# same as nix.nix file, could be moved to common
{username, ...}: {
  system.defaults.smb.NetBIOSName = "lilJ's mba";

  users.users."${username}" = {
    name = "${username}";
    home = "/Users/${username}";
  };

  nix.settings.trusted-users = [username];
}
