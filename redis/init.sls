
include:
{% if pillar.redis.server is defined %}
- redis.server
{% endif %}
{% if pillar.redis.cluster is defined %}
- redis.cluster
{% endif %}

