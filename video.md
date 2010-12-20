# Video

Play live streaming or publish webcam to a *rtmp* server.

## Options

* title : title of the widget, default is *Video*
* ucemeeting : current meeting
* domain : *rtmp* server (like: video.ucengine.org/ucengine)
* stream : *rtmp* stream, should be unique across meetings (optional if ucemeeting is provided)
* token : token for rtmp stream (optional if ucemeeting is provided)
* width
* height

## Methods

* publish: publish video stream from webcam
* receive: receive video stream
* destroy: destroy widget

## Examples

Basic usage:

```javascript
$("#demo").video({domain: "video.ucengine.org", stream: "mystream"});
```

Use it with [[erlyvideo]], only pass *domain* and *ucemeeting*:

```javascript
$("#demo").video({domain: "video.ucengine.org", ucemeeting: meeting});
```

## Theming

```html
<div class="ui-widget ui-video">
  <div class="ui-widget-header">
      <a href="#" class="ui-button ui-widget">Publish</a>
      <span class="ui-video-title">Video</span>
  </div>
  <div class="ui-widget-content">
      <embed height="" width="" wmode="transparent" src="/publish_video.swf" flashvars="" quality="75" type="application/x-shockwave-flash">
  </div>
</div>
```
