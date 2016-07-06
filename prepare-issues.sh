#!/bin/bash

jq .[].title issues/open/*   | sed -e 's/^"//' -e 's/"$//' -e 's/\\"/"/g'
jq .[].title issues/closed/* | sed -e 's/^"//' -e 's/"$//' -e 's/\\"/"/g'

