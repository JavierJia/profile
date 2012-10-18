export PS1="\u@\w:"

# functions
function mv2dir(){
	[ -d $HOME/.removed ] || mkdir $HOME/.removed
	mv -f $@ $HOME/.removed/
}

alias l="ls -lhtrG"      # show detailed info
alias ll="ls -lhtrG "    # show detailed info
alias la="ls -AlGa "       # show hidden files
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

alias gocode='cd $HOME/workplace/code'
alias gocs222='cd $HOME/workplace/code/github/DBMG-PRJ'
alias goasterix='cd $HOME/workplace/code/asterix'
alias golatex='cd $HOME/workplace/reference/latex'
alias goblog='cd $HOME/workplace/code/github/javierjia.github.com/'

alias ctags='ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .'

export LANG='en_US.utf-8'
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
