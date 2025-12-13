{ config, ... }:

{
  # minimal postfix config for smartd alerts
  services.postfix = {
    enable = true;
    enableSubmission = true;
  }
}