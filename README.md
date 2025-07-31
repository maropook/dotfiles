## 参考
WezTerm_ターミナル(https://zenn.dev/mozumasu/articles/mozumasu-wezterm-customization)

Neovim(https://zenn.dev/vim_jp/articles/1b4344e41b9d5b)

dotfiles(https://qiita.com/yutkat/items/c6c7584d9795799ee164)

## 移行のやり方
/Users/hasegawaitsuki_1/.config以下をdotfilesに移行

新しく.config以下にフォルダを追加するとき
mv ~/.config/NEW_FOLDER /Users/hasegawaitsuki_1/ghq/github.com/maropook/dotfiles/.config/

ln -s /Users/hasegawaitsuki_1/ghq/github.com/maropook/dotfiles/.config/NEW_FOLDER ~/.config/NEW_FOLDER


## 2025 8月時点 .config以下
```
configstore/
firebase/
fish@
flutter@
gcloud/
gh/
git@
iterm2@
Microsoft VisualStudio Services@
Microsoft\VisualStudio Services/
nvim@
starship.toml@
wezterm@
```
@がついていないものは機密情報が含まれるため放置