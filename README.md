# [haskell-eventlogs-talk](https://github.com/jship/haskell-eventlogs-talk)

## Synopsis

``` sh
# Build the project.
stack build

# Run the executables with eventlog writing enabled.
stack exec 1-single-thread -- +RTS -l
stack exec 2-single-thread-with-label -- +RTS -l
stack exec 3-two-threads -- +RTS -l
stack exec 4-two-threads-traced -- +RTS -l
stack exec 5-two-threads-fixed -- +RTS -l
stack exec 6-two-threads-totally-separate -- +RTS -l

# Look at generated .eventlog files with `ThreadScope` and `ghc-events`.
```

## Tools

* [`ThreadScope`](https://hackage.haskell.org/package/threadscope): a graphical tool used to visually analyze .eventlog files
* [`ghc-events`](https://hackage.haskell.org/package/ghc-events): a command-line tool used to get the text representation of .eventlog files, among other things
