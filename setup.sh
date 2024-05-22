# general
# remap caps lock to escape: System Settings > Keyboard > Keyboard Shortcuts > Modifier Keys

mkdir -p .cache/zsh

# gotta get dotfiles and stow them first
dotfilesbranch="mac"
dotfilesrepo="https://github.com/lnrssll/dotfiles.git"
git clone --depth 1 -b $dotfilesbranch --recurse-submodules --shallow-submodules $dotfilesrepo ~/dotfiles
stow -d ~/dotfiles -t ~ .

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# adding to zprofile should already exist in dotfiles w mac check
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile

### before install ###

# add repositories to brew
# localsend
brew tap localsend/localsend
# fonts https://www.geekbits.io/how-to-install-nerd-fonts-on-mac/
brew tap homebrew/cask-fonts
# https://devcenter.heroku.com/articles/heroku-cli
brew tap heroku/brew
# for parity
brew tap thoughtbot/formulae

### install ###

if [ ! -f "brew-packages.txt" ]; then
  echo "brew-packages.txt not found"
  exit 1
fi
  
while IFS= read -r program; do
  brew install $program
done < "brew-packages.txt"

### after install ###

# chromium
xattr -cr /Applications/Chromium.app

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# syntax highlighting in zsh
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

# docker
if [ ! -f "~/Downloads/docker.dmg" ]; then
  echo "docker.dmg not found"
  # apple silicon
  curl -o ~/Downloads/docker.dmg https://desktop.docker.com/mac/main/arm64/Docker.dmg
  echo "docker.dmg downloaded"
fi
sudo hdiutil attach Docker.dmg
sudo /Volumes/Docker/Docker.app/Contents/MacOS/install
sudo hdiutil detach /Volumes/Docker
