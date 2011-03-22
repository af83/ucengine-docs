# ucectl

## NAME
ucectl - U.C.Engine control

## SYNOPSYS

`ucectl` (run|start|debug|stop|tests) [node [-c path]] <br />
`ucectl` `--help` <br />
`ucectl` *object* <action> [`--<parameter>` <value>] <br />

## DESCRIPTION

**Ucectl** is the main administration tool for UCengine.

## OPTIONS

### Server administration

  * `run`:
    Start UCengine in foreground.

  * `start`:
    Start UCengine in background.

  * `stop`:
    Stop UCengine when launched in background.

  * `tests`:
    Run unit tests.

The following options are available:

  * node:
    The name of the Erlang node (ex. 'node1', 'node1@localhost' or 'node1@myhost.mydomain').

  * -c <path>
    Path to the configuration file.

### Domain information

  * `infos` `update` `--domain` <domain>  [`--<metadata>` <value>] ... :
    Update the domain <domain> informations with arbitrary values

  * `infos` `get` `--domain` <domain>
    Get informations about the domain <domain>

### Meetings

  * `meeting` `add` `--domain` <domain> `--name` <name> [`--start` <date> `--end` <date>] [`--<metadata>` <value>] ... :
    Create an new meeting with name <name> with optional starting and ending dates (see the FORMAT section for date formatting).

  * `meeting` `update` `--domain` <domain> `--name` <name> [`--start` <date> `--end` <date>] [`--<metadata>` <value>] ... :
    Update the meeting with name <name>.

  * `meeting` `get` `--domain` <domain> `--name` <name>:
    Get all informations about the meeting <name>.

  * `meeting` `delete` `--domain` <domain> `--name` <name>:
    Delete the meeting with name <name>.

  * `meeting` `list` `--domain` <domain> `--status` <status>:
    List all meetings with an optional status <status>, meeting status can be any of: `upcoming`|`opened`|`closed` or `all` (default).

### Users

  * `user` `add` `--domain` <domain> `--uid` <uid> `--auth` <auth> `--credential` <credential> [`--<metadata>` <value>] ... :
    Create an new user with identifier <uid> where <auth> is a method to authenticate (currently only 'password' and 'token' are supported) and <credential> the secret to authenticate the user.

  * `user` `update` `--domain` <domain> `--uid` <uid> `--auth` <auth> `--credential` <credential> [`--<metadata>` <value>] ... :
    Update the user with identifier <uid>.

  * `user` `get` `--domain` <domain> `--uid` <uid>:
    Get all informations about the user with identifier <uid>.

  * `user` `delete` `--domain` <domain> `--uid` <uid>:
    Delete the user with identifier <uid>.

  * `user` `list` `--domain` <domain>:
    List all users.

  * `user` `role` `add` `--domain` <domain> `--uid` <uid> `--role` <role> [`--location` <location>]
    Give the role named <role> to the user <uid> in an optional location <location>
    
  * `user` `role` `delete` `--domain` <domain> `--uid` <uid> `--role` <role> [`--location` <location>]
    Remove the role named <role> to the user <uid> in an optional location <location>

### ACL (prior to version 0.5)

  * `acl` `add` `--domain` <domain> `--uid` <uid> `--object` *object* `--action` <action> [`--meeting` <meeting>] [`--condition` <value>] ... :
    Allow the user <uid> to do <action> on <object> bounded to an optional meeting <meeting> with some <conditions> (see FORMAT for more informations about <conditions>).

  * `acl` `delete` `--domain` <domain> `--uid` <uid> `--object` *object* `--action` <action> [`--meeting` <meeting>] [`--condition` <value>] ... :
    Remove the right for an user <uid> to do <action> on <object> in an optional meeting <meeting> with some <conditions>.

  * `acl` `check` `--domain` <domain> `--uid` <uid> `--object` *object* `--action` <action> [`--meeting` <meeting>] [`--condition` <value>] ... :
    Check that the user <uid> has the right to do <action> on <object> in an optional meeting <meeting> with some <conditions>.

