{
  lib,
  username,
  email,
  ...
}: {
  programs.git = {
    enable = true;

    userName = "${username}";
    userEmail = "${email}";

    aliases = {
      cm = "commit -m";
      amend = "commit --amend";
    };

    ignores = [
      ".DS_Store"
      ".env"
    ];

    # includes = [
    #   {
    #     path = "~/corpo/.gitconfig";
    #     condition = "gitdir:~/path/corpo/";
    #   }
    # ];

    lfs.enable = true; # make ptr to large files(audio/video) locally

    extraConfig = {
      init.defaultBranch = "trunk";
      credential.helper = "cache";
      push.autoSetupRemote = true;
    };
  };
}
