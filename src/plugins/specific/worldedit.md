# WorldEdit Plugin {#worldedit}
The WorldEdit plugin is one of the most famous, if not the most famous plugin (and mod) used to easily manipulate blocks in the world. For that reason, this section does not cover basic WorldEdit features, there are countless WorldEdit tutorials on the internet in various forms.

## Installation {#installation}
You can install WorldEdit like any other plugin - by uploading the plugin (_.jar_) file to the `/plugins/` directory and then restarting the server. WorldEdit is also a mod, so be careful not to accidentally download it instead of a plugin.

## Schematics {#schematics}
Schematic is a file format used to store parts of the world. It is most commonly used when sharing buildings so that the entire world doesn't have to be uploaded.

### Pasting a schematic file {#schematic-paste}
You can paste a schematic file into a world as follows:

1. Move/upload the *.schematic* file to `/plugins/WorldEdit/schematics/` directory
2. Load schematic with `//schem load <filename>` (filename cannot contain space)
3. Load the schematic with `//paste` (if you want to undo the changes, use `//undo` command)

### Creating schematic file {#schematic-creation}
You can create a schematic file as follows:

1. Get wand using `//wand` command and mark the area you want to save in the schematic file (with wand in your hand, select one corner with the right button and the other with the left button)
2. Execute the `//copy` command
3. Execute the `//schem save <filename>` command

After that, `<file name>.schematic` file will be created in `/plugins/WorldEdit/schematics/` directory.

## Lags/server crashing {#worldedit-crash}
If you are operating with a large number of blocks which is causing lags or even crash, the easiest solution is to use the [FAWE](https://www.spigotmc.org/resources/fastasyncworldedit.13932/) (FastAsyncWorldEdit) plugin.