(use posix)
(use regex)
(use section-combinators)
(use srfi-1)

(define (make-directorys directorys)
  (map (right-section create-directory #t) 
       directorys))

(define (base-directory directory root-directory)
  (string-substitute (string-append "^" root-directory "/*") 
                     ""
                     directory))

(define (absolute-path directory)
  (let ((cwd (current-directory))
        (abs-path (and (change-directory directory)
                    (current-directory))))
    (change-directory cwd)
    (string-append abs-path "/")))

(define (make-link source destination #!optional (overwrite-files? #t)) 
  (condition-case 
    (begin (create-symbolic-link source destination) 
           (display (string-append source 
                                   " -> " 
                                   destination)) 
           (newline)) 
    ((exn i/o file) (if overwrite-files? 
                      (begin (display "[Overwrite] ")
                             (delete-file destination)
                             (make-link source destination #t))
                      (display "File exists, ignored")))))

(define (exclude-file? file)
  (or (string-search "git" file)
      (string-search "install" file)))

(define (main source 
              destination 
              #!optional (overwrite #f))
  (let ((source-directorys (find-files source 
                                 test: (lambda (file)
                                         (and (directory? file)
                                              (not (exclude-file? file)))) 
                                 dotfiles: #t))
        (source-files (find-files source 
                                  test: (lambda (file)
                                          (and (regular-file? file)
                                               (not (exclude-file? file))))
                                  dotfiles: #t))
        (remove-source (right-section base-directory source)))
    (change-directory destination)
    (make-directorys (map remove-source source-directorys))
    (let ((destination-files (map (lambda (file)
                                    (string-append destination (remove-source file)))
                                  source-files)))
      (map make-link
           source-files
           destination-files))))

(define args 
  (drop (argv) 
        (+ 1 (list-index (left-section equal? (program-name)) 
                         (argv)))))

(define help-message "install.scm source destination")

(if (<  (length args) 2) 
  (error (string-append "Too Few Args"
                        "\n"
                        help-message))
  (let ((source-directory (list-ref args 0))
        (destination-directory (list-ref args 1))) 
   (main (absolute-path source-directory)
         (absolute-path destination-directory))))
