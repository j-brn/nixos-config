{
  programs.keychain = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;

    agents = [
      "ssh"
      "gpg"
    ];

    keys = [];
  };
}