{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;

    shellAliases = {
      ls = "exa";
      find = "fd";
      grep = "rg";
      cat = "bat";
      ".." = "cd ..";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
    };
  };
}
