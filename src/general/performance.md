# Server Performance/Server Optimization {#performance-optimization}
Many factors affect server performance. The most important ones are listed below. If you follow the recommendations described below, you should not encounter performance issues on smaller to medium servers if you use decent hardware.

On large servers, however, performance can be a very complex topic. You can read more about optimization at the following links
<https://paper-chan.moe/paper-optimization/>
<https://github.com/YouHaveTrouble/minecraft-optimization>

## Server platform (server JAR) {#platforms}
The [server platform](platforms.md#server-platform) (['server jar'](../general/server-jar.md)), is for example *Vanilla*, *Spigot*, *Paper*, or *Fabric*.

### Server with plugins {#platform-plugins}
_Do not_ use Spigot or CraftBukkit!

Use either [Paper](platforms.md#paper), or [Pufferfish](platforms.md#pufferfish), which is a fork of Paper that adds extra optimizations (or [Purpur](platforms.md#purpur), which has same performance as Pufferfish, since it is a Pufferfish [fork](platforms.md#forks)).

The performance difference between Vanilla/Spigot and Paper is really big. The difference between Paper and Pufferfish is not big, but it can help, especially on larger servers.

### Vanilla {#platform-vanilla}
If you don't want the Vanilla game mechanics to be affected, the Fabric platform with [Lithium](https://modrinth.com/mod/lithium) mod is ideal. The Vanilla platform is *not* recommended, as Fabric optimizes the server noticeably for Lithium mod compared to Vanilla, without unintended effects on Vanilla game mechanics.

Lithium mod is only server-side, so players can connect with the Vanilla client.

### Modded servers {#modded}
For modded servers, there are no forks that improve server performance. However, there are some mods that can help with server performance. On Fabric, these include [Lithium](https://modrinth.com/mod/lithium).

Although some optimization modes exist for Forge (see <https://github.com/TheUsefulLists/UsefulMods/blob/main/Performance/Performance120.md>), you won't find an equivalent to Lithium where the performance improvement can be really noticeable. Therefore, the recommendations listed below are even more important than for Paper, Pufferfish, Purpur, or Fabric platforms with Lithium mod.

## Pregeneration {#pregeneration}
Chunk generation is one of the most performance heavy tasks to a server. This can be especially noticeable when CPU performance is low (see below), when chunks are generated quickly when flying with elytra, or at the launch of the server when many players spread in all directions. Therefore, if you are experiencing performance issues, map pregeneration is almost a must. You can read more about pregeneration [here](pregeneration.md#pregeneration).

## Server Resources {#server-resources}
You can read in more detail about the impact of server resources on server performance [here](../administration/server-resources.md#resources).

In short, we could say that:
- CPU has a big impact on server performance
- CPU model is very important. A Minecraft server needs a CPU with high single core performance. The CPU models provided by standard VPS hosts are not suitable for a Minecraft server
- the amount of RAM is often overestimated in terms of performance. Unless there's a severe lack of RAM, giving server more RAM is unlikely to help server performance noticably. More RAM does not automatically mean better performance. Too much RAM makes the performance worse
- Paper/Pufferfish/Purpur can run with (a lot) less server resources than a Vanilla/modded server (especially if heavily modded)

## Regular server restart {#server-restart}
It is optimal to restart the server at least once a day (especially if the less RAM is allocated to the server).

## Basic settings {#basics}
One of the most essential settings regarding Minecraft server performance is `view-distance` (how far the player can see) and `simulation-distance` (how far away from each player the world is updated, i.e. entities in it, blocks, etc.). Both of these settings can be found in the [`server.properties`](../vanilla/server-properties.md#server-properties) file. Setting these values too high can have a large negative impact on server performance. Conversely, lowering these values can help server performance but break certain things (such as some farms). Therefore, it is important not to set this value too low, and instead find the ideal balance between player experience and server performance.

## Java flagy {#java-flags}
Use Aikar [Java flags](../administration/java.md##java-flags). See [here](https://docs.papermc.io/paper/aikars-flags).

## Server performance monitoring {#performance-monitoring}
Server performance health can be determined using two indicators in particular - TPS (ticks per second) and MSPT (milliseconds per tick). You can see what these terms mean at the following link: <https://spark.lucko.me/docs/guides/TPS-and-MSPT>

To find out the cause of lags, nowadays the Spark profiler is mainly used, which is both a plugin and a mod. You can read more about how to detect the cause of lags in [its documentation](https://spark.lucko.me/docs).

On the [Spark Discord](https://discord.gg/PAGT2fu) there is a `#performance-help` channel where you can try asking for help if needed.

### What is a tick {#minecraft-tick}
The game loop of the Minecraft server (simply, the server itself) is updated every 0.05 seconds (so 20 updates per 1 second if the server is not lagging). This game loop update is called a tick.

In some (especially server) configuration files the values are in ticks. 1 second is therefore 20 ticks.

## How many players can the server handle? {#how-many-players-can-server-handle}
It is impossible to say how many players the server can hold. It really depends on a lot of factors like platform, amount of server resources, their model, optimization, or mods.

However, from a certain number of players, you will encounter a limit due to the nature of Minecraft servers, even if you have the latest hardware and a really well optimized server.