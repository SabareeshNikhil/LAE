(sdegeo:create-rectangle (position 0 0.3 0)  (position 14 1 0) "InP" "substrate" )

(sdedr:define-constant-profile "p_doping_definition" "BoronActiveConcentration" 1e+18)
(sdedr:define-constant-profile "n_doping_definition" "PhosphorusActiveConcentration" 1e+17)


(sdegeo:create-rectangle (position 0 0 0)  (position 14 0.3 0) "InGaAs" "p_region" )
(sdedr:define-constant-profile-region "p_doping_placement" "p_doping_definition" "p_region")

(sdegeo:create-rectangle (position 0 0 0)  (position 10 -0.2 0) "InGaAs" "n_region" )
(sdedr:define-constant-profile-region "n_doping_placement" "n_doping_definition" "n_region")

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

(sdedr:define-refinement-size "RefinementDefinition_p" 0.05 0.02 0.5 0.05 0.01 0.1 )

(sdedr:define-refinement-size "RefinementDefinition_n" 0.05 0.005 0.5 0.05 0.001 0.1 )
(sdedr:define-refinement-region "RefinementPlacement_n" "RefinementDefinition_n" "n_region" )

(sdedr:define-refinement-region "RefinementPlacement_p" "RefinementDefinition_n" "p_region" )



(sde:set-meshing-command "snmesh -a -c boxmethod")
(sdedr:append-cmd-file "")
(sde:build-mesh "snmesh" "-a -c boxmethod" "sdemodel_constant")
