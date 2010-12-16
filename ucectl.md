# ucectl

## NAME
ucectl - UCengine control

## SYNOPSYS

`ucectl` (run|start|debug|stop|tests) <br />
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

### Organisations

  * `org` `add` `--name` <name> [`--<metadata>` <value>] ... :
    Create a new organisation with name <name>.

  * `org` `update` `--name` <name> [`--<metadata>` <value>] ... :
    Update the organisation with name <name>.
      
  * `org` `get` `--name` <name>:
    Display all informations about the organisation <name>.

  * `org` `delete` `--name` <name>:
    Delete the organisation with name <name>

  * `org` `list`:
    Display all informations about all organisations.

### Meetings

  - `meeting` `add` `--org` <org> `--name` <name> [`--start` <date> `--end` <date>] [`--<metadata>` <value>] ... :
    Create an new meeting with name <name> in the organisation <org> with optional starting and ending dates (see the FORMAT section for date formatting).

  - `meeting` `update` `--org` <org> `--name` <name> [`--start` <date> `--end` <date>] [`--<metadata>` <value>] .. :
    Update the meeting with name <name> in the organisation <org> with optional starting and ending dates (see the FORMAT section for date formatting).

  - `meeting` `get` `--org` <org> `--name` <name>:
    Get all on informations about the meeting <name> in the organisation <org>.
  
  - `meeting` `delete` `--org` <org> `--name` <name>:
    Delete the meeting with name <name> in the organisation <org>.
  
  - `meeting` `list` `--org` <org> [`--status` <status>]:
    List all meetings with an optional status <status>, meeting status can be any of: `upcoming`|`opened`|`closed` or `all` (default).

## FORMAT

  - `<date>`:
    ISO8601 formatted date (ex. '2010-25-12 00:00:01').

  - `metadata`:
    Organisations and meetings can hold an unlimited amount of metadata as a `key`=<value> store. Any arguments of the command line which are not mandatory are automatically added to the metadata of the object.

## EXAMPLES

List all organisations:
	ucectl org list

Create a new organisation 'AF83' with two metadata ('description' and 'owner'):
	ucectl org add --name 'AF83' --description "Crazy Solid" --owner "Chuck Norris"

Oops, a mistake on the owner field, let's update it:
	ucectl org update --name 'AF83' --description "Crazy Solid" --owner "Louis Montagne"

And delete it:
	ucectl org delete --name 'AF83'

List all meetings at 'AF83':
	ucectl meeting list --org 'AF83'

Only keep the closed|opened|upcoming meetings:
	ucectl meeting list --org 'AF83' --status closed
	ucectl meeting list --org 'AF83' --status opened
	ucectl meeting list --org 'AF83' --status upcoming

Create a new meeting 'Christmas dinner' in the organisation 'AF83':
	ucectl meeting add --org 'AF83' --name 'Christmas dinner' --start '2010-24-12 20:30:00' --end '2010-25-12 03:00:00' --appetizer 'Chips'

Make it frenchier:
	ucectl meeting update --org 'AF83' --name 'Christmas dinner' --start '2010-24-12 20:30:00' --end '2010-25-12 07:00:00' --appetizer 'Snails'

And delete it:
	ucectl meeting delete --org 'AF83' --name 'Christmas dinner'