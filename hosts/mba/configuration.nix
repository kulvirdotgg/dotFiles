{
  pkgs,
  inputs,
  ...
}: {
  security.pam.services.sudo_local.touchIdAuth = true;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

  system.defaults = {
    controlcenter = {
      BatteryShowPercentage = true;
      NowPlaying = false;
    };
    dock = {
      autohide = false;
      tilesize = 22;
      mineffect = "genie";
      largesize = 32;
      mru-spaces = true;
      show-recents = false;

      # don't ned hotcorners
      wvous-bl-corner = null;
      wvous-br-corner = null;
      wvous-tl-corner = null;
      wvous-tr-corner = null;
    };
    finder = {
      CreateDesktop = false;
      FXDefaultSearchScope = "SCcf";
      FXPreferredViewStyle = "Nlsv";
      NewWindowTarget = "Other";
      NewWindowTargetPath = "file:///Users/lilj/Downloads";
      ShowPathbar = true;
      ShowStatusBar = true;
      ShowRemovableMediaOnDesktop = false;
    };
    menuExtraClock = {
      Show24Hour = false;
      ShowAMPM = false;
      ShowSeconds = false;
      ShowDate = 1;
      ShowDayOfWeek = true;
    };
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      AppleICUForce24HourTime = false;
      AppleSpacesSwitchOnActivate = true; # Switch to other workspace when switching application
      "com.apple.keyboard.fnState" = false;
      "com.apple.sound.beep.feedback" = 0;
      "com.apple.sound.beep.volume" = 0.7788008;
      "com.apple.swipescrolldirection" = true;
      "com.apple.trackpad.scaling" = 1.35;
      InitialKeyRepeat = 15;
      KeyRepeat = 3;

      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSAutomaticWindowAnimationsEnabled = true;
      NSScrollAnimationEnabled = true;
      NSTableViewDefaultSizeMode = 2; # finder sidebar icons size
    };
    screencapture = {
      include-date = false;
      location = "~/Documents/screenshots";
      type = "png";
    };
    trackpad = {
      ActuationStrength = 0;
      Clicking = true;
      TrackpadRightClick = true;
    };
    WindowManager = {
      EnableStandardClickToShowDesktop = true;
      EnableTiledWindowMargins = true;
    };
  };

  system.stateVersion = 5;

  time.timeZone = "Asia/Calcutta";
}
