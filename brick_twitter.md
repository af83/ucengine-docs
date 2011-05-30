# Twitter brick

## Introduction

The twitter brick subscribe to meetings hashtags and send tweets to the meeting.

## Dependencies

The brick have some dependencies, which are essentially gems to be installed :

* ucengine
* twitterstream

We provide a Gemfile to install these gems.


## Installation

    $> git clone https://github.com/AF83/ucengine-twitter.git
    $> cd ucengine-twitter
    $> bundle install

## Configuration

See **config.yaml**.

## Launch and stop the brick

    $> bin/twitter start
    twitter: process with pid 83 started.
    $> bin/twitter stop
    twitter: trying to stop process with pid 83...
    twitter: process with pid 83 successfully stopped.

## Events

The brick listen for `twitter.hashtag.add` events.

### twitter.hashtag.add

Sent by a user, it indicates the twitter brick to watch for the corresponding
hashtag. When a message will be retrieved from the twitter stream it will
produce a `twitter.tweet.new` event.

Metadata       | Description
---------------|-------------------------------------------------------------------------------------------------------
hashtag        | The hashtag to minitor

Example:

```javascript
{ "type"     : "twitter.hashtag.add",
  "domain"   : "localhost",
  "datetime" : 1292593766682,
  "id"       : "44099145822544409583064798111089",
  "location" : "demo",
  "from"     : "uid_63444326443_50150",
  "metadata" : {
    "hashtag": "#TED"
  }
}
```

### twitter.tweet.new

Sent by the twitter brick, it notifies that a new twitter message was posted.

Metadata       | Description
---------------|-------------------------------------------------------------------------------------------------------
text           | The tweet message
from           | The twitter user
hashtags       | The hashtags presents in the message

Example:

```javascript
{ "type"     : "twitter.tweet.new",
  "domain"   : "localhost",
  "datetime" : 1292595423660,
  "id"       : "58605572364308395079869070527396",
  "location" : "demo",
  "from"     : "twitter",
  "metadata" : {
    "text"     : "#UCEngine is so cooool !",
    "from"     : "ucengine",
    "hashtags" : "#UCEngine"
  }
}
```

## ACL

none

## Widgets

See [[chat widget|widget_chat]].
