FCRED="[31;1m"
FCGRN="[32;1m"
FCYLW="[33;1m"
FCBLU="[34;1m"
FCPRP="[35;1m"
FCCYN="[36;1m"
CLR="[0m"

function debug {
  if [ $# -eq 1 ]; then
    MSG=$1
    LMSG=$1
  else
    MSG="(${FCPRP}$1${CLR}) $2"
    LMSG="($1) $2"
  fi
  if [ ${DEBUG} -eq 1 ]; then
    echo "[${FCBLU}debug  ${CLR}] $MSG" >&2
  fi
  log debug "$LMSG"
}

function error {
  echo "[${FCRED}error  ${CLR}] $1" >&2
  #log err "$1"
  log error "$1"
}

function warning {
  echo "[${FCYLW}warning${CLR}] $1" >&2
  #log warn "$1"
  log warn "$1"
}

function notice {
  if [ ${NOTICE} -eq 1 ]; then
    echo "[${FCGRN}notice ${CLR}] $1" >&2
  fi
  log notice "$1"
}

function log {
  pri=$2
  msg=$3
  if [ ${LOG} -eq 1 ]; then
    ${LOGGER} -t ${NAME} -p ${pri} "${msg}"
  fi
}
