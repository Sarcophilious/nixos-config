{ pkgs, sources, ... }:
{
  imports = [
  ];



  environment.systemPackages = with pkgs; [
    moosefs
  ];

  services.moosefs = {
    # masterHost = ;
  };
}
