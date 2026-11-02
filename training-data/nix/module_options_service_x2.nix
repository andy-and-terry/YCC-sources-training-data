{ config, lib, ... }:
{
  options.services.demo.enable = lib.mkEnableOption "demo service";
  config = lib.mkIf config.services.demo.enable {
    systemd.services.demo.serviceConfig.ExecStart = "/bin/true";
  };
}
