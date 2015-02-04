(sdegeo:create-rectangle (position 0 0 0)  (position 14 1 0) "InGaAs" "p_region" )
(sdegeo:create-rectangle (position 0 0 0)  (position 10 -0.3 0) "InGaAs" "n_region" )

(sdegeo:create-rectangle (position 1 -0.3 0)  (position 9 -0.301 0) "InGaAs" "Cathode_contact" )
(sdegeo:create-rectangle (position 11 0 0)  (position 13 -0.001 0) "InGaAs" "Anode_contact" )

;(sdedr:define-constant-profile "p_doping_definition_1" "BoronActiveConcentration" 5e+19)
;(sdedr:define-constant-profile-region "p_doping_placement_1" "p_doping_definition_1" "Cathode_contact")

;(sdedr:define-constant-profile "n_doping_definition_1" "PhosphorusActiveConcentration" 5e+19)
;(sdedr:define-constant-profile-region "n_doping_placement_1" "n_doping_definition_1" "Anode_contact")

(sdedr:define-constant-profile "p_doping_definition" "GalliumActiveConcentration" 1e+17)
(sdedr:define-constant-profile-region "p_doping_placement" "p_doping_definition" "p_region")

(sdedr:define-constant-profile "n_doping_definition" "ArsenicActiveConcentration" 1e+17)
(sdedr:define-constant-profile-region "n_doping_placement" "n_doping_definition" "n_region")



(sdegeo:define-contact-set "Cathode" 4  (color:rgb 1 0 0 ) "##" )
(sdegeo:set-current-contact-set "Cathode")
(sdegeo:set-contact-edges (find-edge-id (position 1.5 -0.301 0)) "Cathode")
;(sdegeo:define-3d-contact (list (car (find-face-id (position 1.5 -0.4 0)))) "Cathode")



(sdegeo:define-contact-set "Anode" 4  (color:rgb 1 0 0 ) "##" )
(sdegeo:set-current-contact-set "Anode")
(sdegeo:set-contact-edges (find-edge-id (position 12.5 -0.001 0)) "Anode")
;(sdegeo:define-3d-contact (list (car (find-face-id (position 12.5 -0.1 0)))) "Anode")

;(sdegeo:create-rectangle (position 0 0 0)  (position 14 1 0) "Silicon" "p_region" )
;(sdegeo:create-rectangle (position 0 0 0)  (position 8 -0.3 0) "Silicon" "n_region" )


;(sdedr:define-refinement-size "RefinementDefinition" 0.01 0.001 0.001 0.0001 )
;(sdedr:define-refinement-material "RefinementPlacement" "RefinementDefinition" "InGaAs" )

(sdedr:define-refinement-size "RefinementDefinition_p" 0.5 0.05 0.5 0.05 0.001 0.1 )
(sdedr:define-refinement-region "RefinementPlacement_p" "RefinementDefinition_p" "p_region" )

(sdedr:define-refinement-size "RefinementDefinition_p_1" 0.01 0.001 0.5 0.001 0.0001 0.1 )
(sdedr:define-refinement-region "RefinementPlacement_p_1" "RefinementDefinition_p_1" "p_region_1" )

(sdedr:define-refinement-size "RefinementDefinition_n" 0.5 0.005 0.5 0.05 0.0001 0.1 )
(sdedr:define-refinement-region "RefinementPlacement_n" "RefinementDefinition_n" "n_region" )

(sdedr:define-refinement-size "RefinementDefinition_n_1" 0.01 0.001 0.5 0.001 0.0001 0.1 )
(sdedr:define-refinement-region "RefinementPlacement_n_1" "RefinementDefinition_n_1" "n_region_1" )


;(sde:build-mesh "mesh" "-F tdr " "sde_dvs")
(sde:set-meshing-command "snmesh -a -c boxmethod")
(sdedr:append-cmd-file "")
(sde:build-mesh "snmesh" "-a -c boxmethod" "sdemodel")

