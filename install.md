# Install

## Dependencies

* make
* erlang (R14A)
* yaws
* mnesia or mongodb
* inets

* enunit (for testing only)

### Debian

        aptitude install erlang erlang-yaws make

## Get source code

        git clone git://github.com/AF83/ucengine.git
        git submodule update --init

## Run

        make run

Go to [localhost:5280](http://localhost:5280/)
