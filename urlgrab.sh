#!/bin/bash
#
# Dumps all urls in a website into a file for later processing.
#
# Use crawl-delay directive in robots txt to get the WAIT value

set -e

# Grab script parameters.
URL="$1"
WAIT="0.01"
FILE=$(echo "$1" | cut -d '/' -f3)

# Exclude donwloading these resources.
EXCLUDE="js,css,jpg,jpeg,gif,png,ico,svg,mp4,mp3"

# If wget wait set at command line use it.
if [[ ! -z $2 ]]; then
	WAIT="${2}"
fi

echo "Starting content url audit ..."

# Spider internal urls and save to file.
wget -r -nd --spider --force-html -R "${EXCLUDE}" "${URL}" -w "${WAIT}" 2>&1 | egrep -o 'https?://[^ ]+' | sort | uniq > "${FILE}_urls-content.txt"

echo "Done"

# echo "Starting link audit ..."

# # Loop through the internal urls
# while read url; do
# 	echo "${url}"
# done < "${FILE}-internal-urls.txt"

# # Clean up the file
# sed -i "/Visible/d" "${FILE}-temp.txt"
# sed -i "/Hidden/d" "${FILE}-temp.txt"
# sed -i '/^$/d' "${FILE}-temp.txt"

# cat "${FILE}-temp.txt" | sort | uniq > "${FILE}-all-urls.txt"

# echo "Done"
