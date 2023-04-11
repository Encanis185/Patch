#!/bin/bash
set -e # exit on error
if ! git diff-files --quiet
then
    echo "Git repo not clean. Unstaged changes."
    exit 1
fi
if ! git diff-index --quiet --cached HEAD --
then
    echo "Git repo not clean. Staged changes."
    exit 1
fi

git reset -N HEAD~

git add --edit #edit commit

git commit --reuse-message=ORIG_HEAD #rework commit

git checkout -- :/ #throw away unstanged changes
