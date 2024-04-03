
{ pkgs, ... }:

let
  tmux-sensible = pkgs.tmuxPlugins.mkTmuxPlugin
    {
      pluginName = "sensible";
      version = "25cb91f42d020f675bb0a2ce3fbd3a5d96119efa";
      src = pkgs.fetchFromGitHub {
        owner = "tmux-plugins";
        repo = "tmux-sensible";
        rev = "25cb91f42d020f675bb0a2ce3fbd3a5d96119efa";
        sha256 = "sha256-sw9g1Yzmv2fdZFLJSGhx1tatQ+TtjDYNZI5uny0+5Hg=";
      };
    };

  vim-tmux-navigator = pkgs.tmuxPlugins.mkTmuxPlugin
    {
      pluginName = "vim-tmux-navigator";
      rtpFilePath = "vim-tmux-navigator.tmux";
      version = "38b1d0402c4600543281dc85b3f51884205674b6";
      src = pkgs.fetchFromGitHub {
        owner = "christoomey";
        repo = "vim-tmux-navigator";
        rev = "38b1d0402c4600543281dc85b3f51884205674b6";
        sha256 = "sha256-4WpY+t4g9mmUrRQgTmUnzpjU8WxtrJOWzIL/vY4wR3I=";
      };
    };

  tmux-catppuccin = pkgs.tmuxPlugins.mkTmuxPlugin
    {
      pluginName = "catppuccin";
      version = "5ed4e8a6a20c928688da268dfcdf460ac9c3cb49";
      src = pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "tmux";
        rev = "5ed4e8a6a20c928688da268dfcdf460ac9c3cb49";
        sha256 = "sha256-k9Ihfk8C1jYkGUvOcgLwS4UdXR8d/4Nu/Dyh03FpDZc=";
      };
    };

  tmux-yank = pkgs.tmuxPlugins.mkTmuxPlugin
    {
      pluginName = "yank";
      version = "acfd36e4fcba99f8310a7dfb432111c242fe7392";
      src = pkgs.fetchFromGitHub {
        owner = "tmux-plugins";
        repo = "tmux-yank";
        rev = "acfd36e4fcba99f8310a7dfb432111c242fe7392";
        sha256 = "sha256-/5HPaoOx2U2d8lZZJo5dKmemu6hKgHJYq23hxkddXpA=";
      };
    };
in
{
  home.packages = with pkgs; [];

  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    historyLimit = 100000;
    plugins = [
      # tmux-nvim
      tmux-sensible
      vim-tmux-navigator
      {
        plugin = tmux-catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavour 'mocha'
        '';
      }
      {
        plugin = tmux-yank;
        extraConfig = ''
          # keybindings
          bind-key -T copy-mode-vi v send-keys -X begin-selection
          bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
          bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
        '';
      }
    ];
    extraConfig = ''
      set-option -sa terminal-overrides ",xterm*:Tc"
      set -g mouse on

      unbind C-b
      set -g prefix C-Space
      bind C-Space send-prefix

      # Vim style pane selection
      bind h select-pane -L
      bind j select-pane -D 
      bind k select-pane -U
      bind l select-pane -R

      # Start windows and panes at 1, not 0
      set -g base-index 1
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on

      # Use Alt-arrow keys without prefix key to switch panes
      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D

      # Shift arrow to switch windows
      bind -n S-Left  previous-window
      bind -n S-Right next-window

      # Shift Alt vim keys to switch windows
      bind -n M-H previous-window
      bind -n M-L next-window

      # set vi-mode
      set-window-option -g mode-keys vi

      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}";
    '';
  };
}

