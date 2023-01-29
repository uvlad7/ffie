#!/usr/bin/env bash
# go mod init ffie/gotie &&
go mod tidy && go build -o libgotie.so -buildmode=c-shared gotie.go
