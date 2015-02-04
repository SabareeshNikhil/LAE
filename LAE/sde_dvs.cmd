(sdegeo:create-rectangle (position 0 0.3 0)  (position 14 1 0) "InP" "substrate" )
(sdegeo:create-rectangle (position 0 0 0)  (position 14 0.3 0) "InGaAs" "p_region" )
;(sdegeo:create-rectangle (position 0 0 0)  (position 10 -0.2 0) "InGaAs" "n_region" )


(sdedr:define-constant-profile "p_doping_definition" "BoronActiveConcentration" 1e+18)
(sdedr:define-constant-profile "n_doping_definition" "PhosphorusActiveConcentration" 1e+17)


(sdegeo:create-rectangle (position 0 -0.18683 0)  (position 10 -0.2 0) "InGaAs" "n_region_9" )
(sdedr:define-constant-profile-region "n_doping_placement_9" "n_doping_definition" "n_region_9")

(sdegeo:create-rectangle (position 0 -0.17211 0)  (position 10 -0.18683 0) "InGaAs" "n_region_8" )
(sdedr:define-constant-profile-region "n_doping_placement_8" "n_doping_definition" "n_region_8")

(sdegeo:create-rectangle (position 0 -0.15542 0)  (position 10 -0.17211 0) "InGaAs" "n_region_7" )
(sdedr:define-constant-profile-region "n_doping_placement_7" "n_doping_definition" "n_region_7")

(sdegeo:create-rectangle (position 0 -0.13615 0)  (position 10 -0.15542 0) "InGaAs" "n_region_6" )
(sdedr:define-constant-profile-region "n_doping_placement_6" "n_doping_definition" "n_region_6")

(sdegeo:create-rectangle (position 0 -0.11336 0)  (position 10 -0.13615 0) "InGaAs" "n_region_5" )
(sdedr:define-constant-profile-region "n_doping_placement_5" "n_doping_definition" "n_region_5")

(sdegeo:create-rectangle (position 0 -0.08546 0)  (position 10 -0.11336 0) "InGaAs" "n_region_4" )
(sdedr:define-constant-profile-region "n_doping_placement_4" "n_doping_definition" "n_region_4")

(sdegeo:create-rectangle (position 0 -0.04950 0)  (position 10 -0.08546 0) "InGaAs" "n_region_3" )
(sdedr:define-constant-profile-region "n_doping_placement_3" "n_doping_definition" "n_region_3")

(sdegeo:create-rectangle (position 0 0 0)  (position 10 -0.04950 0) "InGaAs" "n_region_2" )
(sdedr:define-constant-profile-region "n_doping_placement_2" "n_doping_definition" "n_region_2")




(sdegeo:create-rectangle (position 0 0.08782 0)  (position 14 0 0) "InGaAs" "p_region_1" )
(sdedr:define-constant-profile-region "p_doping_placement_1" "p_doping_definition" "p_region_1")

(sdegeo:create-rectangle (position 0 0.5 0)  (position 14 0.08782 0) "InGaAs" "p_region_0" )
(sdedr:define-constant-profile-region "p_doping_placement_0" "p_doping_definition" "p_region_0")





(sdegeo:create-rectangle (position 1 -0.2 0)  (position 9 -0.201 0) "InGaAs" "ntype_contact" )
(sdegeo:create-rectangle (position 11 0 0)  (position 13 -0.001 0) "InGaAs" "ptype_contact" )




(sdegeo:define-contact-set "ntype" 4  (color:rgb 1 0 0 ) "##" )
(sdegeo:set-current-contact-set "ntype")
(sdegeo:set-contact-edges (find-edge-id (position 1.5 -0.201 0)) "ntype")


(sdegeo:define-contact-set "ptype" 4  (color:rgb 1 0 0 ) "##" )
(sdegeo:set-current-contact-set "ptype")
(sdegeo:set-contact-edges (find-edge-id (position 12.5 -0.001 0)) "ptype")

(sdedr:define-refinement-size "RefinementDefinition_sub" 0.5 0.05 0.5 0.5 0.05 0.1 )
(sdedr:define-refinement-region "RefinementPlacement_sub" "RefinementDefinition_sub" "substrate" )

(sdedr:define-refinement-size "RefinementDefinition_p" 0.05 0.005 0.5 0.05 0.001 0.1 )

(sdedr:define-refinement-size "RefinementDefinition_n" 0.05 0.001 0.5 0.05 0.0002 0.1 )
(sdedr:define-refinement-region "RefinementPlacement_n" "RefinementDefinition_n" "n_region_9" )

(sdedr:define-refinement-region "RefinementPlacement_n" "RefinementDefinition_n" "n_region_8" )

(sdedr:define-refinement-region "RefinementPlacement_n" "RefinementDefinition_n" "n_region_7" )

(sdedr:define-refinement-region "RefinementPlacement_n" "RefinementDefinition_n" "n_region_6" )

(sdedr:define-refinement-region "RefinementPlacement_n" "RefinementDefinition_n" "n_region_5" )

(sdedr:define-refinement-region "RefinementPlacement_n" "RefinementDefinition_n" "n_region_4" )

(sdedr:define-refinement-region "RefinementPlacement_n" "RefinementDefinition_n" "n_region_3" )

(sdedr:define-refinement-region "RefinementPlacement_n" "RefinementDefinition_n" "n_region_2" )

(sdedr:define-refinement-region "RefinementPlacement_p" "RefinementDefinition_n" "p_region_1" )

(sdedr:define-refinement-region "RefinementPlacement_p" "RefinementDefinition_p" "p_region_0" )

(sde:set-meshing-command "snmesh -a -c boxmethod")
(sdedr:append-cmd-file "")
(sde:build-mesh "snmesh" "-a -c boxmethod" "sdemodel")

