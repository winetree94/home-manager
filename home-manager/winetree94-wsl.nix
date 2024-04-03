{ config, pkgs, lib, ... }:

{
  imports = [
    # ../programs/ssh
  ];
  home = {
    username = "winetree94";
    homeDirectory = "/home/winetree94";
  };
}
