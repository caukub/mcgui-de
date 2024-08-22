# Logs {#log}
A log is a file that contains the output of the server. It contains a lot of information from which you can (usually) determine the cause and solution of various issues.

## How to send a log {#how-to-share-log}
Open the log file, select all of its contents using *Ctrl + A* shortcut, then copy it with *Ctrl + C*, paste the copied contents to some [pastebin](how-to-ask-for-help.md#pastebin) (e.g. <https://mclo.gs>) and save. After you submit the log to pastebin, pastebin will generate a link that you can share with others.

Usually you want to share the latest log, which for most platforms will be located at `/logs/latest.log`.

Always send a log relevant to the time of the problem, i.e. if the problem occurred at the last server start, don't send a log that is several days old, but the most recent log (which for most platforms will be `/logs/latest.log`).

Always share the whole log, don't remove "irrelevant information", don't share snippets (see [here](how-to-ask-for-help.md#dont-asking-for-help)).

If the server doesn't even try to start, thus no log is created, send the output from the console (terminal). If the console closes immediately on startup, thus you don't have time to copy the output, add `pause` to the new last line of the startup script (`something.bat`) on Windows, `read -p "Press any key to exit"` on Linux/macOS.

### Where is the log located {#log-location}
On classic platforms and Velocity, logs are located in the `/logs/` folder, on BungeeCord/Waterfall in the `proxy.log.0` file.

On very old versions (1.5.2/1.6.4), the log is located in the [server root](~root-directory) in the `server.log` file.

## Log basics {#log-basics}
In the case where you are experiencing a problem related to the server itself, a plugin, or a mod, the cause and solution to the problem can almost always be gleaned from the [server log](#log).

You can read the log from the beginning line by line, but this is usually unnecessary. You can search in text in almost any browser/text editor using the *Ctrl + F* shortcut.

So, if you have a general server problem where you don't know the cause (e.g. the server automatically shuts down), you want to search the log for error messages, i.e. messages with [log level *error*, possibly *warn*](#log-level), i.e. messages containing *'ERROR'* (possibly also *'FATAL'* on Forge and *'SEVERE'* on BungeeCord/Waterfall).

If you have a specific problem with a plugin (or mod; e.g. it won't start), you want to look for messages in the log with the name of that plugin. So if the *AuctionHouse* plugin does not work, you want to look for messages containing *'AuctionHouse'*, as in the example below.

If you don't know what the various errors in the log mean, [this section](#how-to-deal-with-issues) may help.

If you still don't understand the contents of the log and even [Google doesn't help](#google-search), [share the log](#how-to-share-log) and [get advice](#where-get-help).

For example, the message in the log might look like this:

```log
[18:42:47] [Server thread/ERROR]: [AuctionHouse] Error! No plugin supporting Vault's Economy API was found!
```

The structure of the log message in the example above is following:

1. timestamp

The first part of this message is the time it was logged.

2. the source of the message

The source of the message indicates on which thread the message was recorded. In this case it is the 'Server thread'. This information is mostly useless and you don't need to understand it to solve basic problems.

###   {#log-level}

3. log-level

Log level indicates severity. In this case, the log level is *ERROR*, which indicates that this is an error message.

The existing levels are as follows:

- info - information message only
- warn - should not be a serious error, but it warns the user of something
- error - a log level error message indicates that an error has occurred

On Forge you can also encounter *'FATAL'*, on BungeeCord/Waterfall *'SEVERE'*.

4. component name

The component indicates where the message came from (what logged the message). In this case, it is the *AuctionHouse* plugin. If the component is missing, the message was logged by the Minecraft server itself.

5. message

In this case, "Error! No plugin supporting Vault's Economy API was found!" - the log message itself

The format of the log message itself may vary, for example it may not contain square brackets.

## Log splitting {#log-splitting}
If the server runs for a long time, the log is automatically "truncated" after some time and a new file is created. In this case, if you are sending the last log, you need to include the previous log so that the person reading the log has all the information they need.