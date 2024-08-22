# How to ask for help {#how-to-get-help}
In case you have a problem with a server or plugin (or mod), always describe your problem directly, specifically, in as much detail as possible, **always** [attach the server log](logs.md#how-to-share-log) and as much relevant information as possible (for example, if a player can't connect, a message telling the player what it says when they try to connect. If you have trouble with certain plugin setting, include the plugin configuration file(s) and so on).

If the server crashes and crash log is created, send that as well. Crash logs are located in the `/crash-reports/` folder. Send the crash log together with the regular log, do not send the crash log alone, always send normal log too!

A message like *"my server is down "* or *"my plugin is down "* is *completely insufficient* by itself.

Describe your problem in as much detail as possible, provide as much information as possible, what you have already tried, what tutorials you have used, etc.

Always include log and configuration files relevant to the problem, i.e. don't send a log that is two days old when you are dealing with a problem that is happening now. Usually you want to send the latest log, this is in `/logs/latest.log` on the standard platforms and Velocity, and in `proxy.log.0` on BungeeCord.

In case the problem still persists after somebody tries to help you, or you encounter a new problem, again send the (new) log or configuration files and provide as much information related to the problem as possible. The cause of the problem may be different, or you may not have followed the instructions correctly, and without a new log or configuration files it is impossible to tell. Therefore, if the problem persists after somebody's advice, writing *"don't work"* is **completely insufficient**.

If the server doesn't even try to enable (start), thus no log is generated, send the output from the console (terminal). If the console closes immediately, thus you have no time to copy the output, add `pause` to the new last line of the startup script (`something.bat`) on Windows, or `read -p "Press any key to exit"` on Linux/macOS.

## What to not do when asking for help {#dont-asking-for-help}
- do not remove "irrelevant information" from the log
- do not send snippets of log/configuration files

Whether it's logs, bugs, or config files, always share it in its entirety (except for sensitive informationlike tokens/passwords in config files). Do not remove "irrelevant information".

An experienced person can find out much more from a log than you might think, so removing some information can make finding the cause of the problem very difficult or impossible. If you want to remove "sensitive" information, such as IP addresses, you can use <https://mclo.gs> which will automatically hide it.

- do not send raw text/files/screenshots

When you want to share some text (e.g. a configuration file or log), never send it as raw text, a file, or a screenshot. Instead, use the pastebin service - see [here](#pastebin).

- do not send console output

Always share the log instead of the console output. The console output may not contain all the information and depending on the hosting it may be truncated. At the same time, people asking for help often don't copy all the relevant output, or they also copy the output from a previous server launch, which may have outdated information, so it makes it less readable and clear.

- do not seek for help retrospectively

Don't solve the problem retrospectively. Depending on the specific problem and the remaining information (e.g. from logs), finding out the cause may be quite difficult, if at all. If you don't ask for help when you have the problem, don't expect anyone to help you.

For example, in the following example, the cause of the problem cannot be find out, since there is no longer any information from which the cause can be deduced: "I need help with a modded server. I have built a modpack and uploaded it to a folder. The server started up, but after a while of someone playing, it disconnects them and they can't connect anymore. I can't send the log anymore because I reinstalled the server on Vanilla so we can play at least something."

### Inappropriate questions and behavior when seeking for help {#inappropriate-behavior}
Below you can see the most common examples of inappropriate questions and behaviors, with an explanation of why, and how a question might look "right".

- "how does \<plugin> work?"
- "how to set up \<plugin>?"

A question like "How to set up/how does \<plugin> work" is bad because it is too general. The plugin has a number of features and settings, which you can read more about in the [documentation](../general/docs.md) of the plugin or in the configuration files. If the documentation isn't enough to explain, you should always specify what **specifically** you want to set up in the plugin, or describe what **specific** aspect of the plugin you need to explain. No one is willing to explain every aspect of the plugin and configuration (i.e. rewrite the plugin documentation).

For example, a correctly asked question might be, "How do I change the maximum size of the player residence in the Residence plugin?"

- "Hi, is anyone here?"
- "can I ask you a question?"
- "I need help with XY"
- "does anyone have experience with the XY plugin?"
- "Anyone got time? I have a small question (about \<xy>)"

Always describe your problem specifically and provide as much information as possible. By asking questions like the ones above, you're only reducing the chances that someone will help you.

Most people will take a question like "I have a problem with \<xy\>" as: I have a problem with \<xy>, but I'm not even willing to describe it and provide more information, so I'm looking for a specific person who has enough confidence that will be able to help me, and is willing to spend the time to find out the cause of the problem, even though I don't even have the willingness to solve the problem enough to describe it, let alone provide the basic information needed to find out the cause/solution (<https://dontasktoask.com>).

For example, a proper query might be "Hello, I have a problem with \<x>. When I do \<y>, it becomes \<z>, even though I have \<something> set in the plugin configuration. \<link to plugin configuration\>. Why's that?"

- "my plugin is not working"
- "my server is down"

A message like "my server is down", "my plugin is down", etc. is completely insufficient. You always need to describe what specifically is not working and how. What exactly does it mean that the server is "not working"? Does it automatically shut down? Or does it not shut down, but you cannot connect? And what does it mean that the plugin "doesn't work"? It doesn't start (shut down immediately)? Or does it enable but you can't perform certain actions? Or the command returns an error? **Be specific**.

So it's important to always describe the problem in as much detail as possible, i.e. what specific plugin you have what specific problem with (generally it's good to state what make you think that it "doesn't work") and include as much information as possible, i.e. at least the server log, possibly configuration files, and in the case where the player can't connect, a message about what it says to the player when they try to connect.

- "do you know why is this happening? \<screenshot>" with no further information
- "do you know what to do? \<screenshot\>" with no further information

A screenshot can certainly help, but often the screenshot itself may not even tell other people what problem you have. Therefore, it is important not only to send a screenshot, but also to describe the problem and provide as much additional information as possible, including a detailed description of the problem, including when in which situation the problem occurs.

- "why can't I set up/configure \<plugin\>"

We don't know. What exactly does "set \<plugin\>" mean? And what exactly does "can't be set" mean? What makes you think the plugin can't be set? How specifically did you set up the plugin? You need to be specific and provide as much information as possible.

"Hello, I can't set \<plugin\> in \<x\> plugin. I have set \<y\> to `true` in the configuration file, but even after loading the changes using \<command\>, when I click on it, it says \<z\> - \<link to configuration file\>"

- "I need help with XY, DM me"
- don't add anyone as a friend or send them DMs

Unless the person told you, don't ping them, and always communicate in the channel intended for solving your problem. This means you should not send friend request to person or send them private message without their permission. This is inconsiderate not only to the person you are asking for help from, but also to other users who may later search for your problem using search feature. In addition, you are hurting yourself as you are reducing your chances of getting the ideal help, because "two (or more) heads are better than one".

- follow basic internet etiquette

This means not spamming, not @pinging a user without prior conversation (unless they gave you permission), or not contacting anyone directly (in general community support) without prior conversation. If you want to report a bug to the plugin author, that's fine of course).

In the end, you will only harm yourself by such behaviour, spamming and the like won't help you, asking for help in the right way will.

## Where to ask for help {#where-get-help}
If you're dealing with a general Minecraft server issue and need help, there are many communities that will help you. Some of these places include:

- Discord server/forums on the platform itself (e.g. PaperMC/PurpurMC/Fabric Discord)
- Admincraft Discord/Reddit (*r/admincraft*)
- HelpChat Discord (<https://helpch.at/>)
- Discord server of your host (if you use a managed host that has such Discord server)

If you are dealing with plugin (or mod) specific problem, you will often find an invitation to the Discord server on the plugin page.

The most convenient place to ask for help is usually Discord.

## Pastebin {#pastebin}
Never send logs and configuration files as a raw text, files, or a screenshot. Always use pastebin service, where you embed the contents of the file and share a generated link that other users can use to easily view the embedded file. Examples of such services include <https://mclo.gs> and <https://pastebin.com>.

Posting images is inappropriate as you cannot search for text in them and depending on the size and resolution of the monitor, some users may not see the text correctly or may not read it at all. In addition, the text in the image may not be readable by users with visual impairments, and the file may contain whitespaces that cannot be seen at a glance. At the same time, text from a screenshot of someone else's monitor is harder to read for everyone.

Sending files is inappropriate as the user has to download the shared file to their own computer (which some fear for security reasons), and also in the case of some file extensions, the content of the file cannot be easily viewed (especially on mobile devices).

Sending plain text (to Discord) is inappropriate as it is not possible to search in it easily.