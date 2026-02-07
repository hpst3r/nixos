{ config, pkgs, ... }:

{
  services.prometheus = {
    enable = true;
    globalConfig.scrape_interval = "5s";
    scrapeConfigs = [
      {
        job_name = "node";
        static_configs = [{
          targets = [
            "localhost:${toString config.services.prometheus.exporters.node.port}"
            "6028a:${toString config.services.prometheus.exporters.node.port}"
            "6028b:${toString config.services.prometheus.exporters.node.port}"
            "t14g2a:${toString config.services.prometheus.exporters.node.port}"
            "t14g2b:${toString config.services.prometheus.exporters.node.port}"
            "z790:${toString config.services.prometheus.exporters.node.port}"
            "z2g4a.lab.wporter.org:9100"
            "z2g4b.lab.wporter.org:9100"
            "z2g4c.lab.wporter.org:9100"
          ];
        }];
      }
    ];
  };
}
