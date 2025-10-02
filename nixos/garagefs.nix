{ pkgs, sources, ... }:
{
  imports = [
    (sources.sops-nix + "/modules/sops")
  ];

  environment.systemPackages = with pkgs; [
    garage_2
  ];

  sops.secrets.garagefs_rpc_secret = {};
  sops.age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];

  services.garage = {
    package = pkgs.garage_2;
    extraEnvironment = {
      RUST_BACKTRACE = "yes";
    };
    settings = {
      rpc_secret_file = "/run/var/garagefs_rpc_secret";
      #db_engine = "sqlite";
      replication_factor = 1;

    };
    logLevel = "debug";
  };
}
