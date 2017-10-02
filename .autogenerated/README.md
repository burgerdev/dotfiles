# Automatically Generated Files

This directory contains files generated by a `pre-commit` hook like the one
below. This is my current approach to enable `curl|bash` with semi-automatic
file discovery.

```bash
#!/bin/sh

set -e

autodir=".autogenerated"

mkdir -p "${autodir}"

# rc files

rcfiles="${autodir}/toplevelrcfiles"

find . -name "*rc" -maxdepth 1 -exec basename "{}" ";" > "${rcfiles}"
git add "${rcfiles}"

# fish config

fishfun="${autodir}/fish.functions"

find config/fish -type f > "${fishfun}"
git add "${fishfun}"
```