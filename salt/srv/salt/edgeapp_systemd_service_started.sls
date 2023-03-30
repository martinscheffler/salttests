# Taken from this article:
# https://www.lutro.me/posts/managing-systemd-units-with-salt
# Install and run a systemd unit file for the edge app

edgeapp_systemd_unit:
  
  # Copy the systemd unit file to its target location.
  # Desired version of edge app is set from pillar value by template
  file.managed:
    - name: /etc/systemd/system/edgeapp.service
    - source: salt://edgeapp_systemd_unit.jinja
    - template: jinja

  # Execute systemctl reload after unit has changed
  module.run:
    - name: service.systemctl_reload
    - onchanges:
      - file: edgeapp_systemd_unit

# Make sure that edgeapp systemd unit is loaded on device startup
edgeapp_running:
  service.running:
    - name: edgeapp
    - watch:
      - module: edgeapp_systemd_unit
