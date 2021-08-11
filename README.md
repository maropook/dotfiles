# dotfiles

brew bundle

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

fisher install oh-my-fish/plugin-peco

./install.shで各設定ファイルへのシンボリックリンクを生成するのですが、すでにファイルが存在する場合はlnコマンドが失敗するので、その場合は適宜対処してください

fish
