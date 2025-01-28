function peco_select_history_order
  if test (count $argv) = 0
    set peco_flags --layout=top-down
  else
    set peco_flags --layout=bottom-up --query "$argv"
  end

  history|peco $peco_flags|read foo

  if [ $foo ]
    commandline $foo
  else
    commandline ''
  end
end

function history
  builtin history --show-time='%Y/%m/%d %H:%M:%S ' | sort
end

function peco_ghq
  set -l query (commandline)

  if test -n $query
    set peco_flags --query "$query"
  end

  ghq list --full-path | peco $peco_flags | read recent
  if [ $recent ]
    cd $recent
    commandline -r ''
    commandline -f repaint
  end
end

function fish_user_key_bindings
  bind \cr peco_select_history_order
  bind \co peco_ghq
end

function fish_prompt
    if [ $status -eq 0 ]
        set status_face (set_color green)"(*´ω｀*) < "
    else
        set status_face (set_color red)"｡+ﾟ(∩´﹏'∩)ﾟ+｡ < "
    end
    printf '%s %s' (set_color yellow)(prompt_pwd) $status_face
end

# aliases
alias xcode="open -a /Applications/Xcode-16.0.0.app"

# Setting PATH for Python 3.10
# The original version is saved in /Users/toshiyukimannen/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.10/bin" "$PATH"

set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin
set -x PATH  $PATH $(go env GOPATH)/bin
set -x PATH $PATH $HOME/development/flutter/bin

set -x PATH $PATH $HOME/.pub-cache/bin
eval (direnv hook fish)

set -g JAVA_HOME $JAVA_HOME /opt/homebrew/Caller/openjdk@11/11.0.19/bin

set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths

set -x PATH $PATH $HOME/.nodebrew/current/bin

set -x VOLTA_HOME $VOLTA_HOME $HOME/.volta
set -x PATH $PATH $VOLTA_HOME/bin
set VOLTA_FEATURE_PNPM 1

ln -fs /opt/homebrew/bin/gcc-14 /opt/homebrew/bin/gcc
ln -fs /opt/homebrew/bin/g++-14 /opt/homebrew/bin/g++
