hn=$(hostname -f)
case $TERM in
*xterm*|*rxvt*)
    PS1='\[\e]0;\u@${hn}:\w\007\]'
    ;;
*)
    PS1=
esac
GIT_PS1_SHOWDIRTYSTATE=1

if [ "$UID" = 0 -o "$EUID" = 0 ]; then
    PS1=${PS1}'\[\e[30;1m\]\D{%Y-%m-%d} \A|\[\e[0m\] \[\e[31;1m\]\u\[\e[0;31m\]@\[\e[0m\e[1;31m\]${hn}\[\e[0m\]\[\e[34;1m\][\w]\[\e[0m\] \[\e[33m\]$(__git_ps1 "(%s)")\[\e[0m\]\n\$ '
else
    PS1=${PS1}'\[\e[30;1m\]\D{%Y-%m-%d} \A|\[\e[0m\] \[\e[36m\]\u\[\e[36;1m\]@\[\e[0m\e[36m\]${hn}\[\e[0m\]\[\e[34;1m\][\w]\[\e[0m\] \[\e[33m\]$(__git_ps1 "(%s)")\[\e[0m\]\n\$ '
fi
