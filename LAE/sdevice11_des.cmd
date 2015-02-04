Device hetero{
Electrode {
   { Name="ntype"    Voltage=0   }
   { Name="ptype"    Voltage=0   }
   
}

	
File{
	* input files:
	Grid=	"hetero_msh.tdr"
	*Grid=	"../LAE/sdemodel_msh.tdr"
	Parameter= "../LAE/models.par"
	*Parameter = "../Tolga_LAE/models_1E-11.par"
	
	* output files:
	Plot=	"../LAE/sde_dvs_des.tdr"
	Current="../LAE/sde_des_opt@light@_zerobias.plt"
	* Output=	"../LAE/sde_des.log"
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

Physics(Region="n_region") {
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
   			Value = @<OptGen*0.95>@
   			*Value = @OptGen@
   			)
   		QuantumYield (Unity)  		
   		)
   	)
   	#endif	
	MoleFraction(XFraction=0.47)
		
}




Physics(Region="p_region") {
	Optics ( -OpticalGeneration )
	MoleFraction(XFraction=0.48)	
}

Physics ( material="InP" ) { Optics ( -OpticalGeneration ) }
Physics ( material="Gold" ) { Optics ( -OpticalGeneration ) }
}

System{
	hetero d1 (ntype=1 ptype=0)
	Resistor_pset R1 (2 1) {resistance=70}	
	Vsource_pset vdc (2 0) {dc=0}

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
}

Solve {
*- Creating initial guess:
   Coupled(Iterations=100 LineSearchDamping=1e-4){ Poisson } 
   Coupled { Poisson electron hole }
  


   NewCurrentFile="trans_@node@" 
    Transient (
	InitialTime=0 FinalTime=2e-10
	InitialStep=1e-15 MaxStep=5e-14 MinStep=1e-15
	Increment=1.3
	)
   { Coupled { Poisson electron hole }    
   }
}





