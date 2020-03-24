
PH_MARKS_HOME=${PH_MARKS_HOME:-${HOME}/.pornhub}
_PH_VIEW_LINK='https://www.pornhub.com/view_video.php?viewkey='


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
