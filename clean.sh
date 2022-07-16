#!/bin/bash
set -euo pipefail

fn_git_clean() {
  git clean -xdf
  git checkout .
}

ROOT="$PWD"

for i in lib/*
do cd "$ROOT/$i" && fn_git_clean
done
