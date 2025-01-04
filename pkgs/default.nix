{pkgs, ...}: {
  lilj-nvim-config = pkgs.callPackage ./nvim-conf {};
  # firefox = pkgs.callPackage ./firefox-mod-blur {};
}
