#!/bin/bash

sudo xcodebuild -license

type brew &>/dev/null
if [[ "$?" -eq 1 ]]
then
	ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

brew install ansible
