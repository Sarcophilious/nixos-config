{ config, lib, pkgs, sources, ... }:
{
  imports = [];

  services.minio = {
    enable = true;
    dataDir = [
      "/mnt/xfs1/minio"
      "/mnt/xfs2/minio"
      "/mnt/xfs3/minio"
      "/mnt/xfs4/minio"
      ];

    };

}
