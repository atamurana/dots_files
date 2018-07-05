[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

export LANG="ru_RU.UTF-8"
export LC_COLLATE="ru_RU.UTF-8"
export LC_CTYPE="ru_RU.UTF-8"
export LC_MESSAGES="ru_RU.UTF-8"
export LC_MONETARY="ru_RU.UTF-8"
export LC_NUMERIC="ru_RU.UTF-8"
export LC_TIME="ru_RU.UTF-8"

# Aliases
alias g='git'
alias b='bundle install'
alias bu='bundle exec'
alias ll='ls -lah'
alias st='sublime'

alias pg-start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg-stop='pg_ctl -D /usr/local/var/postgres stop'
alias pg-start-old='/usr/local/Cellar/postgresql@9.5/9.5.7/bin/pg_ctl -D /usr/local/var/postgres95 -l /usr/local/var/postgres95/server.log start'
alias pg-stop-old='/usr/local/Cellar/postgresql@9.5/9.5.7/bin/pg_ctl -D /usr/local/var/postgres95 stop'

export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=fxfxcxdxbxegedabagacad

# Константы цветов
COLOR_YELLOW="\[\e[33;10m\]"
COLOR_RED="\[\e[31;10m\]"
COLOR_GREEN="\[\e[32;10m\]"
COLOR_BLUE="\[\e[36;10m\]"
COLOR_NONE="\[\e[0m\]"
COLOR_NONEP="\[\e[38;0m\]"

# Статус репозитория
git_dirty_flag() {
  git status 2> /dev/null | grep -c : | awk '{if ($1 > 0) print "‚ö°"}'
}

# Ветка
parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

prompt_func() {
  prompt="${COLOR_NONE}\w${COLOR_GREEN}$(parse_git_branch)${COLOR_YELLOW}$(git_dirty_flag)${COLOR_NONEP}"
  # Если предыдущая команда завершилась неудачно
  if test $? -eq 0
  then
    PS1="${prompt}${COLOR_NONEP}${COLOR_NONE} " # Подсветить ее вывод красным
  else
    PS1="${prompt}${COLOR_RED}${COLOR_NONE} "
  fi
}

PROMPT_COMMAND=prompt_func

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="/usr/local/opt/qt/bin:$PATH"

