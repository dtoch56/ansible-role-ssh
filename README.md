ssh-role
=========

[![CI](https://github.com/dtoch56/ansible-role-ssh/workflows/CI/badge.svg?event=push)](https://github.com/dtoch56/ansible-role-ssh/actions?query=workflow%3ACI)
[![Release](https://github.com/dtoch56/ansible-role-ssh/workflows/Release/badge.svg?event=push)](https://github.com/dtoch56/ansible-role-ssh/actions?query=workflow%3ARelease)
[![Role](https://img.shields.io/ansible/role/53355)](https://galaxy.ansible.com/dtoch56/ssh)
[![Downloads](https://img.shields.io/badge/dynamic/json?color=blueviolet&label=Galaxy%20Downloads&query=%24.download_count&url=https%3A%2F%2Fgalaxy.ansible.com%2Fapi%2Fv1%2Froles%2F53355%2F%3Fformat%3Djson)](https://galaxy.ansible.com/dtoch56/ssh)


SSH Server and client configuration

Based on Mozilla InfoSec recommendations: https://infosec.mozilla.org/guidelines/openssh.html

Requirements
------------

None.

Role Variables
--------------

Available variables are listed below, along with default values (see defaults/main.yml):

| Variable                          | Description                                           | Default                              |
|-----------------------------------|:------------------------------------------------------|:-------------------------------------|
| ssh_port                          | Ssh-server listening port                             | 22                                   |
| ssh_ansible_user                  | Account for Ansible                                   | ansible                              |
| ssh_users                         | List of accounts to accept incoming SSH connections   | {}                                   |
| ssh_allow_tcp_forwarding          | Allow tunneling out via SSH                           | False                                |
| ssh_host_key_algorithms           |                                                       | [Ref](#ssh_host_key_algorithms)      |
| ssh_kex_algorithms                |                                                       | [Ref](#ssh_kex_algorithms)           |
| ssh_ciphers                       |                                                       | [Ref](#ssh_kex_algorithms)           |
| ssh_macs                          |                                                       | [Ref](#ssh_kex_algorithms)           |
| sshd_host_key_algorithms          | Host keys the client should accepts                   | [Ref](#ssh_kex_algorithms)           |
| sshd_kex_algorithms               | Specifies the available KEX (Key Exchange) algorithms | [Ref](#ssh_kex_algorithms)           |
| sshd_ciphers                      | Specifies the ciphers allowed                         | [Ref](#ssh_kex_algorithms)           |
| sshd_macs                         | Specifies the available MAC algorithms                | [Ref](#ssh_kex_algorithms)           |
| sshd_ca_signature_algorithms      | Allow this incoming sessions only                     | [Ref](#sshd_ca_signature_algorithms) |
| sshd_hostbased_accepted_key_types |                                                       | [Ref](#ssh_kex_algorithms)           |
| sshd_pubkey_accepted_key_types    |                                                       | [Ref](#ssh_kex_algorithms)           |



### <a name="ssh_host_key_algorithms"></a>HostKeyAlgorithms

Defaults:
  - ssh-ed25519-cert-v01@openssh.com
  - ssh-rsa-cert-v01@openssh.com
  - ssh-ed25519,ssh-rsa
  - ecdsa-sha2-nistp521-cert-v01@openssh.com
  - ecdsa-sha2-nistp384-cert-v01@openssh.com
  - ecdsa-sha2-nistp256-cert-v01@openssh.com
  - ecdsa-sha2-nistp521
  - ecdsa-sha2-nistp384
  - ecdsa-sha2-nistp256

### <a name="ssh_kex_algorithms"></a>KexAlgorithms

Defaults:
  - curve25519-sha256@libssh.org
  - ecdh-sha2-nistp521
  - ecdh-sha2-nistp384
  - ecdh-sha2-nistp256
  - diffie-hellman-group-exchange-sha256

### <a name="ssh_ciphers"></a>Ciphers

Defaults:
  - chacha20-poly1305@openssh.com
  - aes256-gcm@openssh.com
  - aes128-gcm@openssh.com
  - aes256-ctr
  - aes192-ctr
  - aes128-ctr

### <a name="ssh_macs"></a>MACs

Defaults:
  - hmac-sha2-512-etm@openssh.com
  - hmac-sha2-256-etm@openssh.com
  - umac-128-etm@openssh.com
  - hmac-sha2-512
  - hmac-sha2-256
  - umac-128@openssh.com

### <a name="sshd_host_key_algorithms"></a>HostKeyAlgorithms

Defaults:
  - ssh-ed25519-cert-v01@openssh.com
  - ssh-ed25519

### <a name="sshd_kex_algorithms"></a>KexAlgorithms

Defaults:
  - curve25519-sha256@libssh.org

### <a name="sshd_ciphers"></a>Ciphers

Defaults:
  - chacha20-poly1305@openssh.com
  - aes256-gcm@openssh.com
  - aes256-gcm@openssh.com

### <a name="sshd_macs"></a> MACs

Defaults:
  - hmac-sha2-512
  - hmac-sha2-512-etm@openssh.com

### <a name="sshd_ca_signature_algorithms"></a>CASignatureAlgorithms

Defaults:
  - ssh-ed25519

### <a name="sshd_hostbased_accepted_key_types"></a>HostbasedAcceptedKeyTypes

Defaults:
  - ssh-ed25519

### <a name="sshd_pubkey_accepted_key_types"></a>PubkeyAcceptedKeyTypes

Defaults:
  - ssh-ed25519

Dependencies
------------

None.

Example Playbook
----------------

    - hosts: servers
      roles:
        - { role: dtoch56.ssh }

License
-------

MIT / BSD

Author Information
------------------

This role was created in 2021 by Max Mudrichenko.

Development
------------------

    pip install pipenv
    pipenv install
