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

### Process inspection
```bash
ps aux | head -n 15
ps -eo pid,ppid, user,%cpu,%mem,stat
```

## PRACTICE SESSION COMMANDS
```bash
sudo apt update && sudo apt install -y htop
htop
```

### Jobs: bg / fg / Ctrl+Z
```bash 
sleep 120 &
jobs -l
fg %1
```

### Now start again and stop it:
```bash
sleep 300
# press Ctrl+Z
bg
jobs -l
```

### Signals: kill/pkill safely
```bash
sleep 9999 &
jobs -l
```

### Graceful
```bash
kill -TERM <PID>

** force (only if need): 
kill -KILL <PID> 
```

### Safe pattern kill workflow
```bash
pgrep -af "sleep 9999"
pkill -f "sleep 9999"
```

### nice / renice (safe CPU hog demo)
```bash
bash -c 'while :; do :; done' &
HOGPID=$!
echo "hog pid=$HOGPID"
ps -p "$HOGPID" -o pid,ni,cmd

** lower its priority
sudo renice -n 15 -p "$HOGPID"
ps -p "$HOGPID" -o pid,ni,cmd

** stop it
kill -TERM "$HOGPID"

** nohup demo
nohup bash -c 'for i in {1..10}; do echo "tick $i"; sleep 1; done' > terminal_dojo/labs/day03_processes_jobs/nohup.out 2>&1 &
tail -f terminal_dojo/labs/day03_processes_jobs/nohup.out

```


