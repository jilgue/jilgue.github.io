#!/usr/bin/env bash

set -e

gitbook build
rsync -va --delete --exclude=.git _book/ ../jilgue.github.io/