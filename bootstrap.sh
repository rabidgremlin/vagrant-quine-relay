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
apt-get -q -y install afnix algol68g aplus-fsf asymptote \
  ats-lang-anairiats bash bf boo bsdgames clisp clojure1.4 cmake \
  coffeescript f2c fp-compiler g++ gauche gawk gcc gforth gfortran \
  ghc ghostscript gnat gnu-smalltalk gobjc golang groovy icont iconx \
  intercal iverilog jasmin-sable libpng12-dev llvm lua5.2 make maxima \
  mlton mono-devel mono-mcs mono-vbnc nasm neko nickle nodejs ocaml \
  octave open-cobol openjdk-6-jdk pari-gp parrot perl php5-cli pike7.8 \
  python r-base ratfor regina-rexx ruby2.0 scala scilab slsh spl-core \
  swi-prolog tcl ucblogo valac xsltproc yorick zoem \
  git tcc


# otherwise step 72 ppt -> Prolog will fail with a:
# /bin/sh: 1: ppt: not found
export PATH="$PATH:/usr/games"

# create a folder to hold all the output
# but clean up first so  we can recover from a failed bootstrap
rm -rf /vagrant/qr
mkdir /vagrant/qr
cd /vagrant/qr

# grab the code
git clone https://github.com/mame/quine-relay .

# make non-ubuntu-packaged language dependencies
cd vendor && make && cd ..

# make it!
make

