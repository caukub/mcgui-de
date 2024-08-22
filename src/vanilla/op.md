# OP {#op}
OP refers to the server operator, the person who has all privileges/rights/permissions to all actions on the server.

The list of operators is stored in the `ops.json` file, which is a [JSON](../general/configs.md#json) file located in the [server root directory](~root-directory).

Giving players OP and having OP enabled is not recommended for security reasons. Instead, it is recommended to properly set [permissions](../general/permissions.md#permissions).

It is important to keep in mind that OP players has all permissions assigned by default, including [bypass](../general/permissions.md#bypass-permission) permissions.

## Commands {#commands}
- `op <nick>` - adds a player to the list of operators
- `deop <nick>` - removes a player from the list of operators