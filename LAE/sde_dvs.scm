
;; Defined Parameters:

;; Contact Sets:
(sdegeo:define-contact-set "Contact" 4 (color:rgb 1 0 0 )"##" )
(sdegeo:define-contact-set "Contact2" 4 (color:rgb 1 0 0 )"##" )

;; Work Planes:
(sde:workplanes-init-scm-binding)

;; Defined ACIS Refinements:
(sde:refinement-init-scm-binding)

;; Restore GUI session parameters:
(sde:set-window-position 0 22)
(sde:set-window-size 1920 1138)
(sde:set-window-style "Windows")
(sde:set-background-color 0 127 178 204 204 204)
(sde:scmwin-set-prefs "Helvetica" "Normal" 12 100 )
