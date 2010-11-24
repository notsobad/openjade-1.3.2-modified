<!doctype style-sheet PUBLIC "-//James Clark//DTD DSSSL Style Sheet//EN">
<!-- Copyright (C) 1999 Avi Kivity -->
                 
<style-sheet>
<style-specification>
<style-specification-body>

<![cdata[                
                 
(root
    (test-expression-language)
)

(define (test-expression-language)
    (sosofo-append
        (make-test "Character Primitives" test-char)
        (make-test "String Primitives" test-string)
    )
)

(define (test-char)
    (sosofo-append
        (testcase 'char=?      #\a #\b)
        (testcase 'char=?      #\a #\a)
        (testcase 'char=?      #\a #\A)
        (testcase 'char<?      #\a #\b)
        (testcase 'char<?      #\a #\a)
        (testcase 'char<?      #\a #\A)
        (testcase 'char<=?     #\a #\b)
        (testcase 'char<=?     #\a #\a)
        (testcase 'char<=?     #\a #\A)
        (testcase 'char>?      #\a #\b)
        (testcase 'char>?      #\a #\a)
        (testcase 'char>?      #\a #\A)
        (testcase 'char>=?     #\a #\b)
        (testcase 'char>=?     #\a #\a)
        (testcase 'char>=?     #\a #\A)
        (testcase 'char-ci=?   #\a #\b)
        (testcase 'char-ci=?   #\a #\a)
        (testcase 'char-ci=?   #\a #\A)
        (testcase 'char-ci<?   #\a #\b)
        (testcase 'char-ci<?   #\a #\a)
        (testcase 'char-ci<?   #\a #\A)
        (testcase 'char-ci<=?  #\a #\b)
        (testcase 'char-ci<=?  #\a #\a)
        (testcase 'char-ci<=?  #\a #\A)
        (testcase 'char-ci>?   #\a #\b)
        (testcase 'char-ci>?   #\a #\a)
        (testcase 'char-ci>?   #\a #\A)
        (testcase 'char-ci>=?  #\a #\b)
        (testcase 'char-ci>=?  #\a #\a)
        (testcase 'char-ci>=?  #\a #\A)
    )
)

(define (test-string)
    (testcase 'string=? "\latin-small-letter-a\latin-small-letter-b;c" "abc")
)

(define symbol-proc-map
    `(
        (char=? . ,char=?) (char<? . ,char<?) (char<=? . ,char<=?) 
        (char>? . ,char>?) (char>=? . ,char>=?) (char-ci=? . ,char-ci=?)
        (char-ci<? . ,char-ci<?) (char-ci<=? . ,char-ci<=?)
        (char-ci>? . ,char-ci>?) (char-ci>=? . ,char-ci>=?)
        (string=? . ,string=?)
    )     
)
     
(define (symbol->proc sym) (cdr (assoc sym symbol-proc-map)))     
                  
(define (testcase proc-sym #!rest args)
    (write-line
        (string-append
            "(" 
            (symbol->string proc-sym)
            (reduce 
                args
                (lambda (args arg) (string-append args " " (obj->string arg)))
                ""
            )
            " --> "
            (obj->string (apply (symbol->proc proc-sym) args))
        )
    )
)       

(define (obj->string obj)
    (cond
        ((char? obj) (list->string (list #\# #\\ obj)))
        ((string? obj) (string-append "\"" obj "\""))
        ((boolean? obj) (if obj "#t" "#f"))
        ((symbol? obj) (symbol->string obj))
        (else "unimplemented")
    )
)           
                  
(define (make-test title proc)
    (sosofo-append
        (write-line title)
        (proc)
        (write-empty-line)
    )
)    

(define (write-empty-line) (write-line ""))

(define newline "\carriage-return;\line-feed;")

(define (write-line string)
    (make formatting-instruction
        data: (string-append string newline)
    )
)

(declare-flow-object-class formatting-instruction
  "UNREGISTERED::James Clark//Flow Object Class::formatting-instruction")

(declare-default-language (language "EN" "US"))

(define language
  (external-procedure "UNREGISTERED::OpenJade//Procedure::language"))

]]>

</style-specification-body>
</style-specification>
</style-sheet>
