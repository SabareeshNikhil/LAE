(sdegeo:create-rectangle (position 0 @<0.001*p_width>@ 0)  (position 3 1 0) "InP" "substrate" )
;(sdegeo:create-rectangle (position 2 @<0.001*p_width>@ 0)  (position 3 1 0) "InP" "substrate" )


(sdedr:define-constant-profile "p_doping_definition" "BoronActiveConcentration" @p_doping@)
(sdedr:define-constant-profile "n_doping_definition" "PhosphorusActiveConcentration" @n_doping@)


(sdegeo:create-rectangle (position 0 0 0)  (position 3 @<0.001*p_width>@ 0) "InGaAs" "p_region" )
(sdedr:define-constant-profile-region "p_doping_placement" "p_doping_definition" "p_region")

(sdegeo:create-rectangle (position 0 0 0)  (position 3 @<-0.001*n_width>@ 0) "InGaAs" "n_region" )
(sdedr:define-constant-profile-region "n_doping_placement" "n_doping_definition" "n_region")

(sdegeo:create-rectangle (position 1 @<-0.001*n_width>@ 0)  (position 2 @<-0.001*n_width - 0.001>@ 0) "InGaAs" "ntype_contact" )
;(sdegeo:create-rectangle (position 1 @<0.001*p_width>@ 0)  (position 2 @<0.001*p_width + 0.001>@ 0) "InP" "ptype_contact" )
(sdegeo:create-rectangle (position 1 1 0)  (position 2 1.001 0) "InP" "ptype_contact" )

(sdegeo:define-contact-set "ntype" 4  (color:rgb 1 0 0 ) "##" )
(sdegeo:set-current-contact-set "ntype")
(sdegeo:set-contact-edges (find-edge-id (position 1.5 @<-0.001*n_width - 0.001>@ 0)) "ntype")


(sdegeo:define-contact-set "ptype" 4  (color:rgb 1 0 0 ) "##" )
(sdegeo:set-current-contact-set "ptype")
(sdegeo:set-contact-edges (find-edge-id (position 1.5 1.001 0)) "ptype")
;(sdegeo:set-contact-edges (find-edge-id (position 1.5 @<0.001*p_width + 0.001>@ 0)) "ptype")

(sdedr:define-refinement-size "RefinementDefinition_sub" 0.5 0.05 0.5 0.5 0.05 0.1 )
(sdedr:define-refinement-region "RefinementPlacement_sub" "RefinementDefinition_sub" "substrate" )
;(sdedr:define-refinement-region "RefinementPlacement_sub" "RefinementDefinition_sub" "substrate_2" )


(sdedr:define-refinement-size "RefinementDefinition_p" 0.05 0.02 0.5 0.05 0.01 0.1 )

(sdedr:define-refinement-size "RefinementDefinition_n" 0.05 0.005 0.5 0.05 0.001 0.1 )
(sdedr:define-refinement-region "RefinementPlacement_n" "RefinementDefinition_n" "n_region" )

(sdedr:define-refinement-region "RefinementPlacement_p" "RefinementDefinition_n" "p_region" )

(sde:set-meshing-command "snmesh -a -c boxmethod")
(sdedr:append-cmd-file "")
(sde:build-mesh "snmesh" "-a -c boxmethod" "sdemodel_ntype_@n_width@_@n_doping@_ptype_@p_width@_@p_doping@")
