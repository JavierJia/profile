export PS1="\u@\w:"

# functions
function mv2dir(){
	[ -d $HOME/.removed ] || mkdir $HOME/.removed
	mv -f $@ $HOME/.removed/
}

alias l="ls -lhtrG"      # show detailed info
alias ll="ls -lhtrG "      # show detailed info
alias la="ls -AlG "       # show hidden files
alias lt="ls -ltcrG "     # sort by change time
alias lx="ls -lXBG "      # sort by extension
alias lr="ls -lRG "       # recursive ls
alias lS="ls -lhSG "      # sort by size
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias rm="mv2dir "

alias du='du -d1 -h'

alias mysqlstart='sudo /opt/local/bin/mysqld_safe5 &' 
alias mysqlstop='/opt/local/bin/mysqladmin5 -u root -p shutdown' 

alias gocode='cd $HOME/workplace/code'

export LANG='utf-8'
