command! -nargs=* Term       call termhide#show_or_create(0, <q-args>)
command! -nargs=* TermSplit  call termhide#show_or_create(1, <q-args>)
command! -nargs=* TermVSplit call termhide#show_or_create(2, <q-args>)
