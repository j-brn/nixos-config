{ pkgs, ... }:
{
  users.users.root = {
    shell = pkgs.zsh;
  };

  users.users.jonas = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
      "wireshark"
      "video"
      "libvirtd"
      "audio"
      "input"
      "dialout"
      "realtime"
      "scanner"
      "lp"
    ];
    shell = pkgs.zsh;
  };

  security.sudo.wheelNeedsPassword = false;
}
