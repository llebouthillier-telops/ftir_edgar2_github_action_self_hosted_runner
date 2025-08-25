# ftir_edgar2_github_action_self_hosted_runner
Upon PR state change to **ready**, trigger a Jenkins build. The build has to be successful in order for the check to pass.

## Why?
Since we use an on premise instance of Jenkins that is not internet facing, we need the self-hosted runner to be the middleman between GitHub and Jenkins

## TL;TR
```bash
just help

Available recipes:
    help    # Help
    up
    down
    restart
```

## TODO list
- [ ] Allow other projects to use this CI pattern

## References
- https://github.com/dduzgun-security/github-self-hosted-runners
- https://github.com/actions/runner/releases/tag/v2.328.0
