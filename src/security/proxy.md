# Proxy security {#proxy-security}
When [backend servers](~backend-server) are in [offline-mode](../general/online-mode.md#offline-mode) due to proxy, these backend servers need to be secured.

In case you use Velocity, you can learn how to secure the servers [here](https://docs.papermc.io/velocity/security).

For BungeeCord (Waterfall; which you should ideally not use), the security procedure is similar except that you cannot use "modern forwarding".

It could be summarized as follows: If you manage the machine on which the servers run yourself, i.e. you have full access to it and no one else is using it, set the address of the [backend servers](~backend-server) to [localhost](https://docs.papermc.io/velocity/security#binding-to-localhost) (you can read what *localhost* is [here](../general/address-ports.md#localhost-address)) and configure [firewall](https://docs.papermc.io/velocity/security#operating-system-firewalls).

For managed hosting, where you don't have access to the whole machine, be aware that traditional security plugins like [BungeeGuard](https://www.spigotmc.org/resources/bungeeguard.79601/) can currently be bypassed through vulnerability (different from [Bungee Spoofing](#bungee-spoof)) that we won't detail here for security reasons. Additionally, it's worth noting that Velocity's modern forwarding can also be bypassed with a slightly more involved version of [Bungee Spoofing](#bungee-spoof).

If the proxy is in [offline mode](../general/online-mode.md#offline-mode) and you are using an authentication plugin (e.g. AuthMe), make sure that the plugin supports the proxy and that no addon or the plugin itself needs to be installed and properly configured. For example, if you use AuthMeReloaded, you need to install AuthMeBungee (do not use AuthMeBridge!) on proxy and configure both AuthMe and AuthMeBungee in the configuration properly (see AuthMeBungee documentation)!

## Bungee/Velocity Spoofing {#bungee-spoof}
Bungee/Velocity spoofing is a method used to bypass the proxy. Here's how it works in principle:

1. In a properly secured setup, backend servers are configured to only accept connections from the trusted proxy server.
2. However, Bungee/Velocity spoof takes advantage of the fact that backend servers in "proxy mode" will accept certain types of connection data that are meant to come from the proxy.
3. An attacker can craft a connection that mimics a legitimate proxy connection, essentially "spoofing" the identity of the Bungee/Velocity proxy.
4. If successful, the backend server accepts this connection as if it came from the legitimate proxy, bypassing intended security measures.

This vulnerability exists because the backend servers don't have a foolproof way to verify that the incoming connection is genuinely from the authorized proxy server.

For Velocity spoof however, the attacker has to know the secret key which is not optional so as long as the key isn't leaked, modern forwarding stays a safer alternative to BungeeGuard which can be bypassed without knowing it's secret.