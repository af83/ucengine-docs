# Frequently asked questions

## Which versions of erlang and yaws do you support ?

We only support the following versions:

- `erlang` starting to R14A
- `yaws` starting to 1.88

## I got a « can't find include lib "yaws/include/yaws.hrl" » error on debian

Despite that you installed the `erlang` and `erlang-yaws` packages on your
debian system, you got the following error when building UC Engine:

    > make
    ...  can't find include lib "yaws/include/yaws.hrl"

The problem comes from the fact that when installing `yaws`, the libraries are
not accessible from `/usr/lib/erlang/lib`. To resolve it, you can add a symlink
between `/usr/lib/yaws` and `/usr/lib/erlang/lib`:

    > ln -s /usr/lib/yaws `/usr/lib/erlang/lib`


