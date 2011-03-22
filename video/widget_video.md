# Video Widget

Play live streaming or publish webcam to a *rtmp* server.

## Location

Video widget is located at *priv/www/lib/video/video.ui.js*.

## Dependencies

* jQuery UI

## Options

* title : title of the widget, default is *Video*
* ucemeeting : current meeting
* domain : *rtmp* server (like: video.ucengine.org/ucengine)
* stream : *rtmp* stream, should be unique across meetings (optional if ucemeeting is provided)
* token : token for rtmp stream (optional if ucemeeting is provided)
* width : width of the widget, the default width is the element width
* height : height of the widget, the default height is (width * ratio)
* ratio : width/height ratio (between 0 and 1), the default ratio is 0.75

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
  <div class="ui-widget-header ui-corner-all ui-helper-clearfix">
      <span class="ui-video-title">Video</span>
      <a href="#" class="ui-button ui-widget">Publish</a>
  </div>
  <div class="ui-widget-content">
      <embed height="" width="" wmode="transparent" src="/publish_video.swf" flashvars="" quality="75" type="application/x-shockwave-flash">
  </div>
</div>
```
