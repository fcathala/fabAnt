# fabAnt

*Packaging utility for Salesforce professionals - Fabrice Cathala 🐸*

---

> **Note from Salesforce**
> The Ant Migration Tool is retired with Spring ’24. The tool continues to function for future API versions but isn’t updated with new functionality and isn’t supported. To manage metadata changes, switch to Salesforce CLI for a modern, supported developer experience.
> [Read here](https://developer.salesforce.com/docs/atlas.en-us.daas.meta/daas/meta_development.htm).

I think it's still a good way to learn "*what's in the platform*" and understand the challenge of deployments but the best IMHO is not to waste time and move ASAP to [DX](https://www.salesforce.com/uk/products/platform/products/salesforce-dx/), if not not already done! I have a Github project located here to give you an head-start: [fabDX](https://github.com/fcathala/fabDX).

**fabAnt** is a simple but efficient packaging utility that simplify moving meta-data packages in between Salesforce orgs. It's built around Salesforce's Ant migration toolkit that it enhances with an old-fashioned script. With fabAnt you can build a package from a change set, pull down the metadata, tweak it and deploy to any org including back into the source. It's also a great way to **build a packages library**.

**fabAnt** is based on the [Force.com Migration Toolkit](https://developer.salesforce.com/docs/atlas.en-us.daas.meta/daas/meta_development.htm) hence will always remains compatible with the latest API version.

>**fabAnt** saves time and reduces risk of manual mistakes. I'm recommending it to any Salesforce implementation teams dealing with lot of packaging work or willing to build a code library.
>
> *Ben N, Senior Salesforce Developer*

The security policy is explained [here](https://github.com/fcathala/fabAnt/blob/master/SECURITY.md).

---

fabAnt is a script wrapper of Salesforce Ant Toolkit used to deploy from org to org, and sooner or later to production.
It's based on Ant that it simplifies and documents. Salesforce release management currently requires a client to temporarly store the metadata to be shipped between orgs. There are no way do do an equivalent operation in the clouds.

Typically you send to the source the name of the components that you need (or a package hosted on the org and that describes them) and then the org send them back to you as they are configured. Of course, classes would contain heavily customized code (that you cannot guess) but [most components](https://developer.salesforce.com/docs/metadata-coverage) are also available for description (and migration/deployment). Having said that, Salesforce is renowned [for skipping support of some metadata types](https://help.salesforce.com/articleView?id=sf.changesets_about_components.htm&type=5) (although, to be accurate, what's available in change Set and what's available in the metadata API is not the same thing). You do need to be careful about this area of an org configuration that require manual-pre and manual-post deployment checklists.

fabAnt will not remove the Salesforce native challenges to release management but will simplify their management by freeing you time to focus on these challenges and automate the easy part of the process.

## First Installation

Although you may argue that this is a painful step, requiring computer troubleshooting at times, it's also a one-off thing to do to accomodate your computer to this way of working with Salesforce orgs.

To run fabAnt you must have the following installed on your computer:

* [Java](https://www.azul.com/downloads/zulu-community/?package=jdk) ~ Attention [Oracle](https://www.oracle.com/uk/downloads/licenses/javase-license1.html) JDK is not Open Source any more. There are some ways around it but the best is to change sowftare altogether and go with [Azul](https://www.azul.com/products/zulu-enterprise/jdk-comparison-matrix/) for instance which is Salesforce's recommended Java Client for the Data Loader as well... Also, you do need the JDK to run Ant, NOT the JRE.
* [Ant](https://ant.apache.org/manual/install.html) (make sure that you add the "*bin*" folder to the Path environment variable)
* [Salesforce toolkit for Ant](https://developer.salesforce.com/docs/atlas.en-us.daas.meta/daas/forcemigrationtool_install.htm)
* [fabAnt](https://github.com/fcathala/fabAnt/archive/refs/heads/main.zip) ~ Download both the PC and Mac versions

## Project Configuration

In the first versions (v1.x) I was trying to limit the number of installation to a single Salesforce Toolkit per computer (as there is a single install of Java or Ant). In the following versions, I have changed this architecture to come bak to something simpler to use. As a result there will be quite a few duplicates but Salesforce manages old versions quite well, so no need to be stressed about that. An install is now **Project Centric** and within a **Project** each folder must represent a pair of source and destination orgs. Example for a 3 orgs structure, you would have to configure your folders this way:

```
C:\USERS\<YOUR_NAME>\<PROJECT_NAME>\DEV-QA
│   │   fabAnt.cmd
│   ├───jar
│   │       ant-salesforce.jar
│   └───lib
│           deployCode.cmd
│           deployCodeCheckOnly.cmd
│           describeMetadata.cmd
│           fabAnt.xml
│           org.down.properties
│           org.up.properties
│           retrieveCode.cmd
│           retrievePkg.cmd
│           testInstallation.cmd
│           undeployCode.cmd
│
└───QA-SIT
│   │   fabAnt.cmd
│   ├───jar
│   │       ant-salesforce.jar
│   └───lib
│           deployCode.cmd
│           deployCodeCheckOnly.cmd
│           describeMetadata.cmd
│           fabAnt.xml
│           org.down.properties
│           org.up.properties
│           retrieveCode.cmd
│           retrievePkg.cmd
│           testInstallation.cmd
│           undeployCode.cmd
│
└───SIT-PROD
    ant-salesforce.jar
    ├───jar
    │       ant-salesforce.jar
    └───lib
            deployCode.cmd
            deployCodeCheckOnly.cmd
            describeMetadata.cmd
            fabAnt.xml
            org.down.properties
            org.up.properties
            retrieveCode.cmd
            retrievePkg.cmd
            testInstallation.cmd
            undeployCode.cmd
```

1. The folders "DEV-QA", "QA-SIT" and "SIT-PROD" should host 3 migrations from "DEV" to "QA", "SIT" and "PROD". You must configure the files "org.down.properties" and "org.up.properties" accordingly (down = source, up = target). There is some room for flexibility here depenmding on how comfortable are you doing it. These folders contain a download from this Git repo which supports both PC and Mac, so you can simplify the folder structure as you prefer (I always get rid of the folder I am not using and move the content of the other to my orgs-duo root).
2. In the "jar" folder you must copy the latest toolkit obtained from [Salesforce](https://developer.salesforce.com/docs/atlas.en-us.daas.meta/daas/forcemigrationtool_install.htm) (ant-salesforce.jar).

## User Guide

fabAnt really is just a script, wrapping all Ant calls into a simplified interface. Who say "simplified interface" says "less powerful", so it may be the case that you have to learn the whole Ant approach but at least this repo gives you an head start. Strangely version 1.x was more powerful but it was also more complex to hack into, so I decided to simplify the approach. Also, I'm wroking into a [CLI DX version](https://github.com/fcathala/fabDX), but this is not going to be the magical solution to move an org from a Production centric to Repository centric approach of Enterprise-Class application lifecycle management. I'll do my best to simplify things again.

```
----------------------------------------------------------
 fabPack - Packaging Utility for Salesforce Professionals
----------------------------------------------------------

 (1) Check installation
 (2) Retrieve all supported metadata types
 (3) Download components from manifest
 (4) Download components from the package
 (5) Validate components on the target
 (6) Deploy components on the target
 (7) Delete components on the target
 (8) Quit

----------------------------------------------------------

Please, type the selection number from 1 to 8.
```

### (1) Check installation

Validate the whole stack is correctly installed. Show some Environment Variable that are always good to check.

### (2) Retrieve metadata types

Create a folder "metadata\archive\%TimeStamp%-describeMetadata" including the result file "log.txt" which contains the list of all metadata components supposed to be touched, hence requiring migration. (this bit remains "To Be Clarified")

### (3) Download from manifest

Use the "package.xml" stored in the "metadata\temp" folder to retrieve and download all components listed there. Download these components into the folder "metadata\temp" including the descriptif "package.xml". When done, create a folder "metadata\archive\%TimeStamp%-retrieveCode" including the result file "log.txt".

### (4) Download from package

Use the package name described in "org.down.properties" (example: #sf.pkgName = DailyCS) to retrieve and download all components listed there. Download these components into the folder "metadata\temp" including the descriptif "package.xml". When done, create a folder "metadata\archive\%TimeStamp%-retrievePkg" including the result file "log.txt".

### (5) Validate on the target

Expect to find in the "metadata\temp" folder the file "package.xml" and associated subfolder containing the components to deploy. Then, DO NOT deploy but only tests the deployment can happen without fault. When done, create a folder "metadata\archive\%TimeStamp%-deployCodeCheckOnly" including the result file "log.txt".

### (6) Deploy on the target

Expect to find in the "metadata\temp" folder the file "package.xml" and associated subfolder containing the components to deploy. When done, create a folder "metadata\archive\%TimeStamp%-deployCode" including the result file "log.txt" and a copy of the metadata just deployed.

### (7) Delete on the target

Expect to find in the "metadata\temp" folder the files "destructiveChanges.xml" and "package.xml" containing the components to remove and, optionaly, the ones to deploy afterward. When done, create a folder "metadata\archive\%TimeStamp%-undeployCode" including the result file "log.txt".

### (8) Quit

Leave fabAnt.

## Useful Links

* [Zulu (Java) download](https://www.azul.com/downloads/zulu-community/?package=jdk)
* [Ant](https://ant.apache.org/manual/)
* [Ant Salesforce Toolkit](https://developer.salesforce.com/docs/atlas.en-us.daas.meta/daas/forcemigrationtool_install.htm)
* [Components Available in Change Sets](https://help.salesforce.com/articleView?id=sf.changesets_about_components.htm&type=5) + [Unsupported Metadata Types](https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/meta_unsupported_types.htm) + [Metadata Coverage](https://developer.salesforce.com/docs/metadata-coverage) + [Components Available in Managed Packages](https://help.salesforce.com/articleView?id=sf.packaging_packageable_components.htm&type=5)
* [Ant Migration Tool Guide](https://developer.salesforce.com/docs/atlas.en-us.daas.meta/daas/meta_development.htm)
* [Metadata API Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/meta_intro.htm)
* [5 Steps to Salesforce Continuous Delivery that Works for You](https://automationchampion.com/2019/08/10/app-review-5-steps-to-salesforce-continuous-delivery-that-works-for-you-no-expertise-required/) (Blog post)
* [Farewell package.xml](https://saramorgan.net/2021/02/22/farewell-package-xml-you-will-not-be-missed/) (Blog post)
