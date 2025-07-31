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
ln -fs /opt/homebrew/bin/g++-14 /opt/homebrew/bin/g+

set -gx PATH /opt/homebrew/opt/flex/bin $PATH

set -gx PATH /opt/homebrew/opt/flex/bin $PATH

alias python=python3
set -x LDFLAGS "-L$(brew --prefix openssl@3)/lib"
set -x CPPFLAGS "-I$(brew --prefix openssl@3)/include"
set -x PKG_CONFIG_PATH "$(brew --prefix openssl@3)/lib/pkgconfig"
set -x PYTHON_CONFIGURE_OPTS "--with-openssl=$(brew --prefix openssl@3)"
set -x SSL_CERT_FILE (python -m certifi)
set -x REQUESTS_CA_BUNDLE $SSL_CERT_FILE

set -Ux PATH /Applications/Docker.app/Contents/Resources/bin $PATH
set -Ux JAVA_HOME /usr/local/Cellar/openjdk@17/17.0.15/libexec/openjdk.jdk/Contents/Home
set -Ux ANDROID_HOME /Users/hasegawaitsuki_1/Library/Android/sdk
set -Ux PATH $HOME/.nodenv/bin $PATH
status --is-interactive; and source (nodenv init -|psub)
set -U fish_user_paths /opt/homebrew/bin $fish_user_paths
set -gx PATH $HOME/.gem/ruby/2.6.0/bin $PATH


# 優先的に Homebrew Ruby を使う
set -gx PATH /opt/homebrew/opt/ruby/bin $PATH

