{ stdenv }:

stdenv.mkDerivation rec {
  name = "rofi-config-${version}";
  version = "1.0";
  src = ./src;
  installPhase = ''
    mkdir $out
    cp -rv $src/* $out
  '';
}
