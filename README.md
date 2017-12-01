# Cerebro Puppet Module [![Puppet Forge](https://img.shields.io/puppetforge/v/yano3/cerebro.svg?style=flat-square)](https://forge.puppet.com/yano3/cerebro)

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with cerebro](#setup)
    * [Beginning with cerebro](#beginning-with-cerebro)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

Puppet module for managing and configuring [Cerebro](https://github.com/lmenezes/cerebro).

## Setup

### Beginning with cerebro

```
class { 'cerebro': }
```

## Usage

```
class { 'cerebro':
  version => '0.7.2',
}
```

## Reference

### Parameters

#### Class: `cerebro`

- `version`: Specify Cerebro version.
- `service_ensure`: Determines whether the cerebro service should be running.
- `service_enable`: Determines whether the cerebro service should be enabled when the system is booted.
- `secret`: Specify secret string.
- `hosts`: Specify a list of known hosts.
- `basepath`: Specify application base path.
- `shell`: Specify a shell for cerebro user.
- `manage_user`: Specify whether creating user that cerebro process is executed as.
- `cerebro_user`: Specify the user that cerebro process is executed as.
- `package_url`: Specify a package location.
- `java_opts`: Specify `JAVA_OPTS` variables.
- `java_home`: Specify `JAVA_HOME` path.
- `basic_auth_settings`: Specify basic authentication settings.

## Limitations

This module has been tested on:

- CentOS 7

## Development

Bug reports and pull requests are welcome on GitHub at https://github.com/yano3/puppet-cerebro.
