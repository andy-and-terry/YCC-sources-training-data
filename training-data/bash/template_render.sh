#!/usr/bin/env bash
set -euo pipefail

# Tiny template engine: {{ key }}, {{ key|upper }}, {% if key %}...{% endif %}, {% for x in list %}...{% endfor %}
# Lists are stored as newline-separated values.
declare -A ctx=(
    [user.first]=Ada
    [user.last]=Lovelace
    [count]=3
    [noun]=messages
    [admin]=1
    [tags]=$'math\n<engines>'
)

# Quoted replacements so bash 5.2's patsub_replacement does not treat '&' as the match.
escape_html() { local s=$1; s=${s//&/"&amp;"}; s=${s//</"&lt;"}; s=${s//>/"&gt;"}; printf '%s' "$s"; }

render() {
    local tpl=$1 key var body pre post item out v filter
    # for-loops
    while [[ $tpl =~ \{%\ for\ ([a-z]+)\ in\ ([a-z.]+)\ %\}(.*) ]]; do
        var=${BASH_REMATCH[1]} key=${BASH_REMATCH[2]}
        pre=${tpl%%"{% for $var in $key %}"*}
        body=${BASH_REMATCH[3]%%"{% endfor %}"*}
        post=${BASH_REMATCH[3]#*"{% endfor %}"}
        out=''
        while IFS= read -r item; do
            ctx[$var]=$item
            out+=$(render "$body"; echo .); out=${out%.}
        done <<<"${ctx[$key]}"
        tpl=$pre$out$post
    done
    # conditionals
    while [[ $tpl =~ \{%\ if\ ([a-z.]+)\ %\} ]]; do
        key=${BASH_REMATCH[1]}
        pre=${tpl%%"{% if $key %}"*}
        body=${tpl#*"{% if $key %}"}; post=${body#*"{% endif %}"}; body=${body%%"{% endif %}"*}
        [[ -n ${ctx[$key]:-} && ${ctx[$key]} != 0 ]] || body=''
        tpl=$pre$body$post
    done
    # variables
    while [[ $tpl =~ \{\{\ *([a-z.]+)(\|([a-z]+))?\ *\}\} ]]; do
        key=${BASH_REMATCH[1]} filter=${BASH_REMATCH[3]}
        v=${ctx[$key]:-}
        case $filter in upper) v=${v^^} ;; lower) v=${v,,} ;; raw) ;; *) v=$(escape_html "$v") ;; esac
        tpl=${tpl/"${BASH_REMATCH[0]}"/"$v"}
    done
    printf '%s' "$tpl"
}

template='Hello {{ user.first }} {{ user.last }}, you have {{ count }} new {{ noun|upper }}.
{% if admin %}[admin]
{% endif %}{% for t in tags %}- {{ t }}
{% endfor %}{% if missing %}hidden{% endif %}done
'
render "$template"
