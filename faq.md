# Frequently asked questions

## How to write U.C.Engine ?

**U.C.Engine**.

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

## Who's the devil behind U.C.Engine ?

Some folks of [af83](http://af83.com/).

## Do you destroy your community ?

See [How to destroy your community](http://lwn.net/Articles/370157/) on lwn.

Short answer: **No**.

### #1 Make the project depend as much as possible on difficult tools

We are using git + erlang + javascript + ruby. No really difficult.

### #2 Encourage the presence of poisonous people

Right. We are poisonous people.

### #3 Provide no documentation

Documentation is in progress.

### #4 Project decisions should be made in closed-door meetings

Okay, we need to improve this point.

### #5 Employ large amounts of legalese

No contributor agrement, no trademarks. Just send us a patch.

### #6 The community liaison must be chosen carefully

We don't have a community liaison.

### #7 Governance obfuscation.

Like #4, we need more transparency.

### #8 Screw around with licensing

Erlang code == AGPL, javascript == BSD/GPL.

### #9 Do not allow anybody outside the company to have commit access

Only Chuck Norris have commit access.

### #10 Silence

**(...)**
