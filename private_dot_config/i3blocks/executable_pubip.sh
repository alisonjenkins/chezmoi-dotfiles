#!/bin/bash
if [ "$BLOCK_BUTTON" -eq 1 ]; then
  dig +short myip.opendns.com @resolver1.opendns.com | tr --delete '\n' | xclip -sel clipboard
fi

dig +short myip.opendns.com @resolver1.opendns.com
