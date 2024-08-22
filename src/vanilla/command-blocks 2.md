# Command blocks {#command-blocks}
A command block is a block that can execute Minecraft commands.

## Usage {#command-blocks-usage}
In order to use (open) a command block, the player must:

1. in `server.properties` enable `enable-command-block` by setting the value to `true` (the server must be restarted for the changes to take effect after editing the file)
2. have [OP](op.md#op)
3. be in gamemode creative

However, it is always better to use a plugin or mod instead of a command block, both in terms of server performance and security. Thus, if command blocks are enabled, it is most ideal to disable them by setting `enable-command-block` to `false` in the `server.properties` file located in server [root directory](~root-directory).