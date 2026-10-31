{ config, lib, pkgs, ...}:

{
  virtualisation.docker = {
    enable = false;
    storageDriver = "btrfs";

    rootless = {
        enable = true;
        setSocketVariable = true;
        # Optionally customize rootless Docker daemon settings
        daemon.settings = {
            data-root = "~/.local/docker";
            dns = [ "1.1.1.1" "8.8.8.8" ];
            registry-mirrors = [ "https://mirror.gcr.io" ];
        };
    };
  };
}