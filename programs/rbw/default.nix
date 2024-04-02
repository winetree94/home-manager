
{ pkgs, ... }:

{
  programs.rbw = {
    enable = true;
    settings = {
      email = "winetree94@gmail.com";
      base_url = "https://vaultwarden.winetree94.com";
      identity_url = "https://vaultwarden.winetree94.com/identity";
      pinentry = pkgs.pinentry-tty;
    };
  };
}

