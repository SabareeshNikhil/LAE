Device hetero{
Electrode {
   { Name="Anode"    Voltage=0   }
   { Name="Cathode"    Voltage=0   }
   
}

File{
	* input files:
	*Grid=	"hetero_msh.tdr"
	Grid=	"../LAE/sdemodel_msh.tdr"
	Parameter= "../LAE/models.par"
	
	* output files:
	Plot=	"../LAE/sde_dvs_des.tdr"
	Current="../LAE/sde_des_opt0.plt"
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
      hAvalanche(Eparallel CarrierTempDrive)
   ) 
		
}

Physics(Region="n_region_9") {
	MoleFraction(XFraction=0.47)	
}

Physics(Region="n_region_8") {
	MoleFraction(XFraction=0.47)	
}

Physics(Region="n_region_7") {
	MoleFraction(XFraction=0.47)	
}

Physics(Region="n_region_6") {
	MoleFraction(XFraction=0.47)	
}

Physics(Region="n_region_5") {
	MoleFraction(XFraction=0.47)	
}

Physics(Region="n_region_4") {
	MoleFraction(XFraction=0.47)	
}

Physics(Region="n_region_3") {
	MoleFraction(XFraction=0.47)	
}

Physics(Region="n_region_2") {
	MoleFraction(XFraction=0.47)	
}

Physics(Region="n_region_1") {
	MoleFraction(XFraction=0.47)	
}

Physics(Region="n_region_0") {
	MoleFraction(XFraction=0.47)	
}
*Physics(Region="i_region") {
*	Optics ( -OpticalGeneration )
*	MoleFraction(
*		xFraction=0.7
*		Grading(
*			(xFraction=0.3 GrDistance=3
*			RegionInterface=("i_region" "block_region")
*			 )
*			)
*		)
*}

*Physics(Region="block_region") {
*	Optics ( -OpticalGeneration )
*	MoleFraction(XFraction=0.3)	
*}

Physics(Region="p_region") {
	Optics ( -OpticalGeneration )
	MoleFraction(XFraction=0.48)	
}

*Physics ( material="InP" ) { Optics ( -OpticalGeneration ) }
Physics ( material="Gold" ) { Optics ( -OpticalGeneration ) }
}

System{
	*hetero d1 (ntype=1 ptype=0)
	hetero d1 (Cathode=1 Anode=0)
	Resistor_pset R1 (2 1) {resistance=70}	
	Vsource_pset vdc (2 0) {dc=1}
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

CurrentPlot {

ModelParameter = "Optics/OpticalGeneration/Scaling"

}


Math {
  NoSRHperPotential
  Extrapolate
  RelErrControl
  Notdamped=50
  Iterations=20
}

Solve {
 *Creating initial guess:
   Coupled(Iterations=100 LineSearchDamping=1e-4){ Poisson } 
   Coupled { Poisson electron hole }
  


   NewCurrentFile="trans_8" 
    Transient (
	InitialTime=0 FinalTime=2e-10
	InitialStep=1e-15 MaxStep=5e-14 MinStep=1e-17
	Increment=1.3
	)
   { Coupled { Poisson electron hole }    
   }
}

*Solve{ 
*   Coupled { Poisson }   
*   Coupled { Poisson Electron }
*   Coupled { Poisson Electron Hole }  

    
*    Quasistationary ( MaxStep = 0.01 MinStep = 1e-8 
*                          Goal { Name= "Cathode" Voltage =15.0}) 
*                         { Coupled { Poisson Electron Hole } }
            
*}






