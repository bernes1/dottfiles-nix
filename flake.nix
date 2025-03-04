{
  description = "Darwin configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/master";
    darwin.url = "github:lnl7/nix-darwin#991bb2f6d46fc2ff7990913c173afdb0318314cb";
    #darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, darwin, ... }: {
    darwinConfigurations."sovepose" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      specialArgs = { inherit self; };
      modules = [
        ./hosts/sovepose/configuration.nix

        home-manager.darwinModules.home-manager
        {
          users.users.duck.home = "/Users/duck";
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.duck = import ./home.nix;

          # Optionally, use home-manager.extraSpecialArgs to pass
          # arguments to home.nix
          home-manager.extraSpecialArgs = {
            hostname = "sovepose"; 
          };
        }
      ];
    };
    darwinConfigurations."quack" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      specialArgs = { inherit self; };
      modules = [
        ./hosts/quack/configuration.nix

        home-manager.darwinModules.home-manager
        {
          users.users.duck.home = "/Users/duck";
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.duck = import ./home.nix;

          # Optionally, use home-manager.extraSpecialArgs to pass
          # arguments to home.nix
          home-manager.extraSpecialArgs = {
            hostname = "quack"; 
          };
        }
      ];
    };
  };
}
