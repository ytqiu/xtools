#!/bin/zsh
echo 'hello world!'
expect <<EOF
  set time -1 
  spawn ssh admin@192.168.1.117
  expect {
    "yes/no" { send "yes\r"; exp_continue; }
    "password" { send "******\r"; }
  }

  expect "Welcome"
  send "cd /home\r"
  expect "home"
  send "ls -al\r"
  expect "kongsheng"
  interact
EOF
