# TMux Setup

```shell
brew install tmux

# symlink the default config
ln -s $PWD/tmux.conf $HOME/.tmux.conf

# symlink any of the project settings
ln -s $PWD/fitzbuild $HOME/fitzbuild
```

## Plugins

I'm currently using [TPM](https://github.com/tmux-plugins/tpm).

TL;DR

```shell
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Now open a tmux session and run `<prefix> I` (note: capital i) to install all the plugins in the .tmux.conf file.

