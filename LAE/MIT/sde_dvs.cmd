(sde:clear)

(sdegeo:create-rectangle (position (+ -@xsimax@ -0.01) -0.02 0) (position (+ @xsimax@ 0.01) (+ @ysimax@ 0.02) 0) "Oxide" "R.Ox")
(sdegeo:create-rectangle (position -@xsimax@ 0 0) (position @xsimax@ @ysimax@ 0) "Silicon" "R.SiBody")

(sdegeo:create-rectangle (position -@xsimax@ 0 0 ) (position (+ -@xsimax@ 0.287) @ysimax@ 0) "Silicon" "R.Sinplusleft")
(sdegeo:create-rectangle (position  @xsimax@ 0 0 ) (position (- @xsimax@ 0.287) @ysimax@ 0) "Silicon" "R.Sinplusright")

(sdegeo:create-rectangle (position -@xsigemax@ (- @ysimax@ @ysigemax@) 0) (position @xsigemax@ @ysimax@ 0) "SiliconGermanium" "R.SiGe")


(define SiLeftContactRegion (sdegeo:create-rectangle (position (+ -@xsimax@ 0.1) @ysimax@ 0) (position  (+ -@xsimax@ 0.182)  (+ @ysimax@ 0.02) 0) "AnyMaterial" "R.SiConLeft"))
(define SiRightContactRegion (sdegeo:create-rectangle (position (- @xsimax@ 0.1) @ysimax@ 0) (position (- @xsimax@ 0.182) (+ @ysimax@ 0.02) 0) "AnyMaterial" "R.SiConRight"))
(define SiGeContactRegion (sdegeo:create-rectangle (position -0.041 @ysimax@ 0) (position 0.041 (+ @ysimax@ 0.02) 0) "AnyMaterial" "R.SiGeCon"))



(sdedr:define-constant-profile "Const.Si" "PhosphorusActiveConcentration" 5e14)
(sdedr:define-constant-profile "Const.SiGe" "BoronActiveConcentration" 1e18)
(sdedr:define-constant-profile "Const.Sinplusright" "PhosphorusActiveConcentration" 1e19)

(sdedr:define-constant-profile-region "PlaceCD.Si" "Const.Si" "R.SiBody")
(sdedr:define-constant-profile-region "PlaceCD.SiGe" "Const.SiGe" "R.SiGe")
(sdedr:define-constant-profile-region "PlaceCD.Sinplusleft" "Const.Sinplusright" "R.Sinplusleft")
(sdedr:define-constant-profile-region "PlaceCD.Sinplusright" "Const.Sinplusright" "R.Sinplusright")

(sdedr:define-refeval-window "RefWin.nplusleft" "Rectangle" (position (+ -@xsimax@ 0.282) -0.002 0) (position (+ -@xsimax@ 0.292) (+ @ysimax@ 0.002) 0))
(sdedr:define-refeval-window "RefWin.nplusright" "Rectangle" (position (+ @xsimax@ -0.282) -0.002 0) (position (+ @xsimax@ -0.292) (+ @ysimax@ 0.002) 0))

(sdedr:define-refeval-window "RefWin.sigeleft" "Rectangle" (position (+ -@xsigemax@ -0.01) 0.082 0) (position (+ -@xsigemax@ 0.01) (- (- @ysimax@ @ysigemax@) 0.01) 0))
(sdedr:define-refeval-window "RefWin.sigeright" "Rectangle" (position (+ @xsigemax@ -0.01) 0.082 0) (position (+ @xsigemax@ 0.01) (- (- @ysimax@ @ysigemax@) 0.01) 0))
(sdedr:define-refeval-window "RefWin.sigetop" "Rectangle" (position (+ -@xsigemax@ -0.01) (- (- @ysimax@ @ysigemax@) -0.01) 0) (position (+ @xsigemax@ 0.01) (- (- @ysimax@ @ysigemax@) 0.01) 0))

(sdedr:define-refinement-size "Size.SiStd" 0.01 0.01 0.000 0.01 0.01 0.000)
(sdedr:define-refinement-size "Size.SiGeStd" 0.01 0.01 0.000 0.01 0.01 0.000)
(sdedr:define-refinement-size "Size.nplusleft" 0.001 0.001 0.000 0.001 0.001 0.000) 
(sdedr:define-refinement-size "Size.nplusright" 0.001 0.001 0.000 0.001 0.001 0.000)

(sdedr:define-refinement-size "Size.sigeright" 0.001 0.001 0.000 0.001 0.001 0.000)
(sdedr:define-refinement-size "Size.sigeleft" 0.001 0.001 0.000 0.001 0.001 0.000)
(sdedr:define-refinement-size "Size.sigetop" 0.001 0.001 0.000 0.001 0.001 0.000)


(sdedr:define-refinement-material "Place.SiStd" "Size.SiStd" "Silicon")
(sdedr:define-refinement-material "Place.SiGeStd" "Size.SiGeStd" "SiliconGermanium")
(sdedr:define-refinement-placement "Place.nplusleft" "Size.nplusleft" "RefWin.nplusleft")
(sdedr:define-refinement-placement "Place.nplusright" "Size.nplusright" "RefWin.nplusright")

(sdedr:define-refinement-placement "Place.sigeright" "Size.sigeright" "RefWin.sigeright")
(sdedr:define-refinement-placement "Place.sigeleft" "Size.sigeleft" "RefWin.sigeleft")
(sdedr:define-refinement-placement "Place.sigetop" "Size.sigetop" "RefWin.sigetop")


(sdegeo:define-contact-set "SiContactLeft" (color:rgb 1.0 1.0 1.0) "##")
(sdegeo:define-contact-set "SiContactRight" (color:rgb 1.0 1.0 1.0) "##")
(sdegeo:define-contact-set "SiGeContact" (color:rgb 1.0 1.0 1.0) "##")

(sdegeo:set-current-contact-set "SiContactLeft")
(sdegeo:set-contact-boundary-edges SiLeftContactRegion "SiContactLeft")
(sdegeo:delete-region SiLeftContactRegion)

(sdegeo:set-current-contact-set "SiContactRight")
(sdegeo:set-contact-boundary-edges SiRightContactRegion "SiContactRight")
(sdegeo:delete-region SiRightContactRegion)

(sdegeo:set-current-contact-set "SiGeContact")
(sdegeo:set-contact-boundary-edges SiGeContactRegion "SiGeContact")
(sdegeo:delete-region SiGeContactRegion)


(sde:save-model "n@node@_bnd")
(sde:build-mesh "snmesh" "" "n@node@_msh")

