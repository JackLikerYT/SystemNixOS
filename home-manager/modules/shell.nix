{
  programs.fish = {
      enable = true;
      interactiveShellInit =
      ''
          set fish_greeting
          fastfetch
          starship init fish | source
      '';
  };

  programs.starship = {
    enable = true;
    presets = [
      "pastel-powerline"
    ];
  };
}
