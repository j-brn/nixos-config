{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    # gui
    redshift

    # devtools
    binutils
    cmake
    docker-compose
    gcc
    gnumake
    libsForQt5.oxygen-icons5
    qt5.qtwayland
    lld
    mako
    mediainfo
    networkmanagerapplet
    pavucontrol
    pkgs.breeze-icons
    pkgs.gnome3.adwaita-icon-theme
    pkgs.hicolor-icon-theme
    python3
    rustup
    virtmanager
    vulkan-tools
    wireshark
    xdg_utils
    dmenu

    # browser
    chromium
    google-chrome
    firefox-wayland

    # music
    spotify

    # IDEs
    jetbrains.clion
    jetbrains.phpstorm

    # communication
    discord-canary
    teamspeak_client
    signal-desktop
    teams
    jitsi
    
    # file manager
    gnome3.nautilus
    gnome3.sushi

    # text editor
    pantheon.elementary-code

    # cli tools
    ripgrep
    fd
    zoxide
    bottom
    topgrade
    bat
    wrk
    procs
    act
    htmlq

    # vm
    looking-glass-client

    # image processing
    gimp
    aseprite

    # js devtools
    nodejs
    yarn

    # rgb
    openrgb

    # passwords
    keepassxc
    bitwarden

    # mail
    thunderbird
    hydroxide

    # mouse config
    (import ../../pkgs/rivalcfg.nix)

    zellij

    # create windows sticks
    woeusb

    # cam
    webcamoid
    droidcam

    # crypto
    exodus

    # notes
    joplin-desktop

    # calculator
    speedcrunch

    # scanner
    gnome.simple-scan

    # office
    # onlyoffice-bin
    libreoffice-fresh
    okular
  ];
}
