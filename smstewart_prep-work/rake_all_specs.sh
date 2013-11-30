#!/bin/bash
# 
# Quick script to rake all specs in learn_ruby-master and output results to terminal as well as the file "RAKE_OUTPUT"
# by: me!(rogueSF)


for dir in learn_ruby-master/*; do (cd "$dir" && echo "$dir">> ../../'rake_output.txt' && rake && rake >> ../../'rake_output.txt'); done
