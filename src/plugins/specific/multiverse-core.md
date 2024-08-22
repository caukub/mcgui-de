# Multiverse-Core Plugin {#multiverse-core}
Multiverse-Core is a plugin used to manage worlds. You can find everything you need in the [plugin documentation](https://github.com/Multiverse/Multiverse-Core/wiki). Below are the most frequently referenced questions/topics.

## Features {#features}
Multiverse-Core makes it easy to manage worlds, that is, in particular [create](https://github.com/Multiverse/Multiverse-Core/wiki/Command-Reference#create-command), [import](https://github.com/Multiverse/Multiverse-Core/wiki/Command-Reference#import-command) and [configure worlds in different ways](#world-config).

## Managing worlds {#world-config}
Multiverse-Core allows you to configure a number of settings in worlds, such as difficulty, disabling mobs or monsters, setting the gamemode in a given world, and much more (see [here](https://github.com/Multiverse/Multiverse-Core/wiki/World-properties)).

At the same time, you can use [command](../../general/commands.md#commands) `mv gamerule <gamerule> <value> [world]` to set [gamerule](../../vanilla/game-rules.md#gamerules) for a specific world (which you should be able to do without the last argument even without MV, though).

## World name / '[]' in chat {#mv-prefixchat}
In the case where you have a world name before the username in chat, or empty square brackets due to Multiverse-Core, you can disable this feature with `mv config prefixchat false` command.

## Config resets {#config-reset}
The Multiverse-Core config file(s) must be edited when the server is not running. Otherwise, the config will reset.

Fortunately, MV allows you to change the values in the config at runtime without resetting it with the `mv config <key> <value>` command.

## Examples {#mv-examples}
- Void world

If you want to create a new world and you have the [VoidGen](https://www.spigotmc.org/resources/voidgen.25391/) plugin installed on your server, you can simply create it with the `mv create <worldname> <env> -g VoidGen:<parameters> -t FLAT` command (see the VoidGen plugin page)

- Importing a world

To import a world, just upload the world to [server root directory](~root-directory) and execute `mv import <worldname> <world-type>` command, where *worldname* is the folder name and *type* is 'NORMAL', 'FLAT', 'NETHER' or 'END' (or 'LARGEBIOMES'/'AMPLIFIED'). If the import fails, you are almost certainly either using the wrong version of Multiverse-Core, or trying to load a world from a higher version of Minecraft, which is not possible.