#!/usr/bin/env bash

# make sure everything is up to date
apt-get update
apt-get upgrade

# so golang doesn't stop the show with popularity contest questions
export DEBIAN_FRONTEND=noninteractive

# get all the compilers/tools
apt-get -q -y install algol68g bash beef boo clisp clojure1.4 coffeescript \
  f2c fp-compiler g++ guile-2.0 gawk gcc gforth gfortran ghc gnat gnu-smalltalk \
  gobjc golang groovy icont intercal iverilog jasmin-sable llvm lua5.2 \
  make mono-devel mono-mcs nodejs ocaml octave open-cobol openjdk-6-jdk \
  parrot perl php5-cli pike7.8 python r-base regina-rexx ruby1.9.3 scala \
  swi-prolog tcc tcl8.5 ucblogo valac git

# create a folder to hold all the output
mkdir /vagrant/qr
cd /vagrant/qr

# grab the code
git clone https://github.com/mame/quine-relay .

# make it!
make

