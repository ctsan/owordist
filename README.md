# Edit Distance - Levenshtein Distance in OCaml

## Description

This is a very simple implementation of levenshtein distance,
borrowing the notation of the corresponding wikipedia article,
and implemented with recursion and memoization.

## Examples

    $ ./dist hello hellou
    1 
    $ ./dist hello hello 
    0
    $ ./dist "hello world" "hlo wrld" 
    3

## How to Compile

To compile from source code, you will need **opam** and
the **core** library (opam install core).

then just run
    make 


## Possible Extensions

* Make this configurable to support more cost associations
