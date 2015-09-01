# OpenJDK Java

This will install OpenJDK Java.

## Requirements

None

## Role Variables

### Role defaults

The list of Java versions to install. This is overridden by the
application that needs it if necessary

    java_versions:
      - "openjdk-7-jre-headless"
      - "openjdk-6-jre"

## Dependencies

None

## Example Playbook

    - hosts: servers
      roles:
         - role: openjdk-java
