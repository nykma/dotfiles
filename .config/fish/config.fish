export XDG_CONFIG_HOME="$HOME/.config"
export LANG="zh_CN.UTF-8"
export VISUAL="emacsclient -t"
export EDITOR="emacsclient -t"
export TZ="Asia/Shanghai"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/keyring/ssh"

# set PATH "/usr/local/texlive/2015/bin/x86_64-linux" "$HOME/.bin" $PATH

function l
  ls -lah $argv
end

function m
  git add . -A
  git commit -m $argv
end

function wow
  git status
end

# env -i HOME=$HOME dash -l -c 'export -p' | sed -e "/PATH/s/'//g;/PATH/s/:/ /g;s/=/ /;s/^export/set -x/" | source

function p
  proxychains4 -q $argv
end

function d
  sudo docker $argv
end

function local-server
  python -m SimpleHTTPServer $argv
end

function -e fish_preexec _run_fasd
  fasd --proc (fasd --sanitize $argv | tr -s ' ' \n) > /dev/null 2>&1
end


function j
  set -l dir (fasd -de "printf %s" "$argv")
  if test "$dir" = ""
    echo "no matching directory"
    return 1
  end
  cd $dir
end

# function l
  # ls -latrh (fasd -d -e 'printf %s' "$argv")
# end

function v
  fasd -f -e vim 'printf %s' "$argv"
end

function a
  fasd -A .
end

#this script can never fail
#i use it in the fish_config
#call it with start_agent

setenv SSH_ENV $HOME/.ssh/environment

function start_agent
  if [ -n "$SSH_AGENT_PID" ]
    ps -ef | grep $SSH_AGENT_PID | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
      test_identities
    end
  else
    if [ -f $SSH_ENV ]
      . $SSH_ENV > /dev/null
    end
    ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
      test_identities
    else
      echo "Initializing new SSH agent ..."
      ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
      echo "succeeded"
      chmod 600 $SSH_ENV
      . $SSH_ENV > /dev/null
      ssh-add
    end
  end
end


function test_identities
  ssh-add -l | grep "The agent has no identities" > /dev/null
  if [ $status -eq 0 ]
    ssh-add
    if [ $status -eq 2 ]
      start_agent
    end
  end
end


function fish_title
    if [ $_ = 'fish' ]
	echo (prompt_pwd)
    else
        echo $_
    end
end

alias e="emacsclient -t"

set fish_greeting ""

rbenv rehash > /dev/null ^&1
