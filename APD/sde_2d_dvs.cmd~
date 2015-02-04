(sde:clear)

(sdegeo:create-rectangle 
  (position 0 0 0.0 )  (position 6 3 0.0 ) "Silicon" "p_substrate" )
(sdedr:define-refeval-window 
  "RefEvalWin_pSubstrate" "Rectangle"  (position 0 0 0.0 )  (position 6 3 0.0 ))
(sdedr:define-constant-profile 
  "ConstantProfileDefinition_pSubstrate" "DopingConcentration" -3e17)
(sdedr:define-constant-profile-placement 
  "ConstantProfilePlacement_pSubstrate" "ConstantProfileDefinition_pSubstrate" "RefEvalWin_pSubstrate")
(sdedr:define-multibox-size "MultiboxDefinition_pSubstrate" 2 0.2 0 0.5 0.1 0 1.2 1.2 1 )
(sdedr:define-multibox-placement 
  "MultiboxPlacement_pSubstrate" "MultiboxDefinition_pSubstrate" "RefEvalWin_pSubstrate" )

(sdegeo:create-rectangle 
  (position 0.55 0 0.0 )  (position 5.45 1.6 0.0 ) "Silicon" "n_well" )
(sdedr:define-refeval-window 
  "RefEvalWin_nWell" "Rectangle"  (position 0.55 0 0.0 )  (position 5.45 1.6 0.0 ))
(sdedr:define-constant-profile 
  "ConstantProfileDefinition_nWell" "DopingConcentration" 1e15)
(sdedr:define-constant-profile-placement 
  "ConstantProfilePlacement_nWell" "ConstantProfileDefinition_nWell" "RefEvalWin_nWell")
(sdedr:define-multibox-size "MultiboxDefinition_nWell" 0.5 0.1 0 0.1 0.05 0 1.2 1.2 1 )
(sdedr:define-multibox-placement 
  "MultiboxPlacement_nWell" "MultiboxDefinition_nWell" "RefEvalWin_nWell" )

(sdegeo:create-rectangle 
  (position 0.55 -0.14 0.0 )  (position 1.4 0 0.0 ) "Gold" "cathode1_contact" )
(sdegeo:define-contact-set "cathode1" 4 (color:rgb 1 0 0) "##")
(sdegeo:set-current-contact-set "cathode1")
(sdegeo:define-2d-contact (find-edge-id (position 0.975 0 0))
(sdegeo:get-current-contact-set))

(sdegeo:create-rectangle 
  (position 4.6 -0.14 0.0 )  (position 5.45 0 0.0 ) "Gold" "cathode_contact" )
(sdegeo:define-contact-set "cathode" 4 (color:rgb 1 0 0) "##")
(sdegeo:set-current-contact-set "cathode")
(sdegeo:define-2d-contact (find-edge-id (position 5.025 0 0))
(sdegeo:get-current-contact-set))

(sdegeo:create-rectangle 
  (position 2.86 -0.14 0.0 )  (position 3.14 0 0.0 ) "Gold" "anode_contact" )
(sdegeo:define-contact-set "anode" 4 (color:rgb 1 0 0) "##")
(sdegeo:set-current-contact-set "anode")
(sdegeo:define-2d-contact (find-edge-id (position 3.0 -0.14 0))
(sdegeo:get-current-contact-set))

(sdegeo:create-rectangle 
  (position 0.55 0 0.0 )  (position 1.4 0.15 0.0 ) "Silicon" "n+_1" )
(sdedr:define-refeval-window 
  "RefEvalWin_n+Implant_1" "Rectangle"  (position 0.55 0 0.0 )  (position 1.4 0.15 0.0 ))
(sdedr:define-constant-profile 
  "ConstantProfileDefinition_n+Implant_1" "DopingConcentration" 3e18)
(sdedr:define-constant-profile-placement 
  "ConstantProfilePlacement_n+Implant_1" "ConstantProfileDefinition_n+Implant_1" "RefEvalWin_n+Implant_1")
(sdedr:define-multibox-size "MultiboxDefinition_n+Implant_1" 0.1 0.05 0 0.01 0.01 0 1.2 1.2 1 )
(sdedr:define-refeval-window 
  "RefEvalWin_n+Implant_1_1" "Rectangle"  (position (- 0.75 0.1) 0 0.0 )  (position (+ 0.95 0.1) (+ 0.15 0.05) 0.0 ))
(sdedr:define-multibox-placement 
  "MultiboxPlacement_n+Implant_1" "MultiboxDefinition_n+Implant_1" "RefEvalWin_n+Implant_1_1" )


(sdegeo:create-rectangle 
  (position 4.6 0 0.0 )  (position 5.45 0.15 0.0 ) "Silicon" "n+" )
(sdedr:define-refeval-window 
  "RefEvalWin_n+Implant" "Rectangle"  (position 4.6 0 0.0 )  (position 5.45 0.15 0.0 ))
(sdedr:define-constant-profile 
  "ConstantProfileDefinition_n+Implant" "DopingConcentration" 3e18)
(sdedr:define-constant-profile-placement 
  "ConstantProfilePlacement_n+Implant" "ConstantProfileDefinition_n+Implant" "RefEvalWin_n+Implant")
(sdedr:define-multibox-size "MultiboxDefinition_n+Implant" 0.1 0.05 0 0.01 0.01 0 1.2 1.2 1 )
(sdedr:define-refeval-window 
  "RefEvalWin_n+Implant_0_1" "Rectangle"  (position (- 5.05 0.1) 0 0.0 )  (position (+ 5.25 0.1) (+ 0.15 0.05) 0.0 ))
