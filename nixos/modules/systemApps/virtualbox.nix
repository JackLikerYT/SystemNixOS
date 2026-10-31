{ config, pkgs, ...}:

{
  virtualisation.virtualbox.host.enable = true;
  environment.etc."vbox/networks.conf".text =
    ''
        * 0.0.0.0/0 ::/0
        * 26.0.0.0/8
    '';
}