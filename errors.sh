#!/bin/bash
files=$(find src -name *.java)

for file in $files; do
	echo -en "\t$file:\n"
	grep java.awt $file
	echo -en "\n"
done