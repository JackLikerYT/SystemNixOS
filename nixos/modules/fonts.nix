{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-cove
  ];

  fonts.fontconfig.enable = true;
  fonts.fontconfig.defaultFonts.monospace = [ "CaskaydiaCove Nerd Font" ];
}
