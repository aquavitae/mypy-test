#!/bin/bash

echo -e "\n\033[34mVersions\033[0m"
python --version
mypy --version

echo -e "\n\033[34mpython -m project.cli\033[0m"
python -m project.cli

echo -e "\n\033[34mMypy from root (both should pass)\033[0m"
set -v
mypy -m project.cli
mypy project/cli.py
set +v

echo -e "\n\033[34mMypy from inside project (both fail)\033[0m"
cd project
set -v
mypy -m cli
mypy cli.py
set +v
cd ..

