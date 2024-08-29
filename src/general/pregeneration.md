# Pregeneration {#pregeneration}
Generating chunks is one of the most heavy tasks for a Minecraft server. Therefore, it is recommended to pregenerate the map, especially if you are experiencing performance issues. Even if you don't encounter problems normally, the problem may occur, for example, when flying with elytra, or when launching the server when many players start spreading to all directions.

## How to pregenerate a world {#how-to-pregenerate}
The world can be pregenerated using [Chunky](https://modrinth.com/plugin/chunky), which is both a mod and a plugin.

It is useful to use the plugin [ChunkyBorder](https://modrinth.com/plugin/chunkyborder) to set the border so players cannot escape the pregenerated area. Otherwise, players can endlessly generate new chunks and thus fill up the disk space. If more players explore the ungenerated parts of the map with elytra, this will eventually become noticeable.

## Pre-generated world size {#world-size}
As described [here](../administration/server-resources.md#disk-usage), the Minecraft world takes up the most disk space of all things. Therefore, it is important to choose the size of the pre-generated world so that there is enough disk space left. You can find out how much disk space the pregenerated world will take up by using this tool: <https://onlinemo.de/world>

It is important to keep in mind that the larger the radius, the more area the radius increase takes up (πr²). Thus, a total radius of 5,000 blocks takes up much less map space (and therefore disk space) than the difference in area between a radius of 20,000 and 25,000 blocks (4.3 GB vs 68 GB (106 GB is a radius of 25,000 - 68 GB takes up a radius of 20,000 = difference of 68 GB)), where the area is many times larger.

It is also important to keep in mind that the nether is 8x smaller than the overworld.

If you are not sure if the world of the selected size contains everything you need, you can use the following tool:
<https://www.chunkbase.com/apps/seed-map>