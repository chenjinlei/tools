# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH
unset USERNAME

SVN_EDITOR=vim
export SVN_EDITOR
while [ 1 ]
do
	echo "1-zxj3ser  2-zxj4ser  3-64λ zxjtcp "
    read flag
    if [ $flag -eq 1 ]; then
      break
    elif [ $flag -eq 2 ]; then
      break
    elif [ $flag -eq 3 ]; then
      break
    elif [ $flag -eq 4 ]; then
      break
    else
      clear
    fi
done

if [ $flag -eq 1 ]; then
        export HOME=$HOME/zxj3ser
        cd $HOME
        . bash_profile
elif [ $flag -eq 2 ]; then
        export HOME=$HOME/zxj4ser
        cd $HOME
        . bash_profile
else
        export HOME=$HOME/zxjtcp
        cd $HOME
        . bash_profile
fi

