{ config, pkgs, ...}:

{
  services.cloudflare-warp.enable = true;
  systemd.user.services.warp-taskbar.wantedBy = [ "graphical.target" ];
}