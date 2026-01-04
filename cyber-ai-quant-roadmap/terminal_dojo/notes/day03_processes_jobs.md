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