# ============================================================
# Powerlevel10k — instant prompt
# Doit rester tout en haut du fichier. Tout ce qui affiche un
# prompt interactif (mot de passe, confirmation [y/n], etc.)
# doit être placé AVANT ce bloc, le reste peut aller après.
# ============================================================
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Si tu viens de bash, il faut parfois ajuster $PATH ici.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# ============================================================
# Oh My Zsh
# ============================================================
export ZSH="$HOME/.oh-my-zsh"

# Complétion sensible à la casse (majuscules/minuscules distinctes)
CASE_SENSITIVE="true"

# Thème du prompt (ici géré par Powerlevel10k via p10k configure,
# mais oh-my-zsh a quand même besoin d'une valeur)
ZSH_THEME="robbyrussell"

# Plugins chargés par oh-my-zsh (liste unique, fusionnée)
# - git                    : raccourcis et infos git dans le prompt
# - virtualenv             : affiche le venv Python actif
# - rust                   : complétion pour Rust
# - zsh-autosuggestions    : suggère la fin des commandes déjà tapées
# - zsh-syntax-highlighting: colore la commande en fonction de sa validité
plugins=(git virtualenv rust zsh-autosuggestions zsh-syntax-highlighting)

# Charge oh-my-zsh (doit venir après ZSH_THEME et plugins)
source $ZSH/oh-my-zsh.sh

# Charge la config Powerlevel10k si elle existe (générée par `p10k configure`)
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ============================================================
# Outils modernes (installés séparément, pas via oh-my-zsh)
# ============================================================

# zoxide : "cd" intelligent qui retient tes dossiers fréquents.
# Une fois initialisé, tape "z <partie_du_nom>" pour y sauter.
if command -v zoxide &> /dev/null; then
	eval "$(zoxide init zsh)"
fi

# eza : remplace "ls" avec couleurs, icônes et statut git
if command -v eza &> /dev/null; then
	alias ls="eza --icons --group-directories-first"
	alias ll="eza -la --icons --group-directories-first"
	alias lt="eza --tree --icons"
fi

# bat : remplace "cat" avec coloration syntaxique
if command -v bat &> /dev/null; then
	alias cat="bat --paging=never"
elif command -v batcat &> /dev/null; then
	alias cat="batcat --paging=never"
fi

# ============================================================
# Fonctions perso
# ============================================================

# Crée et active un environnement virtuel Python
# Usage : mkvenv <nom>
mkvenv() {
	if [ -z "$1" ]; then
		echo "Usage: mkvenv <name>"
		return 1
	fi
	echo "==> Creating venv '$1'..."
	python3 -m venv "$1"
	source "$1/bin/activate"
	echo "==> $1 created !"
}

# ============================================================
# Alias
# ============================================================

# Compilation C stricte (utile pour la Norme 42)
alias cccc="cc -Werror -Wall -Wextra"
alias ccc="cc -Werror -Wextra -Wall *.c"

alias c="clear"

# Norminette (vérificateur de norme 42)
alias nrm="norminette"
alias wnrm="watch -n1 norminette"   # relance la norminette toutes les secondes

# Python
alias f8="flake8"
alias ff8="flake8 *.py"
alias p3="python3 *.py"
alias pp3="python3"

# Recharge la config zsh sans redémarrer le terminal
alias zzsh="source ~/.zshrc; echo '==> zshrc reloaded !'"

# Raccourci vers le dossier de travail 42
alias cddev="cd ~/developer/42"

# Lance Neovim avec une config alternative (dossiers ~/.config/mivn et nivm)
alias mivn='NVIM_APPNAME=mivn nvim'
alias nivm='NVIM_APPNAME=nivm nvim'
