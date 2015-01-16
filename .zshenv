
PATH=/usr/local/opt/ruby/bin:/usr/local/share/npm/bin:/usr/local/bin:$PATH
PATH=$HOME/.local/bin:$PATH:

# remove duplicates from path
PATH=`echo -n $PATH | awk -v RS=: '{ if (!arr[$0]++) {printf("%s%s",!ln++?"":":",$0)}}'`

