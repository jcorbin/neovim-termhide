function! termhide#show_or_create(split, shell)
  " use any given shell argument...
  let term_shell = a:shell
  " ... global setting
  if term_shell == "" && exists("g:termhide_default_shell")
    let term_shell = g:termhide_default_shell
  endif
  " ... or normal command shell setting
  if term_shell == ""
    let term_shell = &shell
  endif

  let buf_expr = 'term://*' . term_shell

  " if still visible, switch to its window, and enter insert mode
  let wn = bufwinnr(buf_expr)
  if wn >= 0
    exe wn .  'wincmd w' | startinsert
    return
  endif

  " TODO: cross tab support?
  " let wid = bufwinid(buf_expr)
  " win_gotoid

  " no existing window, create a split if requested or necessary
  if a:split == 0 && &modified
    split
  elseif a:split == 1
    split
  elseif a:split == 2
    vsplit
  elseif a:split == 3
    if exists('g:termhide_hud_size')
      let hud_size = g:termhide_hud_size
    else
      let hud_size = 10
    endif

    " botright
    topleft split
    exe 'resize ' .  hud_size
    setlocal wfh
  endif

  " if buffer hidden, show it
  let bn = bufnr(buf_expr)
  if bn >= 0
    exe bn . 'buffer' | startinsert
    return
  endif

  " create a new hide-able terminal buffer for the requested shell
  exe 'terminal ' . term_shell
  setlocal bufhidden=hide
endfunction

function! termhide#hud()
  if exists(":Gstatus") != 2
    return
  endif

  if exists('g:termhide_hud_size')
    let hud_size = g:termhide_hud_size
  else
    let hud_size = 10
  endif

  botright Gstatus
  exe 'resize ' .  hud_size
  setlocal wfh
endfunction
