# Events

## Internals

### internal.file.add
### internal.org.add
### internal.presence.add
### internal.presence.delete
### internal.roster.add
### internal.roster.delete
### internal.user.add
### internal.user.update

## Twitter

### twitter.hashtag.add
### twitter.tweet.new

## Chat

## chat.message.new
## chat.translation.new

## Video

### video.stream.new

Send by [[erlyvideo]] with token and channel for viewing and publishing video.

Metadata       | Description
---------------|------------------------------------------
token          |
channel        |


### video.stream.start

Send by [[erlyvideo]] when a user start publishing video/webcam

Metadata       | Description
---------------|------------------------------------------
broadcaster    |

### video.stream.lost

Send by [[erlyvideo]] when source have been lost

Metadata       | Description
---------------|------------------------------------------
broadcaster    |

### video.stream.stop

Send by [[erlyvideo]] when a user stop publishing video/webcam

Metadata       | Description
---------------|------------------------------------------
broadcaster    |

