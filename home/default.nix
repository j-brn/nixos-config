{ config, lib, pkgs, ... }:
let
  home-manager = builtins.fetchGit {
    url = "https://github.com/rycee/home-manager.git";
    ref = "master";
  };

  jonasFolder = ./jonas;
  jonasToImport = name: value: jonasFolder + ("/" + name);
  filterCaches = key: value: value == "regular" && lib.hasSuffix ".nix" key;
in
{
  imports = [
    "${home-manager}/nixos"
  ];

  nixpkgs.config.allowUnfree = true;
  home-manager.useGlobalPkgs = true;

  home-manager.users.jonas = { ... }: {
    imports = lib.mapAttrsToList jonasToImport (lib.filterAttrs filterCaches (builtins.readDir jonasFolder));
  };
}
