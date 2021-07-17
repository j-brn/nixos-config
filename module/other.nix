{ config, pkgs, lib, ... }:
{
  services.printing.enable = true;

  services.fwupd = {
    enable = true;
    package = pkgs.fwupd;
  };

  services.journald.extraConfig = ''
    MaxRetentionSec=1month
  '';

  environment.systemPackages = with pkgs; [
    qlcplus
  ];


  nix.autoOptimiseStore = true;
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 30d";
  };

  services.hardware.bolt.enable = true;

  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
  };

  programs.adb.enable = true;
}
