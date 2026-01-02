# Log Viewing Cheatsheet (Day 2)

## Quick file inspection
```bash
ls -lah
file <name>
wc -l <file>
head -n 20 <file>
tail -n 20 <file>
tail -f <file>        # follow a growing log
```

## Reading comfortably large file
```bash
less <file>
# /pattern      search
#n              next match
#q              quit
```

## Counting & summarizing
```bash
wc <file>
wc -l <file>
sort <file> | uniq -c | sort -nr
```

## Extracting field w/wt piepline
```bash
cut -d' ' -f1,2,3 <file>
cut -d',' -f1,3 <file>
tr '[:lower:]' '[:upper:]'
tr -d '\r'                 # remove Windows CR if needed
tr ',' '\t'                # CSV → tab view
cut -d' ' -f3 app.log | cut -d'=' -f2 | sort | uniq -c | sort -nr
cut -d' ' -f4 app.log | cut -d'=' -f2 | sort | uniq -c | sort -nr
```
