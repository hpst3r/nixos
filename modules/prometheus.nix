{ config, pkgs, ... }:

{
  services.prometheus = {
    enable = true;
    globalConfig.scrape_interval = "5s";
    scrapeConfigs = [
      {
        job_name = "node";
	static_configs = [{
	  targets = [ "localhost:${toString config.services.prometheus.exporters.node.port}" ];
	}];
      }
    ];
  };
}
