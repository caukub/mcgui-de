# Reload {#reload}
If the server is running on the Spigot platform or its [fork](../general/platforms.md#forks) (Paper, Pufferfish, Purpur, ...), do not use the `reload` command, especially if it is a production server. You can learn more why [here](https://madelinemiller.dev/blog/problem-with-reload/).

Using the Vanilla reload command to reload datapacks is fine. You can do this by executing the `minecraft:reload` command instead of `reload`.

## Reloading plugins {#plugin-reload}
As with the `reload` command, don't use plugins such as PlugManX to reload other plugins (you can learn why in the article mentioned above)! When installing/removing a plugin, restart the server.

If you want to reload the plugin to apply configuration changes, use the _reload_ command of the plugin if the plugin has such command (e.g. EssentialsX has `ess reload`). Using _reload_ command of the plugin is perfectly fine. If the plugin has such command, you can find it in the plugin's [documentation](../general/docs.md). If the plugin does not have the reload command, restart the server.