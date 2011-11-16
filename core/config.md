# Configuration file

Configuration file is located at *etc/uce.cfg*.

## Virtual hosts

Virtual hosts make possible to use one instance of U.C.Engine with multiple domains.
The `hosts` variable allow you to define custom configuration values for each host:

```erlang
% Global config
{bricks,
 [{"twitter", "secret token for twitter"},
  {"translation", "secret token for translation"}]}.

{data, "data/files"}.

% Per host config
{hosts, [
 {"localhost", []},
 {"example.com", [{data, "/tmp"}
                  {bricks, [{"document", "secret token for document"}]}
]}]}.
```

Here we define a global data directory for all our hosts and override the value for
the example.com host. Thus localhost will have a data directory set to *data/files* and example.com will have the *tmp* directory as its data directory.

The logic of the overwrite mechanism is to replace the global value. For instance, the example set 2 bricks for each hosts while the example.com define its own brick.
As the bricks variable is replaced for example.com, this domain will only have the document brick.

### Setting up different databases per vhost

You can setup different databases for each vhost. It allow you to use mnesia for one domain and mongodb for another.

Example:

```erlang
% Per host config
{hosts, [
 {"localhost", [{db, mnesia}]},
 {"example.com", [{db, mongodb},
                  {mongodb, [{size, 10},
                  {host, "127.0.0.1"},
                  {port, 27017},
                  {database, "example"}]}
                  ]}
]}
```

## Admin setup

```erlang
{admin, [{uid, "root"}, {auth, "password"}, {credential, "p4ssw0rd"}]}.
```

## User rights

```erlang
{roles, [{"default", [{"add", "presence", []},
                      {"get", "user", []}]},
         {"speaker", [{"join", "meeting", []},
                      {"add", "event", [{"type", "message.chat.new"}]}]}]}.
```

Roles are described by a name (ex: "speaker") and a list of associated
rights. The format of the right is a simple tuple:

  - the action allowed ("add" in the example above)
  - the object concerned by the action ("event" in the example above)
  - a list of conditions which depends on the kind of object and
    action (the event "type" is limited to "message.chat.new" in the
    example above).

For more informations, take a look at the [[ACL overview|acl]].

## Register

Allow direct registration or allowed only for connected users with `user::add` ACL.
Can be set up by vhost.

```erlang
{register, open}.
{register, restricted}.
```

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

## Bind ip

Specific IP address that U.C.Engine will listen on.

```erlang
{bind_ip, {0,0,0,0}}.
```

## Port

```erlang
{port, 5280}.
```

## Wwwroot

The `wwwroot` key allow you to indicate which directory you want to be served by the embedded web server.
This directory is usefull to serve your own static files.

```erlang
{wwwroot, "wwwroot/"}.
```

## Data

The `data` key allow you to indicate which directory you want to be the repository of uploaded files.

```erlang
{data, "data/files"}.
```

## Connection timeout

The `connection_timeout` key is usefull when you want to customize the timeout of the live api (longpolling only).
The connection will be closed if nothing happened during this time.

Value in seconds.

```erlang
{connection_timeout, 60}.
```

## Timeout refresh

The `timeout_refresh` is the interval (in seconds) where the cleanup presences occurs.

Value in seconds.

```erlang
{timeout_refresh, 1}.
```

## Presence timeout

The `presence_timeout` key allow you to customize the delay of inactivity for one user before being disconnected.

Value in seconds.

```erlang
{presence_timeout, 150}.
```

## Cache refresh

The `cache_refresh` is used to customize the `cache_refresh_secs` of yaws.
Ignore it if you don't serve your assets via U.C.Engine.

A `0` value means there is no cache, and yaws will not cache any files.

Value in seconds.

```erlang
{cache_refresh, 0}.
```

## PID file

The `pidfile` key indicate where you want to store the pid of your U.C.Engine instance.
This allow you, for example, to check if there is a current U.C.Engine instance running.

```erlang
{pidfile, "tmp/ucengine.pid"}.
```

## Log dir

Directory where yaws will wrote logs files.

```erlang
{log_dir, "log/"}.
```

## Log level

Level of logs. Values: debug, info, warning, error, critical.

```erlang
{log_level, debug}.
```

## Databases backends

### Mnesia

```erlang
{db, mnesia}.
```

### MongoDB setup

```erlang
{db, mongodb}.

{mongodb, [{size, 10},
           {host, "127.0.0.1"},
           {port, 27017},
           {database, "ucengine"}]}.
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

## Broadcasting strategy (events)

Any value but `async` will enable the sync mode. Setting this to `async` will enable the async strategy, that is, clients get a key which is not persisted nor broadcasted (for a short time at least).

``` erlang
{events, async}
```
