#!/bin/sh

mkdir -p src/erlguten/

for d in {src,include,priv}; do
    cp -r erl/erlguten/$d src/erlguten/
done
