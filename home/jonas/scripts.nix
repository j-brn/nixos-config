{
  home.file.".scripts/lg-client" = {
    executable = true;
    text = ''
      pkill looking-glass-client

      looking-glass-client \
        app:allowDMA=false \
        app:shmFile=/dev/kvmfr0 \
        win:fullScreen \
        win:showFPS=false \
        win:jitRender=true \
        spice:enable=no \
    '';
  };
}
