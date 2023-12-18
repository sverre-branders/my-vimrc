#! /bin/bash
# This script is used to sym link the files in this directory to ~/.vimrc and ~/.vim

# Create the links
if [ $# -eq 0 ]; then
    if [ ! -e $HOME/.vimrc ]; then
        echo "Linking vimrc file"
        ln -s vimrc $HOME/.vimrc
    else
        echo "Warning: vimrc already exists."
        read -r -p "Are you sure you want to overwrite it? [y/N] " response
        case "$response" in
            [yY][eE][sS]|[yY])
                echo "Linking vimrc file and overwriting"
                ln -sf vimrc $HOME/.vimrc
                ;;
            *)
                echo "skipped."
                ;;
        esac
    fi

    if [ ! -e $HOME/.vim/ ]; then
        echo "Linking vim/ directory"
        ln -s ./ $HOME/.vim/
    else
        echo "Warning: vim/ directory already exists."
        read -r -p "Are you sure you want to overwrite it? [y/N] " response
        case "$response" in
            [yY][eE][sS]|[yY])
                echo "Linking vim/ directory and overwriting"
                ln -sf ./ $HOME/.vim/
                ;;
            *)
                echo "skipped."
                ;;
        esac
    fi
fi

# check for 'unlink' flag
case "$1" in
    -u|--unlink|--remove|--uninstall)
        echo "Removing symbolic links"
        if [ -L $HOME/.vimrc ]; then
            rm -f $HOME/.vimrc
        fi
        if [ -L $HOME/.vim/ ]; then
            rm -f $HOME/.vim/
        fi
        ;;
    *)
        echo "To link vim configuration run this script. To remove the symlink, run this script with the '--unlink' flag"
esac

