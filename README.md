# ansible-ssh-role
SSH Server and client configuration

Based on Mozilla InfoSec recommendations: https://infosec.mozilla.org/guidelines/openssh.html

## Variables

| Variable         | Description                                                          | Default  |
| ---------------- |:--------------------------------------------------------------------:| --------:|
| ssh_port         | Ssh-server listening port                                            | 22       |
| ssh_ansible_user | Account for Ansible                                                  | ansible  |
| ssh_users        | List of accounts to accept incoming SSH connections                  | {}       |
