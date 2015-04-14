#!/bin/bash
rm -rf /tmp/ghc-mod
cd ghc-mod
cabal sandbox init
cabal install --only-dependencies
#https://www.haskell.org/cabal/users-guide/installing-packages.html section creating a binary package
#use `cabal` instead of `runhaskell Setup.hs` so we can use the sandbox
cabal configure --prefix=/usr/local
cabal build
cabal copy --destdir=/tmp/ghc-mod
#http://superuser.com/questions/692578/how-to-remove-full-path-when-doing-tar-gz-compression
tar -czf ghc-mod.tar.gz -C /tmp/ghc-mod .
