# Timer

The timer widget show elapsed and remaining time of the current meeting.

## Options

* ucemeeting: current meeting
* start: The time when the user entered the meeting.

## Methods

* destroy

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
