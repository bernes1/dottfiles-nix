{ config, pkgs, ... }: {
  programs.git = {
    enable = true;
    userEmail = "37117219+bernes1@users.noreply.github.com.";
    userName = "bernes1";
    signing = {
      key = "/Users/duck/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/PublicKeys/9cd3441e6c99f55a072e83a247603679.pub";
      signByDefault = true;
    };
    extraConfig = {
      core.excludesfile = ".gitignore_global";
      gpg.format = "ssh";
      gpg.ssh.allowedsignersfile = "~/.config/git/allowed_signers";
    };
  };
}
