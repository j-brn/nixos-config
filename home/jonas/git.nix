{
  programs.git = {
    enable = true;

    userName = "j-brn";
    userEmail = "me@bricker.io";

    extraConfig = {
       core = { editor = "vim"; };
       pull = { ff = "only"; };
    };

    ignores = [
      ".idea"
      ".swp"
    ];
  };
}
