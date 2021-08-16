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
      "adbusers"
      "vboxusers"
      "libvirtd"
      "audio"
      "input"
      "dialout"
      "adbusers"
      "wireshark"
      "realtime"
    ];
    shell = pkgs.zsh;
  };

  security.sudo.wheelNeedsPassword = false;
}
