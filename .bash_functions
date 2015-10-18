#! /bin/bash

. ~/.bash_constants

# Unicode printing
ucat() {
  [[ -n "$1" ]] || { echo "Usage: ucat [file]"; return; }
  native2ascii -encoding UTF-8 -reverse $1
}

uconv() {
  [[ -n "$1" ]] || { echo "Usage: uconv [file]"; return; }
  iconv -f euc-kr -t UTF-8 $1 >> tmp.txt
  mv tmp.txt $1
  echo "Converted $1"
}

uconvs() {
  [[ -n "$1" ]] || { echo "Usage: uconvs [some extension]"; return; }
  for file in *.$1
  do
      iconv -f euckr -t utf8 "$file" | sponge "$file"
      echo "Converted $file"
  done
}

uhead() {
  [[ -n "$1" ]] || { echo "Usage: uhead [file]"; return; }
  head $1 | native2ascii -encoding UTF-8 -reverse
}

beamer() {
  cp -r ~/skel/beamer/* .
}

remark() {
  cp -r ~/skel/remark/* .
}

# File conversion
rmd2html() {
    [[ -n "$1" ]] || { echo "Usage: rmd2html [file]"; return; }

    tmp=`mktemp /tmp/XXXXXX.md`
    rscript -e "library(knitr); knit('$1', '$tmp');" > /tmp/null

    #TODO: Get optional parameter for css file
    html="${1%.*}.html"
    echo "create $html"
    if [ -f "css/custom-bootstrap.css" ]; then
        echo "include custom-bootstrap.css"
        pandoc $tmp -o $html -c css/custom-bootstrap.css
    else
        pandoc $tmp -o $html
    fi

    echo "cleaning up..."
    rm -f $tmp
    echo "done"
    open $html
}

# Hacker's diary
diary() {
    [[ -n "$1" ]] || { echo "Usage: diary [title]"; return; }

    dir=$DIARY_DIR
    #TODO: filename - transliterate hangul to roman letters
    strip=${1//-/}
    merge=${strip// /-}
    clean=${merge//[^a-zA-Z0-9\-]/}
    lower="$(echo $clean | tr '[:upper:]' '[:lower:]')"
    short="${lower:0:30}"
    final=${short//-./.}
    fname=$dir/$(date "+%Y")/$(date "+%Y-%m-%d")-$final.md
    echo $fname

    temp[0]="---"
    temp[1]="layout: diary"
    temp[2]="title: \"$1\""
    temp[3]="date: $(date '+%Y-%m-%d %H:%M')"
    temp[4]="comments: false"
    temp[5]="categories: []"
    temp[6]="original: null"
    temp[7]="---"

    printf "%s\n" "${temp[@]}" > $fname
    vi $fname
}

# Meeting logs
meeting() {
    [[ -n "$1" ]] || { echo "Usage: meeting [title]"; return; }

    dir=$MEETING_DIR
    strip=${1//-/}
    merge=${strip// /-}
    clean=${merge//[^a-zA-Z0-9\-]/}
    lower="$(echo $clean | tr '[:upper:]' '[:lower:]')"
    short="${lower:0:30}"
    final=${short//-./.}
    fname=$dir/$(date "+%Y-%m-%d")-$final.md
    echo $fname

    temp[0]="---"
    temp[1]="layout: meeting"
    temp[2]="title: \"$1\""
    temp[3]="date: $(date '+%Y-%m-%d %H:%M')"
    temp[4]="comments: false"
    temp[5]="categories: []"
    temp[6]="original: null"
    temp[7]="---"

    printf "%s\n" "${temp[@]}" > $fname
    vi $fname
}


# Research logs
research() {
    dir=$RESEARCH_DIR
    fname=$dir/$(date "+%Y-%m-%d").md
    echo $fname
    vi $fname
}

log() {
    if [ $1 ]; then
        dir=$1
        mkdir -p $dir
    else
        dir='.'
    fi
    fname=$dir/$(date "+%Y-%m-%d-%H%M%S").txt
    echo $fname
    vi $fname
}

bill() {
  # TODO: check file existance
  [[ -n "$1" ]] || { echo "Usage: bill [billnum]"; return; }
  dir="/home/e9t/data/popong/bill-docs/txt"
  aid=`expr ${1:0:2} + 0`
  fname=$dir/$aid/$1.txt
  vi $fname
}

# Get apt-history
function apt-history(){
      case "$1" in
        install)
              cat /var/log/dpkg.log | grep 'install '
              ;;
        upgrade|remove)
              cat /var/log/dpkg.log | grep $1
              ;;
        rollback)
              cat /var/log/dpkg.log | grep upgrade | \
                  grep "$2" -A10000000 | \
                  grep "$3" -B10000000 | \
                  awk '{print $4"="$5}'
              ;;
        *)
              cat /var/log/dpkg.log
              ;;
      esac
}

# Compile TeX and open pdf
function ctex() {
    [[ -n "$1" ]] || { echo "Usage: ctex [somefile].tex"; return; }
    pdflatex -shell-escape $1
    bibtex ${1/.tex}.aux
    pdflatex $1
    pdflatex $1
    open ${1/.tex}.pdf
}

