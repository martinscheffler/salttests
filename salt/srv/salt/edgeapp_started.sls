# https://www.lutro.me/posts/managing-systemd-units-with-salt

edgeapp_systemd_unit:
  file.managed:
    - name: /etc/systemd/system/edgeapp.service
    - source: salt://edgeapp_systemd_unit.jinja
    - template: jinja
  module.run:
    - name: service.systemctl_reload
    - onchanges:
      - file: edgeapp_systemd_unit

edgeapp_running:
  service.running:
    - name: edgeapp
    - watch:
      - module: edgeapp_systemd_unit
