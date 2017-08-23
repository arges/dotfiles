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

export PATH=$PATH:/home/arges/src/projects/ubuntu-archive-tools
export PATH=/home/arges/src/projects/ubuntu-dev-tools:$PATH
export GOPATH=/home/arges/go
