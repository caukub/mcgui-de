# Proxy security {#proxy-security}
When [backend servers](~backend-server) are in [offline-mode](../general/online-mode.md#offline-mode) due to proxy, these backend servers need to be secured.

In case you use Velocity, you can learn how to secure the servers [here](https://docs.papermc.io/velocity/security).

For BungeeCord (Waterfall; which you should ideally not use), the security procedure is the same except that you cannot use "modern forwarding".

It could be summarized as follows: If you manage the machine on which the servers run yourself, i.e. you have full access to it and no one else is using it, set the address of the [backend servers](~backend-server) to [localhost](https://docs.papermc.io/velocity/security#binding-to-localhost) (you can read what *localhost* is [here](../general/address-ports.md#localhost-address)) and configure [firewall](https://docs.papermc.io/velocity/security#operating-system-firewalls) (and on Velocity, use "modern forwarding").

For managed hosting, on Bungee (if you don't have access to the whole machine), use a plugin like [BungeeGuard](https://www.spigotmc.org/resources/bungeeguard.79601/) instead of Velocity modern forwarding.

If the proxy is in [offline mode](../general/online-mode.md#offline-mode) and you are using an authentication plugin (e.g. AuthMe), make sure that the plugin supports the proxy and that no addon or the plugin itself needs to be installed and properly configured. For example, if you use AuthMeReloaded, you need to install AuthMeBungee (do not use AuthMeBridge!) on proxy and configure both AuthMe and AuthMeBungee in the configuration properly (see AuthMeBungee documentation)!