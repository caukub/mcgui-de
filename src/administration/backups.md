# Backups {#backups}
In the case that server data is deleted, corrupted or lost, without a server backup you will irretrievably lose all data. For this reason, if you care about your server data at all, backing up is an essential part of server management. As I'm sure you've heard already: "There are two types of people: those who back up and those who haven't lost their data yet."

Backups may not be only for purpose of protecting data from unexpected loss, but for example, they allow you to access older versions of configuration files etc., which can be useful in some situations.

Whenever you take any action where something bad might happen to your server data (such as a server version change, especially if it's experimental), make sure you have a backup!

Data stored in [standalone databases](databases.md#standalone-database) (e.g. MySQL) is not stored in the server data, so you need to backup this data separately.

## Creating backups {#backup-creation}
If you are using a Minecraft host, creating automatic (and eventually custom) backups is almost certainly part of the service provided, so you don't have to worry about anything.

However, if you manage the server on which the Minecraft server is running, you'll need to take care of the managing backups yourself.

There are many tools for creating automatic backups, including [Borg](https://www.borgbackup.org/).

If you want to create a manual backup on a Linux operating system, you can use the *tar* or *rsync* tools. On a Windows operating system, to create a manual backup, just right-click on the server folder → click *Send to* → click *Compressed (zipped) folder* and wait for the folder to compress.

## On-site and off-site backups {#backup-types}
An on-site backup is a backup that is on the same server (disk) as the data being backed up.

An off-site backup is a remote backup, that is, a backup on a different server (disk) than the data being backed up.

It is important to have both on-site and off-site backups (or you may not have on-site backups at all). These can come in hand, for example, if you lose access to the server on which the Minecraft server is running, or if the server disk is damaged. In such a case, on-site backups would be completely useless and you would lose data just as if you hadn't created any backup.