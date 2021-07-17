{ pkgs, lib, ... }:
{
  programs.tmux = {
    enable = false;
    clock24 = true;
    baseIndex = 1;
    escapeTime = 0;
    historyLimit = 10000;

    extraConfig = ''
        bind -n C-n run-shell -b 'alacritty --working-directory #{pane_current_path} -e tmux'
       bind -n C-l send-keys C-l \; run 'sleep 0.1' \; clear-history


              set -g mouse-utf8 on
              set -g mouse on
      set -g set-titles on

      set -g monitor-activity on
      set -g visual-activity off
    '';
  };
}
