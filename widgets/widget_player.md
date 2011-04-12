# Player

Video player using HTML5 *video* element. Video should be encoded in mp4 and webm.

## Location

The player widget is located at *priv/www/lib/player/player.ui.js*.

## Dependencies

* [[jQuery UI|http://jqueryui.com/]]

## Options

Option         | Description
---------------|---------------------------------------------------------------
start          | The time when user entered the meeting
src            | The video source (without .mp4 or .webm)
title          | The title to display in the widget header
width          |
height         |

## Methods

Method         | Description
---------------|---------------------------------------------------------------
play           | Resume the player
pause          | Pause the player
stop           | Stop the player
seek           | Jump to the specified timestamp
destroy        | Destroy the widget

## Example

```javascript
$("<div>").player({src    : "example",
                   width  : 600,
                   height : 400});
```

## Theming

```html
<div class="ui-widget ui-player">
  <div class="ui-widget-header">
    <span>Video</span>
  </div>
  <div class="ui-widget-content">
    <video height="400" width="600" class="ui-player-video" preload="auto" tabindex="0">
      <source src=example.mp4" name="mp4" type="video/mp4" codecs="avc1.42E01E, mp4a.40.2" />
      <source src="example.webm" name="webm" type="video/webm" codecs="vp8, vorbis" />
    </video>
  </div>
</div>
```
