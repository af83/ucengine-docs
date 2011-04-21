# Timer

The timer widget show elapsed and remaining time of the current meeting.

## Location

The timer widget is located at *priv/www/lib/timer/timer.ui.js*.

## Dependencies

* [[jQuery UI|http://jqueryui.com/]]

## Options

Option         | Description
---------------|---------------------------------------------------------------
ucemeeting     | The current meeting
start          | The time when the user entered the meeting

## Methods

Method         | Description
---------------|---------------------------------------------------------------
destroy        | Destroy the widget

## Example

```javascript
$("<div>").timer({ucemeeting: meeting, start: time});
```

## Theming

```html
<div class="ui-widget ui-timer">
  <div class="ui-widget-content">
    <span class="ui-timer-value">00:20:00 / 00:00:00 / 00:20:00</span>
  </div>
</div>
```
