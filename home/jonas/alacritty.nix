{ pkgs, lib, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      shell.program = "${pkgs.zsh}/bin/zsh";
      #args = [ "-u" ];
      background_opacity = 0.95;
      env.TERM = "xterm-256color";
      colors = {
        normal = {
          black = "0x000000";
          red = "0xd54e53";
          green = "0xb9ca4a";
          yellow = "0xe6c547";
          blue = "0x7aa6da";
          magenta = "0xc397d8";
          cyan = "0x70c9ba";
          white = "0xeaeaea";
        };

        # Bright colors
        bright = {
          black = "0x666666";
          red = "0xff3334";
          green = "0x9ec400";
          yellow = "0xe7c547";
          blue = "0x7aa6da";
          magenta = "0xb77ee0";
          cyan = "0x54ced6";
          white = "0xffffff";
        };
      };
    };
  };
}
