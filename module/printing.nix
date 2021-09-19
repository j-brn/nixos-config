{ pkgs, ... }:
{
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      gutenprint
      gutenprintBin
    ];
  };

  services.avahi = {
    enable = true;
    nssmdns = true;
  };
  
  hardware.sane = {
    enable = true;
    extraBackends = with pkgs; [
      sane-airscan
      sane-backends
    ];
  };
}
