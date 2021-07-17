{ pkgs, ...}:

{
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;

    extraPackages = with pkgs; [
      amdvlk
      rocm-opencl-icd
      rocm-opencl-runtime
      libGL
      libva
      vaapiVdpau
      libvdpau-va-gl
      libdrm
      mesa
      egl-wayland
    ];

    extraPackages32 = with pkgs; [
      driversi686Linux.amdvlk
    ];
    
    setLdLibraryPath = true;
  };
}
