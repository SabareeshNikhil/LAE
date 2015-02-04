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
	Parameter = "models_1E-09.par"
	
	* output files:
	Plot=	"../LAE/sde_dvs_des.tdr"
	Current="../LAE/sde_des_opt1_tau09_111.plt"
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

Physics(Region="n_region_9") {
	Optics (
	ComplexRefractiveIndex (
		WavelengthDep (real imag) )
   	OpticalGeneration (
   		SetConstant (
   			*TimeDependence (
			*WaveTime = (0.4e-10, 0.402e-10)
			*WaveTSigma = 1e-14
			*)
   			Value = 4.75e+20
   			*Value = 5E20
   			)
   		QuantumYield (Unity)  		
   		)
   	)
	MoleFraction(XFraction=0.47)
		
}

Physics(Region="n_region_8") {
	Optics (
	ComplexRefractiveIndex (
		WavelengthDep (real imag) )
   	OpticalGeneration (
   		SetConstant (
   			*TimeDependence (
			*WaveTime = (0.4e-10, 0.402e-10)
			*WaveTSigma = 1e-14
			*)
   			Value = 4.25e+20
   			*Value = 5E20
   			)
   		QuantumYield (Unity)  		
   		)
   	)
	MoleFraction(XFraction=0.47)
		
}

Physics(Region="n_region_7") {
	Optics (
	ComplexRefractiveIndex (
		WavelengthDep (real imag) )
   	OpticalGeneration (
   		SetConstant (
   			TimeDependence (
			WaveTime = (0.4e-10, 0.402e-10)
			WaveTSigma = 1e-14
			)
   			Value = 3.75e+20
   			*Value = 5E20
   			)
   		QuantumYield (Unity)  		
   		)
   	)
	MoleFraction(XFraction=0.47)
		
}

Physics(Region="n_region_6") {
	Optics (
	ComplexRefractiveIndex (
		WavelengthDep (real imag) )
   	OpticalGeneration (
   		SetConstant (
   			*TimeDependence (
			*WaveTime = (0.4e-10, 0.402e-10)
			*WaveTSigma = 1e-14
			*)
   			Value = 3.25e+20
   			*Value = 5E20
   			)
   		QuantumYield (Unity)  		
   		)
   	)
	MoleFraction(XFraction=0.47)
		
		
}

Physics(Region="n_region_5") {
	Optics (
	ComplexRefractiveIndex (
		WavelengthDep (real imag) )
   	OpticalGeneration (
   		SetConstant (
   			*TimeDependence (
			*WaveTime = (0.4e-10, 0.402e-10)
			*WaveTSigma = 1e-14
			*)
   			Value = 2.75e+20
   			*Value = 5E20
   			)
   		QuantumYield (Unity)  		
   		)
   	)
	MoleFraction(XFraction=0.47)
		
		
}

Physics(Region="n_region_4") {
	Optics (
	ComplexRefractiveIndex (
		WavelengthDep (real imag) )
   	OpticalGeneration (
   		SetConstant (
   			*TimeDependence (
			*WaveTime = (0.4e-10, 0.402e-10)
			*WaveTSigma = 1e-14
			*)
   			Value = 2.25e+20
   			*Value = 5E20
   			)
   		QuantumYield (Unity)  		
   		)
   	)
	MoleFraction(XFraction=0.47)
		
		
}

Physics(Region="n_region_3") {
	Optics (
	ComplexRefractiveIndex (
		WavelengthDep (real imag) )
   	OpticalGeneration (
   		SetConstant (
   			*TimeDependence (
			*WaveTime = (0.4e-10, 0.402e-10)
			*WaveTSigma = 1e-14
			*)
   			Value = 1.75e+20
   			*Value = 5E20
   			)
   		QuantumYield (Unity)  		
   		)
   	)
	MoleFraction(XFraction=0.47)
		
		
}

Physics(Region="n_region_2") {
	Optics (
	ComplexRefractiveIndex (
		WavelengthDep (real imag) )
   	OpticalGeneration (
   		SetConstant (
   			*TimeDependence (
			*WaveTime = (0.4e-10, 0.402e-10)
			*WaveTSigma = 1e-14
			*)
   			Value = 1.25e+20
   			*Value = 5E20
   			)
   		QuantumYield (Unity)  		
   		)
   	)
	MoleFraction(XFraction=0.47)	
		
	
}

Physics(Region="p_region_1") {
	Optics (
	ComplexRefractiveIndex (
		WavelengthDep (real imag) )
   	OpticalGeneration (
   		SetConstant (
   			*TimeDependence (
			*WaveTime = (0.4e-10, 0.402e-10)
			*WaveTSigma = 1e-14
			*)
   			Value = 7.5e+19
   			*Value = 5E20
   			)
   		QuantumYield (Unity)  		
   		)
   	)
	MoleFraction(XFraction=0.47)	
		
	
}

Physics(Region="p_region_0") {
	Optics (-OpticalGeneration)
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
OpticalIntensity OpticalGeneration
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
  


*   NewCurrentFile="trans_111" 
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






