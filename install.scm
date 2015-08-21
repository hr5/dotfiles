(use posix)
(use regex)
(use section-combinators)
(use srfi-1)

(define (make-dirs dirs) 
  (map (right-section create-directory #t) 
       dirs))

(define (basedir dir root)
  (string-substitute (string-append "^" root "/*") 
                     ""
                     dir))

(define (absolute-path dir) 
  (let ((cwd (current-directory))
        (apath (and (change-directory dir)
                    (current-directory))))
    (change-directory cwd)
    (string-append apath "/")))

(define (make-link src dst #!optional (overwrite? #t)) 
  (condition-case 
    (begin (create-symbolic-link src dst) 
           (display (string-append src 
                                   " -> " 
                                   dst)) 
           (newline)) 
    ((exn i/o file) (if overwrite? 
                      (begin (display "[Overwrite] ")
                             (delete-file dst)
                             (make-link src dst #t))
                      (display "File exists, ignored")))))

(define (exclude? file) 
  (string-search "git" file))

(define (main src 
              dst 
              #!optional (overwrite #f))
  (let ((source-dirs (find-files src 
                                 test: (lambda (file) (and (directory? file) 
                                                           (not (exclude? file)))) 
                                 dotfiles: #t))
        (source-files (find-files src 
                                  test: (lambda (file) (and (regular-file? file) 
                                                            (not (exclude? file))))
                                  dotfiles: #t))
        (remove-src (right-section basedir src)))
    (change-directory dst)
    (make-dirs (map remove-src source-dirs))
    (map make-link 
         source-files
         (map (lambda (file) 
                (string-append dst file)) 
              (map remove-src source-files)))))


(define args 
  (drop (argv) 
        (+ 1 (list-index (left-section equal? (program-name)) 
                         (argv)))))

(if (<  (length args) 2) 
  (error "Too Few Args")
  (main (absolute-path (list-ref args 0)) 
        (absolute-path (list-ref args 1))))
