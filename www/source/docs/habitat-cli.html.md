---
title: Habitat Docs - hab CLI Reference
draft: false
---

# Habitat Command-Line Interface (CLI) Reference

The commands for the Habitat CLI (`hab`) are listed below.

| Applies to Version | Last Updated |
| ------- | ------------ |
| hab 0.59.0/20180712155441 (linux) | 13 Jul 2018 |

## hab



**USAGE**

```
hab [SUBCOMMAND]
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```



**ALIASES**

```
apply      Alias for: 'config apply'
install    Alias for: 'pkg install'
run        Alias for: 'sup run'
setup      Alias for: 'cli setup'
start      Alias for: 'svc start'
stop       Alias for: 'svc stop'
term       Alias for: 'sup term'
```

**SUBCOMMANDS**

| Command | Description |
| ------- | ----------- |
| [hab bldr](#hab-bldr) | Commands relating to Habitat Builder |
| [hab cli](#hab-cli) | Commands relating to Habitat runtime config |
| [hab config](#hab-config) | Commands relating to a Service's runtime config |
| [hab file](#hab-file) | Commands relating to Habitat files |
| [hab origin](#hab-origin) | Commands relating to Habitat origin keys |
| [hab pkg](#hab-pkg) | Commands relating to Habitat packages |
| [hab plan](#hab-plan) | Commands relating to plans and other app-specific configuration. |
| [hab ring](#hab-ring) | Commands relating to Habitat rings |
| [hab studio](#hab-studio) | Commands relating to Habitat Studios |
| [hab sup](#hab-sup) | Commands relating to the Habitat Supervisor |
| [hab supportbundle](#hab-supportbundle) | Create a tarball of Habitat Supervisor data to send to support |
| [hab svc](#hab-svc) | Commands relating to Habitat services |
| [hab user](#hab-user) | Commands relating to Habitat users |
---

## hab bldr

Commands relating to Habitat Builder

**USAGE**

```
hab bldr [SUBCOMMAND]
```

**FLAGS**

```
-h, --help    Prints help information
```




**SUBCOMMANDS**

| Command | Description |
| ------- | ----------- |
| [hab bldr channel](#hab-bldr-channel) | Commands relating to Habitat Builder channels |
| [hab bldr job](#hab-bldr-job) | Commands relating to Habitat Builder jobs |
---

### hab bldr channel

Commands relating to Habitat Builder channels

**USAGE**

```
hab bldr channel [SUBCOMMAND]
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```




**SUBCOMMANDS**

| Command | Description |
| ------- | ----------- |
| [hab bldr channel create](#hab-bldr-channel-create) | Creates a new channel |
| [hab bldr channel destroy](#hab-bldr-channel-destroy) | Destroys a channel |
| [hab bldr channel list](#hab-bldr-channel-list) | Lists origin channels |
---

### hab bldr channel create

Creates a new channel

**USAGE**

```
hab bldr channel create [OPTIONS] <CHANNEL>
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```

**OPTIONS**

```
-u, --url <BLDR_URL>     Specify an alternate Builder endpoint. If not specified, the value will be taken from the HAB_BLDR_URL environment variable if defined. (default: https://bldr.habitat.sh)
-o, --origin <ORIGIN>    Sets the origin to which the channel will belong. Default is from 'HAB_ORIGIN' or cli.toml
```

**ARGS**

```
<CHANNEL>    The channel name
```



---

### hab bldr channel destroy

Destroys a channel

**USAGE**

```
hab bldr channel destroy [OPTIONS] <CHANNEL>
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```

**OPTIONS**

```
-u, --url <BLDR_URL>     Specify an alternate Builder endpoint. If not specified, the value will be taken from the HAB_BLDR_URL environment variable if defined. (default: https://bldr.habitat.sh)
-o, --origin <ORIGIN>    Sets the origin to which the channel belongs. Default is from 'HAB_ORIGIN'or cli.toml
```

**ARGS**

```
<CHANNEL>    The channel name
```



---

### hab bldr channel list

Lists origin channels

**USAGE**

```
hab bldr channel list [OPTIONS] [ORIGIN]
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```

**OPTIONS**

```
-u, --url <BLDR_URL>    Specify an alternate Builder endpoint. If not specified, the value will be taken from the HAB_BLDR_URL environment variable if defined. (default: https://bldr.habitat.sh)
```

**ARGS**

```
<ORIGIN>    The origin for which channels will be listed. Default is from 'HAB_ORIGIN'or cli.toml
```



---

### hab bldr job

Commands relating to Habitat Builder jobs

**USAGE**

```
hab bldr job [SUBCOMMAND]
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```




**SUBCOMMANDS**

| Command | Description |
| ------- | ----------- |
| [hab bldr job cancel](#hab-bldr-job-cancel) | Cancel a build job group and any in-progress builds |
| [hab bldr job demote](#hab-bldr-job-demote) | Demote packages from a completed build job to a specified channel |
| [hab bldr job promote](#hab-bldr-job-promote) | Promote packages from a completed build job to a specified channel |
| [hab bldr job start](#hab-bldr-job-start) | Schedule a build job or group of jobs |
| [hab bldr job status](#hab-bldr-job-status) | Get the status of one or more job groups |
---

### hab bldr job cancel

Cancel a build job group and any in-progress builds

**USAGE**

```
hab bldr job cancel [FLAGS] [OPTIONS] <GROUP_ID>
```

**FLAGS**

```
-f, --force      Don't prompt for confirmation
-h, --help       Prints help information
-V, --version    Prints version information
```

**OPTIONS**

```
-z, --auth <AUTH_TOKEN>    Authentication token for Builder
-u, --url <BLDR_URL>       Specify an alternate Builder endpoint. If not specified, the value will be taken from the HAB_BLDR_URL environment variable if defined. (default: https://bldr.habitat.sh)
```

**ARGS**

```
<GROUP_ID>    The job group id that was returned from "hab bldr job start" (ex: 771100000000000000)
```



---

### hab bldr job demote

Demote packages from a completed build job to a specified channel

**USAGE**

```
hab bldr job demote [FLAGS] [OPTIONS] <GROUP_ID> <CHANNEL>
```

**FLAGS**

```
-i, --interactive    Allow editing the list of demotable packages
-h, --help           Prints help information
-V, --version        Prints version information
```

**OPTIONS**

```
-z, --auth <AUTH_TOKEN>    Authentication token for Builder
-u, --url <BLDR_URL>       Specify an alternate Builder endpoint. If not specified, the value will be taken from the HAB_BLDR_URL environment variable if defined. (default: https://bldr.habitat.sh)
-o, --origin <ORIGIN>      Limit the demotable packages to the specified origin
```

**ARGS**

```
<GROUP_ID>    The job id that was returned from "hab bldr start" (ex: 771100000000000000)
<CHANNEL>     The target channel name
```



---

### hab bldr job promote

Promote packages from a completed build job to a specified channel

**USAGE**

```
hab bldr job promote [FLAGS] [OPTIONS] <GROUP_ID> <CHANNEL>
```

**FLAGS**

```
-i, --interactive    Allow editing the list of promotable packages
-h, --help           Prints help information
-V, --version        Prints version information
```

**OPTIONS**

```
-z, --auth <AUTH_TOKEN>    Authentication token for Builder
-u, --url <BLDR_URL>       Specify an alternate Builder endpoint. If not specified, the value will be taken from the HAB_BLDR_URL environment variable if defined. (default: https://bldr.habitat.sh)
-o, --origin <ORIGIN>      Limit the promotable packages to the specified origin
```

**ARGS**

```
<GROUP_ID>    The job id that was returned from "hab bldr job start" (ex: 771100000000000000)
<CHANNEL>     The target channel name
```



---

### hab bldr job start

Schedule a build job or group of jobs

**USAGE**

```
hab bldr job start [FLAGS] [OPTIONS] <PKG_IDENT>
```

**FLAGS**

```
-g, --group      Schedule jobs for this package and all of its reverse dependencies
-h, --help       Prints help information
-V, --version    Prints version information
```

**OPTIONS**

```
-z, --auth <AUTH_TOKEN>    Authentication token for Builder
-u, --url <BLDR_URL>       Specify an alternate Builder endpoint. If not specified, the value will be taken from the HAB_BLDR_URL environment variable if defined. (default: https://bldr.habitat.sh)
```

**ARGS**

```
<PKG_IDENT>    The origin and name of the package to schedule a job for (eg: core/redis)
```



---

### hab bldr job status

Get the status of one or more job groups

**USAGE**

```
hab bldr job status [FLAGS] [OPTIONS] <GROUP_ID|--origin <ORIGIN>>
```

**FLAGS**

```
-s, --showjobs    Show the status of all build jobs for a retrieved job group
-h, --help        Prints help information
-V, --version     Prints version information
```

**OPTIONS**

```
-u, --url <BLDR_URL>     Specify an alternate Builder endpoint. If not specified, the value will be taken from the HAB_BLDR_URL environment variable if defined. (default: https://bldr.habitat.sh)
-l, --limit <LIMIT>      Limit how many job groups to retrieve, ordered by most recent (default: 10)
-o, --origin <ORIGIN>    Show the status of recent job groups created in this origin (default: 10 most recent)
```

**ARGS**

```
<GROUP_ID>    The group id that was returned from "hab bldr job start" (ex: 771100000000000000)
```



---

## hab cli

Commands relating to Habitat runtime config

**USAGE**

```
hab cli [SUBCOMMAND]
```

**FLAGS**

```
-h, --help    Prints help information
```




**SUBCOMMANDS**

| Command | Description |
| ------- | ----------- |
| [hab cli completers](#hab-cli-completers) | Creates command-line completers for your shell. |
| [hab cli setup](#hab-cli-setup) | Sets up the CLI with reasonable defaults. |
---

### hab cli completers

Creates command-line completers for your shell.

**USAGE**

```
hab cli completers --shell <SHELL>
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```

**OPTIONS**

```
-s, --shell <SHELL>    The name of the shell you want to generate the command-completion. Supported Shells: bash, fish, zsh, powershell [possible values: bash, fish, zsh, powershell]
```




---

### hab cli setup

Sets up the CLI with reasonable defaults.

**USAGE**

```
hab cli setup
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```





---

## hab config

Commands relating to a Service's runtime config

**USAGE**

```
hab config [SUBCOMMAND]
```

**FLAGS**

```
-h, --help    Prints help information
```




**SUBCOMMANDS**

| Command | Description |
| ------- | ----------- |
| [hab config apply](#hab-config-apply) | Sets a configuration to be shared by members of a Service Group |
| [hab config show](#hab-config-show) | Displays the default configuration options for a service |
---

### hab config apply

Sets a configuration to be shared by members of a Service Group

**USAGE**

```
hab config apply [OPTIONS] <SERVICE_GROUP> <VERSION_NUMBER> [FILE]
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```

**OPTIONS**

```
-r, --remote-sup <REMOTE_SUP>    Address to a remote Supervisor's Control Gateway [default: 127.0.0.1:9632]
-u, --user <USER>                Name of a user key to use for encryption
```

**ARGS**

```
<SERVICE_GROUP>     Target service group (ex: redis.default)
<VERSION_NUMBER>    A version number (positive integer) for this configuration (ex: 42)
<FILE>              Path to local file on disk (ex: /tmp/config.toml, default: <stdin>)
```



---

### hab config show

Displays the default configuration options for a service

**USAGE**

```
hab config show [OPTIONS] <PKG_IDENT>
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```

**OPTIONS**

```
-r, --remote-sup <REMOTE_SUP>    Address to a remote Supervisor's Control Gateway [default: 127.0.0.1:9632]
```

**ARGS**

```
<PKG_IDENT>    A package identifier (ex: core/redis, core/busybox-static/1.42.2)
```



---

## hab file

Commands relating to Habitat files

**USAGE**

```
hab file [SUBCOMMAND]
```

**FLAGS**

```
-h, --help    Prints help information
```




**SUBCOMMANDS**

| Command | Description |
| ------- | ----------- |
| [hab file upload](#hab-file-upload) | Uploads a file to be shared between members of a Service Group |
---

### hab file upload

Uploads a file to be shared between members of a Service Group

**USAGE**

```
hab file upload [OPTIONS] <SERVICE_GROUP> <VERSION_NUMBER> <FILE>
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```

**OPTIONS**

```
-r, --remote-sup <REMOTE_SUP>    Address to a remote Supervisor's Control Gateway [default: 127.0.0.1:9632]
-u, --user <USER>                Name of the user key
```

**ARGS**

```
<SERVICE_GROUP>     Target service group (ex: redis.default)
<VERSION_NUMBER>    A version number (positive integer) for this configuration (ex: 42)
<FILE>              Path to local file on disk
```



---

## hab origin

Commands relating to Habitat origin keys

**USAGE**

```
hab origin [SUBCOMMAND]
```

**FLAGS**

```
-h, --help    Prints help information
```




**SUBCOMMANDS**

| Command | Description |
| ------- | ----------- |
| [hab origin key](#hab-origin-key) | Commands relating to Habitat origin key maintenance |
| [hab origin secret](#hab-origin-secret) | Commands related to secret management |
---

### hab origin key

Commands relating to Habitat origin key maintenance

**USAGE**

```
hab origin key [SUBCOMMAND]
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```




**SUBCOMMANDS**

| Command | Description |
| ------- | ----------- |
| [hab origin key download](#hab-origin-key-download) | Download origin key(s) to HAB_CACHE_KEY_PATH |
| [hab origin key export](#hab-origin-key-export) | Outputs the latest origin key contents to stdout |
| [hab origin key generate](#hab-origin-key-generate) | Generates a Habitat origin key |
| [hab origin key import](#hab-origin-key-import) | Reads a stdin stream containing a public or secret origin key contents and writes the key to disk |
| [hab origin key upload](#hab-origin-key-upload) | Upload origin keys to Builder |
---

### hab origin key download

Download origin key(s) to HAB_CACHE_KEY_PATH

**USAGE**

```
hab origin key download [FLAGS] [OPTIONS] <ORIGIN> [REVISION]
```

**FLAGS**

```
-e, --encryption    Download public encryption key instead of public signing key
-s, --secret        Download secret signing key instead of public signing key
-h, --help          Prints help information
-V, --version       Prints version information
```

**OPTIONS**

```
-z, --auth <AUTH_TOKEN>    Authentication token for Builder (required for downloading secret keys)
-u, --url <BLDR_URL>       Specify an alternate Builder endpoint. If not specified, the value will be taken from the HAB_BLDR_URL environment variable if defined. (default: https://bldr.habitat.sh)
```

**ARGS**

```
<ORIGIN>      The origin name
<REVISION>    The key revision
```



---

### hab origin key export

Outputs the latest origin key contents to stdout

**USAGE**

```
hab origin key export [OPTIONS] <ORIGIN>
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```

**OPTIONS**

```
-t, --type <PAIR_TYPE>    Export either the 'public' or 'secret' key
```

**ARGS**

```
<ORIGIN>
```



---

### hab origin key generate

Generates a Habitat origin key

**USAGE**

```
hab origin key generate [ORIGIN]
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```


**ARGS**

```
<ORIGIN>    The origin name
```



---

### hab origin key import

Reads a stdin stream containing a public or secret origin key contents and writes the key to disk

**USAGE**

```
hab origin key import
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```





---

### hab origin key upload

Upload origin keys to Builder

**USAGE**

```
hab origin key upload [FLAGS] [OPTIONS] <ORIGIN|--pubfile <PUBLIC_FILE>>
```

**FLAGS**

```
-s, --secret     Upload secret key in addition to the public key
-h, --help       Prints help information
-V, --version    Prints version information
```

**OPTIONS**

```
-z, --auth <AUTH_TOKEN>        Authentication token for Builder
-u, --url <BLDR_URL>           Specify an alternate Builder endpoint. If not specified, the value will be taken from the HAB_BLDR_URL environment variable if defined. (default: https://bldr.habitat.sh)
    --pubfile <PUBLIC_FILE>    Path to a local public origin key file on disk
    --secfile <SECRET_FILE>    Path to a local secret origin key file on disk
```

**ARGS**

```
<ORIGIN>    The origin name
```



---

### hab origin secret

Commands related to secret management

**USAGE**

```
hab origin secret [SUBCOMMAND]
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```




**SUBCOMMANDS**

| Command | Description |
| ------- | ----------- |
| [hab origin secret delete](#hab-origin-secret-delete) | Delete a secret for your origin |
| [hab origin secret list](#hab-origin-secret-list) | List all secrets for your origin |
| [hab origin secret upload](#hab-origin-secret-upload) | Create and upload a secret for your origin. |
---

### hab origin secret delete

Delete a secret for your origin

**USAGE**

```
hab origin secret delete [OPTIONS] <KEY_NAME>
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```

**OPTIONS**

```
-z, --auth <AUTH_TOKEN>    Authentication token for Builder
-u, --url <BLDR_URL>       Specify an alternate Builder endpoint. If not specified, the value will be taken from the HAB_BLDR_URL environment variable if defined. (default: https://bldr.habitat.sh)
-o, --origin <ORIGIN>      The origin for which the secret will be deleted. Default is from 'HAB_ORIGIN' or cli.toml
```

**ARGS**

```
<KEY_NAME>    The name of the variable key to be injected into the studio.
```



---

### hab origin secret list

List all secrets for your origin

**USAGE**

```
hab origin secret list [OPTIONS]
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```

**OPTIONS**

```
-z, --auth <AUTH_TOKEN>    Authentication token for Builder
-u, --url <BLDR_URL>       Specify an alternate Builder endpoint. If not specified, the value will be taken from the HAB_BLDR_URL environment variable if defined. (default: https://bldr.habitat.sh)
-o, --origin <ORIGIN>      The origin for which secrets will be listed. Default is from 'HAB_ORIGIN' or cli.toml
```




---

### hab origin secret upload

Create and upload a secret for your origin.

**USAGE**

```
hab origin secret upload [OPTIONS] <KEY_NAME> <SECRET>
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```

**OPTIONS**

```
-z, --auth <AUTH_TOKEN>    Authentication token for Builder
-u, --url <BLDR_URL>       Specify an alternate Builder endpoint. If not specified, the value will be taken from the HAB_BLDR_URL environment variable if defined. (default: https://bldr.habitat.sh)
-o, --origin <ORIGIN>      The origin for which the secret will be uploaded. Default is from 'HAB_ORIGIN' or cli.toml
```

**ARGS**

```
<KEY_NAME>    The name of the variable key to be injected into the studio. Ex: KEY="some_value"
<SECRET>      The contents of the variable to be injected into the studio.
```



---

## hab pkg

Commands relating to Habitat packages

**USAGE**

```
hab pkg [SUBCOMMAND]
```

**FLAGS**

```
-h, --help    Prints help information
```




**SUBCOMMANDS**

| Command | Description |
| ------- | ----------- |
| [hab pkg binds](#hab-pkg-binds) | Displays the binds for a service |
| [hab pkg binlink](#hab-pkg-binlink) | Creates a binlink for a package binary in a common 'PATH' location |
| [hab pkg build](#hab-pkg-build) | Builds a Plan using a Studio |
| [hab pkg channels](#hab-pkg-channels) | Find out what channels a package belongs to |
| [hab pkg config](#hab-pkg-config) | Displays the default configuration options for a service |
| [hab pkg demote](#hab-pkg-demote) | Demote a package from a specified channel |
| [hab pkg env](#hab-pkg-env) | Prints the runtime environment of a specific installed package |
| [hab pkg exec](#hab-pkg-exec) | Executes a command using the 'PATH' context of an installed package |
| [hab pkg export](#hab-pkg-export) | Exports the package to the specified format |
| [hab pkg hash](#hab-pkg-hash) | Generates a blake2b hashsum from a target at any given filepath |
| [hab pkg info](#hab-pkg-info) | Returns the Habitat Artifact information |
| [hab pkg install](#hab-pkg-install) | Installs a Habitat package from Builder or locally from a Habitat Artifact |
| [hab pkg path](#hab-pkg-path) | Prints the path to a specific installed release of a package |
| [hab pkg promote](#hab-pkg-promote) | Promote a package to a specified channel |
| [hab pkg provides](#hab-pkg-provides) | Search installed Habitat packages for a given file |
| [hab pkg search](#hab-pkg-search) | Search for a package in Builder |
| [hab pkg sign](#hab-pkg-sign) | Signs an archive with an origin key, generating a Habitat Artifact |
| [hab pkg upload](#hab-pkg-upload) | Uploads a local Habitat Artifact to Builder |
| [hab pkg verify](#hab-pkg-verify) | Verifies a Habitat Artifact with an origin key |
---

### hab pkg binds

Displays the binds for a service

**USAGE**

```
hab pkg binds <PKG_IDENT>
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```


**ARGS**

```
<PKG_IDENT>    A package identifier (ex: core/redis, core/busybox-statis/1.42.2)
```



---

### hab pkg binlink

Creates a binlink for a package binary in a common 'PATH' location

**USAGE**

```
hab pkg binlink [FLAGS] [OPTIONS] <PKG_IDENT> [BINARY]
```

**FLAGS**

```
-f, --force      Overwrite existing binlinks
-h, --help       Prints help information
-V, --version    Prints version information
```

**OPTIONS**

```
-d, --dest <DEST_DIR>    Sets the destination directory (default: /bin)
```

**ARGS**

```
<PKG_IDENT>    A package identifier (ex: core/redis, core/busybox-static/1.42.2)
<BINARY>       The command to binlink (ex: bash)
```



---

### hab pkg build

Builds a Plan using a Studio

**USAGE**

```
hab pkg build [FLAGS] [OPTIONS] <PLAN_CONTEXT>
```

**FLAGS**

```
-D, --docker     Uses a Dockerized Studio for the build (default: Studio uses a chroot on linux)
-R, --reuse      Reuses a previous Studio for the build (default: clean up before building)
-h, --help       Prints help information
-V, --version    Prints version information
```

**OPTIONS**

```
-k, --keys <HAB_ORIGIN_KEYS>    Installs secret origin keys (ex: "unicorn", "acme,other,acme-ops")
-r, --root <HAB_STUDIO_ROOT>    Sets the Studio root (default: /hab/studios/<DIR_NAME>)
-s, --src <SRC_PATH>            Sets the source path (default: $PWD)
```

**ARGS**

```
<PLAN_CONTEXT>    A directory containing a plan.sh file or a habitat/ directory which contains the plan.sh file
```



---

### hab pkg channels

Find out what channels a package belongs to

**USAGE**

```
hab pkg channels [OPTIONS] <PKG_IDENT>
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```

**OPTIONS**

```
-z, --auth <AUTH_TOKEN>    Authentication token for Builder
-u, --url <BLDR_URL>       Specify an alternate Builder endpoint. If not specified, the value will be taken from the HAB_BLDR_URL environment variable if defined. (default: https://bldr.habitat.sh)
```

**ARGS**

```
<PKG_IDENT>    A fully qualified package identifier (ex: core/busybox-static/1.42.2/20170513215502)
```



---

### hab pkg config

Displays the default configuration options for a service

**USAGE**

```
hab pkg config <PKG_IDENT>
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```


**ARGS**

```
<PKG_IDENT>    A package identifier (ex: core/redis, core/busybox-static/1.42.2)
```



---

### hab pkg demote

Demote a package from a specified channel

**USAGE**

```
hab pkg demote [OPTIONS] <PKG_IDENT> <CHANNEL>
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```

**OPTIONS**

```
-z, --auth <AUTH_TOKEN>    Authentication token for Builder
-u, --url <BLDR_URL>       Specify an alternate Builder endpoint. If not specified, the value will be taken from the HAB_BLDR_URL environment variable if defined. (default: https://bldr.habitat.sh)
```

**ARGS**

```
<PKG_IDENT>    A fully qualified package identifier (ex: core/busybox-static/1.42.2/20170513215502)
<CHANNEL>      Demote from the specified release channel
```



---

### hab pkg env

Prints the runtime environment of a specific installed package

**USAGE**

```
hab pkg env <PKG_IDENT>
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```


**ARGS**

```
<PKG_IDENT>    A package identifier (ex: core/redis, core/busybox-static/1.42.2)
```



---

### hab pkg exec

Executes a command using the 'PATH' context of an installed package

**USAGE**

```
hab pkg exec <PKG_IDENT> <CMD> [ARGS]...
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```


**ARGS**

```
<PKG_IDENT>    A package identifier (ex: core/redis, core/busybox-static/1.42.2)
<CMD>          The command to execute (ex: ls)
<ARGS>...      Arguments to the command (ex: -l /tmp)
```



---

### hab pkg export

Exports the package to the specified format

**USAGE**

```
hab pkg export [OPTIONS] <FORMAT> <PKG_IDENT>
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```

**OPTIONS**

```
-u, --url <BLDR_URL>       Specify an alternate Builder endpoint. If not specified, the value will be taken from the HAB_BLDR_URL environment variable if defined. (default: https://bldr.habitat.sh)
-c, --channel <CHANNEL>    Retrieve the container's package from the specified release channel (default: stable)
```

**ARGS**

```
<FORMAT>       The export format (ex: aci, cf, docker, kubernetes, mesos, or tar)
<PKG_IDENT>    A package identifier (ex: core/redis, core/busybox-static/1.42.2) or filepath to a Habitat Artifact (ex: /home/acme-redis-3.0.7-21120102031201-x86_64-linux.hart)
```



---

### hab pkg hash

Generates a blake2b hashsum from a target at any given filepath

**USAGE**

```
hab pkg hash [SOURCE]
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```


**ARGS**

```
<SOURCE>    A filepath of the target
```



---

### hab pkg info

Returns the Habitat Artifact information

**USAGE**

```
hab pkg info [FLAGS] <SOURCE>
```

**FLAGS**

```
-j, --json       Output will be rendered in json
-h, --help       Prints help information
-V, --version    Prints version information
```


**ARGS**

```
<SOURCE>    A path to a Habitat Artifact (ex: /home/acme-redis-3.0.7-21120102031201-x86_64-linux.hart)
```



---

### hab pkg install

Installs a Habitat package from Builder or locally from a Habitat Artifact

**USAGE**

```
hab pkg install [FLAGS] [OPTIONS] <PKG_IDENT_OR_ARTIFACT>...
```

**FLAGS**

```
-b, --binlink    Binlink all binaries from installed package(s)
-f, --force      Overwrite existing binlinks
-h, --help       Prints help information
-V, --version    Prints version information
```

**OPTIONS**

```
-z, --auth <AUTH_TOKEN>    Authentication token for Builder
-u, --url <BLDR_URL>       Specify an alternate Builder endpoint. If not specified, the value will be taken from the HAB_BLDR_URL environment variable if defined. (default: https://bldr.habitat.sh)
-c, --channel <CHANNEL>    Install from the specified release channel (default: stable)
```

**ARGS**

```
<PKG_IDENT_OR_ARTIFACT>...    One or more Habitat package identifiers (ex: acme/redis) and/or filepaths to a Habitat Artifact (ex: /home/acme-redis-3.0.7-21120102031201-x86_64-linux.hart)
```



---

### hab pkg path

Prints the path to a specific installed release of a package

**USAGE**

```
hab pkg path <PKG_IDENT>
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```


**ARGS**

```
<PKG_IDENT>    A package identifier (ex: core/redis, core/busybox-static/1.42.2)
```



---

### hab pkg promote

Promote a package to a specified channel

**USAGE**

```
hab pkg promote [OPTIONS] <PKG_IDENT> <CHANNEL>
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```

**OPTIONS**

```
-z, --auth <AUTH_TOKEN>    Authentication token for Builder
-u, --url <BLDR_URL>       Specify an alternate Builder endpoint. If not specified, the value will be taken from the HAB_BLDR_URL environment variable if defined. (default: https://bldr.habitat.sh)
```

**ARGS**

```
<PKG_IDENT>    A fully qualifed package identifier (ex: core/busybox-static/1.42.2/20170513215502)
<CHANNEL>      Promote to the specified release channel
```



---

### hab pkg provides

Search installed Habitat packages for a given file

**USAGE**

```
hab pkg provides [FLAGS] <FILE>
```

**FLAGS**

```
-p               Show full path to file
-r               Show fully qualified package names (ex: core/busybox-static/1.24.2/20160708162350)
-h, --help       Prints help information
-V, --version    Prints version information
```


**ARGS**

```
<FILE>    File name to find
```



---

### hab pkg search

Search for a package in Builder

**USAGE**

```
hab pkg search [OPTIONS] <SEARCH_TERM>
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```

**OPTIONS**

```
-z, --auth <AUTH_TOKEN>    Authentication token for Builder
-u, --url <BLDR_URL>       Specify an alternate Builder endpoint. If not specified, the value will be taken from the HAB_BLDR_URL environment variable if defined. (default: https://bldr.habitat.sh)
```

**ARGS**

```
<SEARCH_TERM>    Search term
```



---

### hab pkg sign

Signs an archive with an origin key, generating a Habitat Artifact

**USAGE**

```
hab pkg sign [OPTIONS] <SOURCE> <DEST>
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```

**OPTIONS**

```
--origin <ORIGIN>    Origin key used to create signature
```

**ARGS**

```
<SOURCE>    A path to a source archive file (ex: /home/acme-redis-3.0.7-21120102031201.tar.xz)
<DEST>      The destination path to the signed Habitat Artifact (ex: /home/acme-redis-3.0.7-21120102031201 x86_64-linux.hart)
```



---

### hab pkg upload

Uploads a local Habitat Artifact to Builder

**USAGE**

```
hab pkg upload [OPTIONS] <HART_FILE>...
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```

**OPTIONS**

```
-z, --auth <AUTH_TOKEN>    Authentication token for Builder
-u, --url <BLDR_URL>       Specify an alternate Builder endpoint. If not specified, the value will be taken from the HAB_BLDR_URL environment variable if defined. (default: https://bldr.habitat.sh)
-c, --channel <CHANNEL>    Additional release channel to upload package to. Packages are always uploaded to unstable, regardless of the value of this option. (default: none)
```

**ARGS**

```
<HART_FILE>...    One or more filepaths to a Habitat Artifact (ex: /home/acme-redis-3.0.7-21120102031201-x86_64 linux.hart)
```



---

### hab pkg verify

Verifies a Habitat Artifact with an origin key

**USAGE**

```
hab pkg verify <SOURCE>
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```


**ARGS**

```
<SOURCE>    A path to a Habitat Artifact (ex: /home/acme-redis-3.0.7-21120102031201-x86_64-linux.hart)
```



---

## hab plan

Commands relating to plans and other app-specific configuration.

**USAGE**

```
hab plan [SUBCOMMAND]
```

**FLAGS**

```
-h, --help    Prints help information
```




**SUBCOMMANDS**

| Command | Description |
| ------- | ----------- |
| [hab plan init](#hab-plan-init) | Generates common package specific configuration files. Executing without argument will create a habitat directory in your current folder for the plan. If PKG_NAME is specified it will create a folder with that name. Environment variables (those starting with 'pkg_') that are set will be used in the generated plan |
---

### hab plan init

Generates common package specific configuration files. Executing without argument will create a habitat directory in

**USAGE**

```
hab plan init [FLAGS] [OPTIONS] [PKG_NAME]
```

**FLAGS**

```
--windows           Use a Windows Powershell plan template
    --with-all          Generate omnibus plan with all available plan options
    --with-callbacks    Include callback functions in template
    --with-docs         Include plan options documentation
-h, --help              Prints help information
-V, --version           Prints version information
```

**OPTIONS**

```
-o, --origin <ORIGIN>              Origin for the new app
-s, --scaffolding <SCAFFOLDING>    Specify explicit Scaffolding for your app (ex: node, ruby)
```

**ARGS**

```
<PKG_NAME>    Name for the new app
```



---

## hab ring

Commands relating to Habitat rings

**USAGE**

```
hab ring [SUBCOMMAND]
```

**FLAGS**

```
-h, --help    Prints help information
```




**SUBCOMMANDS**

| Command | Description |
| ------- | ----------- |
| [hab ring key](#hab-ring-key) | Commands relating to Habitat ring keys |
---

### hab ring key

Commands relating to Habitat ring keys

**USAGE**

```
hab ring key [SUBCOMMAND]
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```




**SUBCOMMANDS**

| Command | Description |
| ------- | ----------- |
| [hab ring key export](#hab-ring-key-export) | Outputs the latest ring key contents to stdout |
| [hab ring key generate](#hab-ring-key-generate) | Generates a Habitat ring key |
| [hab ring key import](#hab-ring-key-import) | Reads a stdin stream containing ring key contents and writes the key to disk |
---

### hab ring key export

Outputs the latest ring key contents to stdout

**USAGE**

```
hab ring key export <RING>
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```


**ARGS**

```
<RING>    Ring key name
```



---

### hab ring key generate

Generates a Habitat ring key

**USAGE**

```
hab ring key generate <RING>
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```


**ARGS**

```
<RING>    Ring key name
```



---

### hab ring key import

Reads a stdin stream containing ring key contents and writes the key to disk

**USAGE**

```
hab ring key import
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```





---

## hab studio



**USAGE**

```
hab studio [FLAGS] [OPTIONS] <SUBCOMMAND> [ARG ..]
```





**SUBCOMMANDS**

| Command | Description |
| ------- | ----------- |
| [hab studio build](#hab-studio-build) | Build using a Studio |
| [hab studio enter](#hab-studio-enter) | Interactively enter a Studio |
| [hab studio new](#hab-studio-new) | Creates a new Studio |
| [hab studio rm](#hab-studio-rm) | Destroys a Studio |
| [hab studio run](#hab-studio-run) | Run a command in a Studio |
| [hab studio version](#hab-studio-version) | Prints version information |
---

### hab studio build



**USAGE**

```
hab studio [COMMON_FLAGS] [COMMON_OPTIONS] build [FLAGS] [PLAN_DIR]
```

**FLAGS**

```
-R  Reuse a previous Studio state (default: clean up before building)
```





---

### hab studio enter



**USAGE**

```
hab studio [COMMON_FLAGS] [COMMON_OPTIONS] enter
```






---

### hab studio new



**USAGE**

```
hab studio [COMMON_FLAGS] [COMMON_OPTIONS] new
```






---

### hab studio rm



**USAGE**

```
hab studio [COMMON_FLAGS] [COMMON_OPTIONS] rm
```






---

### hab studio run



**USAGE**

```
hab studio [COMMON_FLAGS] [COMMON_OPTIONS] run [CMD] [ARG ..]
```






---

### hab studio version









---

## hab sup



**USAGE**

```
hab sup <SUBCOMMAND>
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```




**SUBCOMMANDS**

| Command | Description |
| ------- | ----------- |
| [hab sup bash](#hab-sup-bash) | Start an interactive Bash-like shell |
| [hab sup run](#hab-sup-run) | Run the Habitat Supervisor |
| [hab sup sh](#hab-sup-sh) | Start an interactive Bourne-like shell |
| [hab sup term](#hab-sup-term) | Gracefully terminate the Habitat Supervisor and all of its running services |
---

### hab sup bash

Start an interactive Bash-like shell

**USAGE**

```
hab sup bash
```

**FLAGS**

```
-h, --help    Prints help information
```





---

### hab sup run

Run the Habitat Supervisor

**USAGE**

```
hab sup run [FLAGS] [OPTIONS] [--] [PKG_IDENT_OR_ARTIFACT]
```

**FLAGS**

```
-A, --auto-update       Enable automatic updates for the Supervisor itself
    --json-logging      Use structured JSON logging for the Supervisor. Implies NO_COLOR
    --no-color          Turn ANSI color off
-I, --permanent-peer    If this Supervisor is a permanent peer
-v                      Verbose output; shows file and line/column numbers
-h, --help              Prints help information
```

**OPTIONS**

```
-a, --application <APPLICATION>            Application name; [default: not set].
    --bind <BIND>...                       One or more service groups to bind to a configuration
    --binding-mode <BINDING_MODE>          Governs how the presence or absence of binds affects service startup. strict blocks startup until all binds are present. [default: strict] values: relaxed, strict]
-u, --url <BLDR_URL>                       Specify an alternate Builder endpoint. If not specified, the value will be taken from the HAB_BLDR_URL environment variable if defined. (default: https://bldr.habitat.sh)
    --channel <CHANNEL>                    Receive Supervisor updates from the specified release channel [default: stable]
    --config-from <CONFIG_DIR>             Use package config from this path, rather than the package itself
-e, --environment <ENVIRONMENT>            Environment name; [default: not set].
-n, --events <EVENTS>                      Name of the service group running a Habitat EventSrv to forward Supervisor and service event data to
    --group <GROUP>                        The service group; shared config and topology [default: default].
    --listen-ctl <LISTEN_CTL>              The listen address for the Control Gateway [default: 127.0.0.1:9632]
    --listen-gossip <LISTEN_GOSSIP>        The listen address for the gossip system [default: 0.0.0.0:9638]
    --listen-http <LISTEN_HTTP>            The listen address for the HTTP Gateway [default: 0.0.0.0:9631]
    --override-name <NAME>                 The name of the Supervisor if launching more than one [default: default]
    --org <ORGANIZATION>                   The organization that the Supervisor and its subsequent services are part of [default: default]
    --peer <PEER>...                       The listen address of one or more initial peers (IP[:PORT])
    --peer-watch-file <PEER_WATCH_FILE>    Watch this file for connecting to the ring
-r, --ring <RING>                          Ring key name
-s, --strategy <STRATEGY>                  The update strategy; [default: none] [values: none, at-once, rolling]
-t, --topology <TOPOLOGY>                  Service topology; [default: none]
```

**ARGS**

```
<PKG_IDENT_OR_ARTIFACT>    Load the given Habitat package as part of the Supervisor startup specified by a package identifier (ex: core/redis) or filepath to a Habitat Artifact (ex: home/core-redis-3.0.7-21120102031201-x86_64-linux.hart).
```



---

### hab sup sh

Start an interactive Bourne-like shell

**USAGE**

```
hab sup sh
```

**FLAGS**

```
-h, --help    Prints help information
```





---

### hab sup term

Gracefully terminate the Habitat Supervisor and all of its running services

**USAGE**

```
hab sup term [OPTIONS]
```

**FLAGS**

```
-h, --help    Prints help information
```

**OPTIONS**

```
--override-name <NAME>    The name of the Supervisor if more than one is running [default: default]
```




---

## hab supportbundle

Create a tarball of Habitat Supervisor data to send to support

**USAGE**

```
hab supportbundle
```

**FLAGS**

```
-h, --help    Prints help information
```





---

## hab svc

Commands relating to Habitat services

**USAGE**

```
hab svc [SUBCOMMAND]
```

**FLAGS**

```
-h, --help    Prints help information
```




**SUBCOMMANDS**

| Command | Description |
| ------- | ----------- |
| [hab svc key](#hab-svc-key) | Commands relating to Habitat service keys |
| [hab svc load](#hab-svc-load) | Load a service to be started and supervised by Habitat from a package identifier. If an installed package doesn't satisfy the given package identifier, a suitable package will be installed from Builder. |
| [hab svc start](#hab-svc-start) | Start a loaded, but stopped, Habitat service. |
| [hab svc status](#hab-svc-status) | Query the status of Habitat services. |
| [hab svc stop](#hab-svc-stop) | Stop a running Habitat service. |
| [hab svc unload](#hab-svc-unload) | Unload a service loaded by the Habitat Supervisor. If the service is running it will additionally be stopped. |
---

### hab svc key

Commands relating to Habitat service keys

**USAGE**

```
hab svc key [SUBCOMMAND]
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```




**SUBCOMMANDS**

| Command | Description |
| ------- | ----------- |
| [hab svc key generate](#hab-svc-key-generate) | Generates a Habitat service key |
---

### hab svc key generate

Generates a Habitat service key

**USAGE**

```
hab svc key generate <SERVICE_GROUP> [ORG]
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```


**ARGS**

```
<SERVICE_GROUP>    Target service group (ex: redis.default)
<ORG>              The service organization
```



---

### hab svc load

Load a service to be started and supervised by Habitat from a package identifier. If an installed package doesn't

**USAGE**

```
hab svc load [FLAGS] [OPTIONS] <PKG_IDENT>
```

**FLAGS**

```
-f, --force      Load or reload an already loaded service. If the service was previously loaded and running this operation will also restart the service
-h, --help       Prints help information
-V, --version    Prints version information
```

**OPTIONS**

```
-a, --application <APPLICATION>      Application name; [default: not set].
    --bind <BIND>...                 One or more service groups to bind to a configuration
    --binding-mode <BINDING_MODE>    Governs how the presence or absence of binds affects service startup. strict blocks startup until all binds are present. [default: strict] [values: relaxed, strict]
-u, --url <BLDR_URL>                 Specify an alternate Builder endpoint. If not specified, the value will be taken from the HAB_BLDR_URL environment variable if defined. (default: https://bldr.habitat.sh)
    --channel <CHANNEL>              Receive package updates from the specified release channel [default: stable]
-e, --environment <ENVIRONMENT>      Environment name; [default: not set].
    --group <GROUP>                  The service group; shared config and topology [default: default].
-r, --remote-sup <REMOTE_SUP>        Address to a remote Supervisor's Control Gateway [default: 127.0.0.1:9632]
-s, --strategy <STRATEGY>            The update strategy; [default: none] [values: none, at-once, rolling]
-t, --topology <TOPOLOGY>            Service topology; [default: none]
```

**ARGS**

```
<PKG_IDENT>    A Habitat package identifier (ex: core/redis)
```



---

### hab svc start

Start a loaded, but stopped, Habitat service.

**USAGE**

```
hab svc start [OPTIONS] <PKG_IDENT>
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```

**OPTIONS**

```
-r, --remote-sup <REMOTE_SUP>    Address to a remote Supervisor's Control Gateway [default: 127.0.0.1:9632]
```

**ARGS**

```
<PKG_IDENT>    A Habitat package identifier (ex: core/redis)
```



---

### hab svc status

Query the status of Habitat services.

**USAGE**

```
hab svc status [OPTIONS] [PKG_IDENT]
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```

**OPTIONS**

```
-r, --remote-sup <REMOTE_SUP>    Address to a remote Supervisor's Control Gateway [default: 127.0.0.1:9632]
```

**ARGS**

```
<PKG_IDENT>    A Habitat package identifier (ex: core/redis)
```



---

### hab svc stop

Stop a running Habitat service.

**USAGE**

```
hab svc stop [OPTIONS] <PKG_IDENT>
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```

**OPTIONS**

```
-r, --remote-sup <REMOTE_SUP>    Address to a remote Supervisor's Control Gateway [default: 127.0.0.1:9632]
```

**ARGS**

```
<PKG_IDENT>    A Habitat package identifier (ex: core/redis)
```



---

### hab svc unload

Unload a service loaded by the Habitat Supervisor. If the service is running it will additionally be stopped.

**USAGE**

```
hab svc unload [OPTIONS] <PKG_IDENT>
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```

**OPTIONS**

```
-r, --remote-sup <REMOTE_SUP>    Address to a remote Supervisor's Control Gateway [default: 127.0.0.1:9632]
```

**ARGS**

```
<PKG_IDENT>    A Habitat package identifier (ex: core/redis)
```



---

## hab user

Commands relating to Habitat users

**USAGE**

```
hab user [SUBCOMMAND]
```

**FLAGS**

```
-h, --help    Prints help information
```




**SUBCOMMANDS**

| Command | Description |
| ------- | ----------- |
| [hab user key](#hab-user-key) | Commands relating to Habitat user keys |
---

### hab user key

Commands relating to Habitat user keys

**USAGE**

```
hab user key [SUBCOMMAND]
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```




**SUBCOMMANDS**

| Command | Description |
| ------- | ----------- |
| [hab user key generate](#hab-user-key-generate) | Generates a Habitat user key |
---

### hab user key generate

Generates a Habitat user key

**USAGE**

```
hab user key generate <USER>
```

**FLAGS**

```
-h, --help       Prints help information
-V, --version    Prints version information
```


**ARGS**

```
<USER>    Name of the user key
```



---

