# Git Hooks for Java

- Works only with gradle projects
- `pre-commit` Assumes specific directory structure
```
.git
service-a
    - src/main
service-b
    - src/main
```

## Installation

As `.git` is project-specific, to keep same git hooks across multiple machines and to keep them up to date, the best way to install hooks is to create symbolic links.

```shell
ln -sf path/to/cloned/hooks/<hook.sh> path/to/project/.git/hooks/<hook>
```

If for some reason default hooks are not executable, making them to be so is needed:
```shell
chmod +x path/to/cloned/hooks/<hook>.sh
```

To remove hook from your project, simply delete symbolic link from `path/to/project/.git/hooks`.