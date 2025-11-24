
# M715q

Little ThinkCentre desktop used as a router/jumpbox/web server/file server for my lab.

- R5 2400GE (4c 8t)
- 16gb (2x 8gb SODIMM) DDR4 2666
- 128gb Hynix SSD

Root on (LUKS encrypted, with TPM key for automatic unlock) ZFS

Services:

- NGINX
- Grafana
- Prometheus
- VictoriaLogs
- Samba
- Tailscale
