
{ pkgs, ... }:

let
  tmux-nvim = pkgs.tmuxPlugins.mkTmuxPlugin
    {
      pluginName = "tmux.nvim";
      version = "unstable-2023-01-06";
      src = pkgs.fetchFromGitHub {
        owner = "aserowy";
        repo = "tmux.nvim/";
        rev = "57220071739c723c3a318e9d529d3e5045f503b8";
        sha256 = "sha256-zpg7XJky7PRa5sC7sPRsU2ZOjj0wcepITLAelPjEkSI=";
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
    plugins = with pkgs; [
      tmux-nvim
    ];
    extraConfig = ''
      set -g mouse on

      setw -g mode-keys vi

      # Use Alt-arrow keys without prefix key to switch panes
      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D

      # Shift arrow to switch windows
      bind -n S-Left  previous-window
      bind -n S-Right next-window

      # scrollback buffer size increase
      set -g history-limit 100000

      # change window order
      bind-key -n C-S-Left swap-window -t -1
      bind-key -n C-S-Right swap-window -t +1

      # disable window name auto change
      set-option -g allow-rename off

      # bar color
      set -g status-bg black
      set -g status-fg white
    '';
  };
}

