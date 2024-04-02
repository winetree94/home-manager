
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fzf
  ];

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
        "zoxide"
        "zsh-interactive-cd"
        "colored-man-pages"
        "fancy-ctrl-z"
      ];
    };
    # plugins = [
    #   {
    #     name = "zsh-syntax-highlighting";
    #     src = pkgs.fetchFromGitHub {
    #       owner = "zsh-users";
    #       repo = "zsh-syntax-highlighting";
    #       rev = "2d60a47cc407117815a1d7b331ef226aa400a344";
    #       sha256 = "1pnxr39cayhsvggxihsfa3rqys8rr2pag3ddil01w96kw84z4id2";
    #     };
    #   }
    # ];
  };
}
