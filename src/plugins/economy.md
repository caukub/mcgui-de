# Economy {#economy}
In case you want to use economy on your server, you will need an economy plugin and [Vault](specific/vault.md) installed (normally).

The Vault plugin itself is not an economy plugin, but most economy plugins need it to work properly, see [here](#why-vault).

If you are using EssentialsX or CMI, both of these plugins provide economy (but it may not be enabled in CMI by default, so you may need to enable it in the configuration). If you use CMI for economy, you need to use a modified version of Vault or Economy Injector, as you can read on [this page](https://www.zrips.net/cmi/), where you can find download links for them.

If you don't use EssentialsX or CMI, there are many different plugins providing economy, such as LiteEco or Economy++ (I don't recommend any of the plugins, these are just examples, if you are looking for an economy plugin, do your own research). Generally you want the plugin to have support for Vault.

## Vault features {#why-vault}
The reason why [Vault](specific/vault.md#vault) was created and is used is simple. There are many plugins for the economy. If Vault didn't exist, each plugin developer using the economy would have to add support for each such plugin providing economy individually.

This is why Vault was created. The author of the plugin providing the economy simply adds support for Vault, and then each plugin developer who wants to interact with the economy interacts only with Vault itself instead of having to add support for each economy plugin.

So Vault alone is (normally) not enough for a functional economy, as it is not an economy plugin. If you only have Vault installed without an economy plugin, plugins using the economy will not work properly, for example:

```log
[16:32:20] [Server thread/INFO]: [EconomyShopGUI] [WARN]: Failed to load default economy provider with reason 'No supported economy provider for Vault detected, please install a plugin such as Essentials', trying to automatically find supported economy provider
[16:32:20] [Server thread/INFO]: [EconomyShopGUI] [INFO]: Detected Vault, initializing...
[16:32:20] [Server thread/INFO]: [EconomyShopGUI] [WARN]: ===================================================
[16:32:20] [Server thread/INFO]: [EconomyShopGUI] [WARN]:
[16:32:20] [Server thread/INFO]: [EconomyShopGUI] [WARN]: Failed to automatically load an available economy provider, this plugin requires one, disabling...
[16:32:20] [Server thread/INFO]: [EconomyShopGUI] [WARN]: See a list of available economy providers on our wiki here: https://wiki.gpplugins.com/economyshopgui/file-configuration/config.yml#economy-provider
[16:32:20] [Server thread/INFO]: [EconomyShopGUI] [WARN]:
[16:32:20] [Server thread/INFO]: [EconomyShopGUI] [WARN]: ===================================================
[16:32:20] [Server thread/INFO]: [EconomyShopGUI] Disabling EconomyShopGUI v6.4.2
```

## Plugins using economy
The moment you have an economy providing plugin and Vault installed, you can start using a number of plugins or plugin features, the most common of which include:

- shops (GUI shops like EconomyShopGUI, ShopGUIPlus, GUIShop or DynamicShop; chest shops like EzChestShop, QuickShop, QuickShop Remake)
- auctions (AuctionHouse)

(these are only examples of plugins, I do not recommend any particular plugin)

You can also use almost any feature of plugin using the economy. This can be, for example, paying for creating a residence in the Residence plugin, adding/removing money during a certain DeluxeMenus event, etc.