redis:
  cluster:
    enabled: True
    master:
      host: 192.168.1.100
      port: 6379
    mode: sentinel
    quorum: 2
    role: slave
supervisor:
  server:
    service:
      redis_sentinel:
        name: sentinel
        type: redis