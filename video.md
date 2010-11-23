# Video

Play live streaming or publish webcam to a *rtmp* server.

## Options

* domain : *rtmp* server (like: video.ucengine.org/ucengine)
* stream : *rtmp* stream, should be unique across meetings.
* width
* height

## Methods

* publish: publish video stream from webcam
* receive: receive video stream
* destroy: destroy widget

## Examples

```javascript
$("#demo").video({domain: "video.ucengine.org"});
```

## Theming

```html
<div class="ui-widget ui-video">
  <embed height="" width="" wmode="transparent" src="" flashvars="" quality="75" type="application/x-shockwave-flash">
</div>
```
