
PH_MARKS_HOME=${PH_MARKS_HOME:-${HOME}/.pornhub}
PH_MARKS_PARALLELIZATION=${PH_MARKS_PARALLELIZATION:-5}


.ph_is_viewkey() {
    [[ ${1} =~ ^ph[0-9a-f]{13}$ ]]
}


.ph_slugify() {
    local argument=$1
    # Substitute spaces with underlines
    argument=${argument// /_}
    # Lowercase all letters
    argument=${argument:l}
    echo "${argument}"
}


.ph_files_viewkeys() {
    for file in "${PH_MARKS_HOME}"/*.info.json; do
        echo "${file:t:r:r}"
    done 2>/dev/null
}


.ph_stdin_viewkeys() {
    if [[ ! -t 0 ]]; then
        while read -r viewkey; do
            if ! .ph_is_viewkey "${viewkey}"; then
                echo "Could not parse \"${viewkey}\"" >&2
                return 1
            fi
            echo "${viewkey}"
        done </dev/stdin
    else
        return 1
    fi
}


.ph_args_viewkeys() {
    for arg in "$@"; do
        echo "${arg}"
    done
}
