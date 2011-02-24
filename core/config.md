# Configuration file

Configuration file is located at *etc/uce.cfg*.

## Virtual hosts

**This feature is currently in development.**

Virtual hosts make possible to use one instance of U.C.Engine with multiple domains.
The hosts variable allow you to define custom configuration values for each host:

    {bricks,
     [{"twitter", "secret token for twitter"},
      {"translation", "secret token for translation"}]}.

    {datas, "datas/files"}

    {hosts, [
             {"localhost", []},
             {"example.com", [{datas, "/tmp"}
                              {bricks, [{"document", "secret token for document"}]}
                              ]}]}
    ]}.

Here we define a global data directory for all our hosts and overwride the value for
the example.com host. Thus the localhost host will have a data directory set to datas/files and the example.com host will have the tmp directory as its data directory.

The logic when we use the overwrite mechanism is to replace the global value. For instance, the example set 2 bricks for each hosts while the example.com define its own brick.
As the bricks variable is replaced for example.com, this domain will only have the document brick.
