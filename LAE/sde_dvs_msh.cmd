Title ""

Controls {
}

Definitions {
	Constant "p_doping_definition" {
		Species = "GalliumActiveConcentration"
		Value = 1e+17
	}
	Constant "n_doping_definition" {
		Species = "ArsenicActiveConcentration"
		Value = 1e+17
	}
	Refinement "RefinementDefinition" {
		MaxElementSize = ( 0.01 0.001 )
		MinElementSize = ( 0.001 0.0001 )
	}
}

Placements {
	Constant "p_doping_placement" {
		Reference = "p_doping_definition"
		EvaluateWindow {
			Element = region ["p_region"]
		}
	}
	Constant "n_doping_placement" {
		Reference = "n_doping_definition"
		EvaluateWindow {
			Element = region ["n_region"]
		}
	}
	Refinement "RefinementPlacement" {
		Reference = "RefinementDefinition"
		RefineWindow = material ["InGaAs"]
	}
}

