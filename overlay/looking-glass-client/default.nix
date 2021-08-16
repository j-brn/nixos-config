{ super, ... }:
let
 version = "f7682c289ada4464b8da78d4f0c7d07652ad4d24";
 checksum = "1z5cda59dpxspjm6sqil8rbk6nggnsslmhz1wvlbcbi2x1n07ifa";
in
{
   looking-glass-client = super.looking-glass-client.overrideAttrs (old: {
      version = "${version}";
      buildInputs = old.buildInputs ++ [
        super.xorg.libXi
        super.xorg.libXScrnSaver
        super.xorg.libXinerama
        super.xorg.libXcursor
        super.xorg.libXpresent
      ];

      src = super.fetchFromGitHub {
        owner = "gnif";
        repo = "LookingGlass";
        rev = version;
        sha256 = checksum;
        fetchSubmodules = true;
      };

      # patches are already upstreamed
      patches = [];
   });
}
