# How to hide plugin list {#plugin-list-hide}
The first step is to disable the `pl`/`plugins` command by disabling the `bukkit.command.plugins` permission. If you don't know how to work with permissions, take a look [here](../general/permissions.md#permissions).

The second step is to disable returning the list of plugins in the query response. You can do that by setting `settings.query-plugins` to `false` in the `bukkit.yml` file. In the case where sending the plugin list in query is enabled, it is possible to look at the list of plugins without connecting to the server, e.g. using <https://mcsrvstat.us>

These two steps disable the options that return the plugin list directly, but the plugin list is still not difficult to find out. One such option is via the namespaces of the commands. This is because the tab complete shows namespaces by default, i.e. `essentials:heal` (`essentials` is a namespace) instead of just `heal`. Command namespaces can be disabled in `spigot.yml` for `commands.send-namespaced` by setting the value to `false`. Tab complete can be disabled completely by setting `tab-complete` to `-1` in `spigot.yml`, but that will make the player experience worse. The server needs to be restarted for the changes to take effect.

```txt
Description: You can now specify how many letters of the command must be typed before it will be tab completed this will help deter people from just spamming around all the commands to see if there is one incorrectly set up.
0 will tab-complete all commands
-1 will disable tab completely
1 will mean you have to type the first letter
2 will mean you have to type the second letter... etc...
```

On new versions, fortunately, to hide commands, you can usually just disable the permission to the command.

On the old versions, you will still be able to see the commands for each plugin. These can be hidden with plugins like PluginHider or NoPlugins (I do not recommend any particular plugin or guarantee their quality or functionality, I am just giving examples). But it is worth considering whether such hiding is worth it. The more experienced will know what plugins you are using despite your efforts to hide them. At the same time, plugins appear in things such as log, Spark or Timings report.