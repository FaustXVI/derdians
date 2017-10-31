with import <nixpkgs> {};
{
    latexEnv = stdenv.mkDerivation {
        name = "latex-sandbox";
        buildInputs = [
            unzip
            wget
            tetex
            stdenv
        ];
        buildPhase = ''
            export TEXMFHOME="texmf";
            export LATEXMFHOME=$TEXMFHOME/tex/latex
            mkdir -p $LATEXMFHOME
            wget http://mirrors.ctan.org/graphics/pgf/base.zip
            unzip -d $LATEXMFHOME base.zip
            texhash
            make
        '';
        src = ./. ;
        installPhase = ''
            mkdir $out
            cp *.pdf $out
        '';
    };
}
