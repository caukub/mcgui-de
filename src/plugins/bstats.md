# bStats {#bstats}
After enabling server supporting plugins, you may notice that there is a folder named `bStats` in the `/plugins/` directory, even though no plugin with that name has been installed on the server. This is because *bStats* is not a standalone plugin, but a feature built right into the platform. bStats is used to collect metrics. Sending this data is enabled by default. This can be disabled in the bStats configuration (`/plugins bStats/config.yml`) by setting `enabled` to `false`.

The collected metrics are publicly available. You can see them [here](https://bstats.org/).