{ pkgs, config, lib, ... }:
let
  modulesFolder = ./module;
  modulesToImport = name: value: modulesFolder + ("/" + name);
  filterCaches = key: value: value == "regular" && lib.hasSuffix ".nix" key;
  modules = lib.mapAttrsToList modulesToImport (lib.filterAttrs filterCaches (builtins.readDir modulesFolder));

  imports = modules ++ [
    ./home
    ./overlay
    ./options/libvirt.nix
    ./options/vfio.nix
    ./options/kvmfr.nix
    ./options/virtualisation.nix
  ];
in
{
  inherit imports;
}
