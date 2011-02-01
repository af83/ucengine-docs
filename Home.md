# U.C.Engine

U.C.Engine (Unified Collaboration Engine), is a [[publish/subscribe|http://en.wikipedia.org/wiki/PubSub]] server with persistence.

It allows you to build real time applications like collaboration based services, live meetings, games or anything that fits well in an event driven philosophy.

U.C.Engine is a [[free software project|https://github.com/AF83/ucengine/blob/master/AGPL-LICENSE.txt]] written in erlang. It exposes a ReSTful HTTP API with JSON as its primary exchange format.

See the [[introduction]] to learn some of the concepts of U.C.Engine.

## Core

* [[Installation|install]] - [[Administration with ucectl|ucectl]]
* **Databases:** [[mongodb]] - [[mnesia]]
* **Full text Search:** [[Solr|solr]]
* [[ReST API|api]] - [[ACL|acl]] - [[events]]

## Bricks and widgets

* **Video:** [[erlyvideo]] - [[red5]] - [[video widget|widget_video]]
* **File sharing:** [[brick|brick_filesharing]] - [[filesharing widget|widget_filesharing]]
* **Translation:** [[brick|brick_translation]]
* **Twitter:** [[brick|brick_twitter]]
* **Standalone widgets :** [[activity|widget_activity]] - [[chat|widget_chat]] - [[file|widget_file]] - [[player|widget_player]] - [[replay|widget_replay]] - [[results|widget_results]] - [[search|widget_search]]  - [[whiteboard|widget_whiteboard]] - [[timer|widget_timer]]

## Create bricks and applications

* [[Designing events|cookbook_events]]
* [[Create a brick|cookbook_brick]]

### HTML/Javascript applications

* [[Quickstart with a video/chat application|quickstartjs]]
* [[Javascript API|ucejs]]
* [[Guide for creating widget|widgets]]

### Ruby

* [[Installation|ruby_install]]
* [API](http://rdoc.info/github/AF83/ucengine.rb/master/frames)

## Help/Discuss

* [[Frequently asked questions|faq]]
* [U.C.Engine mailing-list](http://groups.google.com/group/ucengine)
* IRC: [#ucengine](irc:ucengine@irc.freenode.net) on freenode

## Development and contributions

* [[Roadmap|roadmap]] - [[History|history]]
* [[Launching tests|tests]]

Contributions are welcome !

1. [Fork us](https://github.com/AF83/ucengine)
2. Create your patch in a topic branch
3. Add some unit tests
4. Send pull request

You can also contribute to the [documentation](https://github.com/AF83/ucengine-docs).
