*Device hetero{
Electrode {
   { Name="ptype"    Voltage=0   }
   { Name="ntype"    Voltage=0   }
   
}

File{
	* input files:
	*Grid=	"hetero_msh.tdr"
	Grid=	"../LAE/sdemodel_msh.tdr"
	*Parameter= "../LAE/models.par"
	Parameter = "models_1E-@tau@.par"
	
	* output files:
	Plot=	"../LAE/sde_dvs_des.tdr"
	Current="../LAE/sde_des_opt@light@_tau@tau@_@node@.plt"
	* Output=	"../LAE/sde_des.log"
	OpticalGenerationOutput = "../LAE_simple/optgen"
	}	
	

Physics{
   AreaFactor=10
   Thermionic
   Heterointerface
   Hydrodynamic
   hMobility (DopingDependence HighFieldSaturation Enormal)
   eMobility (DopingDependence HighFieldSaturation Enormal)
   EffectiveIntrinsicDensity( OldSlotboom )     
   Recombination(
      SRH( DopingDep TempDependence Tunneling )
      Auger
      Band2Band
      SurfaceSRH
      eAvalanche(Eparallel CarrierTempDrive)
      hAvalanche(Eparallel CarrierTempDrive)   ) 	
}

Physics(Region="n_region_9") {
	#if @light@	
	Optics (
	ComplexRefractiveIndex (
		WavelengthDep (real imag) )
   	OpticalGeneration (
   		SetConstant (
   			*TimeDependence (
			*WaveTime = (0.4e-10, 0.402e-10)
			*WaveTSigma = 1e-14
			*)
   			Value = @<OptGen*0.95>@
   			*Value = @OptGen@
   			)
   		QuantumYield (Unity)  		
   		)
   	)
   	#endif	
	MoleFraction(XFraction=0.47)
		
}

Physics(Region="n_region_8") {
	#if @light@	
	Optics (
	ComplexRefractiveIndex (
		WavelengthDep (real imag) )
   	OpticalGeneration (
   		SetConstant (
   			*TimeDependence (
			*WaveTime = (0.4e-10, 0.402e-10)
			*WaveTSigma = 1e-14
			*)
   			Value = @<OptGen*0.85>@
   			*Value = @OptGen@
   			)
   		QuantumYield (Unity)  		
   		)
   	)
   	#endif	
	MoleFraction(XFraction=0.47)
		
}

Physics(Region="n_region_7") {
	#if @light@	
	Optics (
	ComplexRefractiveIndex (
		WavelengthDep (real imag) )
   	OpticalGeneration (
   		SetConstant (
   			TimeDependence (
			WaveTime = (0.4e-10, 0.402e-10)
			WaveTSigma = 1e-14
			)
   			Value = @<0.75*OptGen>@
   			*Value = @OptGen@
   			)
   		QuantumYield (Unity)  		
   		)
   	)
   	#endif	
	MoleFraction(XFraction=0.47)
		
}

Physics(Region="n_region_6") {
	#if @light@	
	Optics (
	ComplexRefractiveIndex (
		WavelengthDep (real imag) )
   	OpticalGeneration (
   		SetConstant (
   			*TimeDependence (
			*WaveTime = (0.4e-10, 0.402e-10)
			*WaveTSigma = 1e-14
			*)
   			Value = @<0.65*OptGen>@
   			*Value = @OptGen@
   			)
   		QuantumYield (Unity)  		
   		)
   	)
   	#endif	
	MoleFraction(XFraction=0.47)
		
		
}

Physics(Region="n_region_5") {
	#if @light@	
	Optics (
	ComplexRefractiveIndex (
		WavelengthDep (real imag) )
   	OpticalGeneration (
   		SetConstant (
   			*TimeDependence (
			*WaveTime = (0.4e-10, 0.402e-10)
			*WaveTSigma = 1e-14
			*)
   			Value = @<0.55*OptGen>@
   			*Value = @OptGen@
   			)
   		QuantumYield (Unity)  		
   		)
   	)
   	#endif	
	MoleFraction(XFraction=0.47)
		
		
}

Physics(Region="n_region_4") {
	#if @light@	
	Optics (
	ComplexRefractiveIndex (
		WavelengthDep (real imag) )
   	OpticalGeneration (
   		SetConstant (
   			*TimeDependence (
			*WaveTime = (0.4e-10, 0.402e-10)
			*WaveTSigma = 1e-14
			*)
   			Value = @<0.45*OptGen>@
   			*Value = @OptGen@
   			)
   		QuantumYield (Unity)  		
   		)
   	)
   	#endif	
	MoleFraction(XFraction=0.47)
		
		
}

Physics(Region="n_region_3") {
	#if @light@	
	Optics (
	ComplexRefractiveIndex (
		WavelengthDep (real imag) )
   	OpticalGeneration (
   		SetConstant (
   			*TimeDependence (
			*WaveTime = (0.4e-10, 0.402e-10)
			*WaveTSigma = 1e-14
			*)
   			Value = @<0.35*OptGen>@
   			*Value = @OptGen@
   			)
   		QuantumYield (Unity)  		
   		)
   	)
   	#endif	
	MoleFraction(XFraction=0.47)
		
		
}

Physics(Region="n_region_2") {
	#if @light@	
	Optics (
	ComplexRefractiveIndex (
		WavelengthDep (real imag) )
   	OpticalGeneration (
   		SetConstant (
   			*TimeDependence (
			*WaveTime = (0.4e-10, 0.402e-10)
			*WaveTSigma = 1e-14
			*)
   			Value = @<0.25*OptGen>@
   			*Value = @OptGen@
   			)
   		QuantumYield (Unity)  		
   		)
   	)
   	#endif	
	MoleFraction(XFraction=0.47)	
		
	
}

Physics(Region="p_region_1") {
	#if @light@	
	Optics (
	ComplexRefractiveIndex (
		WavelengthDep (real imag) )
   	OpticalGeneration (
   		SetConstant (
   			*TimeDependence (
			*WaveTime = (0.4e-10, 0.402e-10)
			*WaveTSigma = 1e-14
			*)
   			Value = @<0.15*OptGen>@
   			*Value = @OptGen@
   			)
   		QuantumYield (Unity)  		
   		)
   	)
   	#endif	
	MoleFraction(XFraction=0.47)	
		
	
}

Physics(Region="p_region_0") {
	#if @light@	
	Optics (-OpticalGeneration)
   	#endif	
	MoleFraction(XFraction=0.47)	
		
	
}


Physics(Region="substrate") {
	Optics ( -OpticalGeneration )
	MoleFraction(XFraction=0.48)	
}

*Physics ( material="InP" ) { Optics ( -OpticalGeneration ) }
*Physics ( material="Gold" ) { Optics ( -OpticalGeneration ) }
*}

