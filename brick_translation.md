# Translation brick

## Introduction

The translation brick subscribe to chat messages and translate it.

## Dependencies

The brick have some dependencies, which are essentially gems to be installed :

* ucengine
* rsay

We provide a Gemfile to install these gems.

## Installation

    $> git clone https://github.com/AF83/ucengine-translation.git
    $> cd ucengine-translation
    $> bundle install

## Configuration

See *config.yaml*.

## Launch and stop the brick

    $> bin/translation start
    translation: process with pid 83 started.
    $> bin/translation stop
    translation: trying to stop process with pid 83...
    translation: process with pid 83 successfully stopped.

## Events

### chat.translation.new

It notifies that an earlier text message has
been translated.

Metadata       | Description
---------------|-------------------------------------------------------------------------------------------------------
text           | The message content
lang           | The language of the message
from           | The original sender of the non translated message

Example:

```javascript
{ "type"     : "chat.translation.new",
  "domain"   : "localhost",
  "datetime" : 1292603078834,
  "id"       : "55807763603614612180220217695833",
  "location" : "demo",
  "from"     : "translation",
  "parent"   : "96383203370218539842143583984667",
  "metadata" : {
    "lang" : "en",
    "text" : "Welcome to U.C.Engine",
    "from" : "uid_63444326443_50150"
  }
}
```

## Widgets

See [[chat widget|widget_chat]].
