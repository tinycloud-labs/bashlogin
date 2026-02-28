#!/usr/bin/env bash

# ------- Source scripts -------
source src/globals.sh
source src/resources.sh
source src/sysinfo.sh
source src/sessions.sh

# ------- Defaults -------
set -- $BASHLOGIN_ARGS
STYLE="slant"
# ------- Parse args -------
# Pseudo code:
#   --style is non positional arg (and shouldn't be)
#   everything else is parsed as a arg for the 'service.sh'
while [[ $# -gt 0 ]]; do
  case "$1" in
    --style)
      if [[ -z "$2" ]]; then
        echo "Error: --style requires a font name"
        exit 1
      fi
      STYLE="$2"
      shift 2
      ;;
    --*)
      echo "Unknown option: $1"
      exit 1
      ;;
    *)
      # Not a flag → treat as service
      SERVICES+=("$1")
      shift
      ;;
  esac
done

SERVICES=("$@")

# ------- Style -------
# -w is for width, -k is to keep the aspect ratio
figlet -w 120 -f "$STYLE" -k "$HOSTNAME"

# ------- Exec -------
printHeader "Sessions"
userSessions
echo ""
printHeader "Sys-Info"
sysInfo
echo ""
printHeader "Resource"
resourcesInfo
echo ""

# Optional to display systemd svc
if (( ${#SERVICES[@]} > 0 )); then
  source src/service.sh
  printHeader "Services"
  for svc in "${SERVICES[@]}"; do
    serviceStatus "$svc"
  done
fi

echo -e "$ColorReset"
