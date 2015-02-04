;clear sde
; File Modified for 45 nm node
(sde:clear)
;----------------------------------------------------------------------;

(if (string=? "nMOS" "pMOS") 
 (begin
  (define DSD "BoronActiveConcentration")
  (define DBody  "PhosphorusActiveConcentration")
 )
 (begin 
  (define DSD "PhosphorusActiveConcentration")
  (define DBody  "BoronActiveConcentration")
 )
)
;----------------------------------------------------------------------;

; Doping Parameters
(define Nd_high 1e17)
(define Nd 1e17)

(define Na_ldd 2e20)
(define Na 2e20)
(define Naext 2e20)

;***************Initial Parameters to be defined *************************
; BOX parameters
(define nm 1e-3)
(define Lbox  (* 300 nm)) ; Length of BOX
(define Wbox  (* 300 nm)) ; Width of BOX
(define Hbox  (* 100 nm)) ; Height of BOX

; Factor to Tune the Subthreshold Slope of device
; Higher the Factor, narrower is the transition of SnD doping below Gate.
(define gausdivfac 70)
(define nmperdec (* 2 nm))
(define decades 5)

; Overlap - it decides the Mean Position of Doping Profile
(define overlap (* -0.01 nm))
(define modoverlap (* 0.01 nm))

; Oxide Parameters
(define EOT (* 1.1 nm))
(define Ehighk 3.9)
(define ESiO2 3.9)
(define TOX (/ (* Ehighk EOT) ESiO2))
(define ESi 11.8)

; Channel parameters
(define Lgate (* 150 nm))
;(define Lgate (* 25 nm))
(define over (* 0 nm))
; LbyW etc
; Wfin = (Lg-2*over)/(Leff/Weff) - 2*ESi*tox/Eox
;(define Lg_for_lbyw  (* 45 nm))
;(define Leff (- Lg_for_lbyw (* 2 over)))
;(define W_for_lbyw  (* 30 nm))
;(define Oxd_as_Si (* 2 (* TOX (/ ESi ESiO2))))
;(define Weff (+ W_for_lbyw Oxd_as_Si))
;;(define LbyW (/ (- Lg_for_lbyw (* 2 over)) W_for_lbyw))
;(define LbyW (/ Leff Weff))
;;(begin (display "The value of lbyw is ")  (display LbyW) (newline))    
;
;(define curLeff (- Lgate (* 2 over)))
;;(define Wfin (- (/ (- Lgate (* 2 over)) LbyW) (* TOX (/ ESi ESiO2))))
;(define Wfin (- (/ curLeff LbyW) Oxd_as_Si))
;(define tempWfin (/ Wfin 1e-4))
;(set! Wfin ( * (floor tempWfin) 1e-4))
;(begin (display "The value of Wfin is ")  (display Wfin) (newline))    

(define Wfin  (* 50 nm ))
(define Hfin  (* 45 nm))
(define pitchfin (* 50 nm))
(define by10factor (/ 50 15 ))

;(define depth_inversion (* 2 nm))
(define depth_inversion (/ (* 2 nm) by10factor))

;(define depth_inversion (* 0.38 nm))

;(define junction_refine (* 5 nm))
(define junction_refine (/ (* 5 nm) by10factor))

(define debye_length_original (* 0.10 nm))
; this will be used for meshing
;(define debye_length (/ debye_length_original 2))
(define debye_length (/(/ debye_length_original 2) by10factor))

; no of Fins
(define nfin 1)


; Enter EOT and k value of the material being used:
; Tox = (EhighK * EOT)/(ESiO2)
; Using Quantum Correction 
; EOT = 1.6nm
; Tqm = 0.247nm
; So TOX = EOT - Tqm
;(define EOT (* 1.352 nm))




; Gate and Gate Oxide Parameters - will use old replaces new
;(define Gthick (* 20 nm))
(define Gthick (* 20 nm))
(define TOX_twice (* 2 TOX))
(define Gthick_twice (* 2 Gthick))
(define Woxide (+ Wfin TOX_twice))
(define Hoxide  (+ Hfin TOX))
(define Wgate (+ Woxide Gthick_twice))
(define Hgate (+ Hoxide  Gthick ))
(define Loxide  Lgate)

