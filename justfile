default:
        just --list
lisp-project:
        sbcl
rust-project:
        cargo new $1
