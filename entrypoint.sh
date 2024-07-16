#!/bin/bash

# System stuff, DO NOT CHANGE
start-docker.sh
echo 'Starting OpenSSH server.'
/usr/sbin/sshd -D &

# Custom user autostart scripts go below
echo 'Welcome to DockerUSP!'
echo 'Docker + Ubuntu + SSH + Python - finally all out of the box.'
echo 'See https://github.com/baterflyrity/dockerusp'
/bin/bash