# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/cachyos-zsh-config/cachyos-config.zsh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source ~/.local/share/zinit/zinit.git/zinit.zsh/zinit.zsh
autoload -Uz _zinit
(( ${+_comps})) &&_comps[zinit]=_zinit

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load zsh-completions
autoload -U compinit && compinit

# Path to your oh-my-zsh installation.
# Reevaluate the prompt string each time it's displaying a prompt
setopt prompt_subst
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
autoload bashcompinit && bashcompinit
autoload -Uz compinit
compinit
source <(kubectl completion zsh)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
complete -C '/usr/local/bin/aws_completer' aws

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion Sensetivity-erased
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview "ls --color $realpath"
zstyle ':fzf-tab:complete:z:*' fzf-preview 'eza --color=always --icons --group-directories-first --git-ignore -1 $realpath'

# Faster alternative (no tree view)
zstyle ':fzf-tab:*' fzf-preview \
  'eza --color=always --icons --group-directories-first -1 $realpath'

bindkey '^n' history-search-forward
bindkey '^p' history-search-backward
bindkey '^w' autosuggest-execute
bindkey '^y' autosuggest-accept
bindkey '^u' autosuggest-toggle
bindkey '^L' vi-forward-word
bindkey '^k' up-line-or-search
bindkey '^j' down-line-or-search

eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export TERM=xterm-256color

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_TIME=en_US.UTF-8

alias ex=exit
alias la=tree
alias lg=lazygit
alias cat=bat
alias e=eza
alias vim=nvim
alias vi=vim
alias viewhtml="xdg-open index.html"
alias et="eza --tree --level=2 --long --icons --git"
alias etr="eza --tree --level=2  --icons --git"
alias nvim-up="nvim --headless -c 'Lazy sync' -c 'qa'"

# Git
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gpoh="git push origin HEAD"
alias gpom="git push -u origin main"
alias gpu="git pull origin"
alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gco="git checkout"
alias gb='git branch'
alias gba='git branch -a'
alias gadd='git add'
alias ga='git add -p'
alias gcoall='git checkout -- .'
alias gr='git remote'
alias gre='git reset'

# Docker
alias dco="docker compose"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dl="docker ps -l -q"
alias dx="docker exec -it"

# Dirs
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# GO
export GOPATH='/usr/bin/go'
export GOPATH="$HOME/Miscellaneous/go"
export PATH="$PATH:$GOPATH/bin"

 # .Net
export PATH="$PATH:$HOME/.dotnet/tools"

# Python-uv
export PATH="/home/exul4nzs/.local/bin:$PATH"

# Nmap
alias nm="nmap -sC -sV -oN nmap"

alias c="clear"
alias ff="fastfetch"
alias ac="arduino-cli" 
alias cn="c && nvim"
alias spacman="sudo pacman"
alias nvz="nvim ~/.zshrc"
alias szsh="source ~/.zshrc"
alias nvt="nvim ~/.tmux.conf"
alias stmux="source ~/.tmux.conf"
alias g++23="g++ -std=c++23 -Wall -Wextra"
alias g++20="g++ -std=c++20 -Wall -Wextra"
alias g++17="g++ -std=c++17 -Wall -Wextra"
alias coursier="$HOME/.local/share/coursier/bin/coursier"

# K8S
export KUBECONFIG=~/.kube/config
alias k="kubectl"
alias ka="kubectl apply -f"
alias kg="kubectl get"
alias kd="kubectl describe"
alias kdel="kubectl delete"
alias kl="kubectl logs"
alias kgpo="kubectl get pod"
alias kgd="kubectl get deployments"
alias kc="kubectx"
alias kns="kubens"
alias kl="kubectl logs -f"
alias ke="kubectl exec -it"
alias kcns='kubectl config set-context --current --namespace'
alias podname=''

# HTTP requests with xh!
alias http="xh"

# VI Mode!!!
bindkey jj vi-cmd-mode

# Eza
alias l="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"
alias ltree="eza --tree --level=2  --icons --git"

# SEC STUFF
alias gobust='gobuster dir --wordlist ~/security/wordlists/diccnoext.txt --wildcard --url'
alias dirsearch='python dirsearch.py -w db/dicc.txt -b -u'
alias massdns='~/hacking/tools/massdns/bin/massdns -r ~/hacking/tools/massdns/lists/resolvers.txt -t A -o S bf-targets.txt -w livehosts.txt -s 4000'
alias server='python -m http.server 4445'
alias tunnel='ngrok http 4445'
alias fuzz='ffuf -w ~/hacking/SecLists/content_discovery_all.txt -mc all -u'
alias gr='~/go/src/github.com/tomnomnom/gf/gf'

### FZF ###
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


alias mat='osascript -e "tell application \"System Events\" to key code 126 using {command down}" && tmux neww "cmatrix"'

# Nix!
export NIX_CONF_DIR=$HOME/.config/nix
export PATH=/run/current-system/sw/bin:$PATH
export PATH="$HOME/.cargo/bin:$PATH"

function ranger {
	local IFS=$'\t\n'
	local tempfile="$(mktemp -t tmp.XXXXXX)"
	local ranger_cmd=(
		command
		ranger
		--cmd="map Q chain shell echo %d > "$tempfile"; quitall"
	)

	${ranger_cmd[@]} "$@"
	if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
		cd -- "$(cat "$tempfile")" || return
	fi
	command rm -f -- "$tempfile" 2>/dev/null
}
alias rr='ranger'

# navigation
cx() { cd "$@" && l; }
fcd() { cd "$(find . -type d -not -path '*/.*' | fzf)" && l; }
f() { echo "$(find . -type f -not -path '*/.*' | fzf)" | pbcopy }
fv() { nvim "$(find . -type f -not -path '*/.*' | fzf)" }

 # Nix
 if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
	 . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
 fi
 # End Nix

export XDG_CONFIG_HOME="/home/exul4nzs/.config"

eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"

source ~/.ghcup/env

# Load zsh-vi-mode (add this right after p10k-instant-prompt)
source ~/.zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Cursor customization
ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BEAM
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK

zvm_after_init() {
  bindkey -M vicmd '^R' redo
  autoload -Uz surround
  zle -N delete-surround surround
  zle -N add-surround surround
  zle -N change-surround surround
  bindkey -a cs change-surround
  bindkey -a ds delete-surround
  bindkey -a ys add-surround
  bindkey -M visual s add-surround
}

webinit() {
  # Check if project name is provided
  if [ -z "$1" ]; then
    echo "Usage: webinit <project-name>"
    return 1
  fi

  # Create folder structure
  mkdir -p "$1"/{css,js,images} || {
    echo "Error: Failed to create directories"
    return 1
  }

  # Generate files
  cat > "$1"/index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>${1}</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
  <h1>Hello World!</h1>
  <script src="js/app.js"></script>
</body>
</html>
EOF

  # Add basic CSS
  cat > "$1"/css/style.css << 'EOF'
body {
  font-family: Arial, sans-serif;
  line-height: 1.6;
  margin: 0;
  padding: 20px;
  color: #333;
}
EOF

  # Add basic JS
  cat > "$1"/js/app.js << 'EOF'
console.log("Hello from ${1}!");
EOF

  # Success message
  echo "✅ Web project '$1' created:"
  tree "$1" -L 2
}

