{
  programs.mtr.enable = true;

  networking = {
    nameservers = [
      "1.1.1.1"
      "2606:470dd0:4700:1111"
    ];

    firewall = {
      enable = true;
      allowPing = true;
    };

    networkmanager = {
      enable = true;
      ethernet.macAddress = "random";
      wifi.macAddress = "random";
    };
  };
}
