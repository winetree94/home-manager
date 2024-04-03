{ pkgs, ... }:

{

  home.file = {
    "./.ssh/winetree94.key" = {
      source = ./configs/winetree94.key;
    };
    "./.ssh/winetree94.pub" = {
      source = ./configs/winetree94.pub;
    };
    "./.ssh/swit_ila.key" = {
      source = ./configs/swit_ila.key;
    };
    "./.ssh/swit_ila.pub" = {
      source = ./configs/swit_ila.pub;
    };
  };

  programs.ssh = {
    enable = true;

    matchBlocks = {
      winetree94 = {
        hostname = "winetree94";
        user = "git";
        identityFile = "~/.ssh/winetree94.key";
      };
      swit_ila = {
        hostname = "swit_ila";
        user = "git";
        identityFile = "~/.ssh/swit_ila.key";
      };
    };
  };
}

