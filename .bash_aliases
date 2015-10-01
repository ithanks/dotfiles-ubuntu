# Enable colors in bash
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagacedx
export PS1='\n\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '

# Some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias rm='rm -i'
alias tl='tree -L 2'
alias pop='ssh lucypark@popong.com'
alias dmlab='ssh dmlab@hosting01.snu.ac.kr'
alias pyserv='python -m SimpleHTTPServer'
alias profile='python -m cProfile'
alias profilec='python -m cProfile --sort=cumulative'
alias profilen='python -m cProfile --sort=calls'
alias ipynote='ipython notebook --no-browser --port=8889'
alias gae='$HOME/bin/google_appengine/dev_appserver.py --port=8192 .'
alias gaeup='$HOME/bin/google_appengine/appcfg.py update .'
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
alias duh='du -d 0 -h'
alias subl='$HOME/bin/Sublime\ Text\ 2/sublime_text'
alias plot='$HOME/dev/utils/plot.py'
alias gephi='$HOME/bin/gephi/bin/gephi'
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
alias ports="sudo netstat -plnt"
alias sitespeed.io="$HOME/bin/sitespeed.io/bin/sitespeed.io"
alias gistup="gistup --private --"
alias lg="ssh lucypark@147.46.94.57"
alias autodoc="cd ~/dev/my/konlpy; sphinx-apidoc -o docs/api konlpy corpus"
alias fnlab="mysql -h 58.229.6.72 -u rucy fnlab"
alias venv="source venv/bin/activate"
alias venvp="cd venv/local/lib/python2.7/site-packages"
alias pyp="cd /usr/local/lib/python2.7/dist-packages"
alias docs="cd $HOME/Dropbox/docs/"
alias dmweb="ssh epark@110.10.174.85"
alias monitor="cvt 1920 1080 60; xrandr --newmode '1920x1080_60.00' 146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync; xrandr --addmode DP1 '1920x1080_60.00'; xrandr --output DP1 --rotate left"
alias trackpad="xinput set-prop 11 'Device Enabled' 0"
alias pyspark="$HOME/dev/pkgs/spark-1.5.0-bin-hadoop2.6/bin/pyspark"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias pfg="pip freeze | grep"
alias agi="ag --ignore-dir"
alias sourceb="source ~/.bashrc"
alias p="python"
alias htop="htop -u $USER"


# SCM Breeze (should come after loading rvm)
[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

# z
. "$HOME/bin/z/z.sh"

# texlive 2014
export PATH="/opt/texbin:$PATH"

# rJava
export LD_LIBRARY_PATH="/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/server"

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

# nvm
[ -s "$HOME/.nvm/nvm.sh" ] && . "$HOME/.nvm/nvm.sh"

# javahome
export JAVA_HOME="/usr/lib/jvm/java-7-openjdk-amd64"

# Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# cuda
export CUDA_ROOT=/usr/local/cuda-7.0/bin
export PATH=$CUDA_ROOT:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-7.0/lib64:$LD_LIBRARY_PATH

# virtualenvwrapper
export WORKON_HOME=~/envs
mkdir -p $WORKON_HOME
source /usr/local/bin/virtualenvwrapper.sh

# torch
. $HOME/torch/install/bin/torch-activate

# hadoop
export HADOOP_MAPRED_HOME=/usr/lib/hadoop-mapreduce

# [fuel](https://github.com/mila-udem/fuel)
export FUEL_DATA_PATH=$HOME/data/fuel

# conda
export PATH="/home/epark/miniconda/bin:$PATH"
export PATH="/home/epark/miniconda3/bin:$PATH"

# numba
export LLVM_CONFIG="/usr/bin/llvm-config"
