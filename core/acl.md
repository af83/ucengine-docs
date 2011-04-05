# Access Control list

## Roles

U.C.Engine have a role based autorization mechanism. With this system,
users can hold roles in a specific location, for example: the user
"chuck" holds the role "speaker" in the location "Meeting". 

A role is a set of access rights, namely an Access Control List
(ACL), and is identified by a name (ex: "speaker", "administrator", etc.).

Roles can be attributed to any users with an optional location. If a
location is set, the role will be available only in this location. For
example: the user `chuck` has a role `speaker` in the location
`meeting`. Users can hold as many roles as needed, and can hold the
same role in multiple locations.

When an user is created, it automatically holds the role named
"default" and a new role is created with the same id than the
user. These roles can be used to set access rights for all the users
or for a particular user.

## Access

An access right is the combination of an allowed `action`, an
`object` and an optional dictionary of `conditions`. A literal expression of
an access right could be: "is is allowed to perform `action` on
`object` as long as the `conditions` matches the parameters of the
request".

Note that a condition that is not set into the `conditions` dictionary
will be considered as true: an access right with a given condition
is included in the same access right without this condition. For
example: an access right that allow to `add` an `event` if its type is
`message.chat.new` is more restrictive than an access right that does
not give any conditions about the `event` type ; thus, the later allow the
users holding the role that own this access right to `add` an `event`
with any type.

## Setting up default rights

See the [[configuration file documentation|config]].

## Setting up rights at runtime

### Command-line

See the [[Roles section|ucectl#roles-starting-from-version-05]] of the
ucectl tool and some [[examples|ucectl#examples]].

### REST API

See the [[Roles section|api#roles-starting-from-version-05]] section
of the REST API documentation.

## Example

Let's create a new user named 'chuck' using the ucectl command line tool:

    $ ucectl user add --domain localhost --uid 'Chuck' --auth 'password' --credential 'Norris' --nickname 'Colonel Braddock'
    {"ok", "909432094832048032530257"}

This user holds two default roles: "default" and
"909432094832048032530257".

Create a new role 'ranger' and give it to Chuck

    $ ucectl role add --domain localhost --name ranger
    $ ucectl user role add --domain localhost --uid 909432094832048032530257 --role ranger --location texas

Let's add an access right for Chuck to kick the butt of the bad guys:

    $ ucectl role access add --domain localhost --name ranger --action kick --object butt --who badguys

Check that Chuck can really do it:

    $ ucectl role access check --domain localhost --uid 909432094832048032530257 --name ranger --action kick --object butt --who badguys
    Success: true

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
user.role      | add          | [[Set a role to an user|api#set-a-role-to-an-user]]
user.role      | delete       | [[Unset a role to an user|api#unset-a-role-to-an-user]]
role           | add          | [[Add a new role|api#add-a-new-role]]
role           | delete       | [[Delete a role|api#delete-a-role]]
access         | add          | [[Set an access right to a role|api#set-a-new-access-right-to-a-role]]
access         | delete       | [[Unset an access right from a role|api#unset-an-access-right-from-a-role]]

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
