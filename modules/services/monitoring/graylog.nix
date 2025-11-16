{ config, pkgs, ... }:

{
  services = {
    graylog = {
      enable = true;
      passwordSecret = "placeholder";
      rootPasswordSha2 = "placeholder";
      extraConfig = ''
        http_external_uri = http://localhost/graylog/
	http_publish_uri = http://localhost/graylog/
      '';
      elasticsearchHosts = [ "http://127.0.0.1:9200" ];
      package = pkgs.graylog-6_0;
    };
    mongodb = {
      enable = true;
      package = pkgs.mongodb-6_0;
    };
    opensearch = {
      enable = true;
      settings = {
        "cluster.name" = "my-cluster";
      };
    };
  };
}
