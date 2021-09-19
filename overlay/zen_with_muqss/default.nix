{ super, lib, ...}:
{
  linuxPackages_zen = super.linuxPackagesFor (super.linuxKernel.kernels.linux_zen.override {
    ignoreConfigErrors = true;
  });
}
