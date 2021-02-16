# ![Logo](https://user-images.githubusercontent.com/349381/60662504-7a6e4800-9e54-11e9-9086-0685b6b4edbd.png) fabPack

Packaging Utility for Salesforce Professionals - Fabrice Cathala

---

## Ant Stack Setup


First thing first, install Java, then add Ant on top of it, then add **fabPack** on top of them all.

Note that to control they install correctly you'll need to run the following commands:

~~~bash
$ java -version
java version "1.8.0_152"
Java(TM) SE Runtime Environment (build 1.8.0_152-b16)
Java HotSpot(TM) 64-Bit Server VM (build 25.152-b16, mixed mode)

$ ant -version
Apache Ant(TM) version 1.10.1 compiled on February 2 2017

$ git --version
git version 2.22.0

$ fabpack -version
fabPack version 2.0.0
Stack correctly installed
~~~

### Java
You need to use the JDK, not the JRE, and in your OS word size (32 vs. 64 bits). For added compatibility with the other Java applications running on your machine, I suggest sticking to the latest long-term support ("*LTS*") version available. 

At the time of writing, [Oracle is transitioning the Java release model](https://www.oracle.com/java/java9-screencasts.html?bcid=5582439790001&playerType=single-social) into two streams: the frequent-release developer stream and the stable-release enterprise stream. It's always been more or less the case but things get clearly separated now. You can read more on [Oracle FAQ](http://www.oracle.com/technetwork/java/eol-135779.html).

The current LTS release is version 8.
If you are using any other version than JDK LTS, please uninstall it first. Don't try to run two Java versions in parallel as, although technically possible, it will make troubleshooting *way* more complicated.
You can download Java 8 JDK from [http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html]().

### Ant

Install the latest version of Apache Ant that you can download from [http://ant.apache.org/bindownload.cgi](). 

### Troubleshooting

After both installations are done, typing `java -version` on a command line prompt should return something like this:

~~~bash
> java -version
java version "1.8.0_152"
Java(TM) SE Runtime Environment (build 1.8.0_152-b16)
Java HotSpot(TM) 64-Bit Server VM (build 25.152-b16, mixed mode)
~~~

If this is not the case, validate the following points

On a PC, your %PATH% environment variable should include the following folders (or similar):
* `C:\PROGRA~1\Java\JDK18~1.0_9\bin;`
* `C:\ProgramData\Oracle\Java\javapath;`

Your %PATHEXT% environment variable should start with the following exact sequence:
* `.COM;.EXE;.BAT;.CMD;`

Then, typing `ant -version` on a command line prompt should return something like this:

~~~bash
> ant -version
Apache Ant(TM) version 1.10.1 compiled on February 2 2017
~~~

If this is not the case, validate that your %PATH% environment variable includes the following folder (or similar):
* `C:\PROGRA~2\Apache\Ant-1.9.7\bin;`

You can get more information in the [Force.com Migration Tool Guide](https://developer.salesforce.com/docs/atlas.en-us.daas.meta/daas/forcemigrationtool_prereq.htm).

## fabPack Setup

### Download

To download the latest version of **fabPack** you must download the whole repo using the "*[Clone or download](https://github.com/fcathala/fabPack-SFDC)*" button then pressing "*Download ZIP*".

Extract the repo subfolder "*fabPack*" as shown below (I'm using [PeaZip](http://www.peazip.org/)). This skips the few repo system files located at the root like "*.gitignore*" but will keep the "*emptyfolder.git*" files. You can delete them if you really want.

![UnzippingPackage](https://user-images.githubusercontent.com/349381/62425840-b4da3780-b6d5-11e9-8c89-290b1c5742e3.gif)

### Portable Architecture

**fabPack** is portable. This means that it's dead simple to install and doesn't leave any trace behind:
* No shared library
* No Registry entry

On the other hand, it's code is duplicated every time you create a new project and you will have to [maintain the Ant Migration Toolkit](https://github.com/fcathala/fabPack-Windows/wiki/Installation-Guide#maintain-forcecom-migration-tool) in all folders where it's actively used  ([and it's a rather good thing](https://releasenotes.docs.salesforce.com/en-us/winter17/release-notes/rn_api_meta.htm))... This choice was made to simplify the setup considering that batch files can be cumbersome to provide a clean UI. Selecting a project is done by changing the default folder rather than modifying a setting.

If you are working on four projects at the same time, copy the repo subfolder "*fabPack*" that you've just downloaded into each project folders as shown in the folder structure below. After [configuring fabPack](https://github.com/fcathala/fabPack-SFDC/wiki/Project-Configuration) you will have access for each project to the following settings:

* 6 organisations (Production, Sandbox or DE)
* 6 change sets per org (36 in total)

_**Note that the directory structure is being changed to reflect recent news and incorporate DX.**_

~~~
~
  ├── music
  ├── pictures
  ├── projects
  |   ├── prj01
  |   |   ├── fabPack
  |   |   |   ├── bin
  |   |   |   ├── files
  |   |   |   ├── logs
  |   |   |   ├── settings
  |   |   |   └── fabPack.cmd
  |   |   └── myfolder
  |   ├── prj02
  |   |   ├── fabPack
  |   |   |   └── ...
  |   |   └── myfolder
  |   └── prj03
  |       ├── fabPack
  |       |   └── ...
  |       └── myfolder
  ├── salesforce_ant
  |   ├── v41.0
  |   └── v42.0
  └── videos
~~~

### Maintain Force.com Migration Tool

Always use the latest "*ant-salesforce.jar*" by [downloading the latest version](https://developer.salesforce.com/page/Force.com_Migration_Tool#Force.com_Migration_Tool_Download) and creating a new version subfolder in "~/salesforce_ant".