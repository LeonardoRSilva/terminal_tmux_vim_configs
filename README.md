# terminal_tmux_vim_configs
Settings - terminal | tmux | vim 

## Terminal

### Configure terminal colors (Linux of WSL):

In setting of terminal program, set color profile set the next color (gnome profile): 

#171421 <br>
#C01C28 <br>
#26A269 <br>
#A2734C <br>
#12488B <br>
#A347BA <br>
#2AA1B3 <br>
#D0CFCC <br>

#5E5C64<br>
#F66151<br>
#33D17A<br>
#E9AD0C<br>
#2A7BDE<br>
#C061CB<br>
#33C7DE<br>
#FFFFFF<br>

Also set background color (#161616), font (Fira Code| size: 18)

In file **.bashrc** find and replace this:

```bash
if ["$color_prompt" = yes];then
  PS1='$... '
```
for
```bash
if ["$color_prompt" = yes];then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]@\[\033[01;34m\]\h\[\033[01;35m\](\w) \[\033[01;32m\][\t] \[\033[00m\]\n\$ '
```

then close and open the terminal to see the result

### Configure terminal colors (windows powershell):

First, enable Power Shell implementation policies, run this code with admin:
```bash
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
```

Create file **.profile** with the code below:
```bash
if (!(Test-Path -Path $PROFILE ))
{ New-Item -Type File -Path $PROFILE -Force }

```
Add this code in file **.profile**:
```bash
function prompt { 
"$([char]27)[32m$([Environment]::UserName)$([char]27)[0m" + "@" + "$([char]27)[34m$((Get-ChildItem Env:Computername).Value)$([char]27)[0m" + "$([char]27)[35m(" + "$((Get-Location).Path.Split("\")[-1])" + ")$([char]27)[0m $([char]27)[32m[$(get-date -UFormat '%H:%M:%S')]
$([char]27)[0m$ "
}
```
then close and open the terminal to see the result

### Configure Zoxide and FZF (Linux | WSL):
```bash
sudo apt install zoxide  
sudo apt install fzf
sudo apt install ripgrep
sudo apt install fd-find
sudo ln --symbolic $(which fdfind) /usr/local/bin/fd
```
Add this configuration in **.bashrc**:
```bash
eval "$(zoxide init bash)"
source /usr/share/doc/fzf/examples/key-bindings.bash

export FZF_DEFAULT_OPTS='--layout=reverse --height=80% --preview "cat {} || tree -C {} | less"'

alias lsf='ls | fzf'
```

## TMUX

Install **TMUX** with bellow command:

```bash
  sudo apt install tmux
```
Copy file **.tmux.conf** to the **home** folder and refresh with the following command:
```bash
tmux source-file ~/.tmux.conf
```
Fundamental commands:
```bash
# new session
 tmux new -s session-name

# exit session and delete it
ctl + b, d 

#list session and delete
tmux ls
tmux kill-session -t 0 

#kill all another sessions
tmux kill-session -a

#navigate for sessions
ctrl + b, s

#go into existing session
tmux attach-session -t session_name

#new tab
ctrl + b, c

#rename tab
ctrl + b, ,

#navigate though tabs
ctrl + b, [number_tab]
ctrl + b, w

#vertical split
ctrl + b, ``

#horizontal split
ctrl + b, %

#move between splits
ctrl + b, arrows

#remove split
ctrl + b, x
```

## Vim

Command instalation:
```bash
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
```
Copy file **.vimrc** and folder **.vim** to the **home** directory

| Command                  | Action                                                                   |
|:--------------------------|:-------------------------------------------------------------------------|
| h                         | moves the cursor to the left                                             |
| j                         | moves the cursor down                                                    |
| k                         | moves the cursor up                                                      |
| l                         | moves the cursor to the right                                            |
| 0                         | moves the cursor to the beginning of the line                            |
| $                         | moves the cursor to the end of the line                                  |
| b                         | moves the cursor back a word                                             |
| dd                        | deletes the current line                                                 |
| yy                        | copies the current line                                                  |
| p                         | pastes the clipboard content after the cursor                            |
| P                         | pastes before the cursor                                                 |
| :w                        | saves the current buffer                                                 |
| :wa                       | saves all buffers                                                        |
| :sav                      | save with another name                                                   |
| :x/wq                     | saves and quits the file                                                 |
| gj                        | cursor down on a visual line break                                       |
| gk                        | cursor up on a visual line break                                         |
| H                         | moves the cursor to the first visible line                               |
| M                         | moves the cursor to the middle visible line                              |
| L                         | moves the cursor to the last visible line                                |
| u                         | undo                                                                     |
| ctrl + r                  | redo                                                                     |
| e                         | jumps to the end of the next word                                        |
| E                         | jumps to the end of the next word (including punctuation)                |
| w                         | jumps to the beginning of the next word                                  |
| W                         | jumps to the beginning of the next word (including punctuation)          |
| b                         | jumps to the beginning of the previous word                              |
| B                         | jumps to the beginning of the previous word (including punctuation)      |
| ge                        | jumps to the end of the previous word                                    |
| gE                        | jumps to the end of the previous word (including punctuation)            |
| ^/0w                      | jumps to the first visible character of the line                         |
| g_                        | jumps to the last visible character of the line                          |
| gg                        | goes to the first line of the text                                       |
| G                         | goes to the last line of the text                                        |
| N(number)gg/Ng            | goes to line n                                                           |
| ctrl + z                  | puts the vim process in the background                                   |
| fg                        | returns to the process that is in the background                         |
| vim aquivo1.txt arquivo2.txt | opens 2 buffers in the same window                                       |
| vim -o arquivo1.txt...    | opens 2 buffers, one in each window horizontally                         |
| :ls                       | lists the buffers                                                        |
| :qa                       | closes all buffers                                                       |
| vim -O arquivo1.txt...    | opens 2 buffers, one in each window vertically                           |
| vim * -o /etc/aquivo3.txt | opens all files in the directory and a specific file                     |
| vim * -02 /etc/arquivo3.txt | opens 3 buffers and only 2 windows                                       |
| :sp [file_name(opcional)] | splits horizontally creating a new window with the same buffer           |
| :vsp [file_name(opcional)]| splits vertically creating a new window with the same buffer             |
| :tabe [file_name(opcional)]| new tab                                                                  |
| :tabnew                   | new empty buffer in a new tab                                            |
| :tabs ball                | all buffers in tabs                                                      |
| :tabo                     | closes all tabs                                                          |
| :new                      | creates a new empty horizontal buffer                                    |
| :enew                     | creates a new buffer without creating a new window                       |
| :vnew                     | creates a new empty vertical buffer                                      |
| :bd                       | deletes the current buffer                                               |
| :%bd                      | deletes all buffers                                                      |
| :%bd!                     | deletes the buffer without saving                                        |
| :bn                       | goes to the next buffer                                                  |
| :bp                       | goes to the previous buffer                                              |
| ctrl + 6                  | alternates between the first and last visited buffer                     |
| :bN(number)               | opens the buffer with a specific number (see number with ls command)     |
| :only                     | makes the window with the current buffer the only visible window         |
| vim * -p                  | opens all buffers in different tabs                                      |
| N(numero)gt               | navigates to the tab number                                              |
| gt                        | navigates between tabs                                                   |
| ctrl + w, w               | changes window                                                           |
| ctrl + w, s               | vertical split                                                           |
| ctrl + w, j               | navigates to the window below                                            |
| ctrl + w, k               | navigates to the window above                                            |
| ctrl + w, h               | navigates to the window to the left                                      |
| ctrl + w, l               | navigates to the window to the right                                     |
| vim .                     | opens the vim file explorer                                              |
| :e ./                     | opens the file explorer with vim open                                    |
| %                         | (netrw) new file                                                         |
| d                         | (netrw) new directory                                                    |
| o                         | (netrw) split open horizontal                                            |
| v                         | (netrw) split open vertical                                              |
| p                         | (netrw) preview file                                                     |
| mt                        | (netrw) set target                                                       |
| mf                        | (netrw) mark file                                                        |
| mm                        | (netrw) move                                                             |
| mc                        | (netrw) copy                                                             |
| -                         | (netrw) up directory                                                     |
| D                         | (netrw) delete                                                           |
| R                         | (netrw) rename                                                           |
| ctrl + 6                  | (netrw) exit netrw                                                       |
| 30Lex                     | (netrw) opens netrw to the left                                          |
| :w !sudo tee %            | (obs) saves with administrator user                                      |
| gf                        | with cursor on a link, e.g., (~/Projects/...), opens the file            |
| ctrl + w, f               | with cursor on a link, opens the file in a new horizontal window         |
| ctrl + w, v               | opens a vertical window, gf on the link (to open the file vertically)    |
| ctrl + w, gf              | with the cursor on a link, opens the file in a new tab                   |
| :set scrollbind           | synchronizes the scroll in two windows with the same line pattern        |
| :m +2                     | moves line down                                                          |
| ctrl + d                  | moves scroll down                                                        |
| ctrl + u                  | moves scroll up                                                          |
| {                         | moves to next paragraph or code block                                    |
| }                         | moves to previous paragraph or code block                                |
| gcc                       | comments line                                                            |
| gc                        | comments with motion                                                     |
| gcap                      | comments paragraph                                                       |
| gcgc                      | uncomments                                                               |










