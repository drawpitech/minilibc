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

          makeFlags = [ "CC=${cc}/bin/gcc" ];
          buildInputs = [ cc pkgs.nasm ];
          enableParallelBuilding = true;

          installPhase = ''
            mkdir -p $out/bin
            cp ${name} $out/bin
          '';
        };
      };
      devShells.${system}.default = pkgs.mkShell {
        packages = (with pkgs; [ gdb valgrind ]) ++ packages.${system}.libasm.buildInputs;
      };
      formatter.${system} = pkgs.nixpkgs-fmt;
    };
}
