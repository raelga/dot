" ------------------------
" Perl Programing Language
" ------------------------

" Keybindings
"
map <Leader>pdc :!perldoc %<cr>          " Open perldoc for current file
map <Leader>pdm :!perldoc <cword><cr>
map <Leader>pdf :!perldoc -f <cword><cr>

map <Leader>x :!perl -Ilib %<cr>


" ,T perl tests
"nmap <Leader>T :let g:testfile = expand("%")<cr>:echo "testfile is now" g:testfile<cr>:call Prove (1,1)<cr>
function! Prove ( verbose, taint )
    if ! exists("g:testfile")
        let g:testfile = "t/*.t"
    endif
    if g:testfile == "t/*.t" || g:testfile =~ "\.t$"
        let s:params = "lrc"
        if a:verbose
            let s:params = s:params . "v"
        endif
"        if a:taint
"            let s:params = s:params . "t"
"        endif
        "execute !HARNESS_PERL_SWITCHES=-MDevel::Cover prove -" . s:params . " " . g:testfile
        execute "!prove --timer --normalize --state=save -" . s:params . " " . g:testfile
      "TEST_VERBOSE=1 prove -lvc --timer --normalize --state=save
    else
       call Compile ()
    endif
endfunction

function! Compile ()
    if ! exists("g:compilefile")
        let g:compilefile = expand("%")
    endif
    execute "!perl -wc -Ilib " . g:compilefile
endfunction

autocmd BufRead,BufNewFile *.t,*.pl,*.plx,*.pm nmap <Leader>te :let g:testfile = expand("%")<cr>:echo "testfile is now" g:testfile<cr>:call Prove (1,1)<cr>

" open installed perl modules
au FileType perl command! -nargs=1 PerlModuleSource :tabnew `perldoc -lm <args>`
au FileType perl setlocal iskeyword+=:
au FileType perl nmap <leader>P :PerlModuleSource <cword><cr>zR<cr>

" perltidy
au FileType perl command! -range=% -nargs=* Tidy <line1>,<line2>!perltidy
au FileType perl nmap <Leader>pt mz:Tidy<cr>'z:delmarks z<cr> " normal mode
au FileType perl vmap <Leader>pt :Tidy<cr> " visual mode

" json tidy
au FileType json command! -range=% -nargs=* Tidy <line1>,<line2>!json_xs -f json -t json-pretty
au FileType json nmap <Leader>pt :Tidy<cr> " normal mode
au FileType json vmap <Leader>pt :Tidy<cr> " visual mode

if ! exists("g:did_perl_statusline")
    setlocal statusline+=%(\ %{StatusLineIndexLine()}%)
    setlocal statusline+=%=
    setlocal statusline+=%f\ 
    setlocal statusline+=%P
    let g:did_perl_statusline = 1
endif

if has( 'perl' )
perl << EOP
    use strict;
    sub current_sub {
        my $curwin = $main::curwin;
        my $curbuf = $main::curbuf;

        my @document = map { $curbuf->Get($_) } 0 .. $curbuf->Count;
        my ( $line_number, $column  ) = $curwin->Cursor;

        my $sub_name = '(not in sub)';
        for my $i ( reverse ( 1 .. $line_number  -1 ) ) {
            my $line = $document[$i];
            if ( $line =~ /^\s*sub\s+(\w+)\b/ ) {
                $sub_name = $1;
                last;
            }
        }
        VIM::DoCommand "let subName='$sub_name '";
    }
EOP

function! StatusLineIndexLine()
  perl current_sub()
  return subName
endfunction
endif
