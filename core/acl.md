# Access Control list

## Setting up default acl

See the [[configuration file documentation|config]].

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
