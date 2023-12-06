(defsystem "day3"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on ("str"
               "serapeum")
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "day3/tests"))))

(defsystem "day3/tests"
  :author ""
  :license ""
  :depends-on ("day3"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for day3"
  :perform (test-op (op c) (symbol-call :rove :run c)))
