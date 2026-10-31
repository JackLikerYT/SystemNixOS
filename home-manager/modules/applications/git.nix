{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Kanstantsin Mikhailau";
      user.email = "mikhailau.kanstantsin@gmail.com";
      credential.helper = "cache --timeout=3600";
    };
  };
}