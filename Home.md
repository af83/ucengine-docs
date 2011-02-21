# U.C.Engine

U.C.Engine (Unified Collaboration Engine) includes:

* a [[publish/subscribe|http://en.wikipedia.org/wiki/PubSub]] server with persistence,
* a Javascript frontend client with a library of several realtime collaborative widgets (chat, file sharing...)
* several backend clients that provide additional features to your application (video streaming, file converters...)

U.C.Engine allows you to build real time applications like collaboration based services, live meetings, games or anything that fits well in an event driven philosophy.

U.C.Engine is a [[free software project|https://github.com/AF83/ucengine/blob/master/AGPL-LICENSE.txt]] written in erlang (server) and javascript (front client). It exposes a ReSTful HTTP API with JSON as its primary exchange format. 

See the [[introduction]] to learn some of the concepts of U.C.Engine.

* [[Introduction|introduction]] - [[Installation|install]] - [[Play with the demonstrator]]
* [[Quickstart with a video/chat application|quickstartjs]]
* [[Designing events|cookbook_events]]
* [[Guide for creating widget|cookbook_widgets]]
* [[Create a brick|cookbook_brick]]

## Core

The core of U.C.Engine is a [[publish/subscribe|http://en.wikipedia.org/wiki/PubSub]] server written in Erlang. Persistence is achieved via the database of your choice.

* **API**: [[ReST API reference|api]]
* **Administration**: [[ucectl console|ucectl]]
* **Databases:** [[mongodb]] - [[mnesia]]
* **Full text Search:** [[Solr|solr]]
* [[ACL|acl]] - [[Core events|events]]

## Extensions

Building an application with U.C.Engine is mainly a question of adding bricks to backend clients or widgets to frontend clients. Extensions can be written in any language and several libraries are provided.

### Client libraries

* **Javascript**: [[Javascript API reference|ucejs]]
* **Ruby**: [[install ruby API|ruby_install]] - [Ruby API reference](http://rdoc.info/github/AF83/ucengine.rb/master/frames)
* **Erlang**: you can extract it from [erlyvideo-ucengine](https://github.com/AF83/erlyvideo-ucengine)
* **Nodejs**: [node-ucengine](https://github.com/athoune/node-ucengine) - A contribution by [athoune](https://github.com/athoune)

### Bricks and widgets

* **Video:** [[erlyvideo]] - [[red5]] - [[video widget|widget_video]]
* **File sharing:** [[brick|brick_filesharing]]- [[fileupload widget|widget_fileupload]] - [[filesharing widget|widget_filesharing]]
* **Translation:** [[brick|brick_translation]]
* **Twitter:** [[brick|brick_twitter]]
* **Standalone widgets :** [[activity|widget_activity]] - [[chat|widget_chat]] - [[player|widget_player]] - [[replay|widget_replay]] - [[results|widget_results]] - [[search|widget_search]]  - [[whiteboard|widget_whiteboard]] - [[timer|widget_timer]]

## Help/Discuss

* [[Frequently asked questions|faq]]
* [U.C.Engine mailing-list](http://groups.google.com/group/ucengine)
* IRC: [#ucengine](irc:ucengine@irc.freenode.net) on freenode

## Development and contributions

* [[Roadmap|roadmap]] - [[Changelog|changelog]]
* [[Licenses|licenses]]
* [[Launching tests|tests]]

Contributions are welcome !

1. [Fork us](https://github.com/AF83/ucengine)
2. Create your patch in a topic branch
3. Add some unit tests
4. Send pull request

You can also contribute to the [documentation](https://github.com/AF83/ucengine-docs).

## Professional services

Any company providing professional services around U.C.Engine is welcome in this directory.

* [[Services directory|pro_services]]
