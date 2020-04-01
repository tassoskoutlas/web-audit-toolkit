#!/bin/bash
#
# Dumps all urls in a website into a file for later processing.

set -e

# Grab script parameters.
URL="$1"
WAIT="0.1"

# Exclude donwloading these resources.
EXCLUDE="js,css,jpg,jpeg,png,mp3,mp4"

# If wget wait set at command line use it.
if [[ ! -z $2 ]]; then
	WAIT="${2}"
fi

# Spider internal urls and save to file.
# wget --recursive --spider --force-html --quiet -R "${EXCLUDE}" "${URL}" 2>&1 | egrep -o 'https?://[^ ]+' | sort | uniq > "${FILE}-internal-urls.txt"


# # Loop through the internal urls
# while read url; do
# 	echo "${url}"
# done < "${FILE}-internal-urls.txt"

# # Clean up the file
# sed -i "/Visible/d" "${FILE}-temp.txt"
# sed -i "/Hidden/d" "${FILE}-temp.txt"
# sed -i '/^$/d' "${FILE}-temp.txt"

# cat "${FILE}-temp.txt" | sort | uniq > "${FILE}-all-urls.txt"