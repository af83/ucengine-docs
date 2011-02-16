# File sharing widget

Upload file in current meeting, list uploaded files and allow user to share one of this files.

## Options

* ucemeeting: current meeting
* upload: show/hide upload button
* title: custom title 

## Methods

* clear: reinit widget
* viewAll: show list uploaded files and hide file preview screen
* viewPreview: hide list uploaded files and show file preview screen
* destroy: destroy widget

## Example

```javascript
$("#demo").file_sharing({ucemeeting: meeting});
```

## Theming

```html
<div class="ui-widget ui-filesharing">
  <div class="ui-widget-header">
    <span>File sharing</span>
  </div>
  <div class="ui-filesharing-all" style="display: block;">
    <ul class="ui-filesharing-list"></ul>
  </div>
  <div>
    <p class="ui-filesharing-add">
      <a href="#" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" role="button" ara-disabled="false"><span class="ui-button-text">Upload New File</span></a>
    </p>
  </div>
  <div class="ui-filesharing-preview" style="display: none;">
    <div class="ui-file-sharing-preview-title"></div>
    <div class="ui-corner-all ui-preview-toolbar">
      <span class="ui-filesharing ui-toolbar-button ui-button-previous ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" href="#" role="button" aria-disabled="false" title="">
      <span class="ui-button-icon-primary ui-icon ui-icon-arrowthick-1-n"></span>
      <span class="ui-button-text"></span></span>
      <span class="ui-filesharing ui-toolbar-button ui-button-next ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" href="#" role="button" aria-disabled="false" title="">
        <span class="ui-button-icon-primary ui-icon ui-icon-arrowthick-1-s"></span>
        <span class="ui-button-text"></span>
      </span>
      <span class="ui-filesharing ui-toolbar-selector">
        <span class="ui-filesharing ui-selector-current"></span>
        <span class="ui-filesharing ui-selector-separator">/</span>
        <span class="ui-filesharing ui-selector-total"></span>
      </span>
      <span class="ui-filesharing ui-toolbar-button ui-button-stop ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" href="#" role="button" aria-disabled="false" title="">
        <span class="ui-button-icon-primary ui-icon ui-icon-circle-close"></span>
        <span class="ui-button-text"></span>
      </span>
    </div> 
    <div class="ui-filesharing-preview-page">
      <img src=""/>
    </div>
  </div>
</div>
```
