{ lib, fetchFromGitHub, python3Packages }:

python3Packages.buildPythonApplication rec {
  pname = "persistent-evdev";
  version = "master-10.7.21";

  src = fetchFromGitHub {
    owner = "aiberia";
    repo = "persistent-evdev";
    rev = "c2a8c30b95a5e3d84c6b75c8f4c6df1597055e68";
    sha256 = "1jms1dc342cxhagbrnjq130zkw0gjqggx33iy44d4pnxrz873wgz";
  };

  propagatedBuildInputs = with python3Packages; [
    evdev
    udev
  ];
}