# History stuff. No dupes or lines starting with space. Save history on each prompt. Etc. -KR 2011-03-04
HISTCONTROL=ignoreboth
PROMPT_COMMAND=' history -a'
shopt -s histappend
shopt -s cmdhist
HISTSIZE=10000
HISTFILESIZE=10000
HISTTIMEFORMAT="%F_%T "
