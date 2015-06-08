if [ -x /usr/libexec/path_helper ]; then
    PATH=''
    eval `/usr/libexec/path_helper -s`
fi


PATH=/usr/local/opt/ruby/bin:/usr/local/share/npm/bin:/usr/local/sbin:/usr/local/bin:$PATH
PATH=$HOME/.local/bin:$PATH:

# prepend the active virtualenv to the path
if [[ -n $VIRTUAL_ENV ]]; then
    PATH=$VIRTUAL_ENV/bin:$PATH;
fi

# remove duplicates from path
PATH=`echo -n $PATH | awk -v RS=: '{ if (!arr[$0]++) {printf("%s%s",!ln++?"":":",$0)}}'`

