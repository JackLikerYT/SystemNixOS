{
  swapDevices = [ {
    device = "/var/lib/swapfile";
    size = 16 * 1024; # 16GB
  } ];

  boot.zswap = {
    enable = true;
    compressor = "zstd";
  };
}
