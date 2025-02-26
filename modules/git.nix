{
  username,
  email,
  ...
}: {
  programs.git = {
    enable = true;

    userName = "Kulvir Singh";
    userEmail = "kulvirs734@gmail.com";

    aliases = {};

    ignores = [
      ".DS_Store"
      ".env"
    ];

    lfs.enable = true; # make ptr to large files(audio/video) locally

    extraConfig = {
      init.defaultBranch = "trunk";
      credential.helper = "cache";
      push.autoSetupRemote = true;
    };
  };
}
