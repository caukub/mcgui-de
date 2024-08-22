# NBT {#nbt}
NBT is the format in which world information is stored, including items, entities, player inventories, etc.

In case you want to edit the NBT file you can use NBT editor. There are online NBT editors such as [this](https://nbt.mcph.to/), [this](https://gamertools.net/tools/13), or [this](http://irath96.github.io/webNBT/), or NBT editors that are normal desktop applications. The most well-known such editor is [NBTExplorer](https://www.minecraftforum.net/forums/mapping-and-modding-java-edition/minecraft-tools/1262665-nbtexplorer-nbt-editor-for-windows-and-mac). Online NBT editors do not support some NBT file formats, so in that case you need to use an application like NBTExplorer.

![NBTExplorer Showcase](/assets/images/nbt/nbtexplorer.png)

## Example of NBT editor usage
An example of the NBT editor usage might be when you set [gamerule](../vanilla/game-rules.md#gamerules) *randomTickSpeed* to a huge value like 10000000 and the server crashes instantly, so the gamerule cannot be set back to normal value. In this case, you can manually edit the value of the *randomTickSpeed* gamerule in the NBT file.

The gamerules are stored in a `level.dat` file located in the world folder, so just edit the value of the *randomTickSpeed* gamerule via some NBT editor and replace the original `level.dat` file with the modified file.