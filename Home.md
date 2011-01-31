# U.C.Engine

U.C.Engine (Unified Collaboration Engine), is a [[publish/subscribe|http://en.wikipedia.org/wiki/PubSub]] server with persistence.

It allow you to build real time applications like collaboration based services, live meetings, games or anything that fit well in the event driven philosophy.

U.C.Engine is a [[free software project|https://github.com/AF83/ucengine/blob/master/AGPL-LICENSE.txt]] written in erlang and exposes a ReSTful HTTP API with JSON as the primary exchange format.

See [[introduction]] to learn some concepts of U.C.Engine.

## Topics

* [[Installation|install]] - [[Administration with ucectl|ucectl]] - [[Frequently asked questions|faq]]
* **Databases:** [[mongodb]] - [[mnesia]]
* **Full text Search:** [[Solr|solr]]
* [[ReST API|api]] - [[ACL|acl]] - [[events]]

## Bricks and widgets

* **Video:** [[erlyvideo]] - [[red5]] - [[video widget|widget_video]]
* **File sharing:** [[brick|brick_filesharing]] - [[filesharing widget|widget_filesharing]]
* **Translation:** [[brick|brick_translation]]
* **Twitter:** [[brick|brick_twitter]]
* **Standalone widgets :** [[activity|widget_activity]] - [[chat|widget_chat]] - [[file|widget_file]] - [[player|widget_player]] - [[replay|widget_replay]] - [[results|widget_results]] - [[search|widget_search]]  - [[whiteboard|widget_whiteboard]]

## Create bricks and applications

* [[Designing events|cookbook_events]]
* [[Create a brick|cookbook_brick]].

### HTML/Javascript applications

* [[Quickstart with a video/chat application|quickstartjs]]
* [[Javascript API|ucejs]]
* [[Guide for creating widget|widgets]]

### Ruby

* [[Installation|ruby_install]]
* [API](http://rdoc.info/github/AF83/ucengine.rb/master/frames)

## Help/Discuss

* [ucengine mailing-list](http://groups.google.com/group/ucengine)
* IRC: [#ucengine](irc:ucengine@irc.freenode.net) on freenode.

## Development and contributions

* [[Roadmap|roadmap]]
* [[History|history]]
* [[Launching tests|tests]]

Contributions are welcome !

* [Fork us](https://github.com/AF83/ucengine)
* Create your patch in a topic branch
* Add some unit tests
* Send pull request
