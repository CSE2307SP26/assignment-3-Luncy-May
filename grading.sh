#!/bin/bash
EXPECTOUTPUT=$1
OUTPUT=$2
echo "EXPECTED OUTPUT: $EXPECTOUTPUT"
echo "OUTPUT: $OUTPUT"
while read STUDENTNAME
do 
    # $(git clone https://github.com/CSE2307SP26/$STUDENTNAME.git)
    cd "$STUDENTNAME"
    echo $(pwd)
    git checkout cipher
    git checkout $(git rev-list -1 --before="2026-02-12 10:00:00" cipher)
    javac Cipher.java
    if [[ -f output.txt ]]; then
        diff = diff $EXPECTOUTPUT output.txt
        if [[ $diff == "" ]]; then
            echo "score=1"
        else
            echo "score=0"
        fi
    else
        echo "score=0"
    fi
    cd ..
done
