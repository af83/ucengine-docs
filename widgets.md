# Widgets

## Video

### Options

* domain
* width
* height

### Methods

* publish: publish video stream from webcam
* receive: receive video stream
* destroy: destroy widget

### Examples

```javascript
$("#demo").video({domain: "video.ucengine.org"});
```

## Whiteboard

### Options

* ucemeeting: current meeting with attached session
* disabled: readonly mode
* width
* height
* canvas_id_bottom
* canvas_id_interface
* controls_id
* choosers_id
* widget_color: show/hide color widget
* widget_color_id
* widget_linewidth: show/hide linewidth widget
* widget_linewidth_id
* widget_transport: show/hide transport widget
* widget_transport_id

### Methods

* hideControls
* showControls
* clear
* destroy

### Examples

```javascript
$("#demo").whiteboard();
```

## File

### Options

* ucemeeting: current meeting
* upload: show/hide upload button

### Methods

* clear
* destroy

## Replay

### Options

* date_start
* date_end

### Events

* start
* pause
* stop
* jump ui.timecode

## Chat

TODO

## Search

## Results
