(use-modules
 (magi)
 (gnu system)
 (gnu system file-systems)
 (gnu packages)
 (gnu services))

(define %configs
  (list
   (magi-config
    (name "<some-name>")
    (os (operating-system))
    (users (list
            (magi-user-config
             (name "<some-name>")
             (account (user-account))
             (environment (home-environment))))))))

(dispatcher %configs)
