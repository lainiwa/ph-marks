
PH_MARKS_HOME=${PH_MARKS_HOME:-${HOME}/.pornhub}
PH_MARKS_PARALLELIZATION=${PH_MARKS_PARALLELIZATION:-5}


.ph_parse_json() {
    local query=${1}
    local file=${2}
    local rez
    if (( ${+commands[query-json]} )); then
        rez=$(query-json -c "${query}" -- "${file}")
        rez=${rez#\"}
        rez=${rez%\"}
        <<<"${rez}"
    else
        jq --raw-output "${query}" -- "${file}"
    fi
}

.ph_is_viewkey() {
    # Examples of viewkeys:
    # * ph5e42e83e8f8c2
    # * 414281797, 1270734976
    [[ ${1} =~ ^ph[0-9a-f]{13}$ ||
       ${1} =~ ^[0-9]{9,10}$
    ]]
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
