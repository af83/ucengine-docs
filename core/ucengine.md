# ucengine

## NAME

ucengine - U.C.Engine daemon

## SYNOPSYS

`ucengine` (start|stop|restart|reboot|ping|console|attach) <br />
`ucengine` `--help` <br />

## DESCRIPTION

**ucengine** is the tool to start/stop U.C.Engine daemon.

## OPTIONS

### Server administration

  * `start`:
    Start U.C.Engine in background.

  * `stop`:
    Stop U.C.Engine when launched in background.

  * `console`:
    Start U.C.Engine in foreground with an erlang console.

  * `restart`:
    Restart U.C.Engine

  * `ping`:
    Is U.C.Engine running ?

  * `attach`:
    Attach and erlang shell to the current U.C.Engine node.
