# Whiteboard

The whiteboard widget allow you to draw in real time with other users.

## Location

https://github.com/AF83/ucengine-widgets

## Dependencies

* [[jQuery UI|http://jqueryui.com/]]
* [[UCE widget|https://github.com/AF83/ucengine/blob/master/priv/www/lib/ucewidget.js]]
* [[Html5 Canvas Whiteboard|http://code.google.com/p/html-5-canvas-whiteboard/]]

## Options

Option         | Description
---------------|---------------------------------------------------------------
ucemeeting     | The current meeting
disabled       | Readonly mode
width          |
height         |
ratio          |

## Methods

Method         | Description
---------------|---------------------------------------------------------------
hideControls   | Hide the tools and color buttons
showControls   | Show the tools and color buttons
clear          | Clear the drawing area
destroy        | Destroy the widget

## Examples

```javascript
$("#placeholder").whiteboard({ucemeeting: meeting});
```

## Events
### whiteboard.drawing.clear

Sent by the widget to notifies users that the drawing area has been cleared.

Example:

```javascript
{ "type"     : "whiteboard.drawing.clear",
  "domain"   : "localhost",
  "datetime" : 1302528618280,
  "id"       : "74328361540633556256331623521724",
  "location" : "demo",
  "from"     : "82435388420458600092293846199231",
  "metadata" : {}
}
```

### whitebard.shape.draw

Sent by the whiteboard to notifies users that a shape has been drawn.

Metadata       | Description
---------------|---------------------------------------------------------------
tool           | Either `pencil`, `rectangle` or `circle`
color          | A hexadecimal color
x1             |
y1             |
x2             |
y2             |

Example:

```javascript
{ "type"     : "whiteboard.shape.draw",
  "domain"   : "localhost",
  "datetime" : 1302528106348,
  "id"       : "51368292114199631817954140066774",
  "location" : "demo",
  "from"     : "82435388420458600092293846199231",
  "metadata" : {
    "tool":"pencil",
    "color":"#000000",
    "x1":"304",
    "y1":"74",
    "x2":"310",
    "y2":"94"
  }
}
```

## Theming

```html
<article id="whiteboard" class="ui-widget ui-whiteboard">
  <div class="ui-widget-header ui-corner-all ui-helper-clearfix">
    <span class="ui-widget-header-left">
      <span class="ui-toolbar-button ui-button-fold ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" role="button" aria-disabled="false" title="">
        <span class="ui-button-icon-primary ui-icon ui-icon-triangle-1-s"></span>
        <span class="ui-button-text"></span>
      </span>
    </span>
    <span class="ui-widget-header-title">Whiteboard</span>
    <span class="ui-widget-header-right">
      <span class="ui-toolbar-button ui-button-toggle ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" role="button" aria-disabled="false" title="">
        <span class="ui-button-icon-primary ui-icon ui-icon-circle-plus"></span>
        <span class="ui-button-text"></span>
      </span>
    </span>
  </div>
  <div class="ui-widget-content">
    <div class="ui-whiteboard-toolbar">
      <span class="ui-whiteboard ui-toolbar-button ui-button-left ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" role="button" aria-disabled="false" title="">
        <span class="ui-button-icon-primary ui-icon ui-icon-pencil"></span>
        <span class="ui-button-text"></span>
      </span>
      <span class="ui-whiteboard ui-toolbar-button ui-button-left ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only ui-state-highlight" role="button" aria-disabled="false" title="">
        <span class="ui-button-icon-primary ui-icon ui-whiteboard-icon-rectangle"></span>
        <span class="ui-button-text"></span>
      </span>
      <span class="ui-whiteboard ui-toolbar-button ui-button-left ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" role="button" aria-disabled="false" title="">
        <span class="ui-button-icon-primary ui-icon ui-whiteboard-icon-circle"></span>
        <span class="ui-button-text"></span>
      </span>
      <span class="ui-whiteboard ui-toolbar-button ui-button-right ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" role="button" aria-disabled="false" title="">
        <span class="ui-button-icon-primary ui-icon ui-icon-trash"></span>
        <span class="ui-button-text"></span>
      </span>
      <span class="ui-whiteboard ui-toolbar-button ui-button-right ui-button-color ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" role="button" aria-disabled="false" style="background-color: rgb(233, 130, 91);">      <span class="ui-button-text"></span>
      </span>
      <span class="ui-whiteboard ui-toolbar-button ui-button-right ui-button-color ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" role="button" aria-disabled="false" style="background-color: rgb(207, 78, 49);">
        <span class="ui-button-text"></span>
      </span>
      <span class="ui-whiteboard ui-toolbar-button ui-button-right ui-button-color ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" role="button" aria-disabled="false" style="background-color: rgb(255, 255, 255);">
        <span class="ui-button-text"></span>
      </span>
      <span class="ui-whiteboard ui-toolbar-button ui-button-right ui-button-color ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" role="button" aria-disabled="false" style="background-color: rgb(0, 0, 0);">
        <span class="ui-button-text"></span>
      </span>
    </div>
    <div class="ui-whiteboard-drawing">
      <canvas id="whiteboard-canvas" width="574" height="459" style="height: 254.4px;"></canvas>
    </div>
  </div>
</article>
```
