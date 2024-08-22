# RCON {#rcon}
RCON (from "remote console") or remote access/remote control, is a protocol that allows you to connect to a [console](../general/console.md) remotely.

To use RCON, you must enable it in the `server.properties` file. Here, RCON can be enabled by setting `enable-rcon` to `true`, the RCON port at `rcon.port` ([make sure that the port you want to use for RCON can be used](../general/address-ports.md#open-port)), and set a **secure password** at `rcon.password`.

You can then use any RCON client (e.g. mcrcon or [rcon-cli](https://github.com/gorcon/rcon-cli)) to remotely connect to the console. **Warning!** It is important to specify the password and RCON port for the login credentials (hence the port set in `server.properties` at `rcon.port`), not the server port. Also, if an *SRV* record is used to point the domain, you will probably need to use the hostname/IP address instead of the domain to connect (see [here](../administration/domains.md#srv-pitfall) why).

However, it is generally not recommended to use RCON. A better solution is to control the server via a web panel, if you have one.