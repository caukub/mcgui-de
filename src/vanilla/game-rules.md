# Game rule {#gamerules}
A game rule is a rule that sets a certain behaviour in a world. For example, setting the game rule `doDaylightCycle` to `false` will stop time change. The game rules feature is implemented by Vanilla, so it can be used on all platforms.

A complete list of all game rules can be found at the following link: <https://minecraft.fandom.com/wiki/Game_rule#List_of_game_rules>

It is a good idea to check this list to have basic idea of the available game rules. You can avoid unnecessary use of plugins or mods.

The most commonly used game rules are `doDaylightCycle` and `doWeatherCycle`, which are used to set the day and sunny weather (these gamerules only disable the time/weather change if it is not day/rain, after setting the game rule you need to set the time/weather with `time set day` and `weather clear` commands). Also, the game rule `playersSleepingPercentage` is often used to set what percentage of players must sleep to skip the night, which previously required a datapack (Multiplayer Sleep) or plugin.

Game rules are world specific. If you execute a command in the `world` world, the game rule will not apply in the `lobby` world.

Game rules are case sensitive. If you set a game rule to `playerssleepingpercentage` instead of `playersSleepingPercentage`, the setting will not work.

## Commands {#commands}
The `gamerule <rule> <value>` command sets the game rule in the world in which the command is executed. In the case where the command is executed from the console, the game rule is set in [main world](../general/world.md#main-world).

In the case where you are using an old version of Minecraft, make sure that the game rule you want to set already exists in the Minecraft version you are using (which you check [here](https://minecraft.fandom.com/wiki/Game_rule#History)). This is because the game rule will be set even if it has not yet been implemented in that version, but will have no effect.