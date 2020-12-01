# Rclone Sync

It allows to sync a folder between your computer and a remote connection.

## How to use
You require to have [rclone](https://rclone.org/) installed and a connection already setup [Example to configure Google Drive](https://www.howtogeek.com/451262/how-to-use-rclone-to-back-up-to-google-drive-on-linux/).

To sync a folder:
```
./rclone_sync.sh '<remote_connection>' '<remote_folder>' '<local_folder>'
```

> Leave '' as remote folder to sync the root remote folder.

## Extra
Add this to the crontab for your user and get auto sync every minute
```
* * * * * <project_path>/rclone_sync.sh '<remote_connection>' '<remote_folder>' '<local_folder>' >> /var/log/rclone_sync.log
```

