(sde:clear)

(sdegeo:create-cylinder 
  (position 0 0 0.0 )  (position 0 3 0.0 ) 3 "Silicon" "p_substrate" )
(sdedr:define-refinement-size "RefinementDefinition_p_substrate" 1 0.2 1 0.5 0.1 0.5 )
(sdedr:define-refinement-region "RefinementPlacement_p_substrate" "RefinementDefinition_p_substrate" "p_substrate" )
(sdedr:define-constant-profile "ConstantProfileDefinition_p_substrate" "PhosphorusActiveConcentration" 1e17)
(sdedr:define-constant-profile-region "ConstantProfilePlacement_p_substrate" "ConstantProfileDefinition_p_substrate" "p_substrate")

(sdegeo:create-cylinder 
  (position 0 0 0.0 )  (position 0 1.6 0.0 ) 2.5 "Silicon" "n_well" )
(sdedr:define-refinement-size "RefinementDefinition_n_well" 0.5 0.1 0.5 0.1 0.05 0.1 )
(sdedr:define-refinement-region "RefinementPlacement_n_well" "RefinementDefinition_n_well" "n_well" )
(sdedr:define-constant-profile "ConstantProfileDefinition_n_well" "BoronActiveConcentration" 1e15)
(sdedr:define-constant-profile-region "ConstantProfilePlacement_n_well" "ConstantProfileDefinition_n_well" "n_well")

(sdegeo:create-cylinder 
  (position 0 -0.14 0.0 )  (position 0 0 0.0 ) 2.5 "Gold" "cathode_contact" )
(define contact_extra (sdegeo:create-cylinder 
  (position 0 -0.14 0.0 )  (position 0 0 0.0 ) 1.8 "Gold" "cathode_contact_extra" ))
(entity:delete contact_extra)
(sdegeo:define-contact-set "cathode" 4 (color:rgb 1 0 0) "##")
(sdegeo:set-current-contact-set "cathode")
(sdegeo:define-3d-contact (find-face-id (position 2.025 -0.14 0))
(sdegeo:get-current-contact-set))

(sdegeo:create-cylinder 
  (position 0 -0.14 0.0 )  (position 0 0 0.0 ) 0.14 "Gold" "anode_contact" )
(sdegeo:define-contact-set "anode" 4 (color:rgb 1 0 0) "##")
(sdegeo:set-current-contact-set "anode")
(sdegeo:define-3d-contact (find-face-id (position 0 -0.14 0))
(sdegeo:get-current-contact-set))


(sdegeo:create-cylinder 
  (position 0 0 0.0 )  (position 0 0.43 0.0 ) 3.0 "Oxide" "STI_right" )
(define STI_right_extra (sdegeo:create-cylinder 
  (position 0 0 0.0 )  (position 0 0.43 0.0 ) 2.45 "Oxide" "STI_right_extra" ))
(entity:delete STI_right_extra)

(sdegeo:create-cylinder 
  (position 0 0 0.0 )  (position 0 3 0.0 ) 2.45 "Silicon" "p_substrate_1" )
(sdedr:define-refinement-size "RefinementDefinition_p_substrate_1" 1 0.2 1 0.5 0.1 0.5 )
(sdedr:define-refinement-region "RefinementPlacement_p_substrate_1" "RefinementDefinition_p_substrate_1" "p_substrate_1" )
(sdedr:define-constant-profile "ConstantProfileDefinition_p_substrate_1" "PhosphorusActiveConcentration" 1e17)
(sdedr:define-constant-profile-region "ConstantProfilePlacement_p_substrate_1" "ConstantProfileDefinition_p_substrate_1" "p_substrate_1")

(sdegeo:create-cylinder 
  (position 0 0 0.0 )  (position 0 0.43 0.0 ) 2.45 "Silicon" "n+" )
(sdedr:define-refinement-size "RefinementDefinition_n+" 0.1 0.05 0.1 0.01 0.01 0.01 )
(sdedr:define-refinement-region "RefinementPlacement_n+" "RefinementDefinition_n+" "n+" )
(define n+_extra (sdegeo:create-cylinder 
  (position 0 0 0.0 )  (position 0 0.15 0.0 ) 1.6 "Silicon" "n+_extra" ))
(entity:delete n+_extra)
(sdedr:define-constant-profile "ConstantProfileDefinition_n+" "BoronActiveConcentration" 1e19)
(sdedr:define-constant-profile-region "ConstantProfilePlacement_n+" "ConstantProfileDefinition_n+" "n+")

(sdegeo:create-cylinder 
  (position 0 0 0.0 )  (position 0 0.43 0.0 ) 1.6 "Oxide" "STI" )
(define STI_extra (sdegeo:create-cylinder 
  (position 0 0 0.0 )  (position 0 0.43 0.0 ) 1 "Oxide" "STI_extra" ))
(entity:delete STI_extra)

(sdegeo:create-cylinder 
  (position 0 0 0.0 )  (position 0 3 0.0 ) 1 "Silicon" "p_substrate_2" )
(sdedr:define-refinement-size "RefinementDefinition_p_substrate_2" 1 0.2 1 0.5 0.1 0.5)
(sdedr:define-refinement-region "RefinementPlacement_p_substrate_2" "RefinementDefinition_p_substrate_2" "p_substrate_2" )
(sdedr:define-constant-profile "ConstantProfileDefinition_p_substrate_2" "PhosphorusActiveConcentration" 1e17)
(sdedr:define-constant-profile-region "ConstantProfilePlacement_p_substrate_2" "ConstantProfileDefinition_p_substrate_2" "p_substrate_2")

(sdegeo:create-cylinder 
  (position 0 0 0.0 )  (position 0 0.2 0.0 ) 1 "Silicon" "p+" )
(sdedr:define-refinement-size "RefinementDefinition_p+" 0.1 0.05 0.1 0.01 0.01 0.01 )
(sdedr:define-refinement-region "RefinementPlacement_p+" "RefinementDefinition_p+" "p+" )
(sdedr:define-constant-profile "ConstantProfileDefinition_p+" "PhosphorusActiveConcentration" 1e19)
(sdedr:define-constant-profile-region "ConstantProfilePlacement_p+" "ConstantProfileDefinition_p+" "p+")

;----------------------------------------------------------------------
; Build Mesh 
(sde:build-mesh "snmesh" " " "sde_msh")