(sdedr:define-multibox-placement 
  "MultiboxPlacement_n+Implant" "MultiboxDefinition_n+Implant" "RefEvalWin_n+Implant_0_1" )


(sdegeo:create-rectangle 
  (position 2 0 0.0 )  (position 4 0.2 0.0 ) "Silicon" "p+" )
(sdedr:define-refeval-window 
  "RefEvalWin_p+Implant" "Rectangle"  (position 2 0 0.0 )  (position 4 0.2 0.0 ))
(sdedr:define-constant-profile 
  "ConstantProfileDefinition_p+Implant" "DopingConcentration" -3e18)
(sdedr:define-constant-profile-placement 
  "ConstantProfilePlacement_p+Implant" "ConstantProfileDefinition_p+Implant" "RefEvalWin_p+Implant")
(sdedr:define-multibox-size "MultiboxDefinition_p+Implant" 0.05 0.05 0 0.01 0.01 0 1.2 1.2 1 )
(sdedr:define-refeval-window 
  "RefEvalWin_p+Implant_1" "Rectangle"  (position (- 2 0.1) 0 0.0 )  (position (+ 4 0.1) (+ 0.2 0.05) 0.0 ))
(sdedr:define-multibox-placement 
  "MultiboxPlacement_p+Implant" "MultiboxDefinition_p+Implant" "RefEvalWin_p+Implant_1" )

(sdegeo:create-rectangle 
  (position 1.4 0 0.0 )  (position 2 0.43 0.0 ) "Oxide" "STI_1" )
(sdedr:define-multibox-size "MultiboxDefinition_STI_1_1" 0.05 0.05 0 0.01 0.01 0 1.2 1.2 1 )
(sdedr:define-refeval-window 
  "RefEvalWin_STI_1_1" "Rectangle"  (position (- 1.2 0.1) 0 0.0 )  (position (+ 1.2 0.1) (+ 0.43 0.05) 0.0 ))
(sdedr:define-multibox-placement 
  "MultiboxPlacement_STI_1_1" "MultiboxDefinition_STI_1_1" "RefEvalWin_STI_1_1" )
(sdedr:define-multibox-size "MultiboxDefinition_STI_1_2" 0.05 0.05 0 0.01 0.01 0 1.2 1.2 1 )
(sdedr:define-refeval-window 
  "RefEvalWin_STI_1_2" "Rectangle"  (position (- 2 0.1) 0 0.0 )  (position (+ 2 0.1) (+ 0.43 0.05) 0.0 ))
(sdedr:define-multibox-placement 
  "MultiboxPlacement_STI_1_2" "MultiboxDefinition_STI_1_2" "RefEvalWin_STI_1_2" )
(sdedr:define-multibox-size "MultiboxDefinition_STI_1_3" 0.05 0.05 0 0.01 0.01 0 1.2 1.2 1 )
(sdedr:define-refeval-window 
  "RefEvalWin_STI_1_3" "Rectangle"  (position (- 1.2 0.1) (- 0.43 0.1) 0.0 )  (position (+ 2 0.1) (+ 0.43 0.1) 0.0 ))
(sdedr:define-multibox-placement 
  "MultiboxPlacement_STI_1_3" "MultiboxDefinition_STI_1_3" "RefEvalWin_STI_1_3" )

(sdegeo:create-rectangle 
  (position 4 0 0.0 )  (position 4.6 0.43 0.0 ) "Oxide" "STI" )
(sdedr:define-multibox-size "MultiboxDefinition_STI_1" 0.05 0.05 0 0.01 0.01 0 1.2 1.2 1 )
(sdedr:define-refeval-window 
  "RefEvalWin_STI_1" "Rectangle"  (position (- 4 0.1) 0 0.0 )  (position (+ 4 0.1) (+ 0.43 0.05) 0.0 ))
(sdedr:define-multibox-placement 
  "MultiboxPlacement_STI_1" "MultiboxDefinition_STI_1" "RefEvalWin_STI_1" )
(sdedr:define-multibox-size "MultiboxDefinition_STI_2" 0.05 0.05 0 0.01 0.01 0 1.2 1.2 1 )
(sdedr:define-refeval-window 
  "RefEvalWin_STI_2" "Rectangle"  (position (- 4.8 0.1) 0 0.0 )  (position (+ 4.8 0.1) (+ 0.43 0.05) 0.0 ))
(sdedr:define-multibox-placement 
  "MultiboxPlacement_STI_2" "MultiboxDefinition_STI_2" "RefEvalWin_STI_2" )
(sdedr:define-multibox-size "MultiboxDefinition_STI_3" 0.05 0.05 0 0.01 0.01 0 1.2 1.2 1 )
(sdedr:define-refeval-window 
  "RefEvalWin_STI_3" "Rectangle"  (position (- 4 0.1) (- 0.43 0.1) 0.0 )  (position (+ 4.8 0.1) (+ 0.43 0.1) 0.0 ))
(sdedr:define-multibox-placement 
  "MultiboxPlacement_STI_3" "MultiboxDefinition_STI_3" "RefEvalWin_STI_3" )

(sdegeo:create-rectangle 
  (position 0 0 0.0 )  (position 0.55 0.43 0.0 ) "Oxide" "STI_left" )
(sdegeo:create-rectangle 
  (position 5.45 0 0.0 )  (position 6.0 0.43 0.0 ) "Oxide" "STI_right" )


;----------------------------------------------------------------------
; Build Mesh 
(sde:build-mesh "snmesh" " " "sde_2d_msh")

