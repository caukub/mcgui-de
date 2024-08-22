# Query {#query}
[Query](https://wiki.vg/Query) is a (UDP) protocol used to get information about a server. For example, thanks to Query you can show number and list of players of a server on the web. Whether Query is enabled is determined by the value `enable-query` in `server.properties`.

By default, Query runs on the same [port](../general/address-ports.md#ports) as the server itself (which is possible since the Minecraft server itself runs on *TCP* and Query runs on *UDP*).

Query returns the following information:
- key-value section

Includes basic public information about the server like MOTD, server version, map name, number of players, maximum number of players, player list, server port and server IP address.

Depending on the platform, some extra information returned in the response can be added and eventually removed. For example, Spigot also returns a list of plugins by default, which can be disabled by setting `query-plugins` to `false` in `bukkit.yml`.

For very old versions (\< 1.7.10), there may be connection problems if Query is disabled. So if the server version is lower than 1.7.10, always keep *Query* enabled.

For details on the *Query* protocol, see [this link](https://wiki.vg/Query).