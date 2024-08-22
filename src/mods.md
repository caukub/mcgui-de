# Mods and modpacks {#mods}
## Basics {#mod-basics}
Unless the mod is server-side only, the mod must be installed on both the server and the client (player). This implies that the same is true for [modpacks](#modpack) - the player cannot connect with Vanilla, they must connect with a modpack installed on the client (why can be found [here](basic-principles/plugins-vs-mods.md#plugins-vs-mods)).

Client-side only mods must not be installed on the server (sometimes it won't matter on Fabric, but on Forge it will almost certainly result in server crash).

Fabric and Forge are two completely different platforms, so mods are not compatible with each other and you can't switch between these platforms.

If mods add new things such as blocks & mobs to the game, you can't switch from the modded server to Vanilla without losing data (you can learn why [here](basic-principles/plugins-vs-mods.md#plugins-vs-mods)).

When installing a mod, always read its description. Thanks to reading basic information on the mod page, you can easily avoid unnecessary troubleshooting.

Modded platforms do not support plugins, only mods (see [here](general/platforms.md#hybrids)).

## Platforms {#mod-platforms}
You can find out which platform to choose [here](general/platforms.md#modloaders). Fabric and Forge mods are not compatible with each other.

Below is some basic information that may be useful when managing a server on a given platform.

### Fabric {#fabric}
#### FabricAPI {#fabric-api}
Many Fabric mods require [FabricAPI](https://modrinth.com/mod/fabric-api). If you decide to use Fabric with mods, install it automatically on the server and update the FabricAPI version if the server version changes.

It is a mod like any other, thus it can be installed by uploading it to the `/mods/` folder and then restarting the server.

### Forge {#forge}
In case the server says '*Server is still starting! Please wait before reconnecting.*', try typing `/fml confirm` into the console (with the a slash).

## Mod management {#mod-management}
This section is about mod management, not modpack. You can read more about how to install a modpack [here](#modpack-server-installation).

### Installation {#mod-installation}
You can install a mod by uploading the mod (which is a *.jar* file) to the `/mods/` folder and then restarting the server. Of course, the server must be running [on a platform that supports the mod, and for which the mod is intended](#mod-platforms).

### Version change {#mod-update}
If you want to update a mod, just [delete the old version of the mod](#mod-deletion) and upload a new one, ideally when the server is not running. The changes are applied the next time the server starts (i.e. if the server is running, you need to restart the server).

### Deletion {#mod-deletion}
To remove a mod, delete the mod (the mod itself is a *.jar* file) from the `/mods/` folder and then restart the server.

### Configuration {#configuration}
In case you want to configure a mod in some way, you can do so either using the commands found in the [mod documentation](general/docs.md), or using the [configuration files](#config) (which are generated when the mod is first started) if the mod has configuration files.

On newer versions of both Fabric and Forge, mod configuration files are usually located in the `/config/` folder, but this may not always be the case. For example, they can also be located in the [server root directory](~root-directory), or the [world (main) folder](general/world.md#world-directory). See the [documentation](general/docs.md) of the specific mod for more information.

## Modpack {#modpack}
### What is a modpack {#what-is-a-modpack}
A modpack is nothing more than a collection of mods and their configuration.

### How to install modpack - client {#modpack-client-installation}
The easiest and standard way to install modpack on the client is by using the launcher listed on the page where modpack is uploaded. So if the modpack is uploaded on CurseForge, you simply install the modpack via the CurseForge launcher, if on Modrinth, the Modrinth launcher and so on.

However, this is not always required. Many launchers (such as ATLauncher, MultiMC, or Prism Launcher) support different modpack formats. But for most people, using an "official" modpack launcher will be the easiest option.

### How to install modpack - server {#modpack-server-installation}
To install modpack on a server, simply upload the files from the [server pack](#server-pack) to the server files (to its [root directory](~root-directory)). The server pack is an archive, usually a *.zip* file, so to get to the files in the server pack you need to extract (unzip) it.

If the `/mods/` folder with all the mods is in the [server root directory](~root-directory), you have uploaded the server pack correctly.

In the case where you have full access to the system and manage it yourself (your computer, VPS, dedicated server), the server pack usually contains a startup script (*.sh* file on Linux/macOS, *.bat* on Windows) which you can use to easily start the server.

If you can't use the startup script (especially with "managed", shared hosting), simply install the server platform version required by the version of modpack you uploaded.

### What is a server pack {#server-pack}
A server pack is a file, usually a *.zip* archive, that contains all the modpack files for the server. These are mainly mods that are located in the `/mods/` folder. If the download does not contain the `/mods/` file, it is not a server pack, but a download intended for the client (in that case the archive will probably contain a 'manifest' file (most likely *manifest.json*) and the `/overrides/` folder).

This file is usually hundreds of MB in size. If the file size is only a units of MBs or less, it is almost certainly not a server pack, but a download intended for the client (because with the client, only the mod list file is (usually) downloaded, and the mods are then downloaded by the launcher, which the server cannot do. For that reason, server pack is provided).

On CurseForge you can download the server pack by clicking on the modpack version in the *Additional Files* tab (if the server pack is provided).

After extracting (unzipping) this file and moving/uploading it to the server files, the modpack will be installed on the server (assuming you have the correct platform version that the modpack requires installed).

### How to create a server pack {#how-to-create-server-pack}
If you are following some instructions that works with a server pack, but modpack does not provide one, here is how to create one:

1. Download the client version of the modpack and install it through a launcher that supports it (CurseForge, Modrinth, ATLauncher, ...), by default the launcher through which you will play the modpack (in simple terms this just means to download the modpack and wait for the game to load, then close it)

2. After installing modpack on the client, open the modpack folder

The location of the modpack folder differs from launcher to launcher, but every launcher should have option to access modpack files (folder) easily. Instructions on where to find the modpack folder in most launchers can be found [here](https://shockbyte.com/billing/knowledgebase/217/How-to-Locate-Your-Minecraft-Modpack-Folder.html). When you open the modpack folder, you should see a `/mods/` folder in it. If not, modpack is not installed, or you are in the wrong folder.

3. Select all the files in this folder and create a *.zip* file from them

This will create a "server pack" (the *.zip* file) that you can work with just like in the instructions. But there is an extra step at the end:
After uploading and unzipping the server pack, you need to [delete](#mod-deletion) all mods that are intended only for the client (see [here](#client-mod-on-server)).

### What if the modpack doesn't have a server pack {#no-server-pack}
In the case where the modpack developer does not provide a server pack, you need to do the following:

1. Install the appropriate version of the server platform for which the modpack is intended.
2. Download the client version of the modpack and install it via a launcher that supports it (CurseForge, Modrinth, ATLauncher, ...), that's normally the launcher you will use to play the modpack
3. After installing the modpack on the client, open the modpack files folder

You open/locate the modpack files folder differently in each launcher, but practically every launcher has this option. For instructions on where to find the modpack folder in most launchers, see [here](https://shockbyte.com/billing/knowledgebase/217/How-to-Locate-Your-Minecraft-Modpack-Folder.html). When you open the modpack folder, you should see a `/mods/` folder with mods in it. If not, modpack is not installed, or you are in the wrong directory (folder).

1. Copy all the modpack files and move/upload them to the server files
2. Remove all client-side only mods from the `/mods/` folder (see [here](#client-mod-on-server))

## How to tell if a mod is client-side only {#client-mod-on-server}
If you're experiencing server crashes and (especially on Forge) seeing '*net/minecraft/client*' errors in the log, it's likely that the server is crashing because a client-side only mod is installed on the server. This error will tell you what specific mod is causing the error.

For example, from the [stacktrace](problem-solving/java-basics.md#java-stacktrace) of this error, you can clearly see that the MouseTweaks mod (penultimate line) is causing the problem.

```log
[13:16:00] [Server thread/ERROR]: Encountered an unexpected exception
cpw.mods.fml.common.LoaderException: java.lang.NoClassDefFoundError: net/minecraft/client/entity/EntityClientPlayerMP
	at cpw.mods.fml.common.LoadController.transition(LoadController.java:163) ~[LoadController.class:?]
	at cpw.mods.fml.common.Loader.initializeMods(Loader.java:739) ~[Loader.class:?]
	at cpw.mods.fml.server.FMLServerHandler.finishServerLoading(FMLServerHandler.java:97) ~[FMLServerHandler.class:?]
	at cpw.mods.fml.common.FMLCommonHandler.onServerStarted(FMLCommonHandler.java:319) ~[FMLCommonHandler.class:?]
	at net.minecraft.server.dedicated.DedicatedServer.func_71197_b(DedicatedServer.java:210) ~[en.class:?]
	at net.minecraft.server.MinecraftServer.run(MinecraftServer.java:387) [MinecraftServer.class:?]
	at net.minecraft.server.MinecraftServer$2.run(MinecraftServer.java:685) [li.class:?]
Caused by: java.lang.NoClassDefFoundError: net/minecraft/client/entity/EntityClientPlayerMP
	at yalter.mousetweaks.loaders.MouseTweaksForge.init(Unknown Source) ~[MouseTweaksForge.class:2.4.4]
	... continued
```

On Fabric, information about incorrect use of a client-side only mod is usually explicitly stated in the first lines of the log, but this may not always be the case (fortunately, Fabric usually just doesn't enable the mods and doesn't cause any problem, unlike Forge).

The moment you can tell from the error which mod it is, find out if the mod is
is client-only. If it is, remove it from the server.

But how to find out if mod is client-side only?

You should have an approximate idea of what mods don't belong on the server. For example, a mod that works with shaders is not related to the server, it doesn't interact with it in any way, since shaders only take care of rendering on the client, from which you can deduce that the mod doesn't belong on the server. The same goes for the MouseTweaks mentioned above. The description on the mod page is: "Mouse Tweaks replaces the standard RMB dragging mechanic, adds two new LMB dragging mechanics and an ability to quickly move items with the scroll wheel." This is also unrelated to the server and only affects client behavior.

If the mod is on Modrinth, the mod page says whether it is for the client only or the server as well.

![Image Showing Modrinth Mod Page Of Client Side Only Mod](/assets/images/mods/mod-side.png)

If you're not sure and the mod is not on Modrinth, simply try removing the mod and see if the problem persists (just because the server doesn't automatically start doesn't mean the mod wasn't the problem. You may have multiple such mods installed).

## Common problems and solutions {#mods-common-issues}
Whether you are solving a problem on the server with plugins or mods, it can almost always be read from [log](problem-solving/logs.md#log). Fabric usually has the errors very well described and explained. With Forge it can be worse, normally you can also read the cause from the log without much trouble.

When installing a mod, always read the description on its page for basic information. This can often avoid unnecessary troubleshooting.

Below are the most common problems people encounter.

### Bad mod version {#bad-mod-version}
When downloading a mod, always download the version intended for your platform and version of Minecraft (Fabric/Forge).

#### Bad platform {#wrong-platform}
Fabric and Forge are not compatible with each other, so if the server platform is Fabric you must download the Fabric version of the mod, if Forge you must download the Forge version. The version intended for NeoForge will not work on Forge (on the contrary, it usually does, since NeoForge is Forge [fork](general/platforms.md#forks))

### Wrong Minecraft version {#wrong-version}
As written above, when downloading a mod, always make sure to note which Minecraft (Fabric/Forge) version the mod is for. If you upload a version incompatible with the server version, the server will usually crash. You can always get more information about the error from the [log](problem-solving/logs.md).

For example, on Forge, the error message (in the log) might look like this:

```log
[09pro2023 12:50:41.954] [main/ERROR] net.minecraftforge. fml. loading-ModSorter/LOADING]: Missing or unsupported mandatory dependencies:
Mod ID: 'minecraft', Requested by: 'naturalist', Expected range: '[1.20.1,)', Actual version: '1.19.2'
Mod ID: 'minecraft', Requested by: 'immersive_armors', Expected range: '[1.18.1,1.18.1]', Actual version: '1.19.2'
```

Mods are very "version sensitive" unlike plugins, so a mod with a different "subversion" (e.g. 1.20.1 vs 1.20.2) will usually not work at all. You need to use a version intended for the exact server version.

### Missing dependencies {#mods-missing-dependency}
Like plugins, mods may require another mod to work. Unlike plugins, in case the dependency is not installed, the mod doesn't just disable, but the entire server crashes.

From the [log](problem-solving/logs.md#log) it is almost always easy to get the information about missing dependencies.

Such message might look like this on Fabric ('fabric' in '*requires any version of fabric*' indicates [FabricAPI](#fabric-api)):

```log
[20:34:13] [main/INFO]: Loading Minecraft 1.20.4 with Fabric Loader 0.15.11
[20:34:13] [main/WARN]: Mod resolution failed
[20:34:13] [main/INFO]: Immediate reason: [HARD_DEP_NO_CANDIDATE biomesoplenty 19.0.0.89 {depends fabric @ [*]}, ROOT_FORCELOAD_SINGLE biomesoplenty 19.0.0.89]
[20:34:13] [main/INFO]: Reason: [HARD_DEP biomesoplenty 19.0.0.89 {depends fabric @ [*]}, HARD_DEP biomesoplenty 19.0.0.89 {depends glitchcore @ [>=1.0.0.51]}, HARD_DEP biomesoplenty 19.0.0.89 {depends terrablender @ [>=3.3.0.9]}]
[20:34:13] [main/INFO]: fix: add [add:fabric 1 ([(-∞,∞)]), add:glitchcore 1.0.0.51 ([[1.0.0.51,∞)]), add:terrablender 3.3.0.9 ([[3.3.0.9 ∞)]], remove [], replace []
[20:34:13] [main/ERROR]: Incompatible mods found!
net.fabricmc.loader.impl.FormattedException: Some of your mods are incompatible with the game or each other!
A potential solution has been determined, this may resolve your problem:
	 - Install fabric, any version.
	 - Install glitchcore, version 1.0.0.51 or later.
	 - Install terrablender, version 3.3.0.9 or later.
More details:
	 - Mod 'BiomesOPlenty' (biomesoplenty) 19.0.0.89 requires any version of fabric, which is missing!
	 - Mod 'BiomesOPlenty' (biomesoplenty) 19.0.0.89 requires version 1.0.0.51 or later of glitchcore, which is missing!
	 - Mod 'BiomesOPlenty' (biomesoplenty) 19.0.0.89 requires version 3.3.0.9 or later of terrablender, which is missing!
	at net.fabricmc.loader.impl.FormattedException.ofLocalized(FormattedException.java:51) ~[fabric-loader-0.15.11.jar:?]
	at net.fabricmc.loader.impl.FabricLoaderImpl.load(FabricLoaderImpl.java:195) ~[fabric-loader-0.15.11.jar:?]
	at net.fabricmc.loader.impl.launch.knot.Knot.init(Knot.java:146) ~[fabric-loader-0.15.11.jar:?]
	at net.fabricmc.loader.impl.launch.knot.Knot.launch(Knot.java:68) ~[fabric-loader-0.15.11.jar:?]
	at net.fabricmc.loader.impl.launch.knot.Knot.KnotServer.main(KnotServer.java:23) ~[fabric-loader-0.15.11.jar:?]
	at net.fabricmc.loader.impl.launch.server.FabricServerLauncher.main(FabricServerLauncher.java:69) ~[fabric-loader-0.15.11.jar:?]
	at net.fabricmc.installer.ServerLauncher.main(ServerLauncher.java:69) ~[server.jar:1.0.1]
```

And on Forge as follows:

```log
[09pro2023 12:50:41.954] [main/ERROR] Inet.minecraftforge. fml. loading-ModSorter/LOADING]: Missing or unsupported mandatory dependencies:
Mod ID: 'geckolib', Requested by: 'naturalist', Expected range: '[4.0.0,)', Actual version: '[MISSING]'
Mod ID: 'moonlight', Requested by: 'supplementaries', Expected range: '[1.19.2-2.3.0,1', Actual version: '[MISSING]'
```

For both platforms, it is clearly stated which mod requires which dependency, including its version.

When installing a mod separately (so not a modpack), always read the description on its page for basic information. If a mod needs a dependency, it will be stated there. In addition, on Modrinth, dependencies are listed when you click on the version of the mod, see e.g. [here](https://modrinth.com/mod/mouse-tweaks/version/1.20-2.26-fabric).

### There is a client-only mod on the server
See [here](#client-mod-on-server) for more information.