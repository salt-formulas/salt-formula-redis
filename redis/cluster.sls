{%- from "redis/map.jinja" import server with context %}
{%- from "redis/map.jinja" import cluster with context %}

{%- if cluster.enabled %}

{{ server.conf_dir }}/sentinel.conf:
  file.managed:
  - source: salt://redis/files/{{ server.version }}/sentinel.conf
  - template: jinja
  - user: root
  - group: root
  - mode: 644
  - require:
    - pkg: redis_packages

{%- endif %}

