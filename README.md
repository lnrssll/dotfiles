# dotfiles

my dotfiles

heavily inspired by lukesmithxyz's voidrice repo, but adapted for GNU stow

## usage

```shell
dotfilesbranch="master"
dotfilesrepo="https://github.com/lnrssll/dotfiles.git"
git clone --depth 1 -b $dotfilesbranch --recurse-submodules \
    --shallow-submodules $dotfilesrepo ~/dotfiles
stow -d ~/dotfiles -t ~ .
```
