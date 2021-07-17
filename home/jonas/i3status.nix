{ ... }:
{
  programs.i3status-rust = {
    enable = true;
    bars = {
      bottom = {
        theme = "slick";
        icons = "awesome";

        blocks = [
          {
            block = "music";
            player = "spotify";
            on_click = "spotify";
            buttons = ["prev" "play" "next"];
          }
          {
            block = "disk_space";
            path = "/";
            alias = "/";
            info_type = "available";
            unit = "GB";
            interval = 60;
            warning = 20;
            alert = 10;
          }
          {
            block = "memory";
            display_type = "memory";
            clickable = false;
            format_mem = "{mem_used:2;G}/{mem_total:2;G}({mem_used_percents:2})";
          }
          {
            block = "temperature";
            collapsed = false;
            interval = 2;
            format = "{average}C";
            chip = "k10temp-pci-00c3";
          }
          {
            block = "cpu";
            interval = 5;
            format = "{utilization} {frequency}";
          }
          {
            block = "net";
            on_click = "alacritty -e nmtui";
            format = "{ip}"; 
          }
          {
            block = "sound";
            format = "{output_name} {volume}";
            on_click = "pavucontrol --tab=3";
            show_volume_when_muted = true;
            mappings = {
              "alsa_output.pci-0000_0e_00.4.output_iec958-stereo" = "SPDIF";
            };
          }
          {
            block = "time";
            interval = 1;
            format = "%F %a %T";
          }
        ];
      };
    };
  };
}
