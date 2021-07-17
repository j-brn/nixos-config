{ pkgs, ... }:
{
  # protonmail-bridge is shit
  home.packages = with pkgs; [
    hydroxide
  ];

  systemd.user.services.hydroxide = {
    Unit = {
      Description = "Hydroxide server";
    };

    Service = {
      User = "jonas";
      ExecStart = "hydroxide serve";
    };

    Install = {
      WantedBy = [
        "multi-user.target"
      ];
    };
  };
}