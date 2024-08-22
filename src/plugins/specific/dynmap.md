# Dynmap Plugin {#dynmap}
Dynmap is a plugin (or mod) that allows you to view a Minecraft world in the browser live.

## Dynmap Setup {#dynmap-setup}
To render Dynmap entire map, you must first have the world [pregenerated](../../general/pregeneration.md#pregeneration). Dynmap only displays the generated parts of the world, so otherwise only chunks where players have already been to will be rendered.

You can install Dynmap [like any other plugin](../basics.md#plugin-installation) by uploading the plugin (_.jar_) file into `/plugins/` and then restarting the server.

After that you need to set up Dynmap. In the configuration (`/plugins/dynmap/configuration.txt`) set one of the [open ports](../../general/address-ports.md#open-port) at `webserver-port`, otherwise the Dynmap website will not be accessible "from the outside".

Next, set the quality of Dynmap in the configuration - the lower the quality, the less disk space will Dynmap occupy. The quality is determined by the value of `deftemplatesuffix` (*vlowres* is the worst quality): <https://github.com/webbukkit/dynmap/blob/v3.0/spigot/src/main/resources/configuration.txt#L16>

The last step in configuration is to change the storage type from 'filetree' to 'SQLite'.

You can do this by [commenting out](../../general/configs.md#config-comment) the `type: filetree` line and uncommenting the `type: sqlite` and `dbfile: dynmap.db` lines:

```yaml
# -- Original config --
storage:
  # Filetree storage (standard tree of image files for maps)
  type: filetree
  # SQLite db for map storage (uses dbfile as storage location)
  #type: sqlite
  #dbfile: dynmap.db
```

```yaml
# -- Edited config --
storage:
  # Filetree storage (standard tree of image files for maps)
  #type: filetree
  # SQLite db for map storage (uses dbfile as storage location)
  type: sqlite
  dbfile: dynmap.db
```

This step is not necessary, but some manual file operations (e.g. deleting) can take unnecessarily long time for large maps, as Dynmap generates a huge number of files when using 'filetree' storage type.

The moment you are done editing the config you can save it and restart the server. Once the server and plugin are enabled, Dynmap should be available at `http://<server address>:<open port from Dynmap config>` (the port in the Dynmap config is the `webserver-port` value), e.g. `http://node.myhost.com:5854` or `http://22.33.42.15:5865`.

Dynmap by default runs on _http_, _https_ address will not work.

When you open Dynmap in the browser, it will probably be mostly black. It still needs to be rendered. To start the Dynmap renderer, use [command](../../general/commands.md#commands) `dynmap fullrender [world]`, which will start the render of that world, or the world in which you executed the command if you didn't provide the [argument](../../general/commands.md#command-args) 'world'. It takes a while for the whole map to render.

## Optimization {#dynmap-optimization}
### Disk space (SSD) {#dynmap-ssd}
It is good to note that Dynmap takes up quite a lot of disk space. The amount of space taken can be reduced considerably by reducing the resolution (`deftemplatesuffix` in the config) of Dynmap, or even by using a different image format, see <https://github.com/webbukkit/dynmap/wiki/Configuration.txt#image-format> (if Dynmap is already generated, you need to delete the old maps and render again, otherwise no space will be freed)

### CPU load {#dynmap-cpu}
Dynmap uses a lot of CPU during render. For this reason, it may be good idea to pause the Dynmap render during the day using the `dynmap pause all` scheduler in the admin panel/CRON and run the render overnight to load map changes (using the `dynmap pause none` command).

To optimize performance as much as possible, use the following configuration:
<https://www.spigotmc.org/threads/1-15-server-performance-help.431154/#post-3776848>

### Deleting worlds {#world-deletion}
If you want to delete a specific map type such as surface (3D), cave or flat, you can do so with the `dmap mapdelete <worldname>:<map type>` command. To see all types for a given map, use the `dmap maplist <world>` command.

## Dynmap address without port {#dynmap-address-without-port}
If you to access *http* Dynmap address without specifying the port in the browser, the webserver must be running on port _80_ (_443_ for _https_). This means: a) if you can use port 80 (if the server is not running on a machine managed by you (= [selfhosting](../../administration/host-types.md#selfhosting)), you almost certainly can't), set port 80 for Dynmap in the config (`webserver-port`) b) you can use a reverse proxy. If you are using a shared hosting service, it often provides a reverse proxy feature, so check your admin panel to see if you can find it. If not, NGINX/Caddy is most commonly used for reverse proxy, but you have to host this on your own machine (usually VPS). If you don't want to host the reverse proxy yourself, you can try using Cloudflare Workers, which is a bit more complicated to set up, but there are some tutorials online.

If you have a domain on Cloudflare, you can simply create a redirect using *Redirect Rules*, but this will only redirect the user from *map.domain.tld* to *address:port*.

## Alternatives {#dynmap-alternatives}
Dynmap has several alternatives, including BlueMap, SquareMap and pl3xmap, which should be the most lightweight.