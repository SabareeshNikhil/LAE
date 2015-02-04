
Device moscap {

    File { 

        Grid=	"hetero_msh.tdr"
	*Grid=	"../LAE/sdemodel_msh.tdr"
	Parameter= "../LAE/models.par"
	*Parameter = "../Tolga_LAE/models_1E-11.par"
	
	* output files:
	Plot=	"../LAE/sde_dvs_des_cv.tdr"     

    }


    Electrode { 

        { Name= "ntype"  Voltage= 0.0 } 

        { Name= "ptype"  Voltage= 0.0} 

          }


    Physics { 
    
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
	MoleFraction(XFraction=0.47)
		
}




Physics(Region="p_region") {
	Optics ( -OpticalGeneration )
	MoleFraction(XFraction=0.48)	
}

Physics ( material="InP" ) { Optics ( -OpticalGeneration ) }
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
ConductionBandEnergy ValenceBandEnergy BandGap
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

        ACExtract = "moscap_cv.plt"


}
Solve{ 

   Coupled { Poisson }   

   Coupled { Poisson Electron }

   Coupled { Poisson Electron Hole } 

    NewCurrentFile="init_0" 


    Quasistationary ( MaxStep = 0.01 MinStep = 1e-8 

                          Goal { Parameter=vg.dc Voltage =20}) 

                         { Coupled { Poisson Electron Hole } } 

        

     NewCurrentFile="total_0" 

    Quasistationary ( MaxStep = 0.01 MinStep = 1e-8 

                          Goal { Parameter=vg.dc Voltage =20}) 




    {ACCoupled (    StartFrequency=1  EndFrequency=1E10

               NumberOfPoints=40  Decade

               Node(g b)  *Exclude(vg vb)

         ACCompute(Time=(Range=(0 1) Intervals=80))  

         )

              { Poisson Electron Hole }}


    
}










