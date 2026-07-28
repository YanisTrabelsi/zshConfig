# zshConfig

Ma configuration `.zsh` personnelle : [Oh My Zsh](https://ohmyz.sh/) + [Powerlevel10k](https://github.com/romkatv/powerlevel10k), quelques outils modernes en remplacement des commandes classiques, et des alias/fonctions utiles au quotidien (dont plusieurs pour la Norme 42).

## Contenu

- **`.zshrc`** — la configuration à installer dans `$HOME`
- **`install.sh`** — script d'installation

## Prérequis

Avant d'installer cette config, assure-toi d'avoir :

- [Zsh](https://www.zsh.org/)
- [Oh My Zsh](https://ohmyz.sh/#install)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k#installation) (thème du prompt)
- Les plugins Oh My Zsh suivants :
  - [`zsh-autosuggestions`](https://github.com/zsh-users/zsh-autosuggestions)
  - [`zsh-syntax-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting)
  - `git`, `virtualenv`, `rust` (fournis nativement par Oh My Zsh)

Outils modernes optionnels (détectés automatiquement s'ils sont installés, sinon simplement ignorés) :

- [`zoxide`](https://github.com/ajeetdsouza/zoxide) — `cd` intelligent
- [`eza`](https://github.com/eza-community/eza) — remplace `ls`
- [`bat`](https://github.com/sharkdp/bat) — remplace `cat`

## Installation

```bash
git clone git@github.com:YanisTrabelsi/zshConfig.git
cd zshConfig
source ./install.sh
```

Le script :
1. Sauvegarde ton `~/.zshrc` existant en `~/.zshrc.bak` (s'il y en a un)
2. Installe le nouveau `.zshrc` dans `$HOME`
3. Supprime le dossier cloné, devenu inutile une fois l'installation faite

Ouvre un nouveau terminal (ou lance `zzsh`, voir plus bas) pour charger la nouvelle configuration.

## Ce que contient le `.zshrc`

### Prompt

- Instant prompt Powerlevel10k
- Thème `robbyrussell` par défaut pour Oh My Zsh (le rendu réel est piloté par Powerlevel10k via `p10k configure`, qui génère `~/.p10k.zsh`)

### Plugins Oh My Zsh

| Plugin | Rôle |
|---|---|
| `git` | Raccourcis et infos Git dans le prompt |
| `virtualenv` | Affiche le venv Python actif |
| `rust` | Complétion pour Rust |
| `zsh-autosuggestions` | Suggère la fin des commandes déjà tapées |
| `zsh-syntax-highlighting` | Colore la commande selon sa validité |

### Fonctions

| Fonction | Usage |
|---|---|
| `mkvenv <nom>` | Crée puis active un environnement virtuel Python |

### Alias

| Alias | Effet |
|---|---|
| `cccc` | `cc -Werror -Wall -Wextra` |
| `ccc` | `cc -Werror -Wextra -Wall *.c` |
| `c` | `clear` |
| `nrm` | `norminette` |
| `wnrm` | `watch -n1 norminette` — relance la norminette chaque seconde |
| `f8` | `flake8` |
| `ff8` | `flake8 *.py` |
| `p3` | `python3 *.py` |
| `pp3` | `python3` |
| `zzsh` | Recharge `~/.zshrc` sans redémarrer le terminal |
| `cddev` | `cd ~/developer/42` |
| `mivn` | Lance Neovim avec la config `~/.config/mivn` |
| `nivm` | Lance Neovim avec la config `~/.config/nivm` |
| `ls`, `ll`, `lt` | Remplacées par `eza` (si installé) |
| `cat` | Remplacée par `bat`/`batcat` (si installé) |
