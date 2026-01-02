# Day 2 — Permissions + Users (rwx, ownership, groups, sudo safety)


## Lockdown a secret
```bash
chmod 600 secret.txt
ls -l secret.txt
```

## Make readable by all
```bash
chmod 644 secret.txt
ls -l secret.txt
```

## Execute permission for scripts
```bash
chmod 644 secret.txt
ls -l secret.txt
```

## Execute permission for directory
```bash
ls -ld vault
chmod 700 vault
ls -ld vault
ls -la vault
```

## Mini lab: new user + restricted folder
```bash
sudo useradd -m -s /bin/bash trainee
sudo passwd trainee
```

## Restricted Folder only trainee can access
```bash
sudo mkdir -p /srv/restricted_lab
sudo chown trainee:trainee /srv/restricted_lab
sudo chmod 700 /srv/restricted_lab
ls -ld /srv/restricted_lab
```

## Testing access as current user
```bash
ls /srv/restricted_lab
```
This will throw error as only trainee is allow to access that folder.

## Switch back to trainee to access that folder
```bash
su - trainee
whoami
touch /srv/restricted_lab/hello_from_trainee.txt
ls -la /srv/restricted_lab
exit
```
