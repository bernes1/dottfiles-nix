{ config, pkgs, ... }: {
  programs.git = {
    enable = true;
    userEmail = "37117219+bernes1@users.noreply.github.com.";
    userName = "bernes1";
    extraConfig = {
      core.excludesfile = ".gitignore_global";
    };
  };
}
