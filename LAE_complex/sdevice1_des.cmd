Device LAE{
Electrode {
   { Name="ntype"    Voltage=0   }
   { Name="ptype"    Voltage=0   }
   
}

File{
	* input files:
	Grid=	"sdemodel_ntype_@n_width@_@n_doping@_ptype_@p_width@_@p_doping@_decay_@decay_length@_msh.tdr"
	Parameter= "sdevice.par"
	OpticalGenerationInput = "../LAE_simple/optgen"
	
	* output files:
	Plot=	"trans_sde_des_opt_@light@_bias_@max_bias@_ntype_@n_width@_@n_doping@_ptype_@p_width@_@p_doping@.tdr"
	Current="trans_sde_des_opt_@light@_bias_@max_bias@_ntype_@n_width@_@n_doping@_ptype_@p_width@_@p_doping@.plt"
	* Output=	"hetero_des.log"
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
      hAvalanche(Eparallel CarrierTempDrive)
   ) 
   Optics (
   	OpticalGeneration (

		*ReadFromFile ( DatasetName = OpticalGeneration )

   		SetConstant (
   			TimeDependence (
			WaveTime = (1.4e-10, 1.402e-10)
			WaveTSigma = 1e-14
			)
   			Value = @OptGen@
   			)
   		QuantumYield (Unity)  		
   	)
   )
}

Physics(Region="n_region") {
	MoleFraction(XFraction=0.47)
	
	#if @light@==1	
	Optics (
	ComplexRefractiveIndex (
		WavelengthDep (real imag) 
		)
	)
   	#endif	
			
}

Physics(Region="p_region") {
	MoleFraction(XFraction=0.47)
	
	#if @light@==1	
	Optics (
	ComplexRefractiveIndex (
		WavelengthDep (real imag) 
		)
 	)
   	#endif	
			
}

Physics ( material="Gold" ) { Optics ( -OpticalGeneration ) }


Physics(Region="substrate") {
	Optics ( -OpticalGeneration )
	MoleFraction(XFraction=0.48)	
}

}

System{
	LAE d1 (ntype=1 ptype=0)
	Resistor_pset R1 (2 1) {resistance=70}	
	Vsource_pset vdc (3 0) {dc=15}
	Inductor_pset (3 2) {inductance=1}
}

Plot {
eDensity hDensity eCurrent hCurrent Current/Vector
eLifeTime hLifeTime
EffectiveIntrinsicDensity IntrinsicDensity
eEquilibriumDensity hEquilibriumDensity 
Potential SpaceCharge ElectricField/Vector
eMobility hMobility eVelocity hVelocity
Doping DonorConcentration AcceptorConcentration
ConducntionBandEnergy ValenceBandEnergy BandGap
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
  Number_of_Threads = 20
  StackSize = 2000000
}

Solve {
*- Creating initial guess:
   Coupled(Iterations=100 LineSearchDamping=1e-4){ Poisson } 
   Coupled { Poisson electron hole }
  


   NewCurrentFile="trans_@node@" 
    Transient (
	InitialTime=0 FinalTime=2e-10
	InitialStep=1e-10 MaxStep=5e-10 MinStep=1e-11
	Increment=1.3
	)
   { Coupled { Poisson electron hole }    
   }
}

*Solve{ 
*   Coupled { Poisson }
*   Coupled { Poisson Electron }
*   Coupled { Poisson Electron Hole }  


                                          
*    Quasistationary ( MaxStep = 0.001 MinStep = 1e-5 
*                          Goal { Name= "ntype" Voltage =@max_bias@}) 
*                         { Coupled { Poisson Electron Hole } }
            
*}



