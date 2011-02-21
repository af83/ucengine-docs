# File

Upload file in current meeting, list uploaded files and allow user to preview or to share one of this files.

## Options

* ucemeeting: current meeting
* upload: show/hide upload button
* title: custom title

## Methods

* clear: reinit widget
* viewAll: show list uploaded files and hide file preview screen
* viewPreview: hide list uploaded files and show file preview screen
* destroy: destroy widget

## Exemple
```javascript
$("#demo").file_upload({ucemeeting: meeting});
```

## Theming

```html
<article id="fileupload" class="ui-widget ui-fileupload">
    <div class="ui-widget-header ui-corner-all ui-helper-clearfix">
        <span class="ui-widget-header-left">
            <span class="ui-toolbar-button ui-button-fold ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" role="button" aria-disabled="false" title="">
                <span class="ui-button-icon-primary ui-icon ui-icon-triangle-1-s"></span>
                <span class="ui-button-text"></span>
            </span>
        </span>
        <span class="ui-widget-header-title">Files</span>
        <span class="ui-widget-header-right">
            <span class="ui-toolbar-button ui-button-toggle ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" role="button" aria-disabled="false" title="">
                <span class="ui-button-icon-primary ui-icon ui-icon-circle-plus"></span>
                <span class="ui-button-text"></span>
            </span>
        </span>
    </div>
    <div class="ui-widget-content">
        <div class="ui-fileupload-all">
            <ul class="ui-fileupload-list"></ul>
            <div>
                <p class="ui-fileupload-add">
                    <a href="#" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" role="button" aria-disabled="false"><span class="ui-button-text">Upload New File</span></a>
                </p>
            </div>
        </div>
        <div class="ui-fileupload-preview" style="display: none;">
            <div class="ui-fileupload-preview-title"></div>
            <div class="ui-corner-all ui-preview-toolbar">
                <span class="ui-fileupload ui-toolbar-button ui-button-previous ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" href="#" role="button" aria-disabled="false" title="">
                    <span class="ui-button-icon-primary ui-icon ui-icon-arrowthick-1-n"></span>
                    <span class="ui-button-text"></span>
                </span>
                <span class="ui-fileupload ui-toolbar-button ui-button-next ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" href="#" role="button" aria-disabled="false" title="">
                    <span class="ui-button-icon-primary ui-icon ui-icon-arrowthick-1-s"></span>
                    <span class="ui-button-text"></span>
                </span>
                <span class="ui-fileupload ui-toolbar-selector">
                    <span class="ui-fileupload ui-selector-current"></span>
                    <span class="ui-fileupload ui-selector-separator">/</span>
                    <span class="ui-fileupload ui-selector-total"></span>
                </span>
                <span class="ui-fileupload ui-toolbar-button ui-button-stop ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" href="#" role="button" aria-disabled="false" title="">
                    <span class="ui-button-icon-primary ui-icon ui-icon-circle-close"></span>
                    <span class="ui-button-text"></span>
                </span>
            </div>
            <div class="ui-fileupload-preview-page"><img></div>
        </div>
    </div>
</article>
```
