# Access Control list

## Setting up default rights

See the [[configuration file documentation|config]].

## Setting up rights via the command line

See the [[ACL section|ucectl#acl]] of the ucectl tool and some [[examples|ucectl#examples]].

## List

Object         | Action       | Description
---------------|--------------|----------------------------------------------------------------------------------------
infos          | get          | [[Retrieve the current domain informations|api#get-current-domain-informations]]
infos          | update       | [[Update current domain informations|api#update-current-domain-informations]]
meeting        | get          | [[Retrieve meeting informations|api#retrieve-meetings-informations]]
meeting        | list         | [[List the meetings|api#list-the-meetings]]
meeting        | add          | [[Create a meeting|api#create-a-meeting]]
meeting        | update       | [[Update a meeting|api#modify-a-meeting]]
roster         | add          | [[Join a meeting|api#join-a-meeting]]
roster         | delete       | [[Leave a meeting|api#quit-a-meeting]]
roster         | list         | [[List meeting participant|api#list-users-connected-to-a-meeting-roster]]
file           | add          | [[Upload a file|api#upload-a-file]]
file           | list         | [[List files|api#list-files]]
file           | get          | [[Download a file|api#download-a-file]]
file           | delete       | [[Delete a file|api#delete-a-file]]
event          | get          | [[Retrieve an event by id|api#retrieve-a-event]]
event          | list         | [[List events|api#retrieve-the-events]]
event          | add          | [[Add an event|api#send-an-event-to-ucengine]]
presence       | add          | [[Login|api#authentification]]
presence       | delete       | [[Logout|api#disconnect-users]]
user           | list         | [[List users|api#list-users]]
user           | update       | [[Updade user informations|api#modify-users-informations]]
user           | get          | [[Get user informations|api#retrieve-users-informations]]
user           | delete       | [[Delete an user|api#delete-a-user]]

## Conditions

Conditions allows you to specify rights more finely.

Object         | Action       | Condition  |  Description
---------------|--------------|------------|---------------------------------------------------------------------------------
file           | get          | id         | Download the file which have the corresponding file id.
file           | delete       | id         | Delete the file which have the corresponding file id.
event          | get          | id         | Retrieve the event which have the corresponding event id.
event          | list         | from       | List events which have been posted by the corresponding "from" uid.
event          | add          | to         | Send an event to the corresponding "to" uid.
user           | update       | user       | Update the corresponding "user" uid.
user           | update       | auth       |
user           | get          | user       | Retrieve the informations of the corresponding "user" uid.
user           | delete       | user       | Delete the corresponding "user" uid.
