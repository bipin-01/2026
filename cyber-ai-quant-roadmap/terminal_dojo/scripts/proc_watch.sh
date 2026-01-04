#!/usr/bin/env bash
set -euo pipefail

# proc_watch.sh — alert if processes matching a pattern exceed CPU threshold.
# Usage: ./proc_watch.sh "<pattern>" [cpu_threshold] [interval_seconds] [logfile]
#
# Example:
#   ./proc_watch.sh "python" 60 2
#   ./proc_watch.sh "while :; do" 20 1

PATTERN="${1:-}"
THRESHOLD="${2:-70}"
INTERVAL="${3:-2}"
LOGFILE="${4:-terminal_dojo/labs/day03_processes_jobs/proc_watch_alerts.log}"

if [[ -z "$PATTERN" ]]; then
  echo "Usage: $0 \"<pattern>\" [cpu_threshold] [interval_seconds] [logfile]" >&2
  exit 1
fi

mkdir -p "$(dirname "$LOGFILE")"
ts() { date +"%Y-%m-%d %H:%M:%S"; }

alert() {
  local msg="$1"
  echo "[$(ts)] $msg" | tee -a "$LOGFILE"
  if command -v notify-send >/dev/null 2>&1; then
    notify-send "proc_watch alert" "$msg" >/dev/null 2>&1 || true
  fi
}

echo "Watching pattern='$PATTERN' threshold=${THRESHOLD}% interval=${INTERVAL}s"
echo "Logging to $LOGFILE"
echo "Ctrl+C to stop."

while true; do
  ps -eo pid=,%cpu=,cmd= \
    | awk -v pat="$PATTERN" -v thr="$THRESHOLD" '
        $0 ~ pat {
          cpu=$2+0
          if (cpu >= thr) {
            printf "%s\t%.1f\t", $1, cpu
            for (i=3; i<=NF; i++) printf "%s%s", $i, (i==NF?ORS:OFS)
          }
        }' OFS=" " \
    | while IFS=$'\t' read -r pid cpu cmd; do
        [[ -z "${pid:-}" ]] && continue
        alert "CPU spike pid=$pid cpu=${cpu}% cmd=$cmd"
      done

  sleep "$INTERVAL"
done
