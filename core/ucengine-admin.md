# ucengine-admin

## NAME

ucengine-admin - U.C.Engine administration

## SYNOPSYS

`ucengine-admin` `--help` <br />
`ucengine-admin <domain>` *object* <action> [`--<parameter>` <value>] <br />

## DESCRIPTION

**ucengine-admin** is the main administration tool for U.C.Engine.

## OPTIONS

### Server administration

  * `tests`:
    Run unit tests.

The following options are available:

  * node:

    The name of the Erlang node (ex. 'node1', 'node1@localhost' or 'node1@myhost.mydomain').

### Meetings

  * `meeting` `add` *name* [`--<metadata>` *value*] ... :

    Create an new meeting with name *name*.

  * `meeting` `update` *name* [`--<metadata>` *value*] ...

    Update the meeting with name *name*.

  * `meeting` `get` *name*

    Get all informations about the meeting *name*.

  * `meeting` `delete` *name*

    Delete the meeting with name *name*.

  * `meeting` `list`

    List all meetings.

### Users

  * `user` `add` *name* *auth* *credential* [`--<metadata>` *value*] ...

    Create an new user with the name *name* where <auth> is a method to authenticate (currently only 'password' and 'token' are supported) and <credential> the secret to authenticate the user.

  * `user` `update` *name* *auth* *credential* [`--<metadata>` *value*] ...

    Update the user with the name *name*.

  * `user` `get` *name*

    Get all informations about the user with the name *name*.

  * `user` `delete` *name*

    Delete the user with the name *name*,

  * `user` `list`

    List all users.

  * `user` `role` `add` *name* *role* [`--location` *location*]

    Give the role named *role* to the user *name* in an optional location *location*

  * `user` `role` `delete` *name* *role* [`--location` *location*]

    Remove the role named *role* to the user *name* in an optional location *location*

### Roles

  * `role` `add` *name*

  Add a new role named *name*. By default, no access rights are attached to this role.

  * `role` `delete` *name*

  Remove the role *name*.

  * `role` `access` `add` *name* *action* *object* [`--<condition> *value*] ...

  Allow the users with the role named *name* to do *action* on *object* with some <conditions> (see FORMAT for more informations about <conditions>).

  * `role` `access` `delete` *name* *action* *object* [`--<condition> *value*] ...

  Remove the right for the users with the role named *name* to do *action* on *object* with some <conditions>.

  * `role` `access` `check` *name* *action* *object* [`--location` *location*] [`--<condition> *value*] ...

  Check that the user *uid* has the right to do *action* on *object* in an optional location *location* with some <conditions>.

## FORMAT

  - `metadata`:
    meetings can hold an unlimited amount of metadata as a *key*=*value* store. Any arguments of the command line which are not part of the expected parameters are automatically added to the metadata of the object.

  - `conditions`:
    Just like `metadata` a list of conditions is created with all the command line arguments that are not used by the method itself. The list of conditions that can be used depend on the `object` and `action` used.

## NODE

  It is possible to specify the Erlang node name of U.C.Engine with
  the `--node` argument. This option can be useful when `ucengine-admin` could
  not find the U.C.Engine node name automatically. For example, if the
  U.C.Engine node name is `ucengine@myserver.com`:

  * `time` `get` `--node` ucengine@myserver.com

## EXAMPLES

List all meetings:
    ucengine-admin localhost meeting list

Only keep the closed|opened|upcoming meetings:
    ucengine-admin localhost meeting list closed
    ucengine-admin localhost meeting list opened
    ucengine-admin localhost meeting list upcoming

Create a new meeting 'Christmas dinner':
    ucengine-admin localhost meeting add 'Christmas dinner' --appetizer 'Chips'

Make it frenchier:
    ucengine-admin localhost meeting update 'Christmas dinner' --appetizer 'Snails'

And delete it:
    ucengine-admin localhost meeting delete 'Christmas dinner'

Create a new user 'Chuck' with a password set to 'Norris' with his nickname in the metadata:
    ucengine-admin localhost user add 'Chuck' 'password' 'Norris'\
                    --nickname 'Colonel Braddock'

Update the user with a stronger password and a different nickname:
    ucengine-admin localhost user update 'Chuck' 'password' '835dc9b5fa0ffa8'\
                       --nickname 'Cordell Walker'

Create a new role called 'ranger':
    ucengine-admin localhost role add ranger

Give this role to Chuck in Texas:
    ucengine-admin localhost user role add chuck ranger --location 'texas'

Add the right to the 'ranger' users to protect the law:
    ucengine-admin localhost role access add ranger kick butt --badguy yes

Delete this right:
    ucengine-admin localhost role access delete ranger kick butt --badguy yes

Delete the role:
    ucengine-admin localhost role delete ranger

And delete the user 'Chuck':
    ucengine-admin localhost user delete 'Chuck'
