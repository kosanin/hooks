# Git Hooks For Rust


## Installation

As `.git` is project-specific, to keep same git hooks across multiple machines and to keep them up to date, the best way to install hooks is to create symbolic links.

```shell
ln -sf path/to/cloned/hooks/<hook.sh> path/to/project/.git/hooks/<hook>
```

If for some reason default hooks are not executable, making them to be so is needed:
```shell
chmod +x path/to/cloned/hooks/<hook>.sh
```

To __remove__ hook from your project, simply delete symbolic link from `path/to/project/.git/hooks`.