; Spacer Parameters
(define Lspacer (* 5 nm))
(define Wspacer (+ Wfin (/ pitchfin 3)))
(define Hspacer (/ (+ Hgate Hfin) 2))

; Derived Fin Length = Lgate + 4* Lspacer
;(define Lfin (+ Lgate (* 4 Lspacer)) )
(define Lfin (+ Lgate (* 2 Lspacer)) )


; Hard Mask over top gate to not induce carriers by the top gate- will be absent for TriGate
(define hmask (* 20 nm))

; Source and Drain Extension Regions - will use old replaces New
;(define Lext (* 20 nm)
(define Lext (* 20 nm))
(define Epi  (* 13 nm))
(define Wext (+ Wfin (* Epi 2)))
;(define Wext (* 50 nm))
(define Hext (+ Hfin Epi))

; Silicide Information
(define Silicide (* 6.5 nm))
(define LSilicide Lext)
(define WSilicide (+ Wext (* 2 Silicide)))
(define HSilicide (+ Hext Silicide))

;*************** Starting and Ending points of different structures within *************************
; Start and End points for all
; BOX - (000) and (LWH)
; FIN:
(define xfinlow (- (/ Lbox 2) (/ Lfin 2)))
(define xfinhigh (+ (/ Lbox 2) (/ Lfin 2)))
(define yfinlow (- (/ Wbox 2) (/ Wfin 2)))
(define yfinhigh (+ (/ Wbox 2) (/ Wfin 2)))
(define zfinlow Hbox)
(define zfinhigh (+ Hbox Hfin))

;Oxide:
(define xoxidelow (- (/ Lbox 2) (/ Loxide 2)))
(define xoxidehigh (+ (/ Lbox 2) (/ Loxide 2)))
(define yoxidelow (- (/ Wbox 2) (/ Woxide 2)))
(define yoxidehigh (+ (/ Wbox 2) (/ Woxide 2)))
(define zoxidelow Hbox)
(define zoxidehigh (+ Hbox Hoxide))

;Hard mask over oxide and below third gate
(define xhmasklow (- (/ Lbox 2) (/ Loxide 2)))
(define xhmaskhigh (+ (/ Lbox 2) (/ Loxide 2)))
(define yhmasklow (- (/ Wbox 2) (/ Woxide 2)))
(define yhmaskhigh (+ (/ Wbox 2) (/ Woxide 2)))
(define zhmasklow Hbox)
(define zhmaskhigh (+ zoxidehigh hmask))

;Gate:
(define xgatelow (- (/ Lbox 2) (/ Lgate 2)))
(define xgatehigh (+ (/ Lbox 2) (/ Lgate 2)))
(define ygatelow (- (/ Wbox 2) (/ Wgate 2)))
(define ygatehigh (+ (/ Wbox 2) (/ Wgate 2)))
(define zgatelow Hbox)
;(define zgatehigh (+ Hbox Hgate))
(define zgatehigh (+ zhmaskhigh Gthick))

; Source Extenstion Region
(define xsrcextlow (- xfinlow Lext))
(define xsrcexthigh xfinlow )
;(define ysrcextlow  (- yfinlow (/ Wext 2)))
(define ysrcextlow  (- (/ Wbox 2) (/ Wext 2)))
;(define ysrcexthigh (+ (+ yfinhigh (* (- nfin 1) pitchfin)) (/ Wext 2)))
(define ysrcexthigh (+ (+ (/ Wbox 2) (* (- nfin 1) pitchfin)) (/ Wext 2)))
(define zsrcextlow Hbox)
(define zsrcexthigh (+ Hbox Hext))

; Drain Extenstion Region
(define xdrnextlow xfinhigh) 
(define xdrnexthigh (+ xfinhigh Lext))
;(define ydrnextlow  (- yfinlow (/ Wext 2)))
(define ydrnextlow  (- (/ Wbox 2) (/ Wext 2)))
;(define ydrnexthigh (+ (+ yfinhigh (* (- nfin 1) pitchfin)) (/ Wext 2)))
(define ydrnexthigh (+ (+ (/ Wbox 2) (* (- nfin 1) pitchfin)) (/ Wext 2)))
(define zdrnextlow Hbox)
(define zdrnexthigh (+ Hbox Hext))

; Silicide Over Source Extension Region
(define xsrcSilextlow (- xfinlow LSilicide))
(define xsrcSilexthigh xfinlow )
;(define ysrcSilextlow  (- yfinlow (/ WSilicide 2)))
(define ysrcSilextlow  (- (/ Wbox 2) (/ WSilicide 2)))
;(define ysrcSilexthigh (+ (+ yfinhigh (* (- nfin 1) pitchfin)) (/ WSilicide 2)))
(define ysrcSilexthigh (+ (+ (/ Wbox 2) (* (- nfin 1) pitchfin)) (/ WSilicide 2)))
(define zsrcSilextlow Hbox)
(define zsrcSilexthigh (+ Hbox HSilicide))

; Silicide Over Drain Extension Region
(define xdrnSilextlow xfinhigh) 
(define xdrnSilexthigh (+ xfinhigh LSilicide))
;(define ydrnSilextlow  (- yfinlow (/ WSilicide 2)))
(define ydrnSilextlow  (- (/ Wbox 2) (/ WSilicide 2)))
;(define ydrnSilexthigh (+ (+ yfinhigh (* (- nfin 1) pitchfin)) (/ WSilicide 2)))
(define ydrnSilexthigh (+ (+ (/ Wbox 2) (* (- nfin 1) pitchfin)) (/ WSilicide 2)))
(define zdrnSilextlow Hbox)
(define zdrnSilexthigh (+ Hbox HSilicide))

; Source side spacer region 
(define xSspacerlow (- xgatelow Lspacer))
(define xSspacerhigh xgatelow)
(define ySspacerlow (- (/ Wbox 2) (/ Wspacer 2)))
(define ySspacerhigh (+ (/ Wbox 2) (/ Wspacer 2)))
(define zSspacerlow Hbox)
(define zSspacerhigh (+ Hbox Hspacer))

; Drain side spacer region 
(define xDspacerlow xgatehigh)
(define xDspacerhigh (+ xgatehigh Lspacer))
(define yDspacerlow (- (/ Wbox 2) (/ Wspacer 2)))
(define yDspacerhigh (+ (/ Wbox 2) (/ Wspacer 2)))
(define zDspacerlow Hbox)
(define zDspacerhigh (+ Hbox Hspacer))

; Source Extenstion Region
;(define xsrcextlow (- xfinlow Lext))
;(define xsrcexthigh xfinlow )
;(define ysrcextlow  yfinlow)
;(define ysrcexthigh (+ yfinhigh (* (- nfin 1) pitchfin)))
;(define zsrcextlow Hbox)
;(define zsrcexthigh (+ Hbox Hext))
;
;; Drain Extenstion Region
;(define xdrnextlow xfinhigh) 
;(define xdrnexthigh (+ xfinhigh Lext))
;(define ydrnextlow  yfinlow)
;(define ydrnexthigh (+ yfinhigh (* (- nfin 1) pitchfin)))
;(define zdrnextlow Hbox)
;(define zdrnexthigh (+ Hbox Hext))

;*************** Creation of structure *************************
; BOX defination
;(sdegeo:create-rectangle (position 0 0 0) (position Lbox Wbox 0)  
;"SiO2" "BOX")
(define printfin nfin)

; Loop to replicate the Fin structure = no of fins
(do ( (i 0 (+ i 1)) ) ; i: Counter name; 0: initial value; (+ i 1): incrementer 
 ( (= i printfin) )       ; End Tester
 (begin            ; Body of loop
  (define SFIN (string-append "SFIN." (number->string i)))
  (define FIN (string-append "FIN." (number->string i)))
  (define DFIN (string-append "DFIN." (number->string i)))
  (define newyfinlow (+ (* i pitchfin) yfinlow))
  (define newyfinhigh (+ (* i pitchfin) yfinhigh))
  (sdegeo:create-rectangle (position xfinlow newyfinlow 0) (position xoxidelow newyfinhigh 0)  "Silicon" SFIN)
  (sdegeo:create-rectangle (position xoxidelow newyfinlow 0) (position xoxidehigh newyfinhigh 0)  "Silicon" FIN)
  (sdegeo:create-rectangle (position xoxidehigh newyfinlow 0) (position xfinhigh newyfinhigh 0)  "Silicon" DFIN)
  
  (define GateOxide (string-append "GateOxide." (number->string i)))
  (define newyoxidelow (+ (* i pitchfin) yoxidelow))
  (define newyoxidehigh (+ (* i pitchfin) yoxidehigh))
  (sdegeo:set-default-boolean "BAB")
;  (sdegeo:create-rectangle (position xoxidelow newyoxidelow 0) (position xoxidehigh newyoxidehigh 0) "HfO2" GateOxide)
  (sdegeo:create-rectangle (position xoxidelow newyoxidelow 0) (position xoxidehigh newyoxidehigh 0) "SiO2" GateOxide)

;  (define hmask (string-append "hmask." (number->string i)))
;  (define newyhmasklow (+ (* i pitchfin) yhmasklow))
;  (define newyhmaskhigh (+ (* i pitchfin) yhmaskhigh))
;  (sdegeo:set-default-boolean "BAB")
;  (sdegeo:create-cuboid (position xhmasklow newyhmasklow zhmasklow) (position xhmaskhigh newyhmaskhigh zhmaskhigh)  "HfO2" hmask)
  
  (define Sspacer (string-append "Sspacer." (number->string i)))
  (define newySspacerlow (+ (* i pitchfin) ySspacerlow))
  (define newySspacerhigh (+ (* i pitchfin) ySspacerhigh))
  (sdegeo:set-default-boolean "BAB")
  (sdegeo:create-rectangle (position xSspacerlow newySspacerlow 0) (position xSspacerhigh newySspacerhigh 0)  "Si3N4" Sspacer)
  
  (define Dspacer (string-append "Dspacer." (number->string i)))
  (define newyDspacerlow (+ (* i pitchfin) yDspacerlow))
  (define newyDspacerhigh (+ (* i pitchfin) yDspacerhigh))
  (sdegeo:set-default-boolean "BAB")
  (sdegeo:create-rectangle (position xDspacerlow newyDspacerlow 0) (position xDspacerhigh newyDspacerhigh 0)  "Si3N4" Dspacer)
  
)
)

; A common gate touching all the fins newygatehigh = (nfin - 1)*pitchfin + ygatehigh
(define newygatehigh (+ (* (- nfin 1) pitchfin) ygatehigh))
(sdegeo:set-default-boolean "BAB")
;(sdegeo:create-rectangle (position xgatelow ygatelow 0) (position xgatehigh newygatehigh 0)  
; "Aluminum" "Gate")
; Putting the Source and Drain Extension Region touching all the FINs
(sdegeo:set-default-boolean "BAB")
(sdegeo:create-rectangle (position xdrnextlow ydrnextlow 0) (position xdrnexthigh ydrnexthigh 0)  
"Silicon" "Drain_Ext")
(sdegeo:create-rectangle (position xsrcextlow ysrcextlow 0) (position xsrcexthigh ysrcexthigh 0)  
"Silicon" "Source_Ext")

; Putting the Silicide over Src/Drn Ext Region
(sdegeo:set-default-boolean "BAB")
(sdegeo:create-rectangle (position xdrnSilextlow ydrnSilextlow 0) (position xdrnSilexthigh ydrnSilexthigh 0)  "Silicide" "Drain_Sili")
(sdegeo:create-rectangle (position xsrcSilextlow ysrcSilextlow 0) (position xsrcSilexthigh ysrcSilexthigh 0)  "Silicide" "Source_Sili")

;*************** Contacts *************************
; Defining Contacts
(sdegeo:define-contact-set "gate"      4.0 (color:rgb 1.0 0.0 0.0 ) "##")
;(sdegeo:define-contact-set "gate2"      4.0 (color:rgb 1.0 0.0 0.0 ) "<><>")
(sdegeo:define-contact-set "drain"     4.0 (color:rgb 1.0 0.0 0.0 ) "||")
(sdegeo:define-contact-set "source"    4.0 (color:rgb 1.0 0.0 0.0 ) "==")
;(sdegeo:define-contact-set "substrate" 4.0 (color:rgb 1.0 0.0 0.0 ) "<><>")

; Setting Contacts at Existing Faces: Substrate and Gate
;(sdegeo:set-current-contact-set "substrate")
;(sdegeo:set-contact-faces (find-face-id (position (/ Lbox 2) (/ Hbox 2) 0)) "substrate") 

(sdegeo:set-current-contact-set "gate")
(sdegeo:set-contact-edges (find-edge-id (position xgatelow  (/ (+ yoxidehigh ySspacerhigh) 2)  0)) "gate")
(sdegeo:set-current-contact-set "gate")
(sdegeo:set-contact-edges (find-edge-id (position xgatehigh  (/ (+ yoxidehigh ySspacerhigh) 2)  0)) "gate")

(sdegeo:set-current-contact-set "gate")
(sdegeo:set-contact-edges (find-edge-id (position xgatelow  (/ (+ yoxidelow ySspacerlow) 2)  0)) "gate")
(sdegeo:set-current-contact-set "gate")
(sdegeo:set-contact-edges (find-edge-id (position xgatehigh  (/ (+ yoxidelow ySspacerlow) 2)  0)) "gate")
(sdegeo:set-current-contact-set "gate")

(sdegeo:set-contact-edges (find-edge-id (position (/ (+ xgatehigh xgatelow) 2)  yoxidehigh  0)) "gate")
(sdegeo:set-current-contact-set "gate")
(sdegeo:set-contact-edges (find-edge-id (position (/ (+ xgatehigh xgatelow) 2)  yoxidelow  0)) "gate")

;(sdegeo:set-current-contact-set "gate")
;(sdegeo:set-contact-edges (find-edge-id (position (/ (+ xgatehigh xgatelow) 2)  ygatehigh  0)) "gate")
;(sdegeo:set-current-contact-set "gate")
;(sdegeo:set-contact-edges (find-edge-id (position (/ (+ xgatehigh xgatelow) 2)  ygatelow  0)) "gate")
;
; New source/Drain contacts - on top/bottom EPI layers
(sdegeo:set-current-contact-set "source")
(sdegeo:set-contact-edges (find-edge-id (position (/ (+ xsrcSilextlow xsrcSilexthigh) 2) ysrcSilextlow  0)) "source")
(sdegeo:set-contact-edges (find-edge-id (position (/ (+ xsrcSilextlow xsrcSilexthigh) 2) ysrcSilexthigh  0)) "source")

(sdegeo:set-current-contact-set "drain")
(sdegeo:set-contact-edges (find-edge-id (position (/ (+ xdrnSilexthigh xdrnSilextlow) 2) ydrnSilextlow 0)) "drain")
(sdegeo:set-contact-edges (find-edge-id (position (/ (+ xdrnSilexthigh xdrnSilextlow) 2) ydrnSilexthigh 0)) "drain")

;; Setting contacts for source and drain 
;(sdegeo:set-current-contact-set "source")
;(sdegeo:set-contact-edges (find-edge-id (position xsrcextlow  (/ (+ ysrcextlow ysrcexthigh) 2) 0)) "source")
;
;(sdegeo:set-current-contact-set "drain")
;(sdegeo:set-contact-edges (find-edge-id (position xdrnexthigh (/ (+ ydrnextlow ydrnexthigh) 2) 0)) "drain")

;#####################################*************** Doping Profiles ****************#####################################
;#####################################************************************************#####################################
;#####################################************************************************#####################################
;#####################################************************************************#####################################
;#####################################************************************************#####################################
(define xchannel_N_low  xoxidelow )
(define xchannel_N_high xoxidehigh )

(define xchannellow (+ xoxidelow overlap))
(define xchannelhigh (- xoxidehigh overlap))
(define ychannellow (+ yoxidelow TOX))
(define ychannelhigh (- yoxidehigh TOX))
(define zchannellow Hbox)
(define zchannelhigh (+ Hbox Hfin))

(define length_highdope (* 5 nm))

; Loop to put channel doping in all of the Fins
(do ( (j 0 (+ j 1)) ) ; i: Counter name; 0: initial value; (+ i 1): incrementer 
 ( (= j printfin) )       ; End Tester
 (begin            ; Body of loop

(define Channel (string-append "Channel." (number->string j)))
(define ChDef (string-append "ChDef." (number->string j)))
(define ChannelRegion (string-append "ChannelRegion." (number->string j)))

(define Channel_1 (string-append "Channel_1." (number->string j)))
(define ChDef_1 (string-append "ChDef_1." (number->string j)))
(define ChannelRegion_1 (string-append "ChannelRegion_1." (number->string j)))

(define Channel_2 (string-append "Channel_2." (number->string j)))
(define ChDef_2 (string-append "ChDef_2." (number->string j)))
(define ChannelRegion_2 (string-append "ChannelRegion_2." (number->string j)))

(define newychannellow (+ (* j pitchfin) ychannellow))
(define newychannelhigh (+ (* j pitchfin) ychannelhigh))


(sdedr:define-constant-profile ChannelRegion_1 DBody Nd)
(sdedr:define-refeval-window Channel_1 "Rectangle" (position xchannel_N_low newychannellow 0) (position xchannel_N_high newychannelhigh  0))
(sdedr:define-constant-profile-placement ChDef_1 ChannelRegion_1 Channel_1)


)
)

(define xsourcelow xfinlow)
(define xsourcehigh xchannellow)
(define ysourcelow ychannellow)
(define ysourcehigh ychannelhigh)
(define zsourcelow Hbox)
(define zsourcehigh (+ Hbox Hfin))

(define xdrainlow xchannelhigh)
(define xdrainhigh xfinhigh)
(define ydrainlow ychannellow)
(define ydrainhigh ychannelhigh)
(define zdrainlow Hbox)
(define zdrainhigh (+ Hbox Hfin))

(define length_ldd (* 0.1 nm))

; Loop for source and drain doping (inside Fin)
(do ( (j 0 (+ j 1)) ) ; i: Counter name; 0: initial value; (+ i 1): incrementer 
 ( (= j printfin) )       ; End Tester
(begin            ; Body of loop
(define Drain_ldd (string-append "Drain_ldd." (number->string j)))
(define DrainDef_ldd (string-append "DrainDef_ldd." (number->string j)))
(define DrainRegion_ldd (string-append "DrainRegion_ldd." (number->string j)))

(define Drain (string-append "Drain." (number->string j)))
(define DrainDef (string-append "DrainDef." (number->string j)))
(define DrainRegion (string-append "DrainRegion." (number->string j)))

(define Source_ldd (string-append "Source_ldd." (number->string j)))
(define SourceDef_ldd (string-append "SourceDef_ldd." (number->string j)))
(define SourceRegion_ldd (string-append "SourceRegion_ldd." (number->string j)))

(define Source (string-append "Source." (number->string j)))
(define SourceDef (string-append "SourceDef." (number->string j)))
(define SourceRegion (string-append "SourceRegion." (number->string j)))

(define newydrainlow (+ (* j pitchfin) ydrainlow))
(define newydrainhigh (+ (* j pitchfin) ydrainhigh))
(define newysourcelow (+ (* j pitchfin)  ysourcelow))
(define newysourcehigh (+ (* j pitchfin) ysourcehigh))


)
)

; inside the fin
(sdedr:define-refinement-window "G2" "Line" (position 0.0714 0.175  0) (position  0.0714 0.125  0))
(sdedr:define-gaussian-profile "G2_Prof" DSD "PeakPos" 0  "PeakVal" (* 2 Na) "ValueAtDepth" (* 2 Na) "Depth" 2.5e-9 "Gauss" "Length" 0)
(sdedr:define-analytical-profile-placement "G2_def" "G2_Prof" "G2" "Negative" "NoReplace" "NoEval")

(sdedr:define-refinement-window "G2_1" "Line" (position 0.0714 0.175  0) (position  0.0714 0.125  0))
(sdedr:define-gaussian-profile "G2_Prof_1" DSD "PeakPos" 0  "PeakVal" (* 2 Na) "ValueAtDepth" Nd "Depth" 0.0036 "Gauss" "Length" 0)
(sdedr:define-analytical-profile-placement "G2_def_1" "G2_Prof_1" "G2_1" "Positive" "NoReplace" "NoEval")

(sdedr:define-refinement-window "G1" "Line" (position 0.2286 0.175  0) (position  0.2286 0.125  0))
(sdedr:define-gaussian-profile "G1_Prof" DSD "PeakPos" 0  "PeakVal" (* 2 Na) "ValueAtDepth" (* 2 Na) "Depth" 0.0036 "Gauss" "Length" 0)
(sdedr:define-analytical-profile-placement "G1_def" "G1_Prof" "G1" "Positive" "NoReplace" "NoEval")

(sdedr:define-refinement-window "G1_1" "Line" (position 0.2286 0.175  0) (position  0.2286 0.125  0))
(sdedr:define-gaussian-profile "G1_Prof_1" DSD "PeakPos" 0  "PeakVal" (* 2 Na) "ValueAtDepth" Nd "Depth" 0.0036 "Gauss" "Length" 0)
(sdedr:define-analytical-profile-placement "G1_def_1" "G1_Prof_1" "G1_1" "Negative" "NoReplace" "NoEval")



; Doping of Source and Drain Region


(sdedr:define-constant-profile "SourceRegion" DSD Naext)
(sdedr:define-refeval-window "SourceExtention" "Rectangle" (position xsrcextlow ysrcextlow 0) (position xsrcexthigh ysrcexthigh 0))
(sdedr:define-constant-profile-placement "SourceExtDef" "SourceRegion" "SourceExtention")

(sdedr:define-constant-profile "DrainRegion" DSD Naext)
(sdedr:define-refeval-window "DrainExtention" "Rectangle" (position xdrnextlow ydrnextlow 0) (position xdrnexthigh ydrnexthigh 0))
(sdedr:define-constant-profile-placement "DrainExtDef" "DrainRegion" "DrainExtention")

; Background doping concentration of FIN - 10e15, phosphorous 
;(sdedr:define-constant-profile "FINprofile" DBody 1e17)
;(sdedr:define-constant-profile-region "Finsdoping" "FINprofile" "FIN_b0")

;#####################################*************** Meshing         ****************#####################################
;#####################################************************************************#####################################
;#####################################************************************************#####################################
;#####################################************************************************#####################################
;#####################################************************************************#####################################

; Universal Mesh - 10 nm whole
(sdedr:define-refeval-window "UnivMesh" "Rectangle"  (position  0 0 0)  (position Lbox Wbox 0) )
(sdedr:define-refinement-size "UnivMeshDef" 0.01 0.001 0.001 0.01 0.001 0.001)
(sdedr:define-refinement-placement "Ref1" "UnivMeshDef" "UnivMesh" )

; Source and Drain Extension Region
(sdedr:define-refeval-window "SourceExtMesh" "Rectangle"  (position  xsrcextlow ysrcextlow 0)  (position xsrcexthigh ysrcexthigh 0))
(sdedr:define-refinement-size "SourceExtMeshDef" (/ Lext 3) (/ Wext 3) (/ Lext 3) (/ Wext 3))
(sdedr:define-refinement-placement "RefSrcExt" "SourceExtMeshDef" "SourceExtMesh" )

(sdedr:define-refeval-window "DrainExtMesh" "Rectangle"  (position  xdrnextlow ydrnextlow 0)  (position xdrnexthigh ydrnexthigh 0))
(sdedr:define-refinement-size "DrainExtMeshDef" (/ Lext 3) (/ Wext 3) (/ Lext 3) (/ Wext 3))
(sdedr:define-refinement-placement "RefDrnExt" "DrainExtMeshDef" "DrainExtMesh" )

; Fin - TODO: this needs to be looped in case of > 1 Fins
; Fin is Finer because it is quite long with respect to SnD Ext Region and it is basically consisting of 3 portions - source/channel/drain

;; 1. This is whole Fin Length - from source to drain
(sdedr:define-refeval-window "FinMesh" "Rectangle"  (position  xfinlow yfinlow 0)  (position xfinhigh yfinhigh 0))
(sdedr:define-refinement-size "FinMeshDef" (/ Lfin 20) (/ Wfin 10) (/ Lfin 20) (/ Wfin 10))
(sdedr:define-refinement-placement "RefFin" "FinMeshDef" "FinMesh" )

;; 2. This is Gate Length - Only Channel Region
(sdedr:define-refeval-window "CFinMesh" "Rectangle"  (position  xchannellow ychannellow 0)  (position xchannelhigh ychannelhigh 0))
(sdedr:define-refinement-size "CFinMeshDef" (/ Lgate 20) (/ Wfin 10) (/ Lgate 20) (/ Wfin 10))
(sdedr:define-refinement-placement "CRefFin" "CFinMeshDef" "CFinMesh" )

; Channel
; Ch0
;(sdedr:define-refeval-window "Ch0Mesh" "Rectangle"  (position  xchannel_N_low ychannellow  0)  (position xchannel_N_high (+ ychannellow depth_inversion) 0))
;(sdedr:define-refeval-window "Ch0Mesh" "Rectangle"  (position  xchannel_N_low ychannellow  0)  (position xchannel_N_high (+ ychannellow Wfin) 0))
(sdedr:define-refeval-window "Ch0Mesh" "Rectangle"  (position  xchannel_N_low ychannellow  0)  (position xchannel_N_high (+ ychannellow (/ Wfin 3)) 0))
(sdedr:define-refinement-size "Ch0MeshDef" (/ Lgate 8) (/ debye_length 0.5) (/ Lgate 8) (/ debye_length 0.5) )
(sdedr:define-refinement-placement "RefCh0" "Ch0MeshDef" "Ch0Mesh" )

; Ch0
;(sdedr:define-refeval-window "Ch1Mesh" "Rectangle"  (position  xchannel_N_low (- ychannelhigh Wfin) 0)  (position xchannel_N_high ychannelhigh 0))
(sdedr:define-refeval-window "Ch1Mesh" "Rectangle"  (position  xchannel_N_low (- ychannelhigh (/ Wfin 3)) 0)  (position xchannel_N_high ychannelhigh 0))
(sdedr:define-refinement-size "Ch1MeshDef" (/ Lgate 8) (/ debye_length 0.5) (/ Lgate 8) (/ debye_length 0.5) )
(sdedr:define-refinement-placement "RefCh1" "Ch1MeshDef" "Ch1Mesh" )


; Top Oxide
(sdedr:define-refeval-window "BackOxideMesh" "Rectangle"  (position xchannellow ychannelhigh 0) (position xchannelhigh (+ ychannelhigh EOT) 0 ) )
(sdedr:define-refinement-size "BackOxideMeshDef" (/ Lgate 5) (/ EOT 5) (/ Lgate 5) (/ EOT 5) )
(sdedr:define-refinement-placement "RefBackOxide" "BackOxideMeshDef" "BackOxideMesh" )
; Bottom Oxide
(sdedr:define-refeval-window "FntOxideMesh" "Rectangle"  (position xchannellow (- ychannellow EOT) 0) (position xchannelhigh ychannellow 0))
(sdedr:define-refinement-size "FntOxideMeshDef" (/ Lgate 5) (/ EOT 5) (/ Lgate 5) (/ EOT 5) )
(sdedr:define-refinement-placement "RefFntOxide" "FntOxideMeshDef" "FntOxideMesh" )

; Mesh at the interface of Gate-Channel
; Top Gate
(sdedr:define-refeval-window "BackGateChMesh" "Rectangle"  (position xchannellow ychannelhigh 0) (position xchannelhigh (+ ychannelhigh (/ junction_refine 14)) 0))
(sdedr:define-refinement-size "BackGateChMeshDef" (/ Lgate 5) (/ junction_refine 8) (/ Lgate 5) debye_length )
(sdedr:define-refinement-placement "RefBackGateCh" "BackGateChMeshDef" "BackGateChMesh" )
; Bottom Gate
(sdedr:define-refeval-window "FntGateChMesh" "Rectangle"  (position xchannellow (- ychannellow (/ junction_refine 14)) 0) (position xchannelhigh ychannellow 0))
(sdedr:define-refinement-size "FntGateChMeshDef" (/ Lgate 5) (/ junction_refine 8) (/ Lgate 5) debye_length )
(sdedr:define-refinement-placement "RefFntGateCh" "FntGateChMeshDef" "FntGateChMesh" )

; Gate 
; front side
(sdedr:define-refeval-window "GateMesh0" "Rectangle"  (position  xgatelow ygatelow 0)  (position xdrainlow yoxidelow 0))
(sdedr:define-refinement-size "GateMeshDef0" (/ Lgate 5) (/ Wgate 5) (/ Lgate 5) (/ Wgate 5) )
(sdedr:define-refinement-placement "RefGate0" "GateMeshDef0" "GateMesh0" )

; back side
(sdedr:define-refeval-window "GateMesh2" "Rectangle"  (position  xsourcehigh ysourcehigh 0)  (position xgatehigh ygatehigh 0))
(sdedr:define-refinement-size "GateMeshDef2" (/ Lgate 5) (/ Wgate 5) (/ Lgate 5) (/ Wgate 5) )
(sdedr:define-refinement-placement "RefGate2" "GateMeshDef2" "GateMesh2" )

(sde:build-mesh "mesh" "-F tdr " "2d_Lg_15_1422")




