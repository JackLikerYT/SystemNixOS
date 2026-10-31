{
	description = "Home Manager Flake Configuration";
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05";
		home-manager = {
			url = "github:nix-community/home-manager/master";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		plasma-manager = {
			url = "github:nix-community/plasma-manager";
			inputs.nixpkgs.follows = "nixpkgs";
			inputs.home-manager.follows = "home-manager";
		};

		nix-craftapps = {
			url = "github:olafkfreund/nix-craftapps";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, nixpkgs-stable, nix-craftapps, home-manager, plasma-manager, ... }:
		let
			system = "x86_64-linux";
			#pkgs = nixpkgs.legacyPackages.${system};
			#pkgsStable = nixpkgs-stable.legacyPackages.${system};

			pkgs = import nixpkgs{
				inherit system;
				config.allowUnfree = true;
			};

			pkgsStable = import nixpkgs-stable{
				inherit system;
				config.allowUnfree = true;
			};
		in {
			homeConfigurations."ballfi" = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				extraSpecialArgs = {
					inherit pkgsStable;
				};
				modules = [
					nix-craftapps.homeManagerModules.default
					plasma-manager.homeModules.plasma-manager
					./home.nix
				];
			};
	};
}
