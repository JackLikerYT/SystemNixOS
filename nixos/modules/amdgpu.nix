{ config, pkgs, ...}:

{
  environment.variables = {
    RUSTICL_ENABLE = "radeonsi";
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      mesa.opencl
    ];
  };

  nixpkgs.config.rocmSupport = true;
  hardware.amdgpu.opencl.enable = true;
}
