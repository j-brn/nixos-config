{ super, ... }:
let
  version = "0.0.130";
  checksum = "1razxxx16bjzhv9909qa08dmlmgg7ji1vckvkggw7syi125r5aai";
in
{
   discord-canary = super.discord-canary.overrideAttrs (old: {
      version = "${version}";

      buildInputs = [ super.xorg.libxshmfence ];

      src = super.fetchurl {
        url = "https://dl-canary.discordapp.net/apps/linux/${version}/discord-canary-${version}.tar.gz";
        sha256 = checksum;
      };
   });
}
