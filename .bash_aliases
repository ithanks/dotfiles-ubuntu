# Enable colors in bash
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagacedx
export PS1='\n\[\033[01;35m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '

# Some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias rm='rm -i'
alias tl='tree -L 2'
alias pop='ssh lucypark@125.131.72.52'
alias dmlab='ssh lucypark@147.46.94.186'
alias pyserv='python -m SimpleHTTPServer'
alias profile='python -m cProfile'
alias profilec='python -m cProfile --sort=cumulative'
alias ipynote='ipython notebook'
alias gae='dev_appserver.py --port=8192 .'
alias gaeup='appcfg.py update .'
alias start_apache='sudo /etc/init.d/apache2 start'
alias restart_apache='sudo /etc/init.d/apache2 restart'
alias stop_apache='sudo /etc/init.d/apache2 stop'
alias start_mongo='mongod --fork'
alias stop_mongo='killall -SIGTERM mongod 2>/dev/null'
alias status_mongo="killall -0 mongod 2>/dev/null; if [ \$? -eq 0 ]; then echo 'started'; else echo 'stopped'; fi"
alias start_pg='pg_ctl -D /usr/local/var/postgres -l logfile start'
alias stop_pg='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias status_pg='pg_ctl -D /usr/local/var/postgres status'
alias start_gw='git instaweb --httpd=webrick --browser=google-chrome'
alias stop_gw='git instaweb --stop'
alias gw='open http://localhost:1234/?o=age'
alias f='nautilus .'
alias ah='apt-history | grep " install " | tail'
alias open='gnome-open'
alias chrome='/usr/bin/google-chrome'
alias lc='wc -l *.py'
alias dpd='find . -name "*.py" | xargs grep import'
alias psql='sudo -u postgres psql'
alias lgdb='mysql -h 147.46.94.251 -u root lgtv'
alias mysql='mysql -u root -p'
alias gaeup='~/bin/gae/appcfg.py update ~/dev/sites/snuie.org'
alias duh='du -d 0 -h'
alias subl='$HOME/bin/Sublime\ Text\ 2/sublime_text'
alias plot='$HOME/dev/utils/plot.py'
alias gephi='$HOME/bin/gephi/bin/gephi'

# SCM Breeze
[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

# z
. "$HOME/bin/z/z.sh"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# rJava
export LD_LIBRARY_PATH="/usr/lib/jvm/default-java/jre/lib/amd64/server"

# MATLAB
export PATH="$PATH:$HOME/bin/matlab/r2013b/bin"

# Mendeley
export PATH="$PATH:$HOME/bin/mendeleydesktop-1.10.1-linux-x86_64/bin"

# Intellij by JetBrains
export PATH="$PATH:$HOME/bin/idea-IC-129.713/bin"

# PGF Plots
export TEXINPUTS="$HOME/bin/latex/pgfplots_1.10/tex//:"

# Hannanum
export CLASSPATH="$CLASSPATH:$HOME/dev/pkgs/java/hannanum/0.8.4/en/jhannanum.jar"
