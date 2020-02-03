#!/usr/bin/env bash

# Define flyway sources
FLYWAY_URL="https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/6.2.1/flyway-commandline-6.2.1-linux-x64.tar.gz"
FLYWAY_DIRECTORY="flyway-6.2.1"

# Ensure temp directory exists and it is empty
mkdir -p `pwd`/.temp/
cd `pwd`/.temp/
rm -rf `ls -Ab`

# Download and extract flyway
wget -qO- ${FLYWAY_URL} | tar xvz

# Prepare output directory
mkdir `pwd`/.output/

# Copy files needed from Flyway directory to output directory
cp -R `pwd`/${FLYWAY_DIRECTORY}/{drivers,jre,lib} `pwd`/.output/      # Flyway system folders
cp `pwd`/${FLYWAY_DIRECTORY}/{flyway,flyway.cmd} `pwd`/.output/       # Flyway client

# Remove previous installation before copying new one
cd `pwd`/..
if [[ -d drivers ]]; then rm -Rf drivers; fi
if [[ -d jre ]]; then rm -Rf jre; fi
if [[ -d lib ]]; then rm -Rf lib; fi
if [[ -f flyway ]]; then rm flyway; fi
if [[ -f flyway.cmd ]]; then rm flyway.cmd; fi

# Copy new files into main directory
cp -R `pwd`/.temp/.output/* `pwd`

# Clean temp directory
rm -rf `pwd`/.temp/
