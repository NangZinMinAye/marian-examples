#!/bin/bash

cat $1 \
    | sed 's/\@\@ //g' \
    | ../tools/moses-scripts/scripts/recaser/detruecase.perl 2>/dev/null \
    | ../tools/moses-scripts/scripts/tokenizer/detokenizer.perl -l my 2>/dev/null \
    | ../tools/moses-scripts/scripts/generic/multi-bleu-detok.perl data/valid.my \
    | sed -r 's/BLEU = ([0-9.]+),.*/\1/'
