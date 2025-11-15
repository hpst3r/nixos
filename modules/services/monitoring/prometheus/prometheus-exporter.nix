{ config, pkgs, ... }:

{
  services.prometheus.exporters.node = {
    enable = true;
    port = 9001;
    enabledCollectors = [
      "cpu"
      "loadavg"
      "meminfo"
      "diskstats"
      "filesystem"
      "netdev"
      "netstat"
      "stat"
      "time"
      "uname"
      "vmstat"
      "systemd"
      "hwmon"
      "tcpstat"
      "wifi"
      "softirqs"
      "ethtool"
    ];
  };
}
