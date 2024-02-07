{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      cc = pkgs.gcc12;
    in
    rec {
      packages.${system} = rec {
        default = libasm;
        libasm = pkgs.stdenv.mkDerivation rec {
          name = "libasm.so";
          src = ./.;

          buildInputs = [ cc ] ++ (with pkgs; [ nasm ]);
          enableParallelBuilding = true;
          buildPhase = ''
            make ${name}
          '';

          installPhase = ''
            mkdir -p $out/bin
            cp ${name} $out/bin
          '';
        };
        unit_tests = pkgs.stdenv.mkDerivation rec {
          name = "unit_tests";
          src = ./.;

          buildInputs = [ cc ] ++ (with pkgs; [ nasm criterion ]);
          enableParallelBuilding = true;
          buildPhase = ''
            make ${name} NO_COV=1
          '';

          installPhase = ''
            mkdir -p $out/bin
            cp ${name} $out/bin
          '';
        };
      };
      devShells.${system}.default = pkgs.mkShell {
        packages = packages.${system}.unit_tests.buildInputs ++ (with pkgs; [
          gcovr
          ltrace
          valgrind
          python311Packages.compiledb
          man-pages
          man-pages-posix
          gdb
        ]);
      };
      formatter.${system} = pkgs.nixpkgs-fmt;
    };
}
