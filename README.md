# yingtian0/dotfile

Personal Neovim, tmux, and macOS development setup.

## Recreate on a new Mac

Install Git if necessary, then run:

```bash
git clone https://github.com/yingtian0/dotfile.git ~/dotfile && ~/dotfile/install.sh
```

`install.sh` installs Homebrew when it is missing, installs the tools listed in
`Brewfile`, links `nvim/` to `~/.config/nvim` and `tmux/.tmux.conf` to
`~/.tmux.conf`, installs TPM and its plugins, and synchronizes LazyVim plugins.
It also configures interactive Zsh shells to attach to the `main` tmux session
automatically.
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

## WSL

Install tmux in Ubuntu/Debian WSL with:

```bash
sudo apt update && sudo apt install -y tmux
```

Then link the shared configuration and install TPM:

```bash
ln -sfn ~/dotfile/tmux/.tmux.conf ~/.tmux.conf
git clone --depth 1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

To start or reattach to the `main` session automatically when WSL opens, add
this line to `~/.bashrc`:

```bash
source "$HOME/dotfile/shell/tmux-auto-start.sh"
```

Start a session with `tmux new -s dev`. The prefix is `Ctrl+a`; use
`Ctrl+a v` or `Ctrl+a s` to split panes and `Ctrl+a h/j/k/l` to move between
them.
