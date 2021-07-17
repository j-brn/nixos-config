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
    pulseeffects-pw
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

  systemd.user.services.pulseeffects = {
    description = "Pulseeffects background service";
    enable = false;
    serviceConfig = {
      ExecStart = "${pkgs.pulseeffects-pw}/bin/pulseeffects --gapplication-service";
      ExecStop = "pulseeffects -q";
      CPUSchedulingPolicy = "rr";
    };
    environment = {
      DISPLAY = ":0";
    };
    wantedBy = [ "graphical-session.target" ];
    after = [ "pipewire.service" ];
  };
}
