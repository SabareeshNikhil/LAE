
;; Defined Parameters:

;; Contact Sets:
(sdegeo:define-contact-set "cathode" 4 (color:rgb 1 0 0 )"##" )
(sdegeo:define-contact-set "anode" 4 (color:rgb 1 0 0 )"##" )

;; Work Planes:
(sde:workplanes-init-scm-binding)

;; Defined ACIS Refinements:
(sde:refinement-init-scm-binding)

;; Reference/Evaluation Windows:
(sdedr:define-refeval-window "RefEvalWin_pSubstrate" "Rectangle" (position 0 0 0) (position 6 3 0))
(sdedr:define-refeval-window "RefEvalWin_nWell" "Rectangle" (position 0.5 0 0) (position 5.5 1.6 0))
(sdedr:define-refeval-window "RefEvalWin_n+Implant_1" "Rectangle" (position 0.9 0 0) (position 1.1 0.15 0))
(sdedr:define-refeval-window "RefEvalWin_n+Implant_1_1" "Rectangle" (position 0.8 0 0) (position 1.2 0.2 0))
(sdedr:define-refeval-window "RefEvalWin_n+Implant" "Rectangle" (position 4.9 0 0) (position 5.1 0.15 0))
(sdedr:define-refeval-window "RefEvalWin_n+Implant_0_1" "Rectangle" (position 4.8 0 0) (position 5.2 0.2 0))
(sdedr:define-refeval-window "RefEvalWin_p+Implant" "Rectangle" (position 2 0 0) (position 4 0.2 0))
(sdedr:define-refeval-window "RefEvalWin_p+Implant_1" "Rectangle" (position 1.9 0 0) (position 4.1 0.25 0))
(sdedr:define-refeval-window "RefEvalWin_STI_1_1" "Rectangle" (position 1.1 0 0) (position 1.3 0.85 0))
(sdedr:define-refeval-window "RefEvalWin_STI_1_2" "Rectangle" (position 1.9 0 0) (position 2.1 0.85 0))
(sdedr:define-refeval-window "RefEvalWin_STI_1_3" "Rectangle" (position 1.1 0.7 0) (position 2.1 0.9 0))
(sdedr:define-refeval-window "RefEvalWin_STI_1" "Rectangle" (position 3.9 0 0) (position 4.1 0.85 0))
(sdedr:define-refeval-window "RefEvalWin_STI_2" "Rectangle" (position 4.7 0 0) (position 4.9 0.85 0))
(sdedr:define-refeval-window "RefEvalWin_STI_3" "Rectangle" (position 3.9 0.7 0) (position 4.9 0.9 0))
