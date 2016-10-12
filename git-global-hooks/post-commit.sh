#!/bin/sh
. ~/scripts/etc/config.sh
. ~/scripts/common/status.sh

REPO=$(basename `git rev-parse --show-toplevel`)
DESCR=$(git log -1 HEAD --pretty=format:%s)
MESSAGE="[$REPO] $DESCR"
MESSAGE_HASH=$(echo $MESSAGE | shasum)
mkdir -p ~/.commit-logs
COMMIT_LOG=~/.commit-logs/$MESSAGE_HASH
DATE_TODAY=$(date +"%Y-%m-%d %H:%M:%S")

LABEL='code commit'
if [[ ! -f $COMMIT_LOG ]]; then
	echo $MESSAGE > $COMMIT_LOG
	status "Sending Commit to RescueTime" curl -s --data "key=$RESCUETIME_API_KEY&highlight_date=$DATE_TODAY&description=$MESSAGE&source=$LABEL" https://www.rescuetime.com/anapi/highlights_post
else
	status_skip "Sending Commit to RescueTime"
fi

