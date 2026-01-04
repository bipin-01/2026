# Day 3 — Processes + Jobs (ps/top/kill/nice/nohup/bg/fg)

## Goals
- Understand processes (PID), signals, and job control
- Practice foreground/background workflows
- Build a watcher script to alert on CPU spikes

---

## Core concepts
- **Process**: running program (PID)
- **Signal**: message to a process (TERM=15, KILL=9, INT=2, HUP=1)
- **Foreground**: takes your terminal until it ends
- **Background**: runs behind your terminal using `&`
- **Job control** (per terminal session): `jobs`, `bg`, `fg`, `Ctrl+Z`

---

## Drills (commands)
### Inspect
```bash
ps aux | head -n 15
ps -eo pid,ppid,user,%cpu,%mem,stat,etime,cmd --sort=-%cpu | head -n 15
top
htop
```

## Stuff Practiced
### Jobs
```bash
sleep 120 &
jobs -l
fg %1
sleep 120
# Ctrl+Z
bg
jobs -l
```

### Signals
```bash
sleep 9999 &
jobs -l
kill -TERM <PID>
kill -KILL <PID>         # only if stuck
pkill -f "sleep 9999"    # careful: matches patterns
```

### Priority
```bash
nice -n 10 <cmd>
sudo renice -n 15 -p <PID>
```

### Persist after logout
```bash
nohup <cmd> > out.log 2>&1 &
tail -f out.log
```

### Notes / gotchas
- Prefer `kill -TERM` first, use `-KILL` last resort
- `jobs` is per-terminal; `ps` shows system processes
- `pkill -f` can kill more than we expect--verify with `pgrep -af <pattern>` first


