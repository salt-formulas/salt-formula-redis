
include:
{% if pillar.redis.server is defined %}
- redis.server
{% endif %}
