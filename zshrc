#zmodload zsh/zprof
[[ $COLORTERM = *(24bit|truecolor)* ]] || zmodload zsh/nearcolor


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source <(curl -sL init.zshell.dev); zzinit

 zi load changyuheng/zsh-interactive-cd
 # zi load changyuheng/zsh-interactive-cd
 zi load z-shell/H-S-MW
 zi load supercrabtree/k
 zi load clvv/fasd
 zi load agkozak/zsh-z


# zi ice lucid wait'0'

 zi light zsh-users/zsh-autosuggestions
 zi light z-shell/z-a-meta-plugins

 zi pack"binary" for fzf
 
 zi ice lucid wait has'fzf'
 zi light Aloxaf/fzf-tab
 zi load andrewferrier/fzf-z
 zi light joshskidmore/zsh-fzf-history-search
 zi light ael-code/zsh-plugin-fasd-fzf
 zi snippet OMZP::fzf

 zi light-mode for @annexes @romkatv \
    @fuzzy \
    @ext-git @console-tools @z-shell

# https://wiki.zshell.dev/ecosystem/plugins/h-s-mw
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_all_dups   # remove older duplicate entries from the history
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_reduce_blanks     # remove superfluous blanks from history items
setopt hist_save_no_dups      # do not write a duplicate event to the history file
setopt share_history          # share command history data

HISTFILE=~/.zsh_history
HISTSIZE=10000000
#SAVEHIST=10000000

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# autosuggestions color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

source ~/.env.zsh

