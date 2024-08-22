## Nothing happens "by itself" {#no-magic}
It is important to understand that nothing happens "by itself" on a Minecraft server, and everything has a cause. Both the Minecraft server itself and the plugins are programmed in a certain way, and behave accordingly. Nothing happens "by itself" or by accident.

So if you encounter something unexpected that happened for no apparent reason, try to think about what you've changed since things were "working right", or what might have caused it (see [action and reaction principle](../problem-solving/common-issues.md#action-and-reaction)). Although the two things may not be related at first glance, they may be.

For example, the moment you change the [*online-mode*](../general/online-mode.md#online-mode) setting (whether only players with the original version of the game can access the server), players will lose all their data (you can read more about why [here](../general/online-mode.md#online-mode-change-data-loss)). At first glance this may look like a world reset, as players will lose their inventory and spawn at the spawn location instead of the last location, however the world is still the same, only players don't have their original data.

Another example of this would be changing the name of the world. The moment you [change the name of the main world](../general/world.md#world-name), you must also change the world folder to the name of this new world, as the Minecraft server takes the world data from the folder corresponding to the main world name. In the case where you don't change the folder name, the Minecraft server will not find any folder matching the world name, and thus will create a new world. However, this can be easily solved by deleting the newly created world and renaming the original world folder to the current world name (with the server turned off).

The last example is plugins being enabled. A plugin will enable if it is a `.jar` file located in the `/plugins/` folder. Thus, if you change the `.jar` file extension to anything else, such as `.jarr`, the plugin will not enable.

If the `/plugins/` folder is renamed to `/pluginss/`, no plugins will enable, since the server is programmed to enable plugins loaded in the `/plugins/` folder. Thus, if you rename the `/pluginss/` folder back to `/plugins/`, everything will revert to its original state and all plugins will be enabled again.

This part may be closely related to the [following part](#everything-is-stored-somewhere).

## Everything must be stored somewhere {#everything-is-stored-somewhere}
While this may sound trivial, it is an often misunderstood principle that is important to understand.

All data is always stored somewhere. The [RAM](../administration/server-resources.md#memory) stores the data that the server is currently working with. Data that should persist after the server restarts is stored in [disk](../administration/server-resources.md#disk) (in files) while the server is running or when the server shuts down. When the server needs to work with the data, it is loaded back into memory.

Every time the Minecraft server itself or a plugin tries to read the data, it is read from the files on disk. For example, world data and
(non-plugin data) of players are stored in the world folder (basically `/world/`), plugin data and configurations are stored in the `/plugins/pluginname/` folder, and so on. The data is then read from this particular location. Thus when you want to upload a backup from another server, just upload the backup in the server root directory and extract it. It's that simple - it's just files which needs to be located on the correct place.

This is why when you change the storage type (e.g. from H2 to MySQL), the existing data of the plugin "disappears". In fact, the data still exists, but the plugin is already storing and reading the data from MySQL instead of disk (in the case of H2). Therefore, if you want to use the existing data after the storage change, you need to [migrate](../administration/databases.md#storage-method-change-data-loss) the data from the original storage to the new one.

Thus, if you restore a backup of the server, the server will be in exactly the same state as when the backup was created, since all the data is stored in the files. This is basically completely all server data such as worlds, player data or settings and plugin data. However, if the plugin is connected to a [standalone database](../administration/databases.md#standalone-database), such as MySQL, the plugin data remains logically unchanged even after restoring the backup of the server itself, since the server backup contains only the server data and the database itself runs as a separate service.

Thus, the answer to a question like "How do I undo the playtime when I restore the backup? I use the XY plugin to do this" is that if
the plug-n data in which the time played is stored is in the `/plugins/PlayTime/` folder, for example in the *data.db* file, you just need to take the file in which the playtime data is stored (in this case *data.db*) from the backup and replace it with the current *data.db* file (manipulate with non-configuration files on disk only when the server is not running!). This would return the playtime stats to the state at the time the backup was created. Why is this the case is probably obvious.

If you delete the ban file (basically `banned-players.json`) and load the changes (by restarting the servers), all players will be unbanned. This could go on for everything.