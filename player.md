# Player

Video player using HTML5 *video* element. Video should be encoded in mp4 and webm.

## Options

* start
* src   : source of the video (without .mp4 or .webm)
* width
* height

## Methods

* play
* pause
* stop
* seek
* destroy

## Example

```javascript
$("<div>").player({src    : "example",
                   width  : 600,
                   height : 400});
```

## Theming

```html
<div class="ui-widget ui-player">
  <video height="400" width="600" class="ui-player-video" preload="auto" tabindex="0">
    <source src=example.mp4" name="mp4" type="video/mp4" codecs="avc1.42E01E, mp4a.40.2" />
    <source src="example.webm" name="webm" type="video/webm" codecs="vp8, vorbis" />
    </video>
</div>
```
