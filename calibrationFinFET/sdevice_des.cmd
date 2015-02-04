* DD
File {
	Grid      = "2d_Lg_15_@node|-1@_msh.tdr"
	Plot      = "Cprime_prelims_@node@.dat"
	Current   = "Cprime_prelims_@node@.plt"
	Output    = "Cprime_prelims_@node@.log"
	NonLocalPlot=   "n@node@_nonlocal.plt"
	Parameter = "@parameter@"
}

Electrode{
	{ Name="source"    Voltage=0.0 }
	{ Name="drain"     Voltage=0.0 }
	{ Name="gate"     Voltage=0.0  Workfunction =  @WF@}
	*{ Name="substrate"     Voltage=0.0 }
}

NonLocalPlot((0.15 @<0.15-(W/2000.) - (tox/2000.)>@) (0.15 @<0.15+(W/2000.)+(tox/2000.)>@))
#NonLocalPlot((0.135 0.15))
        { hDensity eDensity Bandgap ConductionBand ValenceBand
         eigenenergy 
         }
         
Physics{
#if   [string compare @Type@ nMOS] == 0
	eQuantumPotential
#elif [string compare @Type@ pMOS] == 0
	hQuantumPotential
#endif
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
Length=@<(W+(tox/2))*1e-7 >@ Permeable Permeation=@<(tox/2)*1e-7>@
#Maxangle=5
-Transparent(Region="GateOxide.0_lump_1") 
-Endpoint (Region="SFIN.0")
-Endpoint (Region="DFIN.0")
)
        
Nonlocal "BG2" 
(regionInterface="GateOxide.0_lump_2/FIN.0"
Length=@<(W+(tox/2))*1e-7 >@ Permeable Permeation=@<(tox/2)*1e-7>@
#Maxangle=5
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
#if   [string compare @Type@ nMOS] == 0
	Coupled{ Poisson eQuantumPotential }
#elif [string compare @Type@ pMOS] == 0
	Coupled{ Poisson hQuantumPotential }
#endif
	
	plot (FilePrefix = "OnlyPoisson_@node@")

	*- Bias drain to target bias
#if   [string compare @Type@ nMOS] == 0
	Quasistationary(
			* InitialStep=0.01 Increment=1.35 
			InitialStep=0.001 Increment=2 
			MinStep=1e-10 MaxStep=0.05
			 Goal{ Name="drain" Voltage= @Vdd@  }
		       ){ Coupled{ Poisson Electron Hole eQuantumPotential} 
			

			
			Save(FilePrefix="Vd_@node@"
                        Time=(Range=(0 1) intervals=1)
                        nooverwrite)
			}
	
	plot (FilePrefix = "DrainRamped_@node@")

	*-  gate voltage sweep
	Load (FilePrefix = "Vd_@node@_0001")
	NewCurrentFile=""
	
	
	Quasistationary(
			InitialStep=1e-3 Increment=2 
			MinStep=1e-7 MaxStep=0.05
			 *Goal{ Name="gate" Voltage= @Vdd@ }
			 Goal{ Name="gate" Voltage= 0.1 }
			 *Goal{ Name="substrate" Voltage= @Vdd@ }
		       ){ Coupled{ Poisson Electron Hole eQuantumPotential}
			CurrentPlot(Time=(Range=(0 1) Intervals=60))
		}

#elif [string compare @Type@ pMOS] == 0
	Quasistationary(
			* InitialStep=0.01 Increment=1.35 
			InitialStep=0.001 Increment=2 
			MinStep=1e-10 MaxStep=0.05
			 Goal{ Name="drain" Voltage= -@Vdd@  }
		       ){ Coupled{ Poisson Electron Hole hQuantumPotential} 
			

			
			Save(FilePrefix="Vd_@node@"
                        Time=(Range=(0 1) intervals=1)
                        nooverwrite)
			}
	
	plot (FilePrefix = "DrainRamped_@node@")

	*-  gate voltage sweep
	Load (FilePrefix = "Vd_@node@_0001")
	NewCurrentFile=""
	
	
	Quasistationary(
			InitialStep=1e-3 Increment=2 
			MinStep=1e-7 MaxStep=0.05
			 *Goal{ Name="gate" Voltage= -@Vdd@ }
			Goal{ Name="gate" Voltage= -0.1 }
			 *Goal{ Name="substrate" Voltage= -@Vdd@ }
		       ){ Coupled{ Poisson Electron Hole hQuantumPotential}
			CurrentPlot(Time=(Range=(0 1) Intervals=60))
		}

#endif


}
