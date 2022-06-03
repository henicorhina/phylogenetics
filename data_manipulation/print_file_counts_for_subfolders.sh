#!/bin/sh

# prints number of files in all subfolders

for f in */; do cd $f ; pwd ;  ls -l | wc -l ; cd .. ; done