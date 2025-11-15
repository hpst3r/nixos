{ config, pkgs, ... }:

{
  services = {
    graylog = {
      enable = true;
      passwordSecret = "BM4hBy-bJ1ypUz8GIJAmc0gB-2FAbCDF1cNwyV2LcAvhrDw3r8BhmrRIFc47f4cQWsnRBsrrhywk9uGdSXWoXzxKJrz80wSh";
      rootPasswordSha2 = "db072f89f7cf605443eeca3c571d9447af470d7a0d9c5e450c0f730022231422";
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
