Title "Untitled"

Controls {
}

Definitions {
	Constant "ChannelRegion_1.0" {
		Species = "BoronActiveConcentration"
		Value = 1e+17
	}
	AnalyticalProfile "G2_Prof" {
		Species = "PhosphorusActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 4e+20, ValueAtDepth = 4e+20, Depth = 2.5e-09)
		LateralFunction = Gauss(Length = 0)
	}
	AnalyticalProfile "G2_Prof_1" {
		Species = "PhosphorusActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 4e+20, ValueAtDepth = 1e+17, Depth = 0.0036)
		LateralFunction = Gauss(Length = 0)
	}
	AnalyticalProfile "G1_Prof" {
		Species = "PhosphorusActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 4e+20, ValueAtDepth = 4e+20, Depth = 0.0036)
		LateralFunction = Gauss(Length = 0)
	}
	AnalyticalProfile "G1_Prof_1" {
		Species = "PhosphorusActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 4e+20, ValueAtDepth = 1e+17, Depth = 0.0036)
		LateralFunction = Gauss(Length = 0)
	}
	Constant "SourceRegion" {
		Species = "PhosphorusActiveConcentration"
		Value = 2e+20
	}
	Constant "DrainRegion" {
		Species = "PhosphorusActiveConcentration"
		Value = 2e+20
	}
	Refinement "UnivMeshDef" {
		MaxElementSize = ( 0.02 0.02 0.02 )
		MinElementSize = ( 0.02 0.02 0.02 )
	}
	Refinement "SourceExtMeshDef" {
		MaxElementSize = ( 0.0066666666666667 0.012666666666667 )
		MinElementSize = ( 0.0066666666666667 0.012666666666667 )
	}
	Refinement "DrainExtMeshDef" {
		MaxElementSize = ( 0.0066666666666667 0.012666666666667 )
		MinElementSize = ( 0.0066666666666667 0.012666666666667 )
	}
	Refinement "FinMeshDef" {
		MaxElementSize = ( 0.016666666666667 0.0012 )
		MinElementSize = ( 0.016666666666667 0.0012 )
	}
	Refinement "CFinMeshDef" {
		MaxElementSize = ( 0.01 0.0012 )
		MinElementSize = ( 0.01 0.0012 )
	}
	Refinement "Ch0MeshDef" {
		MaxElementSize = ( 0.015 3e-05 )
		MinElementSize = ( 0.015 3e-05 )
	}
	Refinement "Ch1MeshDef" {
		MaxElementSize = ( 0.015 3e-05 )
		MinElementSize = ( 0.015 3e-05 )
	}
	Refinement "BackOxideMeshDef" {
		MaxElementSize = ( 0.0075 8.6666666666667e-05 )
		MinElementSize = ( 0.0075 8.6666666666667e-05 )
	}
	Refinement "FntOxideMeshDef" {
		MaxElementSize = ( 0.0075 8.6666666666667e-05 )
		MinElementSize = ( 0.0075 8.6666666666667e-05 )
	}
	Refinement "BackGateChMeshDef" {
		MaxElementSize = ( 0.0075 0.0001875 )
		MinElementSize = ( 0.0075 1.5e-05 )
	}
	Refinement "FntGateChMeshDef" {
		MaxElementSize = ( 0.0075 0.0001875 )
		MinElementSize = ( 0.0075 1.5e-05 )
	}
	Refinement "GateMeshDef0" {
		MaxElementSize = ( 0.015 0.01092 )
		MinElementSize = ( 0.011538461538462 0.0078 )
	}
	Refinement "GateMeshDef2" {
		MaxElementSize = ( 0.015 0.01092 )
		MinElementSize = ( 0.011538461538462 0.0078 )
	}
}

Placements {
	Constant "ChDef_1.0" {
		Reference = "ChannelRegion_1.0"
		EvaluateWindow {
			Element = Rectangle [(0.075 0.144) (0.225 0.156)]
		}
	}
	AnalyticalProfile "G2_def" {
		Reference = "G2_Prof"
		ReferenceElement {
			Element = Line [(0.0714 0.156) (0.0714 0.144)]
			Direction = negative
		}
		notevalline
	}
	AnalyticalProfile "G2_def_1" {
		Reference = "G2_Prof_1"
		ReferenceElement {
			Element = Line [(0.0714 0.156) (0.0714 0.144)]
			Direction = positive
		}
		notevalline
	}
	AnalyticalProfile "G1_def" {
		Reference = "G1_Prof"
		ReferenceElement {
			Element = Line [(0.2286 0.156) (0.2286 0.144)]
			Direction = positive
		}
		notevalline
	}
	AnalyticalProfile "G1_def_1" {
		Reference = "G1_Prof_1"
		ReferenceElement {
			Element = Line [(0.2286 0.156) (0.2286 0.144)]
			Direction = negative
		}
		notevalline
	}
	Constant "SourceExtDef" {
		Reference = "SourceRegion"
		EvaluateWindow {
			Element = Rectangle [(0.005 0.131) (0.025 0.169)]
		}
	}
	Constant "DrainExtDef" {
		Reference = "DrainRegion"
		EvaluateWindow {
			Element = Rectangle [(0.275 0.131) (0.295 0.169)]
		}
	}
	Refinement "Ref1" {
		Reference = "UnivMeshDef"
		RefineWindow = Rectangle [(0 0) (0.3 0.3)]
	}
	Refinement "RefSrcExt" {
		Reference = "SourceExtMeshDef"
		RefineWindow = Rectangle [(0.005 0.131) (0.025 0.169)]
	}
	Refinement "RefDrnExt" {
		Reference = "DrainExtMeshDef"
		RefineWindow = Rectangle [(0.275 0.131) (0.295 0.169)]
	}
	Refinement "RefFin" {
		Reference = "FinMeshDef"
		RefineWindow = Rectangle [(0.025 0.144) (0.275 0.156)]
	}
	Refinement "CRefFin" {
		Reference = "CFinMeshDef"
		RefineWindow = Rectangle [(0.07499 0.144) (0.22501 0.156)]
	}
	Refinement "RefCh0" {
		Reference = "Ch0MeshDef"
		RefineWindow = Rectangle [(0.075 0.144) (0.225 0.148)]
	}
	Refinement "RefCh1" {
		Reference = "Ch1MeshDef"
		RefineWindow = Rectangle [(0.075 0.152) (0.225 0.156)]
	}
	Refinement "RefBackOxide" {
		Reference = "BackOxideMeshDef"
		RefineWindow = Rectangle [(0.07499 0.156) (0.22501 0.1573)]
	}
	Refinement "RefFntOxide" {
		Reference = "FntOxideMeshDef"
		RefineWindow = Rectangle [(0.07499 0.1427) (0.22501 0.144)]
	}
	Refinement "RefBackGateCh" {
		Reference = "BackGateChMeshDef"
		RefineWindow = Rectangle [(0.07499 0.156) (0.22501 0.156107142857)]
	}
	Refinement "RefFntGateCh" {
		Reference = "FntGateChMeshDef"
		RefineWindow = Rectangle [(0.07499 0.143892857143) (0.22501 0.144)]
	}
	Refinement "RefGate0" {
		Reference = "GateMeshDef0"
		RefineWindow = Rectangle [(0.075 0.1227) (0.22501 0.1427)]
	}
	Refinement "RefGate2" {
		Reference = "GateMeshDef2"
		RefineWindow = Rectangle [(0.07499 0.156) (0.225 0.1773)]
	}
}

