# WorldGuard Plugin {#worldguard}
In case you want to protect server builds such as spawn, the most common solution for that is [WorldGuard](https://dev.bukkit.org/projects/worldguard) plugin.

WorldGuard is one of the most widely used plugins, so you can find many tutorials, often in your native language, even when it's not English.

All information can be found in the [plugin documentation](https://worldguard.enginehub.org/en/latest/regions/quick-start/). Below is a summary of the basics and useful information.

## Region creation {#worldguard-region-creation}
To create a region, simply do the following
1. Get wand using `//wand` command
2. Select one corner of the region with one mouse button and the other corner of the region with the other mouse button (with the wand in hand)
3. If you want the region to be from the bedrock to the build limit, execute the `//expand vert` command
4. Create the region using `rg define <region name>` [command](../../general/commands.md#commands)

When the last [command](../../general/commands.md#commands) is executed, a region is created in which normal players (players without permissions) cannot destroy, place blocks, etc. (this can be changed with [flags](#worldguard-flags)).

## Region settings (flags) {#worldguard-flags}
You can change region settings using flags, either interactively using [command](../../general/commands.md#commands) `rg flags <region name>` or "manually" using `region flag <region name> <flag> <value>` [command](../../general/commands.md#commands). For a list of flags and their values, see the [documentation](../../general/docs.md) - <https://worldguard.enginehub.org/en/latest/regions/flags/>

For example, if you want to allow building in a region, just use the `rg flag <region name> build allow` command.

If you would like to add a member to a region without setting permissions, just use the `rg add member <region name> <player name>` or `rg addowner <region name> <player name>` command.

## Global region {#worldguard-global-region}
Each world is (can be) a WorldGuard region, which you can manage like any other region (see [here](https://worldguard.enginehub.org/en/latest/regions/global-region/)). The name of this region is `__global__`, thus the command `rg flag __global__ pvp deny` will disable pvp in the world (in which was the command executed).

## Other {#worldguard-other}
The [WorldGuardExtraFlags](https://www.spigotmc.org/resources/worldguard-extra-flags.4823/) plugin provides about 30 new flags that may be useful in certain situations.

If you can't click ArmorStandTools armorstand to execute command in a region because of WorldGuard, see the [AST website](https://www.spigotmc.org/resources/armor-stand-tools.2237/) for the solution.