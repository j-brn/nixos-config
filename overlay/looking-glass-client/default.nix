{ super, ... }:
let
 version = "master-2021-07-17";
 checksum = "0fwmz0l1dcfwklgvxmv0galgj2q3nss90kc3jwgf6n80x27rsnhf";
in
{
   looking-glass-client = super.looking-glass-client.overrideAttrs (old: {
      version = "${version}";
      buildInputs = old.buildInputs ++ [ super.xorg.libXi super.xorg.libXScrnSaver super.xorg.libXinerama ];

      src = super.fetchFromGitHub {
        owner = "gnif";
        repo = "LookingGlass";
        rev = "HEAD";
        sha256 = "${checksum}";
        fetchSubmodules = true;
      };

      # patches are already upstreamed
      patches = [];
   });
}
