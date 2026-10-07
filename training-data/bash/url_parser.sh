#!/usr/bin/env bash
set -euo pipefail

declare -A DEFAULT_PORT=([http]=80 [https]=443 [ftp]=21 [ssh]=22)

parse_url() {
    local url=$1 re='^([a-zA-Z][a-zA-Z0-9+.-]*)://(([^:@/]*)(:([^@/]*))?@)?(\[[^]]+\]|[^:/?#]+)(:([0-9]+))?(/[^?#]*)?(\?([^#]*))?(#(.*))?$'
    if [[ ! $url =~ $re ]]; then echo "invalid: $url"; return 0; fi
    local scheme=${BASH_REMATCH[1],,}
    echo "url:      $url"
    echo "  scheme: $scheme"
    [[ -n ${BASH_REMATCH[3]} ]] && echo "  user:   ${BASH_REMATCH[3]}"
    [[ -n ${BASH_REMATCH[5]} ]] && echo "  pass:   ${BASH_REMATCH[5]//?/*}"
    echo "  host:   ${BASH_REMATCH[6],,}"
    echo "  port:   ${BASH_REMATCH[8]:-${DEFAULT_PORT[$scheme]:-?} (default)}"
    echo "  path:   ${BASH_REMATCH[9]:-/}"
    [[ -n ${BASH_REMATCH[11]} ]] && echo "  query:  ${BASH_REMATCH[11]}"
    [[ -n ${BASH_REMATCH[13]} ]] && echo "  frag:   ${BASH_REMATCH[13]}"
    return 0
}

parse_url 'https://user:secret@Example.COM:8443/a/b.html?x=1&y=2#top'
parse_url 'http://[::1]/status'
parse_url 'ftp://files.example.org'
parse_url 'not a url'
