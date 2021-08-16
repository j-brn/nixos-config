{ config, pkgs, lib, ... }:
{
  systemd.packages = with pkgs; [
    blueman
  ];

  services = {
    dbus.packages = [ pkgs.blueman ];
  };

  environment.systemPackages = with pkgs; [
    blueman
    pavucontrol
    easyeffects
  ];

  hardware = {
    bluetooth = {
      enable = true;
      package = pkgs.bluez;
    };
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    media-session.enable = true;
    config.pipewire = {
      "context.properties" = {
        "link.max-buffers" = 16;
        "log.level" = 2;
        "default.clock.rate" = 48000;
        "default.clock.quantum" = 2048;
        "default.clock.min-quantum" = 48;
        "default.clock.max-quantum" = 8192;
      };
    };
  };

  # allow realtime priority for audio group
  security.pam.loginLimits = [
    {
      domain = "@audio";
      item = "memlock";
      type = "-";
      value = "unlimited";
    }
    {
      domain = "@audio";
      item = "rtprio";
      type = "-";
      value = "99";
    }
    {
      domain = "@audio";
      item = "nofile";
      type = "soft";
      value = "99999";
    }
    {
      domain = "@audio";
      item = "nofile";
      type = "hard";
      value = "99999";
    }
    {
      domain = "@audio";
      item = "nice";
      type = "-";
      value = "-15";
    }
  ];

  systemd.user.services.easyeffects = {
    description = "Easyeffects background service";
    enable = true;
    serviceConfig = {
      ExecStart = "${pkgs.easyeffects}/bin/easyeffects --gapplication-service";
      ExecStop = "easyeffects -q"; 

      # allow rt prio
      LimitRTPRIO = "99";
      LimitNOFILE = "99999";
      CPUSchedulingPolicy = "rr";
    };
    environment = {
      DISPLAY = ":0";
    };
    wantedBy = [ "sway-session.target" ];
    after = [ "pipewire.service" ];
  };
}
