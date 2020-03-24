
PH_MARKS_HOME=${PH_MARKS_HOME:-${HOME}/.pornhub}
PH_PARALLEL_FETCHES=${PH_PARALLEL_FETCHES:-5}


_ph_slugify() {
    local argument=$1
    # Substitute spaces with underlines
    argument=${argument// /_}
    # Lowercase all letters
    argument=${argument:l}
    echo "${argument}"
}


_get_video_ids_files() {
    for file in "${PH_MARKS_HOME}"/*.json; do
        echo "${file:t:r}"
    done 2>/dev/null
}
