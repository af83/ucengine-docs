# Install

## Dependencies

U.C.Engine has a few dependencies:

* make
* erlang (R14A)
* yaws
* mnesia or mongodb
* eunit (for testing only)

### Debian

On Debian systems the following packages should provide the necessary stuff (but do verify you have the minimal erlang version!):

  - erlang
  - erlang-yaws
  - make

To install them, just run this command:

    $> aptitude install erlang erlang-yaws make
    $> export ERL_LIBS=/usr/lib/yaws/

### Ubuntu

    $> aptitude install erlang yaws make

### Mac OS X

#### MacPorts

    $> sudo port selfupdate
    $> sudo port install erlang +ssl yaws
    $> sudo port load yaws
    $> export ERL_LIBS=/opt/local/lib/yaws/

#### Homebrew

    $> brew install erlang yaws
    $> export ERL_LIBS=/usr/local/Cellar/yaws/1.88/lib/yaws

## Get the source code

Once you are sure to have all the dependencies installed on your system,
retrieve the source code from our github repository:

     $> git clone git://github.com/AF83/ucengine.git

## Run the server (prior to version 0.5)

Then build the server and start it:

     $> make run

Now your U.C.Engine instance is running, go to [localhost:5280](http://localhost:5280/).

## Run the server (starting from version 0.5)

Then build the server:

     $> make rel
     $> cd rel/ucengine
     $> ./bin/ucengine start

Now your U.C.Engine instance is running, go to [localhost:5280](http://localhost:5280/).

## Inject some data

If you want to play with U.C.Engine, you can start the *demo* with some data (meetings, users, ...).

    $> make run
    (in erlang shell): demo:start().

It will create three meetings:

* demo
* demo2
* agoroom

And few users:

* an admin user (username: root, pwd: root)
* a default user (username: participant, pwd: pwd)

## Further reading

* Control U.C.Engine with [[ucectl]]
* Learn how to [[create javascript applications|quickstartjs]]
