#!/usr/bin/env bash
set -uo pipefail

unset unset_var
empty_var=""
set_var="value"

# ${var:-default}: use default if unset or empty, without assigning it.
echo "unset with default: ${unset_var:-fallback}"
echo "empty with default: ${empty_var:-fallback}"
echo "set with default: ${set_var:-fallback}"

# ${var:=default}: same, but also assigns the default back into var.
echo "assign-default: ${unset_var:=assigned}"
echo "unset_var is now: $unset_var"

# ${var:+alt}: use alt only if var IS set and non-empty, otherwise empty.
echo "plus with set_var: ${set_var:+is-set}"
echo "plus with empty_var: ${empty_var:+is-set}"

# ${var:offset:length}: substring extraction.
message="Hello, World!"
echo "substring(7,5): ${message:7:5}"
echo "substring from offset 7: ${message:7}"

# ${#var}: length of the value.
echo "length of message: ${#message}"

# ${var:?error message}: abort with a message if var is unset or empty.
safe_default=${unset_var:-"n/a"}
echo "safe_default: $safe_default"
