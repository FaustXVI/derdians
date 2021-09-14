with import (fetchTarball https://github.com/NixOS/nixpkgs/archive/21.05.tar.gz) {};
let
    pgf = import ./nix/pgf.nix <nixpkgs>;
in
stdenv.mkDerivation {
        name = "latex-sandbox";
        TEXMFHOME="${pgf}/${pgf.TEXMFHOME}"; 
        buildInputs = [
            texlive.combined.scheme-full
        ];
    }
