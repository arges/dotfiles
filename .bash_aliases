export DEBFULLNAME='Chris J Arges'
export DEBEMAIL='christopherarges@gmail.com'
alias sl='ls --color=auto'
alias rm='rm -i'

git-branch() {
    git rev-parse --is-inside-work-tree &> /dev/null || return;
    printf "(%s->%s)" $(basename $(git rev-parse --show-toplevel)) $(git branch 2>/dev/null | grep '^*' | colrm 1 2)
}

export GOPATH=/home/arges/go
export PATH=/home/arges/.local/bin/:${PATH}
export PATH="/root/.local/bin:/root/.cargo/bin:${PATH}"

export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[\033[01;33m\]$(git-branch)\[\033[00m\] \n$ '
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpg-connect-agent updatestartuptty /bye >& /dev/null
