#!/usr/bin/env bash

# fix locale so perl doesn't complain about LC_ALL
locale-gen en_US en_us.UTF-8
dpkg-reconfigure locales
export LC_ALL=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# make sure everything is up to date
apt-get update
apt-get upgrade

# so golang doesn't stop the show with popularity contest questions
export DEBIAN_FRONTEND=noninteractive

# get all the compilers/tools
apt-get install -q -y afnix algol68g aplus-fsf asymptote \
  ats-lang-anairiats bash bc bf boo bsdgames cduce clisp clojure1.4 \
  cmake coffeescript f2c fp-compiler g++ gauche gawk gcc gforth gfortran \
  ghc ghostscript gnat gnu-smalltalk gobjc golang groff groovy icont \
  iconx intercal iverilog jasmin-sable libgd2-xpm-dev libpng12-dev llvm \
  lua5.2 make maxima mlton mono-devel mono-mcs mono-vbnc nasm neko \
  nickle ocaml octave open-cobol openjdk-6-jdk pari-gp parrot perl \
  php5-cli pike7.8 python r-base ratfor regina-rexx rhino ruby2.0 scala \
  scilab slsh spl-core swi-prolog tcl ucblogo valac xsltproc yorick zoem \
  git

# otherwise step ppt -> Prolog will fail with a:
# /bin/sh: 1: ppt: not found
export PATH="$PATH:/usr/games"

# create a folder to hold all the output
# but clean up first so  we can recover from a failed bootstrap
rm -rf /vagrant/qr
mkdir /vagrant/qr
cd /vagrant/qr

# grab the code
git clone https://github.com/mame/quine-relay .

# pin this version of vagrant-qr to a specific commit of quine-relay:
# the one for language #81 Chef, to avoid dependency failure
git checkout 406b154716f1b0775925be39a1d9b34c9ce7ddd7

# make non-ubuntu-packaged language dependencies
cd vendor && make && cd ..

# make it!
make
