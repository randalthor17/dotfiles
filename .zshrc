function zcompile-many() {
  local f
  for f; do zcompile -R -- "$f".zwc "$f"; done
}

# Clone and compile to wordcode missing plugins.
if [[ ! -e $HOME/.zsh/zsh-syntax-highlighting ]]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.zsh/zsh-syntax-highlighting
  zcompile-many $HOME/.zsh/zsh-syntax-highlighting/{zsh-syntax-highlighting.zsh,highlighters/*/*.zsh}
fi
if [[ ! -e $HOME/.zsh/zsh-autosuggestions ]]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.zsh/zsh-autosuggestions
  zcompile-many $HOME/.zsh/zsh-autosuggestions/{zsh-autosuggestions.zsh,src/**/*.zsh}
fi
if [[ ! -e $HOME/.zsh/powerlevel10k ]]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.zsh/powerlevel10k
  make -C $HOME/.zsh/powerlevel10k pkg
fi
if [[ ! -e $HOME/.zsh/zsh-vi-mode ]]; then
  git clone --depth=1 https://github.com/jeffreytse/zsh-vi-mode.git $HOME/.zsh/zsh-vi-mode
  zcompile-many $HOME/.zsh/zsh-vi-mode/{zsh-vi-mode.plugin.zsh,zsh-vi-mode.zsh}
fi

# Activate Powerlevel10k Instant Prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable the "new" completion system (compsys).
autoload -Uz compinit bashcompinit && compinit && bashcompinit
[[ $HOME/.zcompdump.zwc -nt $HOME/.zcompdump ]] || zcompile-many $HOME/.zcompdump
unfunction zcompile-many

# aliases
# alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias ls='exa --icons'

# exports
export PATH=$HOME/.local/bin:$HOME/.local/share/apx:$HOME/git-repos/quickemu:$HOME/.juliaup/bin:$PATH
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export GTK_MODULES="unity-gtk-module"
export SAL_USE_VCLPLUGIN=gtk

# zsh-newuser-install config
HISTFILE=$HOME/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob

# nvm export
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Load plugins.
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.zsh/powerlevel10k/powerlevel10k.zsh-theme
source $HOME/.zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source $HOME/.p10k.zsh

