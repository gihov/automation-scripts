# Automation scripts

## Description

Collection of scripts used for the infrascture.

## Scripts

### notifications/upgrade.sh

This scripts allows you to receive notification on *gotify* when an update is available.

Replace `Gotify_URL` and `Gotify_Token` values.

Then make the script executable `chmod +x ./notifications/upgrade.sh` and add it to crontab:

```bash
echo -n '59 23   * * *   root    /root/upgrade.sh' >> /etc/crontab
```

### upload/jirafeau.sh

This scripts allows you to send, get or delete a file from a jirafeau instance.

Replace `url` and `upload_password` values.

Then make the script  executable `chmod +x ./upload/jirafeau.sh`:

```bash
./upload/jirafeau.sh send FILE [PASSWORD]
./upload/jirafeau.sh get URL [PASSWORD]
./upload/jirafeau.sh delete URL
```


