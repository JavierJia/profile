# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
export PS1="\u@\h \w:"

export VIMRUNTIME=/usr/share/vim/vim74b

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
#alias gcc='/usr/gcc_4_7/bin/gcc-4.7'
#alias g++='/usr/gcc_4_7/bin/g++-4.7'
alias cmake='/usr/local/bin/cmake'

alias gocalvin='ssh jianfeng@calvin.calit2.uci.edu'
alias gocode='cd $HOME/workspace/code'
alias gocs222='cd $HOME/workspace/code/cs222'
alias goasterix='cd $HOME/workspace/code/asterix-project'
alias golatex='cd $HOME/workspace/code/latex'
alias goblog='cd $HOME/workspace/github/'
alias gowiki='cd $HOME/software/mediawiki-1.20.1'
alias goipubmed='ssh jianfeng@ipubmed2'
alias gotarget='cd $HOME/workspace/code/asterix-project/fullstack_genomix/genomix/genomix-hyracks/target/appassembler'
alias open='nautilus'
alias nutch='$HOME/software/apache-nutch-1.6/bin/nutch'
alias listen='netstat -atnp|grep LISTEN'
alias goasterix='ssh jjia@asterix-master.ics.uci.edu'
alias gomasterasterix='ssh -X -C asterix-master'

alias ctags='ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .'

export LANG='en_US.utf-8'
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# JAVA
export JAVA_HOME="$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")"
export PATH="$JAVA_HOME/bin:$PATH"

# Lucene
#export LUCENE_HOME="$HOME/software/lucene-${LUCENE_VERSION}.0/build"
#export CLASSPATH="${LUCENE_HOME}/core/lucene-core-${LUCENE_VERSION}-SNAPSHOT.jar:\
#${LUCENE_HOME}/queryparser/lucene-queryparser-${LUCENE_VERSION}-SNAPSHOT.jar:\
#${LUCENE_HOME}/analysis/common/lucene-analyzers-common-${LUCENE_VERSION}-SNAPSHOT.jar:\
#${LUCENE_HOME}/demo/lucene-demo-${LUCENE_VERSION}-SNAPSHOT.jar"
# Pig
export PIG_HOME="$HOME/software/hadoop/pig-0.10.0"
export PATH="$PATH:$HOME/software/hadoop/pig-0.10.0/bin"
alias pig='pig -l ${PIG_HOME}/log'

# Hbase
export PATH="$PATH:$HOME/software/hadoop/hbase-0.94.2/bin"



#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
#source /home/jianfeng/.rvm/scripts/rvm

export YARN_HOME="$HADOOP_HOME"
export NUTCH_RUNTIME_HOME="/home/jianfeng/software/apache-nutch-1.6"

#export PATH=/usr/gcc_4_7/bin:$PATH
#export LD_LIBRARY_PATH=/usr/gcc_4_7/lib:/usr/gcc_4_7/lib64:$LD_LIBRARY_PATH

# NDK
export NDK="$HOME/software/android-ndk-r8e"
export PATH="$NDK:$PATH"
#export ANDROID_NDK_TOOLCHAIN_ROOT="$HOME/software/android-toolchain"
export ANDTOOLCHAIN="$HOME/software/android-cmake/toolchain/android.toolchain.cmake"
alias android-cmake='cmake -DCMAKE_TOOLCHAIN_FILE=$ANDTOOLCHAIN '
export ANDROID_HOME="/home/jianfeng/software/adt-bundle-linux-x86_64-20130522/sdk"
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH"


# LUCENE
export LUCENE_VERSION="4.3.1"
export LUCENEHOME="/home/jianfeng/software/lucene-${LUCENE_VERSION}"
export CLASSPATH=$CLASSPATH:${LUCENEHOME}/core/lucene-core-${LUCENE_VERSION}.jar:${LUCENEHOME}/queryparser/lucene-queryparser-${LUCENE_VERSION}.jar:${LUCENEHOME}/analysis/common/lucene-analyzers-common-${LUCENE_VERSION}.jar:${LUCENEHOME}/demo/lucene-demo-${LUCENE_VERSION}.jar:${LUCENEHOME}/spatial/lucene-spatial-${LUCENE_VERSION}.jar:${LUCENEHOME}/spatial/lib/spatial4j-0.3.jar:${LUCENEHOME}/queries/lucene-queries-${LUCENE_VERSION}.jar

echo -ne "\033]0;${USER}@${HOSTNAME}\007"
