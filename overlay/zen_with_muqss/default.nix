{ super, lib, ...}:
{
  linuxZenWMuQSS = super.linuxPackagesFor (super.linux_zen.override {
    structuredExtraConfig = with lib.kernel; {
      SCHED_MUQSS = yes;
      PREEMPT_RT = yes;
    };
  });
}
