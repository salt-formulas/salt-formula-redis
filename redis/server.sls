{%- from "redis/map.jinja" import server with context %}

{%- if server.enabled %}

redis_packages:
  pkg.installed:
  - names: {{ server.pkgs }}

vm.overcommit_memory:
  sysctl.present:
    - value: 1

{% if (grains.os == 'Ubuntu' and grains.osrelease > '13.10') or grains.os_family == 'Arch' %}
{% set conf_file_source = 'salt://redis/files/redis.conf.2.8' %}
{% else %}
{% set conf_file_source = 'salt://redis/files/redis.conf.2.2' %}
{% endif %}

{{ server.conf_dir }}:
  file.managed:
  - source: {{ conf_file_source }}
  - template: jinja
  - user: root
  - group: root
  - mode: 644
  - require:
    - pkg: redis_packages

redis_service:
  service.running:
  - enable: true
  - name: {{ server.service }}
  - watch:
    - file: {{ server.conf_dir }}

{%- endif %}
