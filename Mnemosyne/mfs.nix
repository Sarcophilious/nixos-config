{ config, lib, pkgs, sources, ... }:
{
  imports = [];



  services.moosefs = {
    masterHost = "Mnemosyne";
    runAsUser = true;
    master = {
      enable = true;
      openFirewall = true;
      #autoInit = true;
      exports = [
        "* / rw,alldirs,admin,maproot=0:0"
        "* . rw"
      ];
      settings = {
        DATA_PATH = "/persist/mooseMeta";
        WORKING_USER = "moosefs";
        WORKING_GROUP = "moosefs";
        AUTH_CODE = "pants";

      };
    };
    chunkserver = {
      enable = true;
      openFirewall = true;
      hdds = [
      "/mnt/xfs1/moosefs =12T"
      "/mnt/xfs2/moosefs =12T"
      "/mnt/xfs3/moosefs =12T"
      "/mnt/xfs4/moosefs =12T"
      ];
      settings = {
        DATA_PATH = "/persist/mooseChunk";
        MASTER_HOST = "Mnemosyne";
        WORKING_USER = "moosefs";
        WORKING_GROUP = "moosefs";
        LABELS = "mnemosyne";
        AUTH_CODE = "pants";
        BIND_HOST = "Mnemosyne";
      };
    };
    client = {
      enable = true;
    };
    #cgiserver = {
    #  enable = true;
    #  openFirewall = true;
    #};
  };



  #fileSystems = {
  #  "/mnt/mfs" = {
  #    fsType = "moosefs";
  #    device = "10.162.69.56:/";
  #    options = [ "_netdev" ];
  #  };
  #};


}
