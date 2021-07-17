with import <nixpkgs> {};
with python3Packages;

buildPythonPackage rec {
  pname = "rivalcfg";
  version = "4.3.0";

  src = fetchFromGitHub {
    owner = "flozz";
    repo = "rivalcfg";
    rev = "v${version}";
    sha256 = "1jms1dc342cxhagbrnjq130zkw0gjqggx33iy44d4pnxrz873wgz";
  };

  nativeBuildInputs = [
    setuptools
    libusb
    libudev
    hidapi
  ];

  propagatedBuildInputs = [
    setuptools
    hidapi
  ];

  doCheck = false;

  postInstall = ''
    mkdir -p $out/lib/udev/rules.d
    $out/bin/rivalcfg --print-udev > $out/lib/udev/rules.d/99-steelseries-rival.rules
  '';

  preFixup = ''
    wrapPythonPrograms
  '';
}