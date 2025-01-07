{pkgs, ...}: {
  lilj-nvim-config = pkgs.callPackage ./nvim-conf {};
}
