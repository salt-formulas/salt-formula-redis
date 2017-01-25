# Redis

key value storage

## Sample pillars

Redis localhost server

    redis:
      server:
        enabled: true
        bind:
          address: 127.0.0.1 
          port: 6379
          protocol: tcp

Redis world open

    redis:
      server:
        enabled: true
        bind:
          address: 0.0.0.0 
          port: 6379
          protocol: tcp

Redis modes

    redis:
      server:
        enabled: true
        appendfsync: no | everysec | always

Redis cluster master

    redis:
      cluster:
        enabled: True
        master:
          host: 192.168.1.100
          port: 6379
        mode: sentinel
        quorum: 2
        role: master
    supervisor:
      server:
        service:
          redis_sentinel:
            name: sentinel
            type: redis

Redis cluster slave

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

## Command usage

Removes data from your connection's CURRENT database.

    > redis-cli FLUSHDB

Removes data from ALL databases.

    > redis-cli FLUSHALL

## Read more

* http://redis.io/topics/admin
* http://redis.io/topics/quickstart
* http://redis.io/topics/persistence
