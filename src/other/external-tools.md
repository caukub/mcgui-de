# External tools {#external-tools}
## Minecraft Region Fixer {#regionfixer}
The [Minecraft Region Fixer](https://github.com/Fenixin/Minecraft-Region-Fixer) is a tool (Python script) used to fix a broken world (which is not always possible). It doesn't have to be just a corrupted world, but for example a world where there are an extreme amount of entities, causing the server to automatically crash on startup.

## MCASelector {#mcaselector}
[MCASelector](https://github.com/Querz/mcaselector) is "a tool for selecting parts of Minecraft worlds for removal or export".

A specific example of use might be deleting generated "empty chunks" (chunks with no activity in them) to free up disk space.

This tool is written in Java and [provides a CLI](https://github.com/Querz/mcaselector/wiki/CLI-Mode) (can be run with a command), so if you can edit the start command (or its [flags](../administration/java.md#java-flags)), it can be run on shared hosting.

## NBTExplorer {#nbtexplorer}
The [NBTExplorer](https://www.minecraftforum.net/forums/mapping-and-modding-java-edition/minecraft-tools/1262665-nbtexplorer-nbt-editor-for-windows-and-mac) is a tool that allows you to edit [NBT](nbt.md#nbt) files.