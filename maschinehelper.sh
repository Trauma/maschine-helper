#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

while true; do
  sleep 3
  if [[ "${machineHasOpenedOnce:-false}" == false ]] && ! pgrep Maschine && ioreg -p IOUSB -w0 | grep Maschine ; then
    open /Applications/Native\ Instruments/Maschine\ 2/Maschine\ 2.app && machineHasOpenedOnce=true
  elif [[ "${machineHasOpenedOnce:-false}" == true ]] && ! pgrep Maschine && ! ioreg -p IOUSB -w0 | grep Maschine ; then
    machineHasOpenedOnce=false
  fi
done
