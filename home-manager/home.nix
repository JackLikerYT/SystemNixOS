{ config, pkgs, pkgsStable, ...}:

{
	imports =
		[
			./modules/plasma.nix		
			./modules/shell.nix

			./modules/applications/mangohud.nix
			./modules/applications/keepassxc.nix
			./modules/applications/craftapps.nix
			./modules/applications/obs-studio.nix
			./modules/applications/git.nix
			./modules/applications/ssh.nix
		];

	news.display = "silent";
	home = {
		stateVersion = "26.05";
		username = "ballfi";
		homeDirectory = "/home/ballfi";
		shellAliases = {
			flakeupdate = "nix flake update --flake ~/dotfiles/nixos; nix flake update --flake ~/dotfiles/home-manager";
			flakeapply = "sudo nixos-rebuild switch --flake ~/dotfiles/nixos/.#ballfi; home-manager switch --flake ~/dotfiles/home-manager/.#ballfi";
		};
		packages = with pkgs; [
			btop
			brave-origin
			vlc
			telegram-desktop
			protonplus
			fastfetch
			gamescope
			krita
			# davinci-resolve
			unrar
			dualsensectl
			unzip
			p7zip
			mangojuice
			cloudflare-warp
			megasync
			vscodium
			lmstudio
			gale

			audacity
			pkgsStable.gearlever
			handbrake

			(discord.override {
				withOpenASAR = true;
				withVencord = true;
			})
		];
	};

	services.mpris-proxy.enable = true;

	programs.home-manager.enable = true;
}
