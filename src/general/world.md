# World/Worlds {#world}
## World folder {#world-directory}
The world-name folder contains all the information about the world itself, such as chunks (`/region/`), entities (`/entities/`), and so on, but also "non-plugin" information about players, such as inventories, locations (`/playerdata/`), stats (`/stats/`), or advancements (`/advancements/`). These files can be found in the folder of [main world](#main-world).

So when someone talks about the world (e.g. `delete world`), they mean deleting the world folder. The world folder is the world itself.

### level.dat {#level-dat}
Information about the world itself, such as seed, weather, spawn locations, or game rules, is stored in `level.dat` file, which is a [NBT](../other/nbt.md#nbt) file.

## World types {#world-types}
### Main world {#main-world}
The main world of a server is the world that is set at `level-name` in `server.properties`. This world stores not only the data of the world itself (its chunks, difficulty, spawn locations, ...), but also the "non-plugin" data of the players (inventory, advancements, stats, ...). On platforms other than Spigot and its forks, i.e. Vanilla, Fabric, Forge, etc., the nether and end is stored in the `DIM1` and `DIM-1` folders. On Spigot and its forks, the nether and end worlds have a separate `worldName_nether` and `worldName_the_end` folder.

So the main world tends to be the world that has nether and end ([these can be turned off if needed](#nether-end-deletion), the overworld cannot) and players normally play in it. Using the main world as a spawn-only world, for example, is not suitable, in which case it is more appropriate to use [side-world](#other-worlds) (in the case it's not the only world).

Every server has a main world. In case it is deleted, a new one is automatically generated when the server starts.

### Other world(s) / Side world(s) {#other-worlds}
Other worlds are worlds that are not [main world(s)](#main-world). Only the world itself is stored in these worlds; player data is not stored in them. The Multiverse-Core plugin is most commonly used to manage (create, import, ...) such worlds.

## Upload World/Import World {#world-import}
> [!CAUTION]
> All actions must be performed with the server turned off!

### Importing the main world {#world-import-main}
In the case where you want to import a world as [main world](#main-world), just upload the folder (or folders in the case where nether and end have a separate folder) of the world to [server root directory](~root-directory) and either

1. in `server.properties` set `level-name` to the world name (= folder name)

OR

2. rename the world folder(s) to the `level-name` value from `server.properties` (i.e. if `level-name` is set to `worldd`, rename the world folder to `worldd` and possibly nether and end to `worldd_nether` and `worldd_the_end`)

If you are uploading the world as an archive (i.e. a file in *.zip*, *.tar*, *.tar.gz*, etc.), the file needs to be extracted (unzipped). The world must be a folder, not a file.

### Importing other world {#world-import-other}
In case you want to upload a world as [side (other) world](#other-worlds), the easiest solution is to use the Multiverse-Core plugin. Upload the world to the [server root directory](~root-directory) and import it with `mv import <worldname> <world type>` command ([see here](https://github.com/Multiverse/Multiverse-Core/wiki/Command-Reference#import-command))

The world name is the folder name and the world type is `NORMAL`, `NETHER`, `END`, `FLAT`, `LARGEBIOMES` or `AMPLIFIED`.

To teleport to a world, use the `mv tp <worldname>` command.

If you are uploading the world as an archive (i.e. a file in *.zip*, *.tar*, *.tar.gz*, etc.), you need to extract (unzip) the file. The world must be a folder, not a file.

## Deleting a world {#world-deletion}
> [!CAUTION]
> All actions must be performed with the server turned off!

Deleting a world is a simple process. Just delete the folder with the [world name](#world-name) in the server files (*world* by default). If the world is large, this process may some time.

Please note - [main world](#main-world) contains not only the world itself, but also player data (unless a plugin such as Multiverse-Inventories is used to store this data), such as their inventories, advancements and stats ([see here](#world-directory)), so deleting the main world will also delete this data.

## World generator {#world-generator}
The [main world](#main-world) generator can be set using `generator-settings` in [`server.properties`](../vanilla/server-properties.md#server-properties).

Plugin as a generator can be set in [`bukkit.yml`](https://docs.papermc.io/paper/reference/bukkit-configuration#worlds_%3Cworld%3E_generator), or in the *Multiverse-Core* plugin when creating a world using the `-g` parameter. For example, when creating a world with the [VoidGen](https://www.spigotmc.org/resources/voidgen.25391/) generator, use the `mv create <worldname> <env> -g VoidGen -t FLAT` command, or import `mv import <worldname> <env> -g VoidGen -t FLAT` (see [plugin documentation](https://github.com/xtkq-is-not-available/VoidGen/blob/master/docs/tutorial.md)).

## Resetting the world {#world-reset}
> [!CAUTION]
> All actions must be performed with the server turned off!

To reset (= delete world and player data while keeping the same seed) the world, just follow the same procedure as for [world-deletion](#world-deletion), only if the seed is not set in `server.properties`, before shutting down the server and deleting the world, get the world's seed with `seed` and set it in `server.properties` at `level-seed`.

## Difficulty {#world-difficulty}
The difficulty of the world to be created is determined by the `difficulty` value in `server.properties`. Possible difficulty values are `peaceful`, `easy`, `normal`, `hard`.

If the world already exists, changing the difficulty in `server.properties` is not enough. The difficulty needs to be changed [with the command](commands.md#commands) `difficulty <difficulty>`. The difficulty is changed in the world in which the command is executed. If the command is executed from the console, the difficulty of [main-world](#main-world) is changed.

For versions older than 1.14, the difficulty in `server.properties` is expressed as a number between 0 and 3 (0 = peaceful, 3 = hard) (these numbers work on new versions, but this may change in the future). For the difficulty command, however, use the difficulty as text and not a number even on old versions.

## World name {#world-name}
The name of the main world is determined by the value `level-name` in [`server.properties`](../vanilla/server-properties.md#server-properties) (*world* in the base).

The world name must not be empty. Otherwise, the server will crash. It should also contain only characters from the English alphabet and numbers, i.e. no diacritics or special characters including spaces. Otherwise the server can work, but you will probably run into problems, especially with some plugins.

## Setting the world seed {#world-seed}
To change the world seed, you need to shut down the server, [delete existing world](#world-deletion) (if the server has been started at least once, so the world exists), and then set the seed at `level-seed` in the `server.properties` file.

When the server is started, the world will be created with the newly set seed. In the case where no seed is set, a randomly generated one is used.

Note: Technically, it is possible to change the seed of a world without deleting already generated chunks. In this case, the already generated chunks will remain, and the newly generated chunks will have the new seed. This is not recommended. Transitions between new and old chunks will be broken. If you would still like to do this for some reason, you can do so by following the instructions below.

> [!CAUTION]
> All actions must be performed with the server turned off!

1. Set the `level-seed` in `server.properties`
2. In the world folder, delete the `level.dat` and `level.dat_old` files (the world seed is stored in these files)

**Warning!** The `level.dat` file also contains other information (see [here](#level-dat)), such as the spawn location. If you would like to edit only the seed in `level.dat` and `level.dat_old`, instructions on how to edit the contents of such a file can be found [here](../other/nbt.md).

## Disabling nether and/or end generation {#nether-end-deletion}
Nether generation can be disabled by setting `allow-nether` in `server.properties` to `false`.

End generation can be disabled by setting the value of `allow-end` in `bukkit.yml` to `false` (only on Spigot and its forks).

## Statistics {#statistic}
In the `/<main world>/stats/` folder, statistics such as time played, number of deaths, or number of server connections are stored for each player. Since this is a Vanilla feature, stats are collected from the very start of the server. Therefore, the data from these stats is often used to display the time played using [placeholders](../plugins/placeholders.md).

## World migration {#world-migration}
### from Spigot to Vanilla/Fabric/Forge {#world-migration-spigot-to-vanilla}
> [!CAUTION]
> All actions must be performed with the server turned off!

If you want to migrate from Spigot to a platform not based on Spigot (Vanilla, Fabric, Forge, ...), you need to manually migrate the worlds. You can read how to do so here:
<https://docs.papermc.io/paper/migration#to-vanilla>

### from Vanilla/Fabric/Forge to Spigot {#world-migration-vanilla-to-spigot}
If you want to migrate to Spigot or its fork, the worlds will be converted to Spigot (CraftBukkit) format automatically when you start the server.

## Notes {#notes}
When the generator changes (due to Vanilla generator settings/plugins/version change), already generated chunks will stay the same and newly generated chunks will be generated using the new generator. It is not possible to apply new generator to already generated chunks without deleting the chunks.

Minecraft worlds are saved in the so-called [Anvil format](https://minecraft.fandom.com/wiki/Anvil_file_format). However, for specific cases it is not worth using such a format, as it is inefficient (especially for large minigame servers with many small worlds). That's why the Slime format was created by the Hypixel team and used for their minigames. You can read more at the following link: <https://hypixel.net/threads/dev-blog-5-storing-your-skyblock-island.2190753/>

Although there are plugins/platforms that implement and allow you to use this format (e.g. [AdvancedSlimePaper](https://github.com/InfernalSuite/AdvancedSlimePaper) or [Advanced SlimeWorldManager](https://www.spigotmc.org/resources/advanced-slimeworldmanager.87209/)), they will probably be useless or even counterproductive for you.