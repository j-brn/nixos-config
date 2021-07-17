{ super, ... }:
let
  version = "0.0.126";
  checksum = "0apj1c4my17ca452wdga2zb82iqsbljbbg2fylfdvslx286r7dhj";
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
