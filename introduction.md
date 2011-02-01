# Introduction

U.C.Engine (Unified Collaboration Engine), is a persistent [[publish/subscribe|http://en.wikipedia.org/wiki/PubSub]] server.

It allows you to build real time applications like collaboration based services, live meetings, games or anything that fits well in an event driven philosophy.

U.C.Engine is a [[free software project|https://github.com/AF83/ucengine/blob/master/AGPL-LICENSE.txt]] written in erlang. It exposes a ReSTful HTTP API with JSON as its primary exchange format.

## Technology agnostic

You can build your applications with your preferred language. We currently support Erlang, Ruby and javascript. See the [[javascript|ucejs]] and [[ruby|ruby_install]] API.

## A bit of vocabulary

U.C.Engine has a small specific vocabulary to designate a few concepts.

### Meetings

A meeting is a place where events are broadcasted.

In an application you can create meetings a much as you would like.

### Events

Events are the heart of the U.C.Engine protocol.
Here is an event in a JSON format:

```javascript
{ "type"    : "chat.message.new",
  "datetime": 1292593766682,
  "id"      : "44099145822544409583064798111089",
  "meeting" : "introduction",
  "from"    : "ucengine@example.com",
  "metadata": {
    "text": "Hi there ! I'm an event !"
  }
}
```

 attribute | description
-----------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 type      | The event's type. Its existence is mandatory but not its form. That is say you can put in any string you want.
 datetime  | It's the event's timecode set by the server.
 id        | The id set by the server which identify the event among others.
 meeting   | This is the meeting where the event has been posted.
 from      | The id of the user who sent this event.
 metadata  | This is a key/value pair list. Except that the keys and values have to be strings, they are completely free in their form. It defines the data encapsulated by the event.

### Bricks

A brick is a daemon that speaks HTTP with U.C.Engine.

It's the easiest way to integrate existing applications with U.C.Engine. See the [[ReST API|API]].
