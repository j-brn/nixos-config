{ pkgs, lib, ... }:
let
  lockCmd = ''
    swaylock \
      --screenshots \
      --clock \
      --indicator \
      --indicator-radius 100 \
      --indicator-thickness 7 \
      --effect-blur 10x10 \
      --effect-vignette 0.5:0.5 \
      --fade-in 0.2
  '';

  launcherCmd = ''
    wofi \
      --show drun \
      --insensitive \
      --gtk-dark \
      --allow-images \
      --no-actions
  '';

  screenshotCmd = "slurp | grim -g - - | wl-copy";

  lookingGlassCmd = "./.scripts/lg-client";

  modifier = "Mod4";
in
{
  home.packages = with pkgs; [
    # application launcher
    wofi

    # lockscreen
    swaylock-effects

    # screenshot
    slurp
    grim
    wl-clipboard
  ];

  home.keyboard.layout = "eu";

  wayland = {
    windowManager.sway = {
      enable = true;
      xwayland = true;
      extraSessionCommands = ''
        export SDL_VIDEODRIVER=wayland
        export QT_QPA_PLATFORM=wayland
        export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
        export _JAVA_AWT_WM_NONREPARENTING=1
        export BEMENU_BACKEND=wayland
      '';
      config = {
        terminal = "alacritty";
        input = {
          "*" = {
            xkb_layout = "eu";
            accel_profile = "flat";
          };
        };
        output = {
          "DP-3" = {
            scale = "1.75";
            resolution = "3840x2160";
          };
          "DP-4" = {
            resolution = "3940x2160";
            scale = "1.75";
          };
          "*" = {
            bg = "~/Pictures/wallpaper.png fill";
          };
        };
        modifier = "Mod4";
        workspaceAutoBackAndForth = true;
        keybindings = let mod = modifier; in
          with pkgs; {
            "${mod}+Shift+c" = "reload";
            "${mod}+Shift+q" = "kill";
            "${mod}+Shift+e" = "exec swaynag -t warning -m 'Exit sway?' -b 'Yes, exit sway' 'swaymsg exit'";
            "${mod}+x" = "exec ${lockCmd}";
            
            "${mod}+l" = "exec ${lookingGlassCmd}";

            "${mod}+Left" = "focus left";
            "${mod}+Down" = "focus down";
            "${mod}+Up" = "focus up";
            "${mod}+Right" = "focus right";

            "${mod}+Shift+Left" = "move left";
            "${mod}+Shift+Down" = "move down";
            "${mod}+Shift+Up" = "move up";
            "${mod}+Shift+Right" = "move right";

            "${mod}+v" = "split v";
            "${mod}+h" = "split h";

            "${mod}+s" = "layout stacking";
            "${mod}+w" = "layout tabed";
            "${mod}+e" = "layout toggle split";
            "${mod}+r" = "mode resize";

            "${mod}+f" = "fullscreen toggle";
            "${mod}+Shift+space" = "floating toggle";

            "${mod}+1" = "workspace 1";
            "${mod}+2" = "workspace 2";
            "${mod}+3" = "workspace 3";
            "${mod}+4" = "workspace 4";
            "${mod}+5" = "workspace 5";
            "${mod}+6" = "workspace 6";
            "${mod}+7" = "workspace 7";
            "${mod}+8" = "workspace 8";
            "${mod}+9" = "workspace 9";
            "${mod}+0" = "workspace 10";

            "${mod}+Shift+1" = "move container to workspace 1";
            "${mod}+Shift+2" = "move container to workspace 2";
            "${mod}+Shift+3" = "move container to workspace 3";
            "${mod}+Shift+4" = "move container to workspace 4";
            "${mod}+Shift+5" = "move container to workspace 5";
            "${mod}+Shift+6" = "move container to workspace 6";
            "${mod}+Shift+7" = "move container to workspace 7";
            "${mod}+Shift+8" = "move container to workspace 8";
            "${mod}+Shift+9" = "move container to workspace 9";
            "${mod}+Shift+0" = "move container to workspace 10";

            "${mod}+Return" = "exec alacritty";
            "${mod}+d" = "exec ${launcherCmd}";

            # screenshot
            "${mod}+Shift+s" = "exec ${screenshotCmd}";            
 
            # open file manager
            "${mod}+M" = "exec nautilus";
        };
          gaps = {
            inner = 0;
            outer = 0;
          };
          floating = {
            border = 1;
            modifier = "Mod4";
            criteria = [
              { title = "SpeedCrunch"; }
            ];
          };
          bars = [
            {
              position = "bottom";
              statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs .config/i3status-rust/config-bottom.toml";
              trayOutput = "primary";
              fonts = {
                names = [ "Source Code Pro" "FontAwesome" ];
                size = 12.0;
              };
            }
          ];
        };
      };
    };
}

