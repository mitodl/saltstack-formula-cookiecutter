#!/bin/bash

git init
git add -A .
git config user.name "{{ cookiecutter.full_name }}"
git config user.email "{{ cookiecutter.email_address }}"
git commit -m 'Initial commit after generating formula from https://github.com/mitodl/saltstack-formula-cookiectuter'
