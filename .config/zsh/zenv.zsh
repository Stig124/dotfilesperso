export SPICETIFY_INSTALL="$HOME/.spicetify"
export PATH=$HOME/.emacs.d/bin:$HOME/.cargo/bin:$SPICETIFY_INSTALL:$HOME/.local/bin:$HOME/.local/bin/misc/:$HOME/bin:/usr/local/bin:$PATH
export MANPATH=/usr/local/man:$MANPATH
export GDB_HISTFILE="$HOME/.gdb_history"
export ZSH_CACHE_DIR="$HOME/.local/share"

if type nvim &> /dev/null; then
  export VISUAL=nvim
  export EDITOR=nvim
elif type vim &> /dev/null; then
  export VISUAL=vim
  export EDITOR=vim
fi

export DISABLE_AUTO_TITLE='true'
export MONITOR=all

# Conditionals

OSVER=$( (lsb_release -ds || cat /etc/*release || uname -om) 2>/dev/null | head -n1)

if [ -d "/opt/cuda/bin" ]; then
  export PATH="/opt/cuda/bin:$PATH"
fi

if [ -d "$HOME/dotnet" ]; then
  export PATH=$PATH:$HOME/dotnet
  export DOTNET_ROOT=$HOME/dotnet
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
fi

if command -v go >/dev/null 2>&1; then
  export PATH="$(go env GOPATH)/bin:$PATH"
fi

if type rvm &> /dev/null; then
  export PATH="$HOME/.rvm/bin:$PATH"
fi

#Plugin config
export VSCODE=code-insiders

# NVM
export NVM_COMPLETION=true
export NVM_LAZY_LOAD=true
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('lvim' 'nvim' 'emacs')

# Really specific config

if [[ -f "$HOME/.config/zsh/special-${HOSTNAME}.zsh" ]]; then
  source "$HOME/.config/zsh/special-${HOSTNAME}.zsh"
fi

# GPG SSH AGENT

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

export BAT_THEME="Catppuccin Latte"
export DARK_THEME=1

if [[ $DESKTOP_SESSION == "gnome" ]] && type ; then
  if [[ $(gsettings get org.gnome.desktop.interface color-scheme) =~ 'dark' ]]; then
    export BAT_THEME="Catppuccin Mocha"
    export DARK_THEME=1
  else
    export BAT_THEME="Catppuccin Latte"
    export DARK_THEME=0
  fi
else
  # Fallback if not GNOME
  export BAT_THEME="Catppuccin Latte"
  export DARK_THEME=1
fi
