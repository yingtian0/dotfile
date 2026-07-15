# Shorten parent directories in the shell prompt without changing the real path.
# Example: /home/yingtian/github.com/ryoppippi/dotfile -> ~/g/r/dotfile

if [[ -n "${ZSH_VERSION:-}" ]]; then
  dotfile_short_path() {
    local path="${1:-$PWD}"

    if [[ "$path" == "$HOME" ]]; then
      print -r -- "~"
      return
    fi
    if [[ "$path" == "$HOME/"* ]]; then
      path="~/${path#$HOME/}"
    fi

    local prefix=""
    if [[ "$path" == "~/"* ]]; then
      prefix="~/"
      path="${path#\~/}"
    elif [[ "$path" == /* ]]; then
      prefix="/"
      path="${path#/}"
    fi

    local -a parts
    parts=("${(@s:/:)path}")
    local result="$prefix"
    local last=${#parts[@]}

    if (( last == 0 )); then
      print -r -- "$prefix"
      return
    fi
    for ((i = 1; i < last; i++)); do
      result+="${parts[i]:0:1}/"
    done
    result+="${parts[last]}"
    print -r -- "$result"
  }

  if [[ -o interactive ]]; then
    setopt prompt_subst
    PROMPT='%n@%m:%F{cyan}$(dotfile_short_path)%f %# '
  fi
else
  dotfile_short_path() {
    local path="${1:-$PWD}"

    if [[ "$path" == "$HOME" ]]; then
      printf '~'
      return
    fi
    if [[ "$path" == "$HOME/"* ]]; then
      path="~/${path#$HOME/}"
    fi

    local prefix=""
    if [[ "$path" == "~/"* ]]; then
      prefix="~/"
      path="${path:2}"
    elif [[ "$path" == /* ]]; then
      prefix="/"
      path="${path#/}"
    fi

    local -a parts
    local IFS=/
    read -r -a parts <<< "$path"
    local result="$prefix"
    local last=$(( ${#parts[@]} - 1 ))

    for ((i = 0; i < last; i++)); do
      [[ -n "${parts[i]}" ]] && result+="${parts[i]:0:1}/"
    done
    result+="${parts[last]}"
    printf '%s' "$result"
  }

  case $- in
    *i*) PS1='\u@\h:\[\033[01;36m\]$(dotfile_short_path)\[\033[00m\]\$ ' ;;
  esac
fi
