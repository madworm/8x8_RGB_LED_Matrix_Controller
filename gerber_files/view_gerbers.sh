#!/bin/bash

for file in `find ./gerbv -iname "*.gvp"`; do
	gerbv -p $file &
done
