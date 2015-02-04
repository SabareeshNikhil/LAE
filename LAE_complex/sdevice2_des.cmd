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

    NewCurrentFile="init" 


    Quasistationary ( MaxStep = 0.01 MinStep = 1e-8 

                          Goal { Parameter=vg.dc Voltage =10}) 

                         { Coupled { Poisson Electron Hole } } 

        

     NewCurrentFile="total" 

    Quasistationary ( MaxStep = 0.01 MinStep = 1e-8 

                          Goal { Parameter=vg.dc Voltage =10}) 

                        # { Coupled { Poisson Electron Hole } }



    {ACCoupled (    StartFrequency=1  EndFrequency=1E10

               NumberOfPoints=40  Decade

               Node(g b)  *Exclude(vg vb)

         ACCompute(Time=(Range=(0 1) Intervals=80))  

         )

              { Poisson Electron Hole }}

        #plot(FilePrefix="biased" Time=(0;0.2;0.4;0.8;1) NoOverwrite)

    
}
