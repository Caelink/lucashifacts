#!/bin/bash

RANDOM_FACT="$(shuf -n 1 "${FACTS_SOURCE}")"
RANDOM_FACT_HTML="$(echo "${RANDOM_FACT}" | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g; s/"/\&quot;/g; s/'"'"'/\&#39;/g')"

DICE_ROLL=$(shuf -i 1-"${IMAGE_RARITY}" -n 1)

MSG_TEMPLATE_IMG="${RUN_DIR}/assets/template_img"
MSG_TEMPLATE_BASE="${RUN_DIR}/assets/template_head"

EMAIL_ADDRESS="$1"
TEMP_FILE=$(mktemp message.tmp.XXXXXXXXXXXXX)


# add lucashifact
cp "${MSG_TEMPLATE_BASE}" "${TEMP_FILE}"
echo "${RANDOM_FACT_HTML}" >> "${TEMP_FILE}"
echo '</p>' >> "${TEMP_FILE}"

# if the directory doesn't exist
# or no files inside the directory
if [[ ! -d "${IMG_ASSET_DIR}" || ! $(find "${IMG_ASSET_DIR}" -mindepth 1 \( -iname '*.jpg' -o -iname '*.png' \) ) ]]; then
    DICE_ROLL=0
fi

# add the image if necessary
if [ "${DICE_ROLL}" -eq 1 ]; then
    RANDOM_IMAGE=$(find "${IMG_ASSET_DIR}" -type f | shuf -n 1)

    cat "${MSG_TEMPLATE_IMG}" >> "${TEMP_FILE}"
    base64 "${RANDOM_IMAGE}" >> "${TEMP_FILE}"
else
    # otherwise just end the body
    echo '--body--' >> "${TEMP_FILE}"
fi
echo "--message--" >> "${TEMP_FILE}"

if [ "$#" -eq 1 ]; then
    /usr/sbin/sendmail "${EMAIL_ADDRESS}" < "${TEMP_FILE}"
else
    cat "${TEMP_FILE}"
fi
rm "${TEMP_FILE}"
