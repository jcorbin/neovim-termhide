# neovim-termhide

Support For Hide-able [NeoVim `:terminal`][nvim_terminal_emulator] Buffers

Status: **experimental**

## Usage

1. Start a new shell terminal `:Term`
2. Switch back to some other buffer, maybe closing the terminal window first, for example:
   - `<C-\><C-n>` to return to normal mode
   - `<C-w>c` to close the terminal window
   - *NOTE* this does not kill the running terminal, it continues in the
     background, and can be seen in the buffer list
3. Return to the running shell terminal with `:Term`
   - *NOTE* if there is a window already showing the terminal, than it is
     focused in insert mode instead of switching the current window

May use the `:TermSplit` or `:TermVSplit` commands to work in a split, instead
of changing the current window. Similarly `:TermHUD` creates a fixed-height
bottom window. Like `:Term` these commands focus any existing window if
possible, rather than creating a new split window.

You may also specify a different shell to run as in:
- `:Term zsh`
- `:Term powershell.exe`
- `:Term python` *NOTE* any interactive terminal REPL should work

You may specify a different default shell in `$MYVIMRC` by setting `g:termhide_default_shell`:

```vim
let g:termhide_default_shell = 'powershell.exe'
```

Otherwise the default `shell` is used (see `:help 'shell'`). Be careful when
changing this, as it may break other plugins that make assumptions about the
default `shell` on Windows or Unix.

## Suggested Mappings

```vim
" Easy shell start-or-show
nnoremap <leader>$ :Term<cr>

" Quicker 'Go Back'
tnoremap <C-\><C-o> <C-\><C-n><C-o>

" Quicker 'Close Window'
tnoremap <C-\><C-c> <C-\><C-n><C-w>c
```

## Install

neovim-termhide follows the standard runtime path structure. Install with
something like [vim-plug](https://github.com/junegunn/vim-plug):
```vim
Plug 'jcorbin/vim-lobster'
```

## TODO

- improve the HUD mode
- change default modality of the `:Term` command? or instead provide a a higher
  level `<plug>(term)` entry point
- floating window mode?

## Related Questions and Issues

- https://vi.stackexchange.com/questions/19276/how-to-keep-the-neovim-terminal-buffer-in-the-buffer-list-even-after-it-being-hi
- https://vi.stackexchange.com/questions/19288/how-to-hide-terminal-buffer-without-closing-it
- https://github.com/neovim/neovim/issues/2368
- https://github.com/neovim/neovim/issues/3340
- https://github.com/neovim/neovim/issues/5122

[nvim_terminal_emulator]: https://neovim.io/doc/user/nvim_terminal_emulator.html
