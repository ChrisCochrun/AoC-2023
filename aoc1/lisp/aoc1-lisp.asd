(defsystem "aoc1-lisp"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "aoc1-lisp/tests"))))

(defsystem "aoc1-lisp/tests"
  :author ""
  :license ""
  :depends-on ("aoc1-lisp"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for aoc1-lisp"
  :perform (test-op (op c) (symbol-call :rove :run c)))
