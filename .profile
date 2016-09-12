
if [[ "$SHELL" == "/bin/bash" ]]; then
	unalias -a
elif [[ "$SHELL" == "/bin/zsh" ]]; then
	unalias -m "*"
fi

set -o vi

export H=$HOME

if [[ -e "$HOME/sw/maven" ]]; then
  export M2_HOME=$HOME/sw/maven
  export PATH=$PATH:$M2_HOME/bin
fi

if [[ -d "/home/ec2-user/bin/jdk1.7.0" ]]; then
	export JAVA_HOME=/home/ec2-user/bin/jdk1.7.0
	export PATH=$PATH:$JAVA_HOME/bin
fi

if [[ -d /home/ec2-user/sw/go/bin ]] ; then
	export PATH=$PATH:/home/ec2-user/sw/go/bin
fi

alias h='cd ~'
alias cls=clear

alias vi='vim'

alias ls='ls -G'
alias l='ls -ltr'
alias ll='ls -l'
alias la='ls -a'

alias clsl='cls;l'
alias clls='clsl'
alias clll='cls;ll'
alias clsll='cls;ll'
alias clsls='cls;ls'
alias s="cd ${H}/scripts"
alias src="cd ${H}/src"
alias repo="cd ${H}/repo"
alias bin="cd ${H}/bin"
alias u="cd ${H}/util"

alias grep='grep --color'

alias via='vi ~/.profile; apply'
alias apply='. ~/.profile; echo \\o/'
alias virc='vi ~/.vimrc'

alias tmp='cd ~/tmp'
alias sw='cd ~/sw'

alias www='cd /var/www'
alias wlog='cd /var/log'
alias log='cd /var/log'
alias conf='cd /etc/lighttpd/'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias sls='screen -ls'
alias sR='screen -R'
alias visc='vi ~/.screenrc'
alias tls='tmux ls'
alias ta='tmux attach -t'
alias vit='vi ~/.tmux.conf'

alias t0='tail -q -n0 -F'

alias lp="_lp"

alias 3d='cal -3'
alias y='cal -y'

alias md='/home/ec2-user/sw/Markdown_1.0.1/Markdown.pl'

alias push_to_gh="git push origin master"

########################
# Functions
########################

function _lp(){
    if [[ -z $1 ]]; then
        command lp
    else
        c1=$(echo "$1" | cut -c1)
        if [[ $c1 == "/" ]]; then
            echo $1
        else
            fp="$(pwd)/$1"
            if [[ ! -f $fp ]]; then
                echo "no such file exists"
            else
                echo $fp
            fi
        fi
    fi

}

alias gs='git status'
alias gd='git diff'
alias gb='git branch'
alias gc='git checkout'

alias pallete='for i in {0..255} ; do printf "\x1b[38;5;${i}mcolour${i}\n"; done'

alias viz='vi ~/.zshrc'

alias senv="echo \"set -o vi; alias cls='clear'; alias l='ls -ltr'; alias clsl='cls;l'; alias t0='tail -F -n0 -q'; \""

