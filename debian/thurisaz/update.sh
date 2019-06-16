#! /bin/bash
# Update copies any local changes to dotfiles to this repo

REPO=$GITPATH/dotfiles/debian/thurisaz
if [ "$REPO" = "/dotfiles" ]; then
  REPO=`pwd`
fi

echo "Updating files in $REPO..."

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
  echo "Updating $REPO/files/${i} with $HOME/.${i}"
  /usr/bin/cp -f $HOME/.${i} $REPO/files/${i}
done

# Copy special config files
echo "Updating $REPO/config/user-dirs.dirs with $HOME/.config/user-dirs.dirs"
/usr/bin/cp -f $HOME/.config/user-dirs.dirs $REPO/config/user-dirs.dirs
