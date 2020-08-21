export DEBFULLNAME='Chris J Arges'
export DEBEMAIL='chris.j.arges@ubuntu.com'
alias sl='ls --color=auto'
alias rm='rm -i'

mkdirc() {
	mkdir $1 && cd $_
}

sponsorbug() {
	cd ~/src/bugs
	mkdir -p lp$1
	cd lp$1
	sponsor-patch -k67884CF6 -B sbuild -b $1 -w $2
}

dk-build() {
	time make deb-pkg -j`nproc` LOCALVERSION=-$(git rev-parse --short HEAD)
}

send-to-kteam-ml () {
	git send-email --identity canonical --no-chain-reply-to --thread \
		--suppress-cc all --to kernel-team@lists.ubuntu.com $1
}

git-lola() {
	git log --graph --decorate --pretty=oneline --abbrev-commit --all
}

aws-creds() {
    cat ~/.aws/credentials | tail -n2 | awk '{ printf "export %s=%s\n",toupper($1),$3 }'
}

git-branch() {
    git rev-parse --is-inside-work-tree &> /dev/null || return;
    printf "(%s->%s)" $(basename $(git rev-parse --show-toplevel)) $(git branch 2>/dev/null | grep '^*' | colrm 1 2)
}

export GOPATH=/home/arges/go
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[\033[01;33m\]$(git-branch)\[\033[00m\] \n$ '
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpg-connect-agent updatestartuptty /bye >& /dev/null
