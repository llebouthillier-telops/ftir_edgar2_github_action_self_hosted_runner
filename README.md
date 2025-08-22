# ftir_edgar2_github_action_self_hosted_runner
Upon PR stante change to **ready**, trigger a jenkins build. The build has to be successfull in order for the check to [x]

## Why?
Since we use an on premese instance of Jenkins that is not internet facing, we need the self-hosted runner to be the middle man between GitHub and Jenkins

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
