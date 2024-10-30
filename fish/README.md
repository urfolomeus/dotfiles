# Fish dotfiles

## Intitial setup

> Note: we need to have asdf and direnv installed or we'll see errors
> when launching the shell

```shell
# Ensure .config directory exists
mkdir -p $HOME/.config

cd <dotfiles folder>
ln -s $PWD/fish $HOME/.config/fish
```

## Setup fisher


```shell
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
```

We can check that this worked by installing the pure prompt.

```shell
fisher install pure-fish/pure
```

## Adding custom functions

To add a new function we use [`funced`](https://fishshell.com/docs/current/cmds/funced.html) and [`funcsave`](https://fishshell.com/docs/current/cmds/funcsave.html).

I keep function definitions in the `src` folder. When I want to use them on a system I can use the following process:

1. `funced <FUNCTION_NAME>`
2. Paste in the function definition
3. Save the file
4. `funcsave <FUNCTION_NAME>`

