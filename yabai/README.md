# Yabai

## Up and running

### Prereqs

Follow the setup advice on the [yabai repo](https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection) to configure SIP first.

### Installing

```shell
brew install yabai skhd
```

Once yabai is installed, we need to [configure scripting addition](https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release)#configure-scripting-addition) if we want to be able to move windows between spaces.

### Configuring

The configuration is kept in the [./.skhdrc](./.skhdrc) and [./.yabairc](./.yabairc) files.

```shell
ln -s $PWD/yabai/.skhdrc $HOME/.skhdrc
ln -s $PWD/yabai/.yabairc $HOME/.yabairc
```

## Examples

I've put some example config in the ./examples folder. See also [this github repo](https://github.com/Julian-Heng/yabai-config) for some more examples.
