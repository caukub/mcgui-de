# Address and ports {#address-and-ports}
## Address {#address}
An address specifies where something is on the Internet (analogy of a real address, i.e. a specific house could be used).

### Address variants {#address-types}
An address can have a total of three (or four) variants:

1. IP address (for example, `45.134.7.31`)

An IP address is the address that every publicly available service on the Internet runs on. There are two types of IP address - IPv4 (`8.8.8.8`) and IPv6 (`2001:0000:130F:0000:09C0:876A:130B`)

2. Hostname (for example, `node.myhost.com`)

The service address provided by the service provider (if you use one) in "domain format", e.g. `node.myhost.com`

3. Custom domain (for example, `play.myserver.com`)

(custom) domain - custom domain address, e.g. `play.myserver.com`

So there is no such thing as a "custom IP address" (meaning domain). There is only an IP address, hostname, or domain (technically the hostname itself is domain too).

As described for the IP address, every service runs on an IP address. Even if the address is a hostname, or a custom domain, these addresses only "under the hood" point to the IP address, as explained [here](../administration/domains.md#how-domains-work).

### What is localhost {#localhost-address}
As stated on [Wikipedia](https://en.wikipedia.org/wiki/Localhost) - *localhost* is an address that refers to the computer currently in use. This address (loopback) can be used by applications on the local computer to communicate with itself.

In simple terms, this means that services running on *localhost* cannot be accessed publicly. A service running on a *localhost* can only be accessed from the computer on which the service is running.

In hostname form, *localhost* is `localhost`, in IPv4 format it;s `127.0.0.1`, and in IPv6 it's `::1`.

### Address setup {#address-setup}
Simply put, setting the address of a service (whether the server itself, a plugin, or a mode - it doesn't depend on the service) depends on whether the service is to be publicly accessible or not.

If the service is not supposed to be publicly accessible (i.e. accessible from a server other than the one running the service), set [*localhost*](#localhost-address) as the address.

In the case where the address is to be publicly accessible, you usually want to set the address (referred to as 'host', 'address', 'server ip', or 'bind ip' in the config files) to `0.0.0.0`, or leave the IP address/field itself blank if that is an option (in which case this is usually the default setting. See the documentation for more information if needed).

Warning! It is not enough to make only the address itself accessible. The port on which the service runs must be open, see [here](#open-port).

### Using the address {#address-use}
To connect to a particular service, both the address and the port must be known. When the port is not provided, the default port for the specific service is used (for HTTP it's *80*, for HTTPS *443*, and for Minecraft (Java) server *25565*).

It is important to note that the hostname can be used in the same way as the IP address. So you practically never need to know the IP address. It is not even recommended to use an IP address, as it can change and is hard to remember. You use the hostname in exactly the same way as you use the address, i.e. if you run a service on port `59095` (e.g. Dynmap) and the default server address is `node.myhost.com:59090` (i.e. the (hostname) address is `node.myhost.com`), the address of the service with the port that you will be able to access (i.e. in this case view *Dynmap* in the browser) will be `node.myhost.com:59095`.

However, this does not apply to the custom domain point to with *SRV* record. In the case where an *SRV* record is used to point the address, the address can be used almost nowhere (e.g. the *ping* command or in the browser to display *Dynmap*) except the Minecraft client. Read more [here](../administration/domains.md#srv-pitfall).

## How to get the IP address of a server {#hostname-to-ip}
You shouldn't need to use an IP address at all, and it is not recommended as it can change and is hard to remember. The hostname can be used in the same way as the IP address. Read more [here](#address-use).

If you still want to get the IP address of the server for some reason, just open a Command Prompt on your computer (on Windows, keyboard shortcut *Win* + *R* → type *cmd* in the text box → press *Enter*/*OK*) and execute the command `ping <hostname>` (without the brackets), i.e. `ping node.myhost.com`.

Use only the [hostname](#address-terminology). Do not use your custom domain address. In the case where an *SRV* record is used to point the domain, the *ping* command [will not work](#srv-pitfall).

Also do not use port (including colon) in the command.

The hostname is just the address itself (e.g. `node.myhost.com`).

### Port forwarding {#port-forwarding}
If you host a Minecraft server at home and want to allow players outside your network to connect directly to your server, you need to have ability to port forward.

As stated in this article <https://paper-chan.moe/paper-self-hosting/>:
"The exact step varies based on your ISP and router manufacturers so it will not be covered here.
key-in your router model number + ISP name + how to portforward as search terms should net you good result on Google."

If you can port forward, the only step required to make your server accessible to the world is to open the port in your firewall settings.

However, if you are not able to port forward, there are tools that can help you make your server accessible to the outside world despite that, and that by using tunnels like [playit.gg](https://playit.gg/) or [ngrok](https://ngrok.com/product/secure-tunnels). Eventually, you can buy VPS and use reverse-proxy like [frp](https://github.com/fatedier/frp).

## Ports {#ports}
A port allows you to access a specific service or resource at the address (using the same analogy as the address, it would be the room where I find the person I want to communicate with. For this, an address would not be sufficient - I know I need to go to the office building, but I need to go to a specific room where I can communicate with the person to provide the information I require).

### Basics {#port-basics}
Each physical server connected to the Internet can use approximately 65,000 ports.

A port is always used to communicate between two devices on the Internet, both server and client. On these ports, devices connect and communicate with each other. Typically, for a client, the operating system will select a "random" available port, and for a Minecraft server, this is logically the port that the client connects to, i.e. the server port (25565 by default). If the port is not used in the address, this means that the default port is used. That is *25565* for Minecraft (Java edition), *80* for HTTP, *443* for HTTPS, etc.

### Open ports {#open-port}
In order for a server to accept connections on a port, that port must be "open" on the machine, i.e. it must be allowed to accept connections on that particular port. If you are managing the server yourself and the firewall is enabled on the server (it should by default), the ports that should be publicly accessible must be allowed in the firewall.

For some [administration panels](../other/panels.md), ports must also be "allocated" (assigned).

If you are using [shared hosting services](../administration/host-types.md#shared-host), you typically a range of ports that are automatically open is provided (if you see something like *Other available ports* or something like that in the panel, those ports are open).

### Only one service can run per port {#one-service-per-port}
In the case where a device connected to the Internet (either a server or a client) wants to use a port, that port must be available, i.e. it must not be used by any other service. **Only one service can use a port!**

If two services use different protocols (i.e. one *TCP* and the other *UDP*), they can use the same port without any problem. Therefore, for example, a Minecraft server and [Query](../vanilla/query.md#query) can run on the same port. The Minecraft server uses *TCP* and [Query](../vanilla/query.md#query) uses *UDP* (most services run on *TCP*).

### Available ports {#available-ports}
Available ports (sometimes referred to as *"Other Available Ports "*) for [shared hosting](../administration/host-types.md#shared-host) refer to ports that are not used for the purchased service itself, but can be used for other services (plugins and mods).

When a (free) port is set for a service (e.g. *Dynmap*/*Votifier*), the address of that service is `<host>:<used (free) port>`, not `<host>:<default port>` (the server port)! The service always runs on the address assigned to it in the configuration, and therefore, for example, the server port cannot be used to access the Dynmap!