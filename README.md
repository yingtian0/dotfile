# yingtian0/dotfile

Personal Neovim and macOS development setup.

## Recreate on a new Mac

Install Git if necessary, then run:

```bash
git clone https://github.com/yingtian0/dotfile.git ~/dotfile && ~/dotfile/install.sh
```

`install.sh` installs Homebrew when it is missing, installs the tools listed in
`Brewfile`, links `nvim/` to `~/.config/nvim`, and synchronizes LazyVim plugins.
It keeps an existing Neovim configuration by moving it to a timestamped backup.

The Neovim configuration enables LazyVim language extras for Go, TypeScript,
Python, Ruby, and Java. Ruby and Java projects require the corresponding
language runtimes; the installer provides Ruby and OpenJDK 21 through Homebrew.

After installation, open Neovim and run:

```vim
:LazyHealth
:Mason
```

The GitHub CLI is installed but is not authenticated automatically. Run
`gh auth login` if you want to use GitHub from the terminal.
