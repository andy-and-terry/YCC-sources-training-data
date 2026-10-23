#!/usr/bin/env bash
# Extended globbing: ?(p) *(p) +(p) @(p) !(p) patterns
shopt -s extglob nullglob

dir=$(mktemp -d)
trap 'rm -rf "$dir"' EXIT
touch "$dir"/{a.txt,b.txt,c.log,d.tmp,notes.md,backup.txt.bak}

cd "$dir"
echo "everything except .txt:"
printf '  %s\n' !(*.txt)

echo "only .txt or .log:"
printf '  %s\n' *.@(txt|log)

echo "one or more letters then .txt:"
printf '  %s\n' +([a-z]).txt

# Same patterns work inside [[ ]] and case
for name in report.pdf report.PDF image.png; do
    case $name in
        *.@(pdf|PDF)) echo "$name: document" ;;
        !(*.pdf|*.PDF)) echo "$name: other" ;;
    esac
done

[[ "aaa" == +(a) ]] && echo "aaa matches +(a)"
[[ "" == *(a) ]] && echo "empty matches *(a)"
