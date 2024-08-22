# Console {#console}
Simply put, the console will allow you to execute commands with full privileges (without having to be connected to the server) and monitor the output of the server.

People who have never managed a Minecraft server (with access to the console) may have a bad idea of what the console is. For example, a message like "I got banned on my server for cheats, how to fix the console" doesn't make sense.

In principle, the console is really only used to execute commands. It doesn't "do" anything on its own. That is, anticheat detected the cheats and executed the ban command (using the console, so the ban message showed that he got banned by the console). So if the player didn't actually cheat, he may have a broken anticheat plugin, but not the console.

## Console commands {#console-commands}
The console has all rights to execute all commands.

As noted [here](commands.md#commands-console), commands in the console are by default written without an initial slash, since everything executed in the console is a command, so the initial slash is only written in chat, not the console (since the console executes the command and the command itself is e.g. `day`, not `/day`, whereas in a chat an initial slash indicates you are going to execute a command).

A console-related concept that is important to understand is [command-executor](commands.md#command-executor).

## Console spam {#console-spam}
In the case where the console is spamming errors, you have to fix these errors. Definitely do not use plugins like ConsoleSpamFix as a patch. See [here](../problem-solving/how-to-deal-with-issues.md) to learn how to deal with such errors.