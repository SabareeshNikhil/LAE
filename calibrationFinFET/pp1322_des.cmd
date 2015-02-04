* DD
File {
	Grid      = "2d_Lg_15_1305_msh.tdr"
	Plot      = "Cprime_prelims_1322.dat"
	Current   = "Cprime_prelims_1322.plt"
	Output    = "Cprime_prelims_1322.log"
	NonLocalPlot=   "n1322_nonlocal.plt"
	Parameter = "pp1322_des.par"
}

Electrode{
	{ Name="source"    Voltage=0.0 }
	{ Name="drain"     Voltage=0.0 }
        { name=gate voltage=0.0 workfunction= 4.40615105}
	*{ Name="substrate"     Voltage=0.0 }
}

NonLocalPlot((0.15 0.147165) (0.15 0.152835))
        { hDensity eDensity Bandgap ConductionBand ValenceBand
         eigenenergy 
         }
         
Physics{
	* DriftDiffusion  
	* eQCvanDort 
	* AreaFactor = 0.07885
	* Area Factor => Width = 2*(H-fR) + (W-2*fR) + pie*fR
	* AreaFactor = 0.1577
	* Inserting quantum Effect Models
	*	eMultiValley (MLDA)
	*	eMLDA 
	*hQuantumPotential
	EffectiveIntrinsicDensity( OldSlotboom )     
	Mobility(
			DopingDep
			eHighFieldsaturation( GradQuasiFermi )
			hHighFieldsaturation( GradQuasiFermi )
			Enormal
		)
	Recombination(
			SRH( DopingDep 
			Tunneling(Hurkx))
			*Band2Band (Hurkx)
			*eBarrierTunneling(Band2Band TwoBand Transmission) 
			*hBarrierTunneling(Band2Band TwoBand Transmission)
			
	     )           
}

Plot {
	*--Density and Currents, etc
	eDensity hDensity
	TotalCurrent/Vector eCurrent/Vector hCurrent/Vector
	eMobility hMobility
	*eVelocity hVelocity
	eQuasiFermi hQuasiFermi

	*--Temperature 
	* eTemperature Temperature * hTemperature

	*--Fields and charges
	ElectricField/Vector Potential SpaceCharge

	*--Doping Profiles
	Doping DonorConcentration AcceptorConcentration

	*--Generation/Recombination
	SRH Band2Band * Auger
	* AvalancheGeneration eAvalancheGeneration hAvalancheGeneration

	*--Driving forces
	*eGradQuasiFermi/Vector hGradQuasiFermi/Vector
	*eEparallel hEparallel eENormal hENormal
	hQuantumPotential	

	*--Band structure/Composition
	*BandGap 
	*BandGapNarrowing
	*Affinity
	ConductionBand ValenceBand
	eQuantumPotential
	eInterfaceTrappedCharge hInterfaceTrappedCharge
	TotalInterfaceTrapConcentration TotalTrapConcentration
	eBarrierTunneling
	hBarrierTunneling
	nonlocal

}


Math {

Nonlocal "BG1" 
(regionInterface="GateOxide.0_lump_1/FIN.0"
Length=5.335e-07 Permeable Permeation=3.35e-08
-Transparent(Region="GateOxide.0_lump_1") 
-Endpoint (Region="SFIN.0")
-Endpoint (Region="DFIN.0")
)
        
Nonlocal "BG2" 
(regionInterface="GateOxide.0_lump_2/FIN.0"
Length=5.335e-07 Permeable Permeation=3.35e-08
-Transparent(Region="GateOxide.0_lump_2") 
-Endpoint (Region="SFIN.0")
-Endpoint (Region="DFIN.0")
) 
   
   -CheckUndefinedModels
    RelTermMinDensity=1e6
    Extrapolate
    Derivatives
    Avalderivatives
    RelErrControl
    Digits=3
    ErRef(Electron)=1.e7
    ErRef(Hole)=1.e7
    Notdamped=50
    Iterations=10
    EnergyResolution(NonLocal)=0.0001
    Method = ILS (set=1)
    Digits(NonLocal)=2
    Number_of_Threads = 4


}

Solve {
	*- Build-up of initial solution:
	NewCurrentFile="init"
	Coupled(Iterations=100){ Poisson }
	Coupled{ Poisson Electron Hole }
	
	plot (FilePrefix = "OnlyPoisson_1322")

	*- Bias drain to target bias

	Quasistationary(
			* InitialStep=0.01 Increment=1.35 
			InitialStep=0.001 Increment=2 
			MinStep=1e-10 MaxStep=0.05
			 Goal{ Name="drain" Voltage= 0.9  }
		       ){ Coupled{ Poisson Electron Hole} }
	
	plot (FilePrefix = "DrainRamped_1322")

	*-  gate voltage sweep
	NewCurrentFile=""
	
	
	Quasistationary(
			InitialStep=1e-3 Increment=2 
			MinStep=1e-7 MaxStep=0.05
			 Goal{ Name="gate" Voltage= 0.9 }
			 *Goal{ Name="substrate" Voltage= 0.9 }
		       ){ Coupled{ Poisson Electron Hole}
			CurrentPlot(Time=(Range=(0 1) Intervals=60))
			Save(FilePrefix="Vd_1322"
                        Time=(1))
		}
	* none



}


