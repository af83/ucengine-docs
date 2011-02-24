# Install

## Dependencies

U.C.Engine has a few dependancies:

* make
* erlang (R14A)
* yaws
* mnesia or mongodb
* inets

* eunit (for testing only)

## Debian systems

On Debian systems the following packages should provide the necessary stuff:

  - erlang
  - erlang-yaws
  - make

To install them, just run this command:

     aptitude install erlang erlang-yaws make

## Get the source code

Once you are sure to have all the dependancies installed on your system,
retrieve the source code from our github repository:

     git clone git://github.com/AF83/ucengine.git
     git submodule update --init

## Run the server

Then build the server and start it:

     make run

Now your U.C.Engine instance is ready, go to [localhost:5280](http://localhost:5280/).

## Further reading

* Control U.C.Engine with [[ucectl]]
* [[Play with the demonstrator]]
* Learn how to [[create javascript applications|quickstartjs]]
