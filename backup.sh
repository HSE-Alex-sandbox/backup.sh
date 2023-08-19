#!/bin/bash
case $2 in 
	"J"|"xz")
	co="-J"
	;;
	"z"|"gzip")
	co="-z"
	;;
	"j"|"bzip2")
	co="-j"
	;;
	"none")
	co=""
	;;
	*)
	co=$2
	;;
esac
tar $co -cf - $1 2>>error.log | openssl enc -e -aes-256-cbc -pass pass:MyTeStPaSS -pbkdf2 -out $3.secured.tar 1>/dev/null 2>>error.log
date >>error.log
