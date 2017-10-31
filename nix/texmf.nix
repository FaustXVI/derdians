with import <nixpkgs> {};
rec {
    pgf = stdenv.mkDerivation {
        name = "pgffor-sandbox";
        buildInputs = [
            unzip
            tetex
            stdenv
        ];
        buildPhase = ''
            export TEXMFHOME="texmf";
            export LATEXMFHOME=$TEXMFHOME/tex/latex
            mkdir -p $LATEXMFHOME/pgf
            mv doc lua source tex $LATEXMFHOME/pgf
            texhash
        '';
        src = fetchurl {
            url = "http://mirrors.ctan.org/graphics/pgf/base.zip";
            sha256 = "0dsc6ybl2b7n1w8zgr0bcwdmzvmm86qpy7vla88lh2zrcgyii913";
        };
        installPhase = ''
            mkdir $out
            cp -r texmf $out
        '';
    };
}
