{ pkgs, ... }:
let
  #hostCores = "0-3,20-23";
  hostCores = "0-31";
  totalCores = "0-31";

  qemuHook =  pkgs.writeShellScript "qemu" ''
    if [[ $1 == "win10" ]] && [[ $2 == "prepare" || $2 == "release" || $2 == "started" ]]
    then
      if [[ $2 == "prepare" ]]
      then
        # isolate cores
        systemctl set-property --runtime -- user.slice AllowedCPUs=${hostCores}
        systemctl set-property --runtime -- system.slice AllowedCPUs=${hostCores}
        systemctl set-property --runtime -- init.scope AllowedCPUs=${hostCores}
      elif [[ $2 == "release" ]]
      then
        # remove core isolation
        systemctl set-property --runtime -- user.slice AllowedCPUs=${totalCores}
        systemctl set-property --runtime -- system.slice AllowedCPUs=${totalCores}
        systemctl set-property --runtime -- init.scope AllowedCPUs=${totalCores}
      fi
    fi
  '';
in
{
  virtualisation = {
    sharedMemoryFiles = {
      looking-glass = {
        user = "jonas";
        group = "libvirtd";
        mode = "666";
      };
    };

    libvirtd = {
      enable = true;
      qemuOvmf = true;
      qemuRunAsRoot = true;

      onBoot = "ignore";
      onShutdown = "shutdown";

      clearEmulationCapabilities = false;
      deviceACL = [
        "/dev/vfio/vfio"
        "/dev/kvm"
        "/dev/kvmfr0"
        "/dev/null"
        "/dev/nvme1n1"
        "/dev/input/by-id/usb-SteelSeries_SteelSeries_Rival_710_Gaming_Mouse-if01-event-mouse"
        "/dev/input/by-id/usb-SteelSeries_SteelSeries_Rival_710_Gaming_Mouse-if02-event-kbd"
        "/dev/input/by-id/usb-Topre_Corporation_HHKB_Professional-event-kbd"
        "/dev/input/by-id/usb-SteelSeries_SteelSeries_Rival_710_Gaming_Mouse-event-if02"
        "/dev/input/by-id/usb-SteelSeries_SteelSeries_Rival_710_Gaming_Mouse-if01-mouse"
        "/run/user/1000/pulse/native"
      ];
    };

    vfio = {
      enable = true;
      IOMMUType = "amd";
      devices = [
        "10de:2204"
        "10de:1aef"
      ];
      blacklistNvidia = true;
      disableEFIfb = true;
      ignoreMSRs = true;
      applyACSpatch = false;
    };

    hugepages = {
      enable = true;
      defaultPageSize = "1G";
      pageSize = "1G";
      numPages = 24;
    };

    kvmfr = {
      enable = true;

      shm = {
        enable = true;

        size = 128;
        user = "jonas";
        group = "libvirtd";
        mode = "0600";
      };
    };

    docker = {
      enable = true;
      enableOnBoot = false;
    };
  };

  systemd.services.libvirtd.preStart = ''
    mkdir -p /var/lib/libvirt/hooks

    ln -sf ${qemuHook} /var/lib/libvirt/hooks/qemu
  '';
}

