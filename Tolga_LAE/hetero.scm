
;; Defined Parameters:

;; Contact Sets:
(sdegeo:define-contact-set "ntype" 4 (color:rgb 1 0 0 )"##" )
(sdegeo:define-contact-set "ptype" 4 (color:rgb 1 1 0 )"##" )

;; Work Planes:
(sde:workplanes-init-scm-binding)

;; Defined ACIS Refinements:
(sde:refinement-init-scm-binding)

;; Reference/Evaluation Windows:
(sdedr:define-refeval-window "RefEvalWin_3" "Rectangle" (position 28 10.8 0) (position 42 11.2 0))
(sdedr:define-refeval-window "Refwin_2" "Rectangle" (position 28 10.8 0) (position 42 11.2 0))
(sdedr:define-refeval-window "RefEvalWin_4" "Rectangle" (position 30 14.3 0) (position 40 14.7 0))
(sdedr:define-refeval-window "Refwin_1" "Rectangle" (position 0 7.8 0) (position 100 8.2 0))

;; Restore GUI session parameters:
(sde:set-window-position 0 25)
(sde:set-window-size 840 800)
(sde:set-window-style "Windows")
(sde:set-background-color 0 127 178 204 204 204)
(sde:scmwin-set-prefs "Helvetica" "Normal" 9 100 )
