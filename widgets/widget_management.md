# Management widget

The management widget facilitates the management of users, their rights and their interactions.

## Location

Management widget is located at *priv/www/lib/management/management.ui.js*.

## Dependencies

* [[jQuery UI|http://jqueryui.com/]]
* [[jQuery Editable Plugin|http://plugins.jquery.com/node/5601/release]]
* [[ZeroClipboard|http://code.google.com/p/zeroclipboard/]]

## Options

Option         | Description
---------------|---------------------------------------------------------------
ucemeeting     | The current meeting
uceclient      | The client object returned by uce.createClient()
title          | The title to display in the widget header
url            | The meeting url
code           | The meeting access code

## Methods

* clear
* destroy

## Examples

```javascript
$("#placeholder").management({ucemeeting: meeting, uceclient: client});
```

## Events
### roster.nickname.update

Sent by an user to set his new nickname

Metadata       | Description
---------------|-------------------------------------------------------------------------------------------------------
nickname       | The new nickname

Example:

```javascript
{ "type"     : "roster.nickname.update",
  "datetime" : 1292601125202,
  "id"       : "91918360913598370296768635184375",
  "location" : "demo",
  "from"     : "uid_63444326443_50150",
  "metadata" : {
    "nickname": "The Dude"
  }
}
```

### meeting.lead.request

Sent by an user to request the lead of the meeting to the `owner`.

Example:

```javascript
{ "type"     : "meeting.lead.request",
  "datetime" : 1292601125202,
  "id"       : "91918360913598370296768635184375",
  "location" : "demo",
  "from"     : "uid_63444326443_50150",
  "metadata" : {}
}
```

### meeting.lead.refuse

Sent by the meeting owner to warn the user that its lead request was refused.

Metadata       | Description
---------------|-------------------------------------------------------------------------------------------------------
user           | The id of the user who sent the lead request

Example:

```javascript
{ "type"     : "meeting.lead.refuse",
  "datetime" : 1292601125202,
  "id"       : "91918360913598370296768635184375",
  "location" : "demo",
  "from"     : "uid_63444326443_50150",
  "metadata" : {
    "user"   : "uid_9340329840_41321"
  }
}
```

## Theming
```html
<article id="management" class="ui-management ui-widget">
  <div class="ui-widget-header ui-corner-all ui-helper-clearfix">
    <span class="ui-widget-header-left">
      <span class="ui-toolbar-button ui-button-fold ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" role="button" aria-disabled="false" title="">
        <span class="ui-button-icon-primary ui-icon ui-icon-triangle-1-s"></span>
          <span class="ui-button-text"></span>
        </span>
      </span>
      <span class="ui-widget-header-title">Meeting Facilitation</span>
      <span class="ui-widget-header-right">
       <span class="ui-toolbar-button ui-button-toggle ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" role="button" aria-disabled="false" title="">
         <span class="ui-button-icon-primary ui-icon ui-icon-circle-plus"></span>
         <span class="ui-button-text"></span>
       </span>
     </span>
   </div>
   <div class="ui-widget-content">
     <div class="ui-management-roster-header">
       <h1>Connected users (2)</h1>
       <a class="ui-management-invite-link">Invite</a>
     </div>
     <ul class="ui-management-roster">
       <li>
         <span class="ui-management-user">Unnamed 2</span>
         <span class="ui-management-role">You</span>
         <a class="ui-management-lead-button ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-management-lead-button-request" role="button" aria-disabled="false">
           <span class="ui-button-text">Request Lead</span>
         </a>
       </li>
       <li>
         <span class="ui-management-user">Unnamed 1</span>
         <span class="ui-management-role">Owner</span>
       </li>
     </ul>
     <div class="ui-management-invite-header">
       <a class="ui-management-roster-link">Users</a>
       <h1>Add users</h1>
     </div>
     <div class="ui-management-invite">
       <p>URL</p>
       <input type="text" class="ui-management-url" readonly="">
       <a class="ui-management-copy-button ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" role="button" aria-disabled="false">
         <span class="ui-button-text">Copy</span>
       </a>
       <p>Access Code</p>
       <input type="text" class="ui-management-code" readonly="">
       <a class="ui-management-copy-button ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" role="button" aria-disabled="false">
         <span class="ui-button-text">Copy</span>
       </a>
     </div>
   </div>
 </article>
```
