#! /bin/bash
# Install copies the dotfiles from this repo to the local system

REPO=$GITPATH/dotfiles/debian/thurisaz
if [ "$REPO" = "/dotfiles" ]; then
  REPO=`pwd`
fi

echo "Installing files from $REPO..."

dotfiles=(
  "bash_aliases"
  "bash_envs"
  "bash_functions"
  "bashrc"
  "gitconfig"
  "git_completion.bash"
  "git_prompt.sh"
  "vimrc"
)

# Copy special dotfiles
for i in ${dotfiles[@]}; do
  echo "Installing $REPO/files/${i} at $HOME/.${i}"
  /usr/bin/cp -f $REPO/files/${i} $HOME/.${i}
done

# Copy special config files
echo "Installing $REPO/config/user-dirs.dirs at $HOME/.config/user-dirs.dirs"
/usr/bin/cp -f $REPO/config/user-dirs.dirs $HOME/.config/user-dirs.dirs
