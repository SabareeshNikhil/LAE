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
	Current="../LAE/sde_des_opt_complex1_11.plt"
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
   			TimeDependence (
			WaveTime = (1.4e-10, 1.402e-10)
			WaveTSigma = 1e-14
			)
   			Value = 3.0039e+21
   			*Value = 3.162e21
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
   			TimeDependence (
			WaveTime = (1.4e-10, 1.402e-10)
			WaveTSigma = 1e-14
			)
   			Value = 2.6877e+21
   			*Value = 3.162e21
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
			WaveTime = (1.4e-10, 1.402e-10)
			WaveTSigma = 1e-14
			)
   			Value = 2.3715e+21
   			*Value = 3.162e21
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
   			TimeDependence (
			WaveTime = (1.4e-10, 1.402e-10)
			WaveTSigma = 1e-14
			)
   			Value = 2.0553e+21
   			*Value = 3.162e21
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
   			TimeDependence (
			WaveTime = (1.4e-10, 1.402e-10)
			WaveTSigma = 1e-14
			)
   			Value = 1.7391e+21
   			*Value = 3.162e21
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
   			TimeDependence (
			WaveTime = (1.4e-10, 1.402e-10)
			WaveTSigma = 1e-14
			)
   			Value = 1.4229e+21
   			*Value = 3.162e21
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
   			TimeDependence (
			WaveTime = (1.4e-10, 1.402e-10)
			WaveTSigma = 1e-14
			)
   			Value = 1.1067e+21
   			*Value = 3.162e21
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
   			TimeDependence (
			WaveTime = (1.4e-10, 1.402e-10)
			WaveTSigma = 1e-14
			)
   			Value = 7.905e+20
   			*Value = 3.162e21
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
   			TimeDependence (
			WaveTime = (1.4e-10, 1.402e-10)
			WaveTSigma = 1e-14
			)
   			Value = 4.743e+20
   			*Value = 3.162e21
   			)
   		QuantumYield (Unity)  		
   		)
   	)
	MoleFraction(XFraction=0.47)	
		
	
}

Physics(Region="p_region_0") {
	Optics (
	ComplexRefractiveIndex (
		WavelengthDep (real imag) )
   	OpticalGeneration (
   		SetConstant (
   			TimeDependence (
			WaveTime = (1.4e-10, 1.402e-10)
			WaveTSigma = 1e-14
			)
   			Value = 1.581e+20
   			*Value = 3.162e21
   			)
   		QuantumYield (Unity)  		
   		)
   	)
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
OpticalIntensity OpticalGeneration
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

        ACExtract = "moscap_cv_complex1_11.plt"


}
Solve{ 

   Coupled { Poisson }   

   Coupled { Poisson Electron }

   Coupled { Poisson Electron Hole } 

    NewCurrentFile="init_1" 


    Quasistationary ( MaxStep = 0.01 MinStep = 1e-8 

                          Goal { Parameter=vg.dc Voltage =20}) 

                         { Coupled { Poisson Electron Hole } } 

        

     NewCurrentFile="totalcomplex_1" 

    Quasistationary ( MaxStep = 0.01 MinStep = 1e-8 

                          Goal { Parameter=vg.dc Voltage =20}) 




    {ACCoupled (    StartFrequency=1  EndFrequency=1E10

               NumberOfPoints=40  Decade

               Node(g b)  *Exclude(vg vb)

         ACCompute(Time=(Range=(0 1) Intervals=80))  

         )

              { Poisson Electron Hole }}


    
}





