#!/usr/bin/env bash

set -e

COMMIT_FILE=$1
COMMIT_MSG=$(cat $1)
if [[ ! -z "$(git rev-parse -q --verify MERGE_HEAD)" ]]; then
    echo "JIRA check skipped for merge commit"
else
    JIRA_RE='[A-Za-z]{1,10}-[0-9]+'
    CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
    JIRA_ID=$(echo "$CURRENT_BRANCH" | grep -Eo "$JIRA_RE" | awk '{print toupper($0)}')
    if [[ ! -z "$(echo $COMMIT_MSG | grep -E $JIRA_RE)" ]]; then
        echo "JIRA ID present in current commit."
    elif [[ ! -z "$JIRA_ID" ]]; then
        echo "$JIRA_ID - $COMMIT_MSG" > $COMMIT_FILE
        echo "JIRA ID '$JIRA_ID', matched in current branch name, prepended to commit message."
    else
        echo "JIRA ID not present in commit as well as branch"
        exit 1
    fi
fi
