with import <nixpkgs> {};
let
    t = import ./nix/texmf.nix;
in
stdenv.mkDerivation {
        name = "latex-sandbox";
        TEXMFHOME="${t.pgf}/texmf"; 
        buildInputs = [
            tetex
        ];
    }
