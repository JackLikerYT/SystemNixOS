{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Kanstantsin Mikhailau";
      user.email = "mikhailau.kanstantsin@gmail.com";
      url = {
        "git@github.com:" = {
          insteadOf = "https://github.com/";
        };
      };
    };
  };
}