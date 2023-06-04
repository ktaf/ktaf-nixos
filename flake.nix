{
  description = "Hyprland+waybar";


  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    hyprland.url = "github:hyprwm/Hyprland";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";   };


  outputs = { self, nixpkgs, hyprland, home-manager, ... }: 
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
       inherit system;
       config.allowUnfree = true;
        };
        lib = nixpkgs.lib;
    in {
        nixosConfigurations = {
          kourosh = nixpkgs.lib.nixosSystem {
              inherit system;
              modules = [ ./configuration.nix 
              hyprland.nixosModules.default
              {
              programs.hyprland.enable = true;
              programs.hyprland.nvidiaPatches=true;
              programs.hyprland.xwayland.enable=true;
              }
              home-manager.nixosModules.home-manager
              {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.kourosh = import ./home-manager/home.nix;
              }
];
            };
          };
      };
  }

#nixos-23.05




