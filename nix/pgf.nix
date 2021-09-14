nixpkgs : with import nixpkgs {};
stdenv.mkDerivation {
        name = "pgf";
        buildInputs = [
            unzip
            tetex
            stdenv
        ];
        TEXMFHOME="texmf";
        src = fetchurl {
            url = "http://mirrors.ctan.org/graphics/pgf/base.zip";
            sha256 = "0ycdngi71vmp1n75xzpi7bd1d7lr5r7id21kx3l0b16ziyjqcvjg";
        };
        buildPhase = ''
            mkdir -p $TEXMFHOME
            mv tex $TEXMFHOME
            texhash
        '';
        installPhase = ''
            mkdir $out
            cp -r $TEXMFHOME $out
        '';
}
