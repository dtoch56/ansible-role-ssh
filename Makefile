.PHONY: help venv run update lint

help:
	@echo ''
	@echo 'Usage: make [TARGET]'
	@echo 'Targets:'
	@echo '  venv    Create virtual environment for application'
	@echo '  run     Run main playbook'
	@echo '  update  Update python dependencies'
	@echo '  lint    Run yamllint'
	@echo '  id      Get Ansible Galaxy role ID'
	@echo ''


venv:
	python3 -m venv venv
	source venv/bin/activate

run:
	ansible-playbook main.yml --ask-become-pass

update:
	python -m ensurepip --upgrade
	pip3 install pipenv
	pipenv update

lint:
	yamllint .
	ansible-lint

id:
	ansible-galaxy info dtoch56.ssh | grep -E 'id: [0-9]' | awk {'print $2'} | xargs