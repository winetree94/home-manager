{
  description = "Home Manager configuration of winetree94";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixos-flake.url = "github:srid/nixos-flake";
  };

  outputs = inputs@{ self, ... }:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        # linux
        "x86_64-linux"
        "aarch64-linux"
        # mac
        "aarch64-darwin"
        "x86_64-darwin"
      ];

      imports = [
        inputs.nixos-flake.flakeModule
      ];

      perSystem = { self', pkgs, ... }:
        let
          # TODO: Change username
          myUserName = "parkhansol";
        in
        {
          legacyPackages.homeConfigurations.${myUserName} =
            self.nixos-flake.lib.mkHomeConfiguration
              pkgs
              ({ pkgs, ... }: {
                imports = [ self.homeModules.default ];
                home.username = myUserName;
                home.homeDirectory = "/${if pkgs.stdenv.isDarwin then "Users" else "home"}/${myUserName}";
                # home.stateVersion = "22.11";
              });

          # Enables 'nix run' to activate.
          apps.default.program = self'.packages.activate-home;

          # Enable 'nix build' to build the home configuration, but without
          # activating.
          # TODO
          # packages.default = self'.legacyPackages.homeConfigurations.${self.nix-dev-home.username}.activationPackage;
        };
      flake = {
        # home.nix 파일로 분리된 home-manager 구성을 여기에 불러옵니다.
        homeModules.default = import ./home.nix;
      };
    };
}
