# dotfiles
collection of dear dotfiles

# Installation

If you have a local clone of this repo, just run 

```bash
bash install.sh
```

If you want to execute without checking out, you can do that by setting two
environment variables to the shell executing `install.sh`:

  - `DOTFILES_LOCATION` 
    * where to look for the dotfiles base dir
    * will be used as `"${DOTFILES_LOCATION}/relative/path"` by `DOTFILES_FETCH`
    * defaults to `dirname "${BASH_SOURCE[0]}"`
    * alternative for remote setup:
      `https://raw.githubusercontent.com/burgerdev/dotfiles/master`
  - `DOTFILES_FETCH`
    * a command that takes a location (as defined above) and
      prints its content to `stdout`
    * defaults to `cat`
    * alternative for remote setup: `DOTFILES=(curl -Ls)`
    * will be evaluated as
      `"${DOTFILES_FETCH[@]}" "${DOTFILES_LOCATION}/relative/path"`, so you can
      provide a command with curried arguments, such as
      `DOTFILES=(curl -Ls -u "admin:pass containing whitespace")`
  - `DOTFILES_REMOTE`
    * this meta-option will set the former two env vars to their suggested
      alternatives for remote setup
    * full example
      ```bash
      curl https://raw.githubusercontent.com/burgerdev/dotfiles/master/install.sh | \
        env DOTFILES_REMOTE=true bash
      ```

