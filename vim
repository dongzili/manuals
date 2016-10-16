vimrc:
/usr/share/vim/vimrc

#for indent
filetype indent on
set tabstop=4
set expandtab
set shiftwidth=4

#use backspace to delete indent
set softtabstop=4

#stop one file from auto indent
:setlocal nocindent

#while paste no indent
:set paste

#diff
vim -d file1 file2
already in:
:diffsplit {filename}   
