{ pkgs, ... }:

{
  programs.ssh = {
    enable = true;

    matchBlocks = {
      personal = {
        hostname = "winetree94";
        user = "git";
        identityFile = "~/.ssh/winetree94.key";
      };
      swit = {
        hostname = "swit_ila";
        user = "git";
        identityFile = "~/.ssh/swit_ila.key";
      };
    };
  };
}

