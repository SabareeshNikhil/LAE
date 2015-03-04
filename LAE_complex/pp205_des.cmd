Device LAE{
Electrode {
   { Name="ntype"    Voltage=0   }
   { Name="ptype"    Voltage=0   }
   
}

File{
	* input files:
	Grid=	"sdemodel_ntype_200_1E17_ptype_799_1E18_decay_50_msh.tdr"
	Parameter= "sdevice.par"
	OpticalGenerationInput = "../LAE_simple/optgen"
	
	* output files:
	Plot=	"trans_sde_des_opt_0_bias_15_ntype_200_1E17_ptype_799_1E18_decay_50.tdr"
	Current="trans_sde_des_opt_0_bias_15_ntype_200_1E17_ptype_799_1E18_decay_50.plt"
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
   			*TimeDependence (
			*WaveTime = (1.4e-10, 1.402e-10)
			*WaveTSigma = 1e-14
			*)
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


System {

      LAE trans (ntype=g ptype=b)

      Vsource_pset vg (g 0) {dc=0}

      Vsource_pset vb (b 0) {dc=0}

      plot "nodes.plt" (time() g b) 


}


File {

    Output = "cv_opt_0_bias_15_ntype_200_1E17_ptype_799_1E18_decay_50.log"

        Plot = "cv_opt_0_bias_15_ntype_200_1E17_ptype_799_1E18_decay_50.dat"

        Current = "cv_opt_0_bias_15_ntype_200_1E17_ptype_799_1E18_decay_50.plt"

        ACExtract = "cv_opt_0_bias_15_ntype_200_1E17_ptype_799_1E18_decay_50.plt"


}
Solve{ 

   Coupled { Poisson }   

   Coupled { Poisson Electron }

   Coupled { Poisson Electron Hole } 

    NewCurrentFile="init" 


    Quasistationary ( MaxStep = 0.01 MinStep = 1e-8 

                          Goal { Parameter=vg.dc Voltage =10}) 

                         { Coupled { Poisson Electron Hole } } 

        

     NewCurrentFile="total" 

    Quasistationary ( MaxStep = 0.01 MinStep = 1e-8 

                          Goal { Parameter=vg.dc Voltage =10}) 




    {ACCoupled (    StartFrequency=1  EndFrequency=1E10

               NumberOfPoints=40  Decade

               Node(g b)  *Exclude(vg vb)

         ACCompute(Time=(Range=(0 1) Intervals=80))  

         )

              { Poisson Electron Hole }}


    
}

