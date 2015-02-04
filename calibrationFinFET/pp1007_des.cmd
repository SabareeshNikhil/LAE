

File {
	Grid      = "2d_Lg_15_3_msh.tdr"
	Plot      = "2d_Lg_15_1007.dat"
	Current   = "2d_Lg_15_1007.plt"
	Output    = "2d_Lg_15_1007.log"
	Parameter = "pp1007_des.par"
	Load=  "Vd_1005_des.sav"
	MonteCarloOut = "n1007_mc"
}

Electrode{
	{ Name="source"    Voltage=0.0 }
	{ Name="drain"     Voltage=0.0 }
	{ name=gate voltage=0.0 workfunction=4.85168503459}
        
}


MonteCarlo {
  HighKModus = 0
  WithFermiDiracScreening
  ChannelDirection = (1 1 0)
  Normal2OxideDirection = (-1 1 0)
   xGe = 000
  CurrentErrorBar = 2.5
  MinCurrentComput = 8
  DrainContact = 2 # No. of drain contact in .grd (count from 0)
  SelfConsistent(FrozenQF)
  Window = Rectangle[ (0.125,0.14183) (0.175,0.15817) ] # picasso -compat
FinalTime = 3.6e-07
  Plot { Range=(0,1.2e-06) intervals = 100 }
}

plot {
        MCField/Vector
        eMCDensity hMCDensity
        eMCEnergy hMCEnergy
        eMCVelocity/Vector hMCVelocity/Vector
        eMCAvalanche hMCAvalanche
        eMCCurrent/Vector hMCCurrent/Vector
        ElectricField/Vector
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

	*--Band structure/Composition
	*BandGap 
	*BandGapNarrowing
	*Affinity
	ConductionBand ValenceBand
	*eQuantumPotential
     }


Physics{
        Mobility (DopingDep 
        EnormalDependence 
	eHighFieldsaturation( GradQuasiFermi )
	hHighFieldsaturation( GradQuasiFermi )
        )
        EffectiveIntrinsicDensity ( BandgapNarrowing (OldSlotBoom) )
        Recombination(
        SRH( DopingDep Tunneling(Hurkx) )
	)           
}



Math {
   Method=blocked
   Submethod=pardiso
   Digits=6
   Extrapolate
   Derivatives
   Iterations=20
   Notdamped=50
   NumberOfSolverThreads=4
}

solve {
         coupled {poisson hole }
         montecarlo
         plot(fileprefix="n1007_mc" overwrite) 
}




