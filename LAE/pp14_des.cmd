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
	Plot=	"../LAE/sde_dvs_des_decade.tdr"
	Current="../LAE/sde_des_opt_complex1_14_decade.plt"
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
   			Value = 1.9e+22
   			*Value = 2e+22
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
   			Value = 1.7e+22
   			*Value = 2e+22
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
   			Value = 1.5e+22
   			*Value = 2e+22
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
   			Value = 1.3e+22
   			*Value = 2e+22
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
   			Value = 1.1e+22
   			*Value = 2e+22
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
   			Value = 9e+21
   			*Value = 2e+22
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
   			Value = 7e+21
   			*Value = 2e+22
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
   			Value = 5e+21
   			*Value = 2e+22
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
   			Value = 3e+21
   			*Value = 2e+22
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
   			Value = 1e+21
   			*Value = 2e+22
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

        ACExtract = "moscap_cv_complex1_14.plt"


}
Solve{ 

   Coupled { Poisson }   

   Coupled { Poisson Electron }

   Coupled { Poisson Electron Hole } 

    NewCurrentFile="init_1" 


    Quasistationary ( MaxStep = 0.01 MinStep = 1e-8 

                          Goal { Parameter=vg.dc Voltage =1.2}) 

                         { Coupled { Poisson Electron Hole } } 

        

     NewCurrentFile="totalcomplex_1" 

    Quasistationary ( MaxStep = 0.01 MinStep = 1e-8 

                          Goal { Parameter=vg.dc Voltage =1.2}) 




    {ACCoupled (    StartFrequency=1  EndFrequency=1E10

               NumberOfPoints=40  Decade

               Node(g b)  *Exclude(vg vb)

         ACCompute(Time=(Range=(0 1) Intervals=80))  

         )

              { Poisson Electron Hole }}


    
}





