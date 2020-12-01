#!/bin/bash

validate_arguments() {
	if [ "$1" == "help" ]
	then
		echo '*** Help:'
		echo "It allows to sync a remote folder and a local folder."
		echo "Example rclone_sync.sh 'remote_connection' 'remote_folder' 'local_folder'"
		exit 0
	fi

	if [ -z "$1" ]
	then
	    echo "First argument is missing. Rclone driver needed"
	    exit 1
	fi

	if [ -z "$2" ]
	then
	    echo "Third argument is missing. Local folder required."
	    exit 1
	fi
}

validate_arguments $1 $3

CONNECTION=$1
FOLDER=$2
LOCAL_FOLDER=$3
echo 'Setup'
echo '-----'
echo 'Sync for: '$CONNECTION
echo 'Remote folder: ' $FOLDER
echo 'Local folder: ' $LOCAL_FOLDER

echo 'Sync'
echo '----'
echo 'Downloading files...'
/usr/bin/rclone copy --update --verbose --drive-acknowledge-abuse --transfers 30 --checkers 8 --contimeout 60s --timeout 300s --retries 3 --low-level-retries 10 --stats 1s "$CONNECTION:$FOLDER" $LOCAL_FOLDER
echo 'Uploading files...'
/usr/bin/rclone copy --update --verbose --drive-acknowledge-abuse --transfers 30 --checkers 8 --contimeout 60s --timeout 300s --retries 3 --low-level-retries 10 --stats 1s $LOCAL_FOLDER "$CONNECTION:$FOLDER"