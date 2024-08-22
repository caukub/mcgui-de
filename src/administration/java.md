# Java {#java}
## What is Java {#what-is-java}
Java is the programming language in which Minecraft (Java Edition) is written. In order to run a Java application (which Minecraft is), an environment is required to run the application. Such an environment is called a JRE (Java Runtime Environment), sometimes referred to as just "Java".

## Installation {#java-installation}
In the case where you are using a Minecraft hosting service, Java should already be available and the administration should allow you to manage its version.

However, if you are managing the server running Minecraft yourself (whether on your own machine, a VPS, or a dedicated server), you will need to install Java.

You can find which version of Java to choose for your server platform [here](#java-versions).

Detailed instructions on how to install Java can be found at the following link <https://docs.papermc.io/misc/java-install.>

## Java version {#java-versions}
The recommended Java versions for server versions are as follows:

| Server Version | Recommended Java Version |
|----------------|--------------------------|
| >= 1.17.1      | Java 21                  |
| 1.16.5         | Java 16                  |
| 1.12 to 1.16.4 | Java 11                  |
| 1.8 to 1.11    | Java 8                   |

It is important to be careful on certain versions:
- Forge version 1.16.5 and below requires Java version 8. If a higher version of Java is used, the server will crash.
- For old versions (1.7.10, 1.8.8), if you use a version of Java later than 8 on Linux OS, you need to disable `use-native-transport` in `server.properties`. If this option is left on, the server will probably start log spamming and the disk space will fill up very quickly (it's gigabytes in a little while).
###  ︌ {#new-java-old-version}

If you are managing the server yourself and do not know what version of Java is being used, you can find out by using the `java -version` command at the command line.

## Java flags {#java-flags}
Java flags are flags that affect behavior of Java ([JVM](https://en.wikipedia.org/wiki/Java_Virtual_Machine)), including its [garbage collector](#java-gc). Setting correct flags can help server performance.

It is therefore recommended to use the so-called Aikar flags. You can rad more about them here: <https://docs.papermc.io/paper/aikars-flags>

## Startup command {#startup-command}
Normally, Java applications starts with a command in the command line.
The simplest command to start a Java application looks like this:

```sh
java -jar file.jar
```

where `java` is the Java command itself, `-jar` is a parameter indicating that a *.jar* file will be run, and `file.jar` is the name of the file to be run (the [server JAR](../general/server-jar.md)).

**Warning!** If the name of the file to be launched contains a space, it must be enclosed in quotes (otherwise an error will occur), for example: `java -jar "paper 1.18.2" nogui`

Before the name of the startup file are Java flags (which is also the `-jar` flag itself). These flags modify the behavior of Java (JVM) itself, including its [garbage collector](#java-gc). In this example, the *Xmx* flag is used to set the maximum heap memory to 8192 MB.

```sh
java -Xmx8192M -jar server.jar --nogui
```

After the filename there the flags/paramters/args of the program (jar) itself, in this case `--nogui` flag, which disables the [default GUI server](https://preview.redd.it/5wqe0atb5qj61.png?auto=webp&s=03aa31ebb5ee6c876b8007b0b8a4a5ab3e801ae5).

**Warning!** Java flags must come before the file name and program flags/args after it. The following command is not correct and will return an error.

```sh
java --nogui server.jar -jar -Xmx8192M -Xms8192M
```

Not using the correct Java flags has a negative impact on server performance, read more [here](#java-flags). You can use this site to generate the optimal startup command: <https://docs.papermc.io/misc/tools/start-script-gen>

## What is Java GC (garbage collector) {#java-gc}
Java GC takes care of the memory management of Java applications.

You can read more about its behavior [here](server-resources.md#memory-behavior).

## JRE vs JDK {#jre-vs-jdk}
The JRE (Java Runtime Environment) is the environment that allows Java programs (which the Minecraft server itself is) to run (execute).

The JDK (Java Development Kit) contains tools for developing applications for the Java platform. If you use the JDK, you can easily use it to run the Minecraft server as well, since the JRE is included in the JDK.

So unless you plan to develop Java applications on the machine where the server is running, choose the Java JRE, otherwise choose the Java JDK.

## Multiple versions of Java on one machine {#multiple-java-versions}
You can easily use multiple versions of Java on a single machine.

In the [startup command](#startup-command), just use the location of the Java executable instead of the `java` command itself. Thus, instead of

```sh
java -Xmx4G -Xms4G -jar paper.jar --nogui
```

can be used, for example

```sh
/usr/lib/jvm/java-21-openjdk/bin/java -Xmx4G -Xms4G -jar paper.jar nogui
```

or

```sh
"C:\Program Files\Java\jdk-21\bin\java.exe" -Xmx4G -Xms4G -jar paper.jar nogui
```

The `java` command only runs the executable. You can find out where this file is for the current `java` command by running `which java` (Linux/macOS) or `where java` (Windows).

If the path to the Java executable file contains a space (e.g. on a Windows operating system because of the '_Program Files_' folder), you need to enclose it in quotes. Otherwise, an error such as `C:\Program is not recognized as an internal or external command.` will occur.

## Other {#java-other}
If using the 32-bit version of Java, a maximum of 4 GB of RAM can be used.