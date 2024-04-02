
{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
        "npm"
        "yarn"
        "history"
        "node"
        "systemd"
        "multipass"
        "brew"
        # "docker"
        # "docker-compose"
        "sudo"
        "zsh-interactive-cd"
      ];
    };
  };
}
