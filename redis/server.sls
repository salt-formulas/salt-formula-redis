{%- from "redis/map.jinja" import server with context %}

{%- if server.enabled %}

redis_packages:
  pkg.installed:
  - names: {{ server.pkgs }}

vm.overcommit_memory:
  sysctl.present:
    - value: 1

{{ server.conf_dir }}/redis.conf:
  file.managed:
  - source: salt://redis/files/{{ server.version }}/redis.conf
  - template: jinja
  - user: redis
  - group: redis
  - mode: 640
  - require:
    - pkg: redis_packages

redis_service:
  service.running:
  - enable: true
  - name: {{ server.service }}
  - watch:
    - file: {{ server.conf_dir }}/redis.conf

{%- endif %}
