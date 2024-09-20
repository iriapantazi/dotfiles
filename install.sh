#! /bin/bash

# TODO delete if soft link exists
# TODO configure paths

# read two input values, name and email
echo "Enter your name:"
read name
echo "Enter your email@gmail.com:"
read email

ln -s -i ${PWD}/vimrc ~/.vimrc
ln -s -i ${PWD}/bash_aliases ~/.bash_aliases
ln -s -i ${PWD}/tmux.conf ~/.tmux.conf



# if input is empty, then skip
if [ -z "$name" ]; then
    echo "Input name is empty, skipping linking .gitconfig ..."
else
    # replace name in gitconfig
    echo name is $name
    echo email is $email
    cp gitconfig my_gitconfig
    sed -i "s/a_name/$name/g" my_gitconfig
    sed -i "s/an_email/$email/g" my_gitconfig
    ln -s -i ${PWD}/my_gitconfig ~/.gitconfig
fi
