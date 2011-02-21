# File sharing widget

The file sharing widget allow you to synchronize the viewing of a document
with other participants of the meeting.

## Options

* ucemeeting: current meeting
* title: custom title

## Methods

* clear: reinit widget
* startSharing: show a preview screen for the current shared file
* stopSharing: hide the preview screen and show a message that explain there is no shared file for now
* destroy: destroy widget

## Example

```javascript
$("#demo").file_sharing({ucemeeting: meeting});
```

## Theming

```html
<article id="filesharing" class="ui-widget ui-filesharing">
    <div class="ui-widget-header ui-corner-all ui-helper-clearfix">
        <span class="ui-widget-header-left">
            <span class="ui-toolbar-button ui-button-fold ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" role="button" aria-disabled="false" title="">
                <span class="ui-button-icon-primary ui-icon ui-icon-triangle-1-s"></span>
                <span class="ui-button-text"></span>
            </span>
        </span>
        <span class="ui-widget-header-title">File sharing</span>
        <span class="ui-widget-header-right">
            <span class="ui-toolbar-button ui-button-toggle ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" role="button" aria-disabled="false" title="">
                <span class="ui-button-icon-primary ui-icon ui-icon-circle-plus"></span>
                <span class="ui-button-text"></span>
            </span>
        </span>
    </div>

    <div class="ui-widget-content">
        <div class="ui-corner-all ui-filesharing-toolbar">
            <span class="ui-filesharing ui-toolbar-button ui-button-previous ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" href="#" role="button" aria-disabled="false" title="">
                <span class="ui-button-icon-primary ui-icon ui-icon-arrowthick-1-n"></span>
                <span class="ui-button-text"></span>
            </span>
            <span class="ui-filesharing ui-toolbar-button ui-button-next ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" href="#" role="button" aria-disabled="false" title="">
                <span class="ui-button-icon-primary ui-icon ui-icon-arrowthick-1-s"></span>
                <span class="ui-button-text"></span>
            </span>
            <span class="ui-filesharing ui-toolbar-button ui-button-stop ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" href="#" role="button" aria-disabled="false" title="">
                <span class="ui-button-icon-primary ui-icon ui-icon-circle-close"></span>
                <span class="ui-button-text"></span>
            </span>
            <span class="ui-filesharing ui-toolbar-selector">
                <span class="ui-filesharing ui-selector-current"></span>
                <span class="ui-filesharing ui-selector-separator">/</span>
                <span class="ui-filesharing ui-selector-total"></span>
            </span>
        </div>
        <div class="ui-filesharing-page"></div>
        <p class="ui-filesharing-nosharing">There is no shared file for now</p>
    </div>
</article>
```
