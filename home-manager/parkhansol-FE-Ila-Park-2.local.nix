{ config, pkgs, lib, ... }:

{
  imports = [
    ./shared.nix
  ];
  home = {
    username = "parkhansol";
    homeDirectory = "/Users/parkhansol";
  };
}
