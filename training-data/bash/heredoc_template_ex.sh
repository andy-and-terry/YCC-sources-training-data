#!/usr/bin/env bash
user=ada port=8080
cat <<EOT
server {
  user  $user;
  listen $port;
}
EOT
cat <<'EOT'
literal $user stays
EOT
