# U.C.Engine

U.C.Engine (Unified Collaboration Engine) includes:

* a [[publish/subscribe|http://en.wikipedia.org/wiki/PubSub]] server with persistence,
* a Javascript frontend client with a library of several realtime collaborative widgets (chat, file sharing...)
* several backend clients that provide additional features to your application (video streaming, file converters...)

U.C.Engine allows you to build real time applications like collaboration based services, live meetings, games or anything that fits well in an event driven philosophy.

U.C.Engine is a [[free software project|https://github.com/AF83/ucengine/blob/master/AGPL-LICENSE.txt]] written in erlang (server) and javascript (front client). It exposes a ReSTful HTTP API with JSON as its primary exchange format.

See the [[introduction]] to learn some of the concepts of U.C.Engine.

* [[Introduction|introduction]] - [[Installation|install]]
* **Tutorial** : [[Play with API and command line tool|tutorial_1_api_cli]] - [[Creating a chat widget|tutorial_2_js_app]]
* [[Guide for creating a widget|cookbook_widgets]]
* [[Guide for creating a brick|cookbook_brick]]

## Core

The core of U.C.Engine is a [[publish/subscribe|http://en.wikipedia.org/wiki/PubSub]] server written in Erlang. Persistence is achieved via the database of your choice.

* **API**: [[ReST API reference|api]]
* **Administration**: [[ucengine]] - [[ucengine-admin]] - [[config file|config]]
* **Databases:** [[mongodb]] - [[mnesia]]
* **Full text Search:** [[Solr|solr]]
* [[ACL|acl]] - [[Core events|events]]

## Extensions

Building an application with U.C.Engine is mainly a question of adding bricks to backend clients or widgets to frontend clients. Extensions can be written in any language and several libraries are provided.

### Client libraries

* **Javascript**: [[Javascript API reference|ucejs]]
* **Ruby**: [[Ruby library|ucengine-rb]] - [Ruby event-machine library](https://github.com/AF83/ucengine.em)
* **Erlang**: you can extract it from [erlyvideo-ucengine](https://github.com/AF83/erlyvideo-ucengine)
* **Nodejs**: [node-ucengine](https://github.com/athoune/node-ucengine)
* **Python**: [py-ucengine](https://github.com/athoune/py-ucengine/)

### Bricks and widgets

* **Video:** [[erlyvideo]] - [[red5]] - [[video widget|widget_video]]
* **File sharing:** [[brick|brick_filesharing]]- [[fileupload widget|widget_fileupload]] - [[filesharing widget|widget_filesharing]]
* **Translation:** [[brick|brick_translation]]
* **Twitter:** [[brick|brick_twitter]]
* **Standalone widgets :** [[chat|widget_chat]] - [[whiteboard|widget_whiteboard]]

## Help/Discuss

* [[Frequently asked questions (FAQ)|faq]]
* [U.C.Engine mailing-list](http://groups.google.com/group/ucengine)
* IRC: [#ucengine](irc:ucengine@irc.freenode.net) on freenode

## Development and contributions

* [[Changelog|changelog]]
* [[Licenses|licenses]]
* [[Contribution guide|contributions]]

## Professional services

Any company providing professional services around U.C.Engine is welcome in this directory.

* [[Services directory|pro_services]]
