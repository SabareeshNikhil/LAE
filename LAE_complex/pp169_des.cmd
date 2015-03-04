Device LAE{
Electrode {
   { Name="ntype"    Voltage=0   }
   { Name="ptype"    Voltage=0   }
   
}

File{
	* input files:
	Grid=	"sdemodel_ntype_200_1E17_ptype_799_1E18_decay_0_msh.tdr"
	Parameter= "sdevice.par"
	OpticalGenerationInput = "../LAE_simple/optgen"
	
	* output files:
	Plot=	"trans_sde_des_opt_0_bias_15_ntype_200_1E17_ptype_799_1E18.tdr"
	Current="trans_sde_des_opt_0_bias_15_ntype_200_1E17_ptype_799_1E18.plt"
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
			WaveTime = (1.4e-12, 1.6e-12)
			WaveTSigma = 1e-14
			)
   			Value = 10e22
   			)
   		QuantumYield (Unity)  		
   	)
   )
}

Physics(Region="n_region") {
	MoleFraction(XFraction=0.47)
	
			
}

Physics(Region="p_region") {
	MoleFraction(XFraction=0.47)
	
			
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
	Inductor_pset L1 (3 2) {inductance=1}
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
   *Coupled { Poisson electron hole }
  


   NewCurrentFile="trans_169" 
    Transient (
	InitialTime=0 FinalTime=2e-12
	InitialStep=5e-14 MaxStep=5e-14 MinStep=1e-15
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
*                          Goal { Name= "ntype" Voltage =15}) 
*                         { Coupled { Poisson Electron Hole } }
            
*}




