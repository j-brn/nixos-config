{ pkgs, lib, ...}:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    kernelPatches = [
      {
        name = "enable_muqss";
        patch = null;
        extraConfig = ''
          SCHED_MUQSS n
          PREEMPT_RT y
        '';
        iggnoreConfigErrors = true;
      }
    ];
  };
}
