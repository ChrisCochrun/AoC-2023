(defsystem "day2"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "day2/tests"))))

(defsystem "day2/tests"
  :author ""
  :license ""
  :depends-on ("day2"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for day2"
  :perform (test-op (op c) (symbol-call :rove :run c)))
