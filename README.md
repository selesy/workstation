Workstation
===========

This project provides a set of Ansible playbooks and roles that configure a
Java developer's workstation.  As developers, we often like the cleanliness of
a fresh Linux install, but dread the time it takes to reinstall our tools.
The scripts included with this project automate the process of getting back to
work.  Generally, your Internet bandwidth will determine how long it takes
this process to complete.

This project currently supports 32 and 64 bit Debian-based systems.  It should
be possible to add support for Fedora-based systems without too much work if
there's interest.

Applications
------------

This project installs the following applications:

-   Apache Directory Studio - LDAP client (apache_directory_studio)
-   BurpSuite
-   DBeaver - Database client (dbeaver)
-   Eclipse IDE with selected plugins (eclipse)
-   Findbugs
-   Firefox Developer Edition (firefox-de)
-   Git source code management (git)
-   Java JDK - the most recent two versions (java)
-   JMeter - Load testing (jmeter)
-   Kubernetes
-   Maven build system (maven)
-   MiniKube
-   Netbeans IDE (netbeans)
-   SoapUI (soapui)
-   SQLMap
-   Subversion source code management (subversion)
-   UMLet - UML Diagraming (umlet)
-   Zed Attack Proxy - Security testing (zaproxy)

Note that the string in parenthesis above is the tag you can use to explicitly
include or exclude the application's playbook tasks.  See the **Examples**
section below.

Additional Tags
---------------

In addition to the tags listed for each application, there's a set of functional
tags that are applied to the applications as appropriate.  For instance, if you
only want to install the LDAP tools, using the ldap tag below (with an include
switch) would install the command-line LDAP client tools as well as the Apache
Directory Studio.

-   coverage
-   database
-   editors
-   issues
-   ldap
-   modeling
-   networking
-   quality
-   uml
-   virtualization
-   web

Operation
---------

The software development (and systems) tools installed by this project fall
into two categories.  How these installations are managed is dramatically
different depending on the class of the application as follows:

-   Operating System (OS) packaged applications - Applications that provide
    packages in the target operating system are installed using the OS' package
    manager.  Currently these applications are Debian style packages that can
    be installed using "apt".

-   Unpackaged applications - Applications that do not provide OS packages are
    installed by downloading the binary (or source if needed), then compiled
    and/or unarchived into a "safe" location.  Whether you're using a Linux
    distribution that continuously updates or one that expects you to reinstall
    the system when updating to a new major version, the applications installed
    from archives or source code can be protected from the updater.  Applications
    are installed into the following directory:

        /opt/<application-name>/<application-version>

    For systems that upgrade their distribution by reinstalling the OS from a new
    image (such as Linux Mint), it is recommended that the /opt directory be
    installed in a separate partition.  When the OS is upgraded, simply remap the
    /opt directory into the file system without reformating.
    
    Since the path also includes the version number, the applications managed
    by this project are safe during updates.  When a new version of an application
    is included, it's simply installed "next to" the older version of the same
    application.  A soft-link to the most recent version is installed in:

        /opt/<application-name>/latest

    The link to the latest version of the application is used by the desktop
    launchers installed into the OS' menu.  Therefore, launching an application
    from the menu will result in the latest version being launched.  If you need
    to run an older version, you can do so by navigating to the appropriate
    version and run it via the command line.  This project never deletes any of
    the code it installs.  Therefore, if you need to recoup space on your hard
    drive, you'll have to manually delete older versions of the application from
    the /opt directory.

Use
---

There are three scripts included with this project.  The first two simply
prepare a newly installed Linux system to allow the use of Ansible.  The third
script does all the work and is idempotent.  Run it periodically and it will
make sure your system stays up-to-date.  These three scripts are as follows:

*   ansible.sh - This script requires sudo privileges and simply installs
    Ansible and its dependencies on the target system, then creates an SSH key
    that Ansible will later use to connect back into the system.  Run this
    script once or run the steps manually.  It is possible to alter the Ansible
    inventory file to maintain a pool of development workstations.
                 
*   bootstrap.sh - This script creates an Ansible inventory file containing
    only localhost, then uses Ansible to execute the playbook provided by
    bootstrap.yml.  This playbook creates the ansible system user, adds the
    user's public key and then configures passwordless sudo.  Run this script
    once, or perform the equivalent steps manually.
                   
*   workstation.sh - This script actually runs the Ansible playbook that builds
    and maintains the development environment.  It can be run frequently and at
    a minimum will keep the programs installed via the system's package manager
    (currently apt) up-to-date.  It's possible to exclude some or all of the
    programs that are defined in this playbook via the use of tags.  See the
    "tags" section below for more details.

Security Concerns
-----------------

Allowing the ansible system user to execute commands via passwordless sudo (as
described by the "bootstrap.sh" bullet above has security implications.  Since
the most common use of this system is to keep a development environment on the
local host up-to-date, the private key that allows Ansible to execute will
reside on the same machine and will have been installed in an unprivileged
account.  If a cracker were to breach this unprivileged account, they would
easily escalate their privileges to root simply by using the SSH key to
connect to localhost as the ansible user.  You have been warned!

It is suggested that at a minimum, users of this program should choose a strong
password.  It's further suggested that users choose encrypted home directories
to further minimize the possibility of their unprivileged account being
compromised.

Example
-------
Initial setup is done as the regular user. Do *NOT* run the scripts as sudo.
```
./ansible.sh
./bootstrap.sh 127.0.0.1
./workstation.sh
```

The workstation script copies all passed parameters to the ansible-playbook
command.  The most useful reason is to allow the inclusion and exclusion
of roles (or tagged components) based the user's preference.

By default, Ansible completely ignores tags.  If you specify a tag (as in
the example below), ansible will only run tasks with the specified tags.
You can include as many tags as you like, but I find excluding a few tags
to be much more common.

This example runs any tasks that are tagged with the word "networking".

```
./workstation.sh --tags=networking
```

The next example shows how to exclude tasks with specific tags.  If the user
is an Oracle fan-boi, they probably never want to use OpenJDK or Eclipse.

This command will still install the Oracle JDKs and Netbeans but eliminates
that pesky open-source software.

```
./workstation.sh --skip-tags=eclipse,openjdk
```

While every effort is made to keep this document up-to-date, you can always
view the list of available tags using Ansible.  In the root of the workstation
project, simply run the following command:

```
ansible-playbook --list-tags workstation.yml
```

References
----------

1.  [Ansible](http://www.ansible.com)
1.  [Apache Directory Studio](http://directory.apache.org/studio)
1.  [DBeaver](http://dbeaver.jkiss.org)
1.  [Eclipse](http://eclipse.org)
1.  [Firefox Developer Edition](https://www.mozilla.org/en-US/firefox/developer/)
1.  [JMeter](http://jmeter.apache.org/)
1.  [NetBeans](https://netbeans.org/)
1.  [SoapUI](http://www.soapui.org/)
1.  [UMLet](http://www.umlet.com)
1.  [Zed Attack Proxy](https://www.owasp.org/index.php/OWASP_Zed_Attack_Proxy_Project)
