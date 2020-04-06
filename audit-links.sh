#!/bin/bash
#
# Dumps all links from a webpage into a file for later processing.

set -e

# Grab script parameters.
URL="$1"
WAIT="0.01"
FILE="$2"

echo "Dumping links from ${URL} ..."
lynx -listonly -nonumbers -dump "${URL}" >> "${FILE}"

# Clean up the file
sed -i '/Visible/d' "${FILE}"
sed -i '/Hidden/d' "${FILE}"
sed -i '/^$/d' "${FILE}"

echo "Done."