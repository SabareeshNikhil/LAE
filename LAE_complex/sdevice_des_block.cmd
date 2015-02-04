*Device hetero{
Electrode {
   { Name="ntype"    Voltage=0   }
   { Name="ptype"    Voltage=0   }
   
}

File{
	* input files:
	Grid=	"sdemodel_block_msh.tdr"
	Parameter= "sdevice.par"
	OpticalGenerationInput = "optgen"
	
	* output files:
	Plot=	"hetero_des_block_0.tdr"
	Current="hetero_des_block_0.plt"
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

		ReadFromFile ( DatasetName = OpticalGeneration )

   		*SetConstant (
   		*	TimeDependence (
		*	WaveTime = (1.4e-10, 1.402e-10)
		*	WaveTSigma = 1e-14
		*	)
   		*	Value = 0
   		*	)
   		*QuantumYield (Unity)  		
   		*)
   	)
   )
}

Physics(Region="n_region") {
	MoleFraction(XFraction=0.47)
	
	#if @light@==1	
	Optics (
	ComplexRefractiveIndex (
		WavelengthDep (real imag) )
   	#endif	
	)		
}

Physics ( material="Gold" ) { Optics ( -OpticalGeneration ) }
*}

*System{
*	hetero d1 (ntype=1 ptype=0)
*	Resistor_pset R1 (2 1) {resistance=70}	
*	Vsource_pset vdc (2 0) {dc=15}
*}

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
}

*Solve {
*- Creating initial guess:
*   Coupled(Iterations=100 LineSearchDamping=1e-4){ Poisson } 
*   Coupled { Poisson electron hole }
  


*   NewCurrentFile="trans_@node@" 
*    Transient (
*	InitialTime=0 FinalTime=2e-10
*	InitialStep=1e-8 MaxStep=5e-6 MinStep=1e-8
*	Increment=1.3
*	)
*   { Coupled { Poisson electron hole }    
*   }
*}

Solve{ 
   Coupled { Poisson }
   Coupled { Poisson Electron }
   Coupled { Poisson Electron Hole }  

                                          
    Quasistationary ( MaxStep = 0.01 MinStep = 1e-4 
                          Goal { Name= "ntype" Voltage =50}) 
                         { Coupled { Poisson Electron Hole } }
            
}



