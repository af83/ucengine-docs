# MongoDB

## Install

On debian:

    aptitude install mongodb-server

## Configure

Edit *etc/uce.cfg*:

```erlang
{db, mongodb}.

{mongodb,
 {uce_pool, [{size, 10},
             {host, "127.0.0.1"},
             {port, 27017},
             {database, "ucengine"}]}}.
```
