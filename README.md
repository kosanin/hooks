# hooks

Collection of [git-hooks](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks). Even though hooks can be written in python, to avoid relying on its existence on target machine, bash scripts will be used instead.
Purpose of such hooks is to create local CI and put all repetitive tasks under few git commands. Such tasks are:
- build
- test
- static analysis
- auto formatting


References:
- [sh best practices](https://sharats.me/posts/shell-script-best-practices/)
- [shellcheck](https://www.shellcheck.net/)

