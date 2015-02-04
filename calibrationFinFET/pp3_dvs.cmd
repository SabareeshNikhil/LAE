

(sdegeo:create-rectangle (position 0 0 0)  (position 14 1 0) "InGaAs" "p_region" )
(sdegeo:create-rectangle (position 0 0 0)  (position 8 -0.3 0) "InGaAs" "n_region" )

(sdegeo:create-rectangle (position 0 -0.3 0)  (position 3 -0.5 0) "Metal" "Cathode" )
(sdegeo:create-rectangle (position 11 0 0)  (position 14 -0.2 0) "Metal" "Anode" )



(sdedr:define-constant-profile "p_doping_definition" "GalliumActiveConcentration" 1e+17)
(sdedr:define-constant-profile-region "p_doping_placement" "p_doping_definition" "p_region")

(sdedr:define-constant-profile "n_doping_definition" "ArsenicActiveConcentration" 1e+17)
(sdedr:define-constant-profile-region "n_doping_placement" "n_doping_definition" "n_region")



(sdegeo:define-contact-set "Cathode" 4  (color:rgb 1 0 0 ) "##" )
(sdegeo:set-current-contact-set "Cathode")
(sdegeo:set-contact-faces (find-face-id (position 1.5 -0.4 0)) "Cathode")

(sdegeo:define-contact-set "Anode" 4  (color:rgb 1 0 0 ) "##" )
(sdegeo:set-current-contact-set "Anode")
(sdegeo:set-contact-faces (find-face-id (position 12.5 -0.1 0)) "Anode")



(sdedr:define-refinement-size "RefinementDefinition" 0.1 0.01 0.01 0.001 )
(sdedr:define-refinement-material "RefinementPlacement" "RefinementDefinition" "InGaAs" )




(sde:build-mesh "mesh" "-F tdr " "sde_dvs_3_msh")




