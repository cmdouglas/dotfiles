# -------------------------------------------------------------------
# use nocorrect alias to prevent auto correct from "fixing" these
# -------------------------------------------------------------------
#alias foobar='nocorrect foobar'
#alias g8='nocorrect g8'

# -------------------------------------------------------------------
# directory movement
# -------------------------------------------------------------------
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias 'bk=cd $OLDPWD'

# -------------------------------------------------------------------
# directory information
# -------------------------------------------------------------------
alias lh='ls -d .*' # show hidden files/directories only
alias lsd='ls -aFhlG'
alias l='ls -al'

if [[ $IS_MAC -eq 1 ]]; then
	alias ls='ls -GFh' # Colorize output, add file type indicator, and put sizes in human readable format
else
	alias ls='ls --color=auto -Gfh'
fi
alias ll='ls -GFhl' # Same as above, but in long listing format
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
alias 'dus=du -sckx * | sort -nr' #directories sorted by size

alias 'wordy=wc -w * | sort | tail -n10' # sort files in current directory by the number of words they contain
alias 'filecount=find . -type f | wc -l' # number of files (not directories)

# -------------------------------------------------------------------
# Mac only
# -------------------------------------------------------------------
if [[ $IS_MAC -eq 1 ]]; then
    alias ql='qlmanage -p 2>/dev/null' # OS X Quick Look
    alias oo='open .' # open current directory in OS X Finder
    alias 'today=calendar -A 0 -f /usr/share/calendar/calendar.mark | sort'
    alias 'mailsize=du -hs ~/Library/mail'
    alias 'smart=diskutil info disk0 | grep SMART' # display SMART status of hard drive
    # Hall of the Mountain King
    alias cello='say -v cellos "di di di di di di di di di di di di di di di di di di di di di di di di di di"'
    # alias to show all Mac App store apps
    alias apps='mdfind "kMDItemAppStoreHasReceipt=1"'
    # reset Address Book permissions in Mountain Lion (and later presumably)
    alias resetaddressbook='tccutil reset AddressBook'
    # refresh brew by upgrading all outdated casks
    alias refreshbrew='brew outdated | while read cask; do brew upgrade $cask; done'
    # rebuild Launch Services to remove duplicate entries on Open With menu
    alias rebuildopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.fram ework/Support/lsregister -kill -r -domain local -domain system -domain user'
fi


# -------------------------------------------------------------------
# remote machines
# -------------------------------------------------------------------


# -------------------------------------------------------------------
# database
# -------------------------------------------------------------------
alias 'psqlstart=/usr/local/pgsql/bin/pg_ctl -D /usr/local/pgsql/data -l logfile start'
alias 'psqlstop=/usr/local/pgsql/bin/pg_ctl stop'
alias mysql='mysql -u root'
alias mysqladmin='mysqladmin -u root'

# gu shows a list of all developers and the number of commits they've made
alias gu="git shortlog | grep -E '^[^ ]'"

# -------------------------------------------------------------------
# Python venv 
# -------------------------------------------------------------------

activate() {
	if [ -f ./bin/activate ]; then
		source ./bin/activate;
	fi
}


# alias to cat this file to display
alias acat='< ~/.zsh/aliases.zsh'
alias fcat='< ~/.zsh/functions.zsh'
alias sz='source ~/.zshrc'

# copy .htaccess files for zanshin.net and its image sub-directory
alias 'htaccess=scp /Users/mark/Projects/octopress/zanshin/source/htaccess/.htaccess markn@markn.webfactional.com:~/webapps/zanshin ; scp /Users/mark/Projects/octopress/zanshin/source/images/.htaccess markn@markn.webfactional.com:~/webapps/zanshin/images ;'

# deploy zanshin.net and move its .htaccess files
alias 'dz=deploy ; htaccess ;'

# -------------------------------------------------------------------
# Source: http://aur.archlinux.org/packages/lolbash/lolbash/lolbash.sh
# -------------------------------------------------------------------
alias wtf='dmesg'
alias onoz='cat /var/log/errors.log'
alias rtfm='man'
alias visible='echo'
alias invisible='cat'
alias moar='more'
alias icanhas='mkdir'
alias donotwant='rm'
alias dowant='cp'
alias gtfo='mv'
alias hai='cd'
alias plz='pwd'
alias inur='locate'
alias nomz='ps aux | less'
alias nomnom='killall'
alias cya='reboot'
alias kthxbai='halt'