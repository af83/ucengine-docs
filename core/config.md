# Configuration file

Configuration file is located at *etc/uce.cfg*.

## Virtual hosts

**This feature is currently in development.**

Virtual hosts make possible to use one instance of U.C.Engine with multiple domains.
The `hosts` variable allow you to define custom configuration values for each host:

```erlang
% Global config
{bricks,
 [{"twitter", "secret token for twitter"},
  {"translation", "secret token for translation"}]}.

{datas, "datas/files"}.

% Per host config
{hosts, [
 {"localhost", []},
 {"example.com", [{datas, "/tmp"}
                  {bricks, [{"document", "secret token for document"}]}
]}]}.
```

Here we define a global data directory for all our hosts and overwride the value for
the example.com host. Thus localhost will have a data directory set to *datas/files* and example.com will have the *tmp* directory as its data directory.

The logic of the overwrite mechanism is to replace the global value. For instance, the example set 2 bricks for each hosts while the example.com define its own brick.
As the bricks variable is replaced for example.com, this domain will only have the document brick.

## Admin setup

```erlang
{admin, [{uid, "root"}, {auth, "password"}, {credential, "p4ssw0rd"}]}.
```

## User rights

New rights can be set at runtime for an user based on the events he sent. The `acl` section
of the configuration file defines which rights have to be set after an event with a specific
type was received.

With the example below, when an user register himself (triggering an `internal.user.add` event),
U.C.Engine will automatically create the rights for this user to create a
presence (`{"presence", "add"}`) and list all users of his domain (`{"user", "get"}`).


```erlang
{acl, [{"internal.user.add", [{"presence", "add"},
                              {"user", "get"}]}]}.
```

The format of the right is a simple tuple:

  - the object of the right ("presence" in the example above)
  - the action allowed on this object ("add" in the example above)

For more informations, take a look at the [[ACL overview|acl]].

## Bricks

The configuration can specify a list of bricks to accept.
To do so, use the `bricks` key which is a list of key/value tuples:

  - the key is the name of the brick;
  - the value will be a credential token used by the brick to connect to your U.C.Engine instance.

Here is an example of how it could looks like:

```erlang
{bricks,
 [{"twitter", "da39a3ee5e6b4b0d3255bfef85601890afd80710"},
  {"document", "4efb7c6f7edf5c6392e1b108dde0621140fca910"},
  {"erlyvideo", "da93ae03c1280f82709f858ffa22f0a30c26fa10"},
  {"translation", "d713ab03c0280f82708f865ffa2240a38c26f010"}]}.
```

## Port

```erlang
{port, 5280}.
```

## Root

The `root` key allow you to indicate which directory you want to be served by the embedded web server.
This directory is usefull to serve your own static files.

```erlang
{root, "priv/www/"}.
```

## Datas

The `data` key allow you to indicate which directory you want to be the repository of uploaded files.

```erlang
{datas, "datas/files"}.
```

## Long polling timeout

The `long_polling_timeout` key is usefull when you want to customize the long polling hangup timeout.

```erlang
{long_polling_timeout, 60}.
```

## Timeout refresh

```erlang
{timeout_refresh, 1}.
```

## Presence timeout

```erlang
{presence_timeout, 150}.
```

## Cache refresh

```erlang
{cache_refresh, 0}.
```

## PID file

The `pidfile` key indicate where you want to store the pid of your U.C.Engine instance.
This allow you, for example, to check if there is a current U.C.Engine instance running.

```erlang
{pidfile, "tmp/ucengine.pid"}.
```

## Databases backends

### Mnesia

```erlang
{db, mnesia}.
```

### MongoDB setup

```erlang
{db, mongodb}.

{mongodb,
 {uce_pool, [{size, 10},
             {host, "127.0.0.1"},
             {port, 27017},
             {database, "ucengine"}]}}.
```

## Search backends

### Erlang

```erlang
{search, erlang}.
```

### Solr

```erlang
{search, solr}.

{solr, [{host, "http://localhost:8983/solr"}]}.
```

