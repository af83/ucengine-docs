# Introduction

U.C.Engine (Unified Collaboration Engine), is a persistent [[publish/subscribe|http://en.wikipedia.org/wiki/PubSub]] server.

It allows you to build real time applications like collaboration based services, live meetings, games or anything that fits well in an event driven philosophy.

U.C.Engine is a [[free software project|https://github.com/AF83/ucengine/blob/master/AGPL-LICENSE.txt]] written in erlang. It exposes a ReSTful HTTP API with JSON as its primary exchange format.

## Technology agnostic

You can build your applications with your preferred language. We currently support Erlang, Ruby and javascript. See the [[javascript|ucejs]] and [[ruby|ruby_install]] API.

## A bit of vocabulary

U.C.Engine has a small specific vocabulary to designate a few concepts.

### Events

Events are the heart of the U.C.Engine protocol.
Here is an event in a JSON format:

```javascript
{ "type"     : "chat.message.new",
  "domain"   : "localhost",
  "datetime" : 1292601125202,
  "id"       : "91918360913598370296768635184375",
  "location" : "demo",
  "from"     : "82435388420458600092293846199231",
  "metadata" : {
    "text": "Hi there ! I'm an event !"
    "lang": "en"
  }
}
```

You can create your own events without any configuration. Just push them to U.C.Engine.
Creating events allow you to design your own protocol. Thus, the logic is delegated to clients.

### Meetings

A meeting is a place where events are broadcasted.

In an application you can create meetings a much as you would like.

### Bricks

A brick is a daemon that speaks HTTP with U.C.Engine.

It's the easiest way to integrate existing applications with U.C.Engine. See the [[ReST API|api]].

### Widgets

A widget is the easiest way to add interactive features to your front-end application. U.C.Engine is shipped with several [jQueryUI Widget](http://jqueryui.com/).

Further reading: [[installation|install]].
