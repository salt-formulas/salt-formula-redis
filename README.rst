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

## Command usage

Removes data from your connection's CURRENT database.

    > redis-cli FLUSHDB

Removes data from ALL databases.

    > redis-cli FLUSHALL

## Read more

* http://redis.io/topics/admin
* http://redis.io/topics/quickstart
* http://redis.io/topics/persistence
