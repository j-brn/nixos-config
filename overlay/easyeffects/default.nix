{ super, ... }:
let
 version = "6.0.3";
 checksum = "sha256:1m3jamnhgpx3z51nfc8xg7adhf5x7dirvw0wf129hzxx4fjl7rch";
in
{
   easyeffects = super.easyeffects.overrideAttrs (old: {
      version = "${version}";

      src = super.fetchFromGitHub {
        owner = "wwmm";
        repo = "easyeffects";
        rev = "v${version}";
        hash = checksum;
      };
   });
}
