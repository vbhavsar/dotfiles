if [[ "$SHELL" == "/bin/bash" ]]; then
        unalias -a
elif [[ "$SHELL" == "/bin/zsh" ]]; then
        unalias -m "*"
fi

set -o vi

export H=$HOME

if [[ -z $TMP && -d $H/tmp ]]; then
        export TMP=$H/tmp
else
        export TMP=/tmp
fi

if [[ -d "/home/ec2-user/bin/jdk1.7.0" ]]; then
        export JAVA_HOME=/home/ec2-user/bin/jdk1.7.0
        export PATH=$PATH:$JAVA_HOME/bin
fi

alias h='cd ~'
alias cls=clear

alias ls='ls --color'
alias l='ls -ltr'
alias la='ls -a'

alias clsl='cls;l'
alias clls='clsl'
alias cd='_cd'
alias s="cd ${H}/scripts"
alias src="cd ${H}/src"
alias repo="cd ${H}/repo"
alias bin="cd ${H}/bin"
alias u="cd ${H}/util"

alias grep='grep --color'

alias via='vi ~/.profile; apply'
alias apply='. ~/.profile'
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

alias t0='tail -q -n0 -F'

alias lp="_lp"

alias 3d='cal -3'
alias y='cal -y'

########################
# Functions
########################

function _cd(){
	if [ -z $2 ]; then
		command cd $@
	else
		cd $(echo `pwd` | sed "s/$1/$2/")
	fi
}

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


