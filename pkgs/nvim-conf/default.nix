{
  stdenv,
  lib,
}: let
  nvim = ./nvim;
in
  stdenv.mkDerivation {
    pname = "lilj-nvim-config";
    version = "1.0.0";

    buildCommand = ''
      mkdir -p $out
      cp -r ${nvim}/* "$out/"
    '';

    meta = with lib; {
      description = "lilJ's nvim config";
      homepage = "https://kulvir.gg";
      platforms = platforms.all;
      license = licenses.gpl3;
    };
  }
