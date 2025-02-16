{ pkgs, self, ...
}: { # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
    [ pkgs.alacritty pkgs.vim pkgs.zoxide pkgs.tmux pkgs.yubikey-manager ];

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  security.pam.enableSudoTouchIdAuth = true;

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "none";
      upgrade = true;
    };
    brews =
      [ "openssh" "gnupg" "ykpers" "pinentry-mac" "wget" "zizmor" "rustup" "k9s" "pass" "magic-wormhole"];
    casks = [
      "discord"
      "visual-studio-code"
      "iterm2"
      "rectangle"
      "mullvadvpn"
      "signal"
      "element"
      "1password"
      "google-chrome"
      "stats"
      "bluesnooze"
      "burp-suite"
      "secretive"
      "transmission"
    ];
    # onActivation.cleenup = "zap"; 
    masApps = { 
      Wireguard = 1451685025;# App Store URL id
      Microsoft-outlook = 985367838;
    };
  };
}
