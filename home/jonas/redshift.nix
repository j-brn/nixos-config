{ pkgs, ... }:
{
  services.redshift = {
    enable = true;
    package = pkgs.redshift-wlr;
    latitude = "49.8";
    longitude = "8.6";
    tray = true;
    temperature = {
      night = 3500;
      day = 5500;
    };
  };
}
