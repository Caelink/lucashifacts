#!/bin/bash
MO="${RUN_DIR}/lib/mo"

RANDOM_FACT="$(shuf -n 1 "${FACTS_SOURCE}")"
# This is exported so mo picks it up
export RANDOM_FACT_HTML
RANDOM_FACT_HTML="$(echo "${RANDOM_FACT}" | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g; s/"/\&quot;/g; s/'"'"'/\&#39;/g')"

DICE_ROLL=$(shuf -i 1-"${IMAGE_RARITY}" -n 1)

TO_EMAIL_ADDRESS="$1"
RENDERED_TEMPLATE=$(mktemp message.tmp.XXXXXXXXXXXXX)

TEMPLATE="${RUN_DIR}/assets/template.mo"
PARTIAL="${RUN_DIR}/assets/partial"

# Set the dice roll to zero if:
#   - the image assets directory doesn't exist
#   - no supported image files exist inside the image assets directory
IMAGES_LIST=$(find "${IMG_ASSET_DIR}" -mindepth 1 -type f \( -iname '*.jpg' -o -iname '*.png' \) )
if [[ ! -d "${IMG_ASSET_DIR}" || ! "${IMAGES_LIST}" ]]; then
    DICE_ROLL=0
fi

if [[ "${DICE_ROLL}" -eq 1 ]]; then
    # Setting INCLUDE_IMAGE allows us to conditionally include parts of the
    # Mustache template
    #
    # We can't use the same DICE_ROLL variable since mo just checks whether
    # the value is set to decide whether to include that part of the template
    export INCLUDE_IMAGE=1

    # Choose a random image from the image assets directory
    RANDOM_IMAGE=$(printf '%q' "${IMAGES_LIST}" | shuf -n 1)

    # We use a partial here because for large images, we would otherwise
    # encounter bash's "Argument list too long" error. Writing to a file and
    # then calling it as a partial gets around that issue.
    base64 "${RANDOM_IMAGE}" > "${PARTIAL}"
fi

${MO} "${TEMPLATE}" > "${RENDERED_TEMPLATE}"

if [[ "$#" -eq 1 ]]; then
    /usr/sbin/sendmail "${TO_EMAIL_ADDRESS}" < "${RENDERED_TEMPLATE}"
else
    cat "${RENDERED_TEMPLATE}"
fi
rm "${RENDERED_TEMPLATE}"

if [[ -e "${PARTIAL}" ]]; then
    rm "${PARTIAL}"
fi
