{ pkgs, config, lib, ...}:
{
  imports =
    [
      <nixpkgs/nixos/modules/installer/scan/not-detected.nix>

      ./default.nix
    ];

  boot = {
    tmpOnTmpfs = true;

    initrd = {
      availableKernelModules = [
        "nvme" "xhci_pci" "ahci" "usbhid" "sd_mod"
      ];
      kernelModules = [ "dm-snapshot" "amdgpu" "kvm" "kvm-amd" ];
    };

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    #kernelPackages = pkgs.linuxZenWMuQSS;

    kernelParams = [
      "vhost_net.experimental_zcopytx=1"
      "psi=0"
      "systemd.unified_cgroup_hierarchy=1"
    ];

    supportedFilesystems = [ "ntfs" ];
  };

  services.udev = {
    packages = [ (import ./pkgs/rivalcfg.nix) ];
  };

  powerManagement.cpuFreqGovernor = "ondemand";

  boot.initrd.luks.devices = {
    root = {
      device = "/dev/disk/by-uuid/c93c8bbf-d8a9-44f9-b6c6-825b25423b2f";
      preLVM = true;
      allowDiscards = true;
    };
  };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/ca1744ba-d51f-4f3b-b9ab-9e9980cfe1ed";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/8858-AB94";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/66694e1b-9ef2-40b3-b1ce-24e85c4f422d"; }
    ];

  networking.hostName = "nixbox";
  system.stateVersion = "20.09";
}
