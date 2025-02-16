{ config, pkgs, hostname,  ... }:

{
  home.username = "duck";
  home.homeDirectory = "/Users/duck";
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  programs.zsh.enable = true;
  programs.bat.enable = true;
  programs.lsd.enable = true;
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.fzf.enable = true;
  programs.dircolors.enable = true;
  imports = if hostname == "quack"
  then [
    ./home/tmux
    ./home/helix
    ./home/git/quack.nix
  ]
  else[
    ./home/tmux
    ./home/helix
    ./home/git
  ]; 
}
