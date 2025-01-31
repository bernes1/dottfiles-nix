{ config, pkgs, ... }: {
  programs.tmux = {
    enable = true;
    package = pkgs.tmux;
    mouse = true;
    baseIndex = 1;
    shell = "${pkgs.zsh}/bin/zsh";
    plugins = with pkgs.tmuxPlugins; [ sensible yank ];
    extraConfig = ''
      # Terminal overrides
      set-option -sa terminal-overrides ",xterm*:Tc"
      
      # Custom prefix
      unbind C-b
      set -g prefix C-s
      bind C-s send-prefix

      # Pane navigation
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      # Window and pane index settings
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on
    '';
  };
}
