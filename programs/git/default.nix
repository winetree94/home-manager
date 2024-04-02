{ pkgs, ... }:

{
  home.packages = with pkgs; [
    git-crypt
  ];

  programs.git = {
    enable = true;
    userName = "winetree94";
    userEmail = "winetree94@gmail.com";
  };
}

