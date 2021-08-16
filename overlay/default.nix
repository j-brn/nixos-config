{ pkgs, lib, ... }:

{
  nixpkgs.overlays = [
    #(self: super: import ./looking-glass-client {inherit super;})
    (self: super: import ./qemu {inherit super;})
    (self: super: import ./zen_with_muqss {inherit super; inherit lib; })
    (self: super: import ./discord-canary {inherit super; })
    (self: super: import ./easyeffects {inherit super; })
  ];
}
