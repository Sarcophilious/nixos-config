{ config, lib, pkgs, sources, ... }:
{
  imports = [];

  services = {
    samba = {
      enable = true;
      openFirewall = true;
      securityType = "user";
      shares.admin = {
        path = "/storage";
        writable = "yes";
        browsable = "yes";
      };
      shares.global = {
        "server min protocol" = "SMB2_02";
      };
    };

    avahi.enable = true;
    samba-wsdd = {
      enable = true;
      openFirewall = true;
    };


  };

}
