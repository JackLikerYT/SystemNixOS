{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/systemSettings.nix

      ./modules/gaming.nix
      ./modules/swap.nix
      ./modules/amdgpu.nix
      ./modules/fonts.nix

      ./modules/systemApps/docker.nix
      ./modules/systemApps/virtualbox.nix
      ./modules/systemApps/warp-cloudflare.nix

      ./token.nix
    ];

  environment = {
    variables = {
      MANGOHUD = "1";
      OBS_VKCAPTURE = "1";
    };

    systemPackages = with pkgs; [
      wget
      wineWow64Packages.unstable
      winetricks
      protontricks
    ];
  };

  networking.hostName = "ballfi";

  users.users.ballfi = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "wheel" "networkmanager" "docker" "vboxusers" ];
  };
  time.timeZone = "Europe/Warsaw";

  services.flatpak.enable = true;

  programs.fish.enable = true;

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "26.05"; # Did you read the comment?

}

