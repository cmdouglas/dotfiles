
# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions
export ARCHFLAGS='-arch x86_64'

export LESS='--ignore-case --raw-control-chars'
export PAGER='most'
export EDITOR='vim'

# CTAGS Sorting in VIM/Emacs is better behaved with this in place
export LC_COLLATE=C

