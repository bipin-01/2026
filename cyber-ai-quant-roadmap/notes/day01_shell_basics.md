# Day 1 - Shell Basics (Filesystem + PATH + Help)

## Goal
- Understand Linux filesystem navigation, how command are found (PATH), and how to read help/manuals.
- Get comfortable navigating Linux filesystem
- Understand how the shell finds commands (PATH)
- Learn how to self-help using `man`, `--help`, and `help`
- Practice core drills: `pwd`, `ls`, `cd`, `tree`, `which`, `type`, `man`, `--help`

## Filesystem basics
- Absolute path start with '/' (example: `home/<user>/2026`)
- Relative path starts from current directory (example: `notes/`)
- `.` = current directory, `..` = parent directory
- Home directory is `~`

### What I ran

```bash
pwd
ls
ls -la
cd ~
cd -
cd ..
which $PATH
```

## More to Learn and practice these commands
```bash
type
which
tree
```

### what I learned
- `which` prints the path to the executable file found via PATH
- PATH order matters; earlier directions "win"


## Key takeaways 
- PATH determin which executable bin will the command follows first
- `type` could explains if a command is alias/builtin/function/file
- `man` and `--help` are the fastest way to learn command options

## Things to research more on 
- what are linux permission (rwx) and how do they relate to security in real scenario
- how does `sudo` work and what's the safe way to use it?
- what is the difference between `/bin`, `/usr/bin`, and `/usr/local/bin`?



