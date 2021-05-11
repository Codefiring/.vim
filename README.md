# .vim
My own auto init vim config files.
Please note that this repository now only support ubuntu version above 20.04.

# Install

First, you need to clone this repository to your machine through using git.

    git clone https://github.com/codefiring/.vim

And then, copy the file `init.vim` to your home path. Remember to change it's name to `.vimrc`. You can use command as follow:

    cp init.vim ~/.vimrc

If everything goes right when you open vim, it will automatically start installing.

Otherwise, open vim using command `:PlugInstall` to finish initializing your vim config. 

# Usage
## vim-gutentags
Vim-gutentags uses [Universal Ctags](https://docs.ctags.io/en/latest/index.html) as ctags generator. You will need to build and install it according to the [manual](https://docs.ctags.io/en/latest/building.html).

<c-]> go to the definition
<c-o> go back

## [vim-terminal-helper](https://github.com/skywind3000/vim-terminal-help)


- `ALT` + `=`: toggle terminal below.
- `ALT` + `SHIFT` + `h`: move to the window on the left.
- `ALT` + `SHIFT` + `l`: move to the window on the right.
- `ALT` + `SHIFT` + `j`: move to the window below.
- `ALT` + `SHIFT` + `k`: move to the window above.
- `ALT` + `SHIFT` + `n`: move to the previous window.
- `ALT` + `-`: paste register 0 to terminal.
- `ALT` + `q`: switch to terminal normal mode.


Inside the terminal:

```bash
drop abc.txt
```

tell vim to open `abc.txt`

### Command

This plugin provide a single command `H`:

```VimL
:H {shell command}
```

You can type ":H uname -a" in vim's command line, it will send to the terminal directly without actually enter the terminal.


### Settings

- `g:terminal_key`: which key will be used to toggle terminal window, default to `<m-=>`.
- `g:terminal_cwd`: initialize working dir: `0` for unchanged, `1` for file path and `2` for project root.
- `g:terminal_height`: new terminal height, default to 10.
- `g:terminal_pos`: where to open the terminal, default to `rightbelow`.
- `g:terminal_shell`: specify shell rather than default one.
- `g:terminal_edit`: command to open the file in vim, default to `tab drop`.
- `g:terminal_kill`: set to `term` to kill term session when exiting vim.
- `g:terminal_list`: set to 0 to hide terminal buffer in the buffer list.
- `g:terminal_fixheight`: set to 1 to set `winfixheight` for the terminal window.
- `g:terminal_close`: set to 1 to close window if process finished.

## Remember

The internal terminal in both vim/neovim has `NORMAL` and `INSERT` mode. When you are in `INSERT` mode, you can enter shell commands. And if you want to scroll terminal screen or copy / paste texts to a normal vim buffer, you need to switch to `NORMAL` mode by `<c-\><c-n>` (like tmux's `<c-b>` + left square bracket).

This plugin has defined a `<m-q>` map for `<c-\><c-n>`, which makes switching to terminal normal mode a little easier.

If you want to re-enter `INSERT` mode, just press `i` or `a`, and you can input shell commands again.

## Integration

This plugin defined a runner `thelp` for [asyncrun.vim](https://github.com/skywind3000/asyncrun.vim), which enables you use terminal-help to execute asyncrun commands:

```VimL
:AsyncRun -mode=term -pos=thelp echo 123
```

And it is also useful when you are using [asynctasks.vim](https://github.com/skywind3000/asynctasks.vim):

```ini
[test-task]
command=echo 123
output=terminal
pos=thelp
```

You can either set `g:asynctasks_term_pos` to `thelp` or use `pos` field in task option directly. After this:

```VimL
:AsyncTask test-task
```

Can run the task in the terminal-help's window.

