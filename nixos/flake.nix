{
    description = "My NixOS Flake Configuration";
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    };

    outputs = { self, nixpkgs, ... }@inputs: {
		nixosConfigurations = {
				ballfi = nixpkgs.lib.nixosSystem {
					system = "x86_64-linux";
					modules = [
						./hardware-configuration.nix
						./configuration.nix
						{
							nixpkgs.config.allowUnfree = true;
						}
					];
				};
		};
	};
}
