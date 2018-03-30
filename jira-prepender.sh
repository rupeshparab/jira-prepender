#!/usr/bin/env bash

set -e

COMMIT_FILE=$1
COMMIT_MSG=$(cat $1)
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
JIRA_ID=$(echo "$CURRENT_BRANCH" | grep -Eo "[A-Z]{1,10}-[0-9]+")
if [ ! -z "$JIRA_ID" ]; then
    echo "$JIRA_ID - $COMMIT_MSG" > $COMMIT_FILE
    echo "JIRA ID '$JIRA_ID', matched in current branch name, prepended to commit message. (Use --no-verify to skip)"
fi
