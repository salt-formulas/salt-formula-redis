{%- from "redis/map.jinja" import server with context %}
{%- from "redis/map.jinja" import cluster with context %}

{%- if cluster.enabled %}

{%- if cluster.service is defined %}
redis_cluster_packages:
  pkg.installed:
  - names: {{ cluster.pkgs }}
  - require_in:
    - file: {{ server.conf_dir }}/sentinel.conf

redis_sentinel:
  service.running:
  - enable: true
  - name: {{ cluster.service }}
  - watch:
    - file: {{ server.conf_dir }}/sentinel.conf
  - require:
    - pkg: redis_cluster_packages
{%- endif %}

{{ server.conf_dir }}/sentinel.conf:
  file.managed:
  - source: salt://redis/files/{{ server.version }}/sentinel.conf
  - template: jinja
  - user: redis
  - group: redis
  - mode: 640
  - require:
    - pkg: redis_packages

{%- endif %}
