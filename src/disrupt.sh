#!/bin/bash

# Export all these variables for SC2155 rule
export facthtml
export tmpstring

randomfacts="$(shuf -n 1 "$FACTS_SOURCE")"
facthtml="$(echo "${randomfacts}" | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g; s/"/\&quot;/g; s/'"'"'/\&#39;/g')"
tmpstring="$(eval "echo \"$(cat "$RUN_DIR"/assets/template)\"")"

if [ "$#" -eq 1 ]; then
    echo "$tmpstring" | /usr/bin/mutt -e 'set content_type=text/html' -s "lucashi fact of the day" "$1"
else
    echo "$tmpstring"
fi
