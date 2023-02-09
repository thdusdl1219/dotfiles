#zmodload zsh/zprof
[[ $COLORTERM = *(24bit|truecolor)* ]] || zmodload zsh/nearcolor


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# source ZPlug
# source ~/.zplug/init.zsh
source <(curl -sL init.zshell.dev); zzinit

# antigen
# antigen use oh-my-zsh
 # antigen bundle git
##antigen bundle marlonrichert/zsh-autocomplete
 # antigen bundle command-not-found
 # zi load andrewferrier/fzf-z
 zi load changyuheng/zsh-interactive-cd
 zi load z-shell/H-S-MW
 zi load supercrabtree/k
 zi load clvv/fasd

 zi light zsh-users/zsh-autosuggestions
 zi light z-shell/z-a-meta-plugins

 #zi snippet PZT::modules/helper/init.zsh
 zi light-mode for @annexes @romkatv \
   @z-shell @fuzzy @py-utils @console-tools @ext-git #@prezto



# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# autosuggestions color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

source ~/.env.zsh
