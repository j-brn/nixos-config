{ config, pkgs, ... }:

{
  programs.light.enable = true;
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-wlr ];

  environment.systemPackages = with pkgs; [
    blueman
    busybox
    cifs-utils
    coreutils
    curl
    efibootmgr
    efitools
    efivar
    exa
    exfat
    fd
    ffmpeg
    file
    fzf
    git
    gitAndTools.gitFull
    gitAndTools.hub
    gitAndTools.tig
    gnupg
    hexyl
    lm_sensors
    htop
    iftop
    iw
    ldns
    libimobiledevice
    mosh
    ncdu
    neofetch
    nfsUtils
    nmap
    openssl
    pavucontrol
    pciutils
    psmisc
    pwgen
    ripgrep
    s-tui
    sipcalc
    sudo
    tcpdump
    tmux
    unzip
    usbutils
    vim
    wget
    whois
    zsh
    zstd
    dconf
    xdg_utils
    lm_sensors
    scream
    gutenprint
    qt5.qtwayland
  ];

  nixpkgs.config = {
    chromium = {
      enableWideVine = true;
    };
  };
}
