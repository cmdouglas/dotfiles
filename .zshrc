source ~/.zsh/checks.zsh
source ~/.zsh/colors.zsh
source ~/.zsh/setopt.zsh
source ~/.zsh/exports.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/bindkeys.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/history.zsh
source ~/.zsh/zsh_hooks.zsh

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# work stuff
# source ~/.zsh/work.zsh
source ~/.zsh/work-vpn-cisco.zsh

PATH=/usr/local/opt/ruby/bin:/usr/local/share/npm/bin:/usr/local/sbin:/usr/local/bin:$PATH
PATH=$HOME/.local/bin:$PATH:

fortune | cowsay
