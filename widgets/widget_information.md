# Information widget

The information widget display all the meeting informations from the
current meeting metadata and allow all the users who can update this
meeting to update them.

## Location

Information widget is located at *priv/www/lib/information/information.ui.js*.

## Dependencies

* jQuery UI
* [[jQuery Editable Plugin|http://plugins.jquery.com/node/5601/release]]

## Options

* ucemeeting: current meeting
* uceclient: the client object returned by uce.createClient()
* title
* fields: a list of fields to display (default: name and description),
  this list take the form of a dictionary with the name of the field
  in the meeting metadata as the key and a dictionary with the 'title'
  and 'placeholder' value.

## Methods

* clear
* destroy

## Examples

```javascript
$("#placeholder").information({ucemeeting: meeting,
                              uceclient: client,
                              fields: {'name': {title: "Meeting Name",
                                                placeholder: "Enter the name of the meeting room"},
                                       'description': {title: "Description",
                                                       placeholder: "Summarize the topic"}}});
```

## Theming
```html
<article id="information" class="ui-widget ui-information expanded">
  <div class="ui-widget-header ui-corner-all ui-helper-clearfix">
    <span class="ui-widget-header-left">
      <span class="ui-toolbar-button ui-button-fold ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" role="button" aria-disabled="false" title="">
        <span class="ui-button-icon-primary ui-icon ui-icon-triangle-1-s"></span>
        <span class="ui-button-text"></span>
      </span>
    </span>
    <span class="ui-widget-header-title">Informations</span>
    <span class="ui-widget-header-right">
      <span class="ui-toolbar-button ui-button-toggle ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" role="button" aria-disabled="false" title="">
        <span class="ui-button-icon-primary ui-icon ui-icon-circle-minus"></span>
        <span class="ui-button-text"></span>
      </span>
    </span>
  </div>
  <div class="ui-widget-content">
    <ul class="ui-information-list">
      <li class="ui-information-name">
        <span class="ui-information-title">Meeting Name</span>
        <span class="ui-information-value">My first meeting</span>
      </li>
      <li class="ui-information-description">
        <span class="ui-information-title">Description</span>
        <span class="ui-information-placeholder">Please enter a description of the meeting</span>
      </li>
    </ul>
  </div>
</article>
```
