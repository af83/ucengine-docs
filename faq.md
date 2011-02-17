# Frequently asked questions

## How to write U.C.Engine?

**U.C.Engine**.

## Which versions of erlang and yaws do you support?

We only support the following versions:

- `erlang` starting with R14A
- `yaws` starting with 1.88

## I got a « can't find include lib "yaws/include/yaws.hrl" » error on debian

Despite installing the `erlang` and `erlang-yaws` packages on your
debian system, you get the following error when building U.C.Engine:

    > make
    ...  can't find include lib "yaws/include/yaws.hrl"

The problem comes from the fact that when installing `yaws`, the libraries are
not accessible from `/usr/lib/erlang/lib`. To resolve it, you can add a symlink
between `/usr/lib/yaws` and `/usr/lib/erlang/lib`:

    > ln -s /usr/lib/yaws `/usr/lib/erlang/lib`

## Who's the devil behind U.C.Engine?

Some folks of [af83](http://af83.com/).

## You said U.C.Engine is persistent, how do you store events?

We currently support two backends: [[mnesia|mnesia]] and [[mongoDB|mongodb]].

## Does U.C.Engine guaranty that all event are delivered?

The short response is: **yes**.

The longer response is:

U.C.Engine is stateless so it doesn't try to remember what events the client did not received.
Instead, the client can use the timestamp of the last event it received as the starting point of the next request.

Thus, if a request goes wrong and the client doesn't receive the events, it's not a problem.
These events will be retrieved in the next request.

## Is U.C.Engine different from Google wave?

**Objects** 
A few wave objects are similar to U.C.Engine concepts :

 Wave      | U.C.Engine
-----------|------------
 Waves     | Meetings
 Wavelets  | -
 Documents | -
 Robots    | Bricks
 Gadgets   | Widgets

In U.C.Engine there are documents too, but these are just uploaded files.

**Federation** 
U.C.Engine doesn't support federation.
Federation is great but we believe that many applications just don't need federation.

**Complexity**
Google wanted Wave to be the ultimate one size fits all communication tool of the future (remember?). On our side, we believe in simplicity.

U.C.Engine is simpler than Google Wave, because :

  - The core is smaller;
  - The API is smaller;
  - There are fewer and simpler concepts;
  - We don't have to deal with federation

We hope that more developers will be able to use U.C.Engine to build their own collaborative application.

## Is U.C.Engine different from XMPP?

Most of U.C.Engine's features are included in the XMPP protocol.
But a few things make U.C.Engine different from XMPP:

  - While you sometimes need [BOSH](http://en.wikipedia.org/wiki/BOSH) to speak to a XMPP server,
    you always communicate the same way with U.C.Engine because it is HTTP based;
  - U.C.Engine was meant to be simple. That's why it use JSON instead of XML;
  - U.C.Engine is persistent and timeline focused.

Even if we decided not to use XMPP, you can! It should be easy to write a brick to make a bridge between U.C.Engine and XMPP.

## Don't you think U.C.Engine is way too centralized?

As there is no federation design in the U.C.Engine protocol, we indeed built a centralized architecture.
Even if we do believe in the benefit of distributed architectures (social networks for example), we think that many realtime collaboration applications just don't need it and would benefit from using a simpler framework.

Anyway, U.C.Engine pubsub server is a project under the GNU Affero General Public License, so you are totally free to
install it and use it on your own machines. Moreover, all published events can be retrieved in a JSON format which
facilitate migrations and backups of your important live data.

## Do you destroy your community?

See [How to destroy your community](http://lwn.net/Articles/370157/) on lwn.

Short answer: **No**.

### #1 Make the project depend as much as possible on difficult tools

We are using git + erlang + javascript + ruby. Not really difficult.

### #2 Encourage the presence of poisonous people

Right. We are poisonous people.

### #3 Provide no documentation

Documentation is in progress and progress is good.

### #4 Project decisions should be made in closed-door meetings

This point needs improvement but it depends as much on you as it does on us. IRC anyone?

### #5 Employ large amounts of legalese

No contributor agreement, no trademarks. Just send us a patch.

### #6 The community liaison must be chosen carefully

We don't have a community liaison. We have coders. Coders code 24/7 and are always accessible. Even when in the toilets. They respond to patches in millisecond timeframes. Again, IRC anyone?

### #7 Governance obfuscation

Like #4, we need more transparency. Did we say something about IRC?

### #8 Screw around with licensing

Erlang code == AGPL, javascript == BSD/GPL.

### #9 Do not allow anybody outside the company to have commit access

Only Chuck Norris have commit access. If you wish to have commit access, please first submit one or more patches that will be accepted. We will be more than happy to give you write access afterwards.

### #10 Silence

**(...)**

