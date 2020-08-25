(defmethod staple:template ((system (eql (asdf:find-system :lispmath))))
  (asdf:system-relative-pathname system #p"template.ctml"))
(defclass my-page (staple:simple-page) ())
(defmethod staple:page-type ((system (eql (asdf:find-system :lispmath)))) 'my-page)
(defmethod staple:resolve-source-link (source (page my-page))
  (format NIL "http://github.com/mohindertalafuse/lispmath/blob/master/~a.lisp#L~a" 
    (pathname-name (getf source :file))
    (getf source :row)))
