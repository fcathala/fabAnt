# ![Logo](https://user-images.githubusercontent.com/349381/60662504-7a6e4800-9e54-11e9-9086-0685b6b4edbd.png) fabPack

Packaging Utility for Salesforce Professionals - Fabrice Cathala

---

Welcome to the **fabPack** wiki!

fabPack enables you to download Salesforce metadata from one org into a folder on your computer. From there, you can tweak the package and upload it with fabPack into a different org or even back into the same org! It's a [Bash](https://www.gnu.org/software/bash/manual/bash.html#What-is-Bash_003f) UI wrapt around the Ant-based [Force.com Migration Toolkit](https://developer.salesforce.com/docs/atlas.en-us.daas.meta/daas/meta_development.htm).

![Home Menu](https://user-images.githubusercontent.com/349381/60662947-b5bd4680-9e55-11e9-868d-49a3ee0670ef.png)

## Key Features

1. While it supports a limited set of actions, they are the most commonly used in deployments and have been road-tested.
1. The simple user interface allows a fool-proof switch between actions - *even after a long night fixing deployment errors*.
1. The versioned "*retrieve*" operations let you go back in time should you need to.
1. The versioned log files simplify troubleshooting.
1. Its *engine* is maintained by Salesforce themselves hence will always be kept up-to-date with the latest version of the metadata API.
1. It's a great tool for building a packages library.

## Retrieving Metadata

There are two ways to retrieve metadata:

1. By naming a package available in the source org ("*Package*" or "*Change Set*"): [Retrieve a package](https://github.com/fcathala/fabPack-SFDC/wiki/1.-Retrieve-a-package)
1. By uploading a manifest file stored in your computer ("*package.xml*"): [Retrieve a manifest](https://github.com/fcathala/fabPack-SFDC/wiki/2.-Retrieve-a-manifest)

![Retrieve](https://user-images.githubusercontent.com/349381/60662561-9e318e00-9e54-11e9-9a28-1f859ce2dbf1.png)

When the metadata is downloaded to your computer it's stored in a directory ("*src*") called the "*local package*" by opposition to an "*[AppExchange package](https://help.salesforce.com/articleView?id=sharing_apps.htm)*".

## Deploying Metadata

Once the "*local package*" is on your computer, you can then deploy it. **fabPack** offers three deployment options:

3. Validating your local package to the target org in preparation for the actual deployment: [Validate the local package](https://github.com/fcathala/fabPack-SFDC/wiki/3.-Validate-the-local-package)
3. Deploying the local package to the target org: [Deploy the local package](4. Deploy the local package)
3. Deleting or replacing components in the target org: [Deploy the local destructive package](https://github.com/fcathala/fabPack-SFDC/wiki/5.-Deploy-the-local-destructive-package)

![Deploy](https://user-images.githubusercontent.com/349381/60662590-b6091200-9e54-11e9-82d2-2deac6860a2a.png)

> Traditionally developers have used their own tools. **fabPack** brings declarative and programmatic workers to the same deployment pipe. Both teams can update a shared change set in Salesforce which will be retrieved to a computer, optionally edited, and deployed during the daily build.

## Setup

* [Installation Guide](https://github.com/fcathala/fabPack-SFDC/wiki/Installation-guide):
This is a one-off setup requirement per computer dictated by the way vendors install clients (Java then Ant) on each operating system.
* [Project Configuration](https://github.com/fcathala/fabPack-SFDC/wiki/Project-configuration):
This is a simple update required every time you start a new project.

## Reference

* [Development Lifecycle Guide](https://developer.salesforce.com/docs/atlas.en-us.dev_lifecycle.meta/dev_lifecycle/intro.htm)
* [Force.com Migration Tool Guide](https://developer.salesforce.com/docs/atlas.en-us.daas.meta/daas/meta_development.htm)
* [Force.com Migration Tool Download](https://developer.salesforce.com/page/Force.com_Migration_Tool)
* [Metadata API Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/meta_intro.htm)
* [5 Steps to Salesforce Continuous Delivery that Works](https://automationchampion.com/2019/08/10/app-review-5-steps-to-salesforce-continuous-delivery-that-works-for-you-no-expertise-required/#respond)
* [Unsupported Metadata Types](https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/meta_unsupported_types.htm)
* [Components supported via Change Sets](https://help.salesforce.com/articleView?id=changesets_about_components.htm&type=5)
* [Metadata Coverage](https://developer.salesforce.com/docs/metadata-coverage)
* [Packageable Components](https://help.salesforce.com/articleView?id=packaging_packageable_components.htm&type=5)

## Help
Why do you need help? Some components of a Salesforce org [are not supported by the Metadata API](https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/meta_unsupported_types.htm). As a result, every time one of these components appears in your Salesforce solution list you won't be able to carry it (keep it up to date in Prod) in an automated way. Note that [Salesforce is now documenting](https://developer.salesforce.com/docs/metadata-coverage/47) how the component support is evolving version after version.
**fabPack** simplifies the work to be done so that you won't have too many extra tasks during deployments.