### Roles (starting from version 0.5)

  * `role` `add` `--domain` <domain> `--name` <name> :
  Add a new role named <name>. By default, no access rights are attached to this role.
  
  * `role` `delete` `--domain` <domain> `--name` <name> :
  Remove the role <name>.
  
  * `role` `access` `add` `--domain` <domain> `--name` <name> `--action` <action> `--object` <object> [`--<condition> <value] ... :
  Allow the users with the role named <name> to do <action> on <object> with some <conditions> (see FORMAT for more informations about <conditions>).
  
  * `role` `access` `delete` `--domain` <domain> `--name` <name> `--action` <action> `--object` <object> [`--<condition> <value] ... :
  Remove the right for the users with the role named <name> to do <action> on <object> with some <conditions>.
  
  * `role` `access` `check` `--domain` <domain> `--uid` <uid> `--location` <location> `--action` <action> `--object` <object> [`--<condition> <value] ... :
  Check that the user <uid> has the right to do <action> on <object> in an optional location <location> with some <conditions>.

## FORMAT

  - `<date>`:
    ISO8601 formatted date (ex. '2010-25-12 00:00:01').

  - `metadata`:
    meetings can hold an unlimited amount of metadata as a `key`=<value> store. Any arguments of the command line which are not part of the expected parameters are automatically added to the metadata of the object.

  - `conditions`:
    Just like `metadata` a list of conditions is created with all the command line arguments that are not used by the method itself. The list of conditions that can be used depend on the `object` and `action` used.

## NODE

  It is possible to specify the Erlang node name of U.C.Engine with
  the `--node` argument. This option can be useful when `ucectl` could
  not find the U.C.Engine node name automatically. For example, if the
  U.C.Engine node name is `ucengine@myserver.com`:
  
  * `demo` `start` `--node` ucengine@myserver.com

## EXAMPLES

List all meetings:
	ucectl meeting list --domain localhost

Only keep the closed|opened|upcoming meetings:
	ucectl meeting list --domain localhost --status closed
	ucectl meeting list --domain localhost --status opened
	ucectl meeting list --domain localhost --status upcoming

Create a new meeting 'Christmas dinner':
	ucectl meeting add --domain localhost --name 'Christmas dinner' --start '2010-24-12 20:30:00'
                --end '2010-25-12 03:00:00' --appetizer 'Chips'

Make it frenchier:
	ucectl meeting update --domain localhost --name 'Christmas dinner' --start '2010-24-12 20:30:00'
                --end '2010-25-12 07:00:00' --appetizer 'Snails'

And delete it:
ucectl meeting list --domain localhost	ucectl meeting delete --domain localhost --name 'Christmas dinner'

Create a new user 'Chuck' with a password set to 'Norris' with his nickname in the metadata:
	ucectl user add --domain localhost --uid 'Chuck' --auth 'password' --credential 'Norris'
		--nickname 'Colonel Braddock'

Update the user with a stronger password and a different nickname:
	ucectl user update --domain localhost --uid 'Chuck' --auth 'password' --credential '835dc9b5fa0ffa8'
		--nickname 'Cordell Walker'

Allow Chuck to join the meeting 'Coliseum' if he doesn't wear shirt:
	ucectl acl add --domain localhost --uid 'Chuck' --meeting 'Coliseum' --object 'roster'
		--action 'add' --topless 'yes'

Check that Chuck cannot join the meeting 'Coliseum' if he wear shirt:
	ucectl acl add --domain localhost --uid 'Chuck' --meeting 'Coliseum' --object 'roster'
		--action 'add' --topless 'no'

Delete this right:
	ucectl acl delete --domain localhost --uid 'Chuck' --meeting 'Coliseum' --object 'roster'
		--action 'add' --topless 'yes'

And delete the user 'Chuck':
	ucectl user delete --domain localhost --uid 'Chuck'
