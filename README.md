jira-prepender-hook
==========

See also: https://github.com/pre-commit/pre-commit


### Using jira-prepender-hook with pre-commit

Add this to your `.pre-commit-config.yaml`

    -   repo: git://github.com/rupeshparab/jira-prepender
        sha: master
        hooks:
        -   id: jira-prepender

### What this hook does

- `jira-prepender` - Validates commit message for JIRA ID.
    - If JIRA ID is not present in commit message,
      will check the branch name, if found will append it 
      to the commit message
      If not found will throw error and won't allow commit
