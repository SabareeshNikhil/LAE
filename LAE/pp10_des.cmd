Device moscap{
Electrode {
   { Name="ntype"    Voltage=0   }
   { Name="ptype"    Voltage=0   }
   
}

File{
	* input files:
	*Grid=	"hetero_msh.tdr"
	Grid=	"../LAE/sdemodel_msh.tdr"
	Parameter= "../LAE/models.par"
	*Parameter = "../Tolga_LAE/models_1E-12.par"
	
	* output files:
	Plot=	"../LAE/sde_dvs_des.tdr"
	Current="../LAE/sde_des_opt_complex0_10.plt"
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

Physics(Region="p_region_1") {
	MoleFraction(XFraction=0.47)	
		
	
}

Physics(Region="p_region_0") {
	MoleFraction(XFraction=0.47)	
		
	
}


Physics(Region="substrate") {
	Optics ( -OpticalGeneration )
}

*Physics ( material="InP" ) { Optics ( -OpticalGeneration ) }
Physics ( material="Gold" ) { Optics ( -OpticalGeneration ) }
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
  Number_Of_Threads = 20
  StackSize = 20000000
}


System {

      moscap trans (ntype=g ptype=b)

      Vsource_pset vg (g 0) {dc=0}

      Vsource_pset vb (b 0) {dc=0}

      plot "nodes.plt" (time() g b) 


}


File {

    Output = "moscap.log"

        Plot = "moscap.dat"

        Current = "moscap.plt"

        ACExtract = "moscap_cv_complex0_10.plt"


}
Solve{ 

   Coupled { Poisson }   

   Coupled { Poisson Electron }

   Coupled { Poisson Electron Hole } 

    NewCurrentFile="init_0" 


    Quasistationary ( MaxStep = 0.01 MinStep = 1e-8 

                          Goal { Parameter=vg.dc Voltage =20}) 

                         { Coupled { Poisson Electron Hole } } 

        

     NewCurrentFile="totalcomplex_0" 

    Quasistationary ( MaxStep = 0.01 MinStep = 1e-8 

                          Goal { Parameter=vg.dc Voltage =20}) 




    {ACCoupled (    StartFrequency=1  EndFrequency=1E10

               NumberOfPoints=40  Decade

               Node(g b)  *Exclude(vg vb)

         ACCompute(Time=(Range=(0 1) Intervals=80))  

         )

              { Poisson Electron Hole }}


    
}





