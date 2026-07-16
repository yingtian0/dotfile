# Load nvm only when the nvm command is actually used.
if [[ -n "${BASH_VERSION:-}" ]]; then
  export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"

  nvm() {
    unset -f nvm

    if [[ ! -s "$NVM_DIR/nvm.sh" ]]; then
      echo "nvm is not installed: $NVM_DIR/nvm.sh" >&2
      return 1
    fi

    . "$NVM_DIR/nvm.sh"
    if [[ -s "$NVM_DIR/bash_completion" ]]; then
      . "$NVM_DIR/bash_completion"
    fi

    nvm "$@"
  }
fi
