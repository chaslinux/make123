#!/bin/bash

# make123.sh
# by chaslinux@gmail.com
# based on the work of Tavis Ormandy
# This script just automates the installation process for *buntu
# Tested on Xubuntu 22.04

# run all updates to ensure all libraries and programs are up to date
# then install git 
sudo apt update && sudo apt upgrade -y
sudo apt install git -y

# Make a directory to hold the git projects and clone Travis' work
mkdir ~/Code
cd ~/Code
git clone https://github.com/taviso/123elf

# Download the 123 files
cd ~/Code/123elf
wget https://archive.org/download/123-unix/123UNIX1.IMG
wget https://archive.org/download/123-unix/123UNIX2.IMG
wget https://archive.org/download/123-unix/123UNIX3.IMG
wget https://archive.org/download/123-unix/123UNIX4.IMG
wget https://archive.org/download/123-unix/123UNIX5.IMG

# install the necessary software and libraries for *buntu
sudo apt install build-essential gcc-multilib lib32ncurses-dev -y

# build and make the software
./binutils.sh
./extract.sh

make
sudo make install