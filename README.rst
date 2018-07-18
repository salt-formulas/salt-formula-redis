=============
Redis formula
=============

key value storage


Sample pillars
==============

Redis localhost server


.. code-block:: yaml

    redis:
      server:
        enabled: true
        bind:
          address: 127.0.0.1
          port: 6379
          protocol: tcp

Redis world open

.. code-block:: yaml

    redis:
      server:
        enabled: true
        bind:
          address: 0.0.0.0
          port: 6379
          protocol: tcp

Redis modes

.. code-block:: yaml

    redis:
      server:
        enabled: true
        appendfsync: no | everysec | always

Redis cluster master

.. code-block:: yaml

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

.. code-block:: yaml

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


Command usage
=============

Removes data from your connection's CURRENT database.

    > redis-cli FLUSHDB

Removes data from ALL databases.

    > redis-cli FLUSHALL


More information
================

* http://redis.io/topics/admin
* http://redis.io/topics/quickstart
* http://redis.io/topics/persistence


Documentation and Bugs
======================

To learn how to install and update salt-formulas, consult the documentation
available online at:

    http://salt-formulas.readthedocs.io/

In the unfortunate event that bugs are discovered, they should be reported to
the appropriate issue tracker. Use Github issue tracker for specific salt
formula:

    https://github.com/salt-formulas/salt-formula-redis/issues

For feature requests, bug reports or blueprints affecting entire ecosystem,
use Launchpad salt-formulas project:

    https://launchpad.net/salt-formulas

You can also join salt-formulas-users team and subscribe to mailing list:

    https://launchpad.net/~salt-formulas-users

Developers wishing to work on the salt-formulas projects should always base
their work on master branch and submit pull request against specific formula.

    https://github.com/salt-formulas/salt-formula-redis

Any questions or feedback is always welcome so feel free to join our IRC
channel:

    #salt-formulas @ irc.freenode.net