*System{
*	hetero d1 (ntype=1 ptype=0)
*	*hetero d1 (Cathode=1 Anode=0)
*	Resistor_pset R1 (2 1) {resistance=70}	
*	Vsource_pset vdc (2 0) {dc=1}
*}

Plot {
eDensity hDensity eCurrent hCurrent Current/Vector
eLifeTime hLifeTime
EffectiveIntrinsicDensity IntrinsicDensity
eEquilibriumDensity hEquilibriumDensity 
Potential SpaceCharge ElectricField/Vector
eMobility hMobility eVelocity hVelocity
Doping DonorConcentration AcceptorConcentration
ConductionBandEnergy ValenceBandEnergy BandGap
eQuasiFermiPotential hQuasiFermiPotential
SRHRecombination AugerRecombination TotalRecombination 
SurfaceRecombination Band2Band 
#if @light@==1	
OpticalIntensity OpticalGeneration
#endif
}


Math {
  NoSRHperPotential
  Extrapolate
  RelErrControl
  Notdamped=50
  Iterations=20
}

*Solve {
 *Creating initial guess:
*   Coupled(Iterations=100 LineSearchDamping=1e-4){ Poisson } 
*   Coupled { Poisson electron hole }
  


*   NewCurrentFile="trans_@node@" 
*    Transient (
*	InitialTime=0 FinalTime=1e-10
*	InitialStep=1e-13 MaxStep=5e-13 MinStep=1e-15
*	Increment=1.3
*	Plot { Range = (0 1.0e-10) Intervals=20 }
*	)
*   { Coupled { Poisson electron hole }    
*   }
*}

Solve{ 
   Coupled { Poisson }   
   Coupled { Poisson Electron }
   Coupled { Poisson Electron Hole }  

    
    Quasistationary ( MaxStep = 0.01 MinStep = 1e-8 
                          Goal { Name= "ntype" Voltage =15.0}) 
                         { Coupled { Poisson Electron Hole } }
            
}





