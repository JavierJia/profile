for f in $PWD/.*rc;do echo $f; ln -s $f ~/ ;done
ln -s $PWD/.vim ~/
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
