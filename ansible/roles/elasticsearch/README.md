# Elasticsearch

This will install Elasticsearch.

## Requirements

None

## Role Variables

### Role defaults

The base version to install, and then it will install the latest patch
version available

    es_install_base_version: 1.5

A list of Elasticsearch plugins to install. The dirname is used to
check if the plugin is already installed. This is typically overridden
in your application plays

    es_plugins:
      - name: elasticsearch/elasticsearch-cloud-aws/2.1.1
        dirname: elasticsearch-cloud-aws
      - name: lmenezes/elasticsearch-kopf
        dirname: kopf

### Role vars

The official APT repository information.
Elasticsearch key ID

    es_key_id: "D88E42B4"

Elasticsearch apt repository

    es_repository: "http://packages.elasticsearch.org/elasticsearch"

Java version to use for elasticsearch. This is overriding the Java
dependency role

    java_versions: 7-jre-headless

## Dependencies

* [Open JDK Java](https://gitlab.fronter.net/ansible-roles/openjdk-java.git)

## Example Playbook

    - hosts: servers
      roles:
         - role: elasticsearch
