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
	Refinement "RefinementDefinition_p" {
		MaxElementSize = ( 0.5 0.05 0.5 )
		MinElementSize = ( 0.05 0.001 0.1 )
	}
	Refinement "RefinementDefinition_p_1" {
		MaxElementSize = ( 0.01 0.001 0.5 )
		MinElementSize = ( 0.001 0.0001 0.1 )
	}
	Refinement "RefinementDefinition_n" {
		MaxElementSize = ( 0.5 0.005 0.5 )
		MinElementSize = ( 0.05 0.0001 0.1 )
	}
	Refinement "RefinementDefinition_n_1" {
		MaxElementSize = ( 0.01 0.001 0.5 )
		MinElementSize = ( 0.001 0.0001 0.1 )
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
	Refinement "RefinementPlacement_p" {
		Reference = "RefinementDefinition_p"
		RefineWindow = region ["p_region"]
	}
	Refinement "RefinementPlacement_p_1" {
		Reference = "RefinementDefinition_p_1"
		RefineWindow = region ["p_region_1"]
	}
	Refinement "RefinementPlacement_n" {
		Reference = "RefinementDefinition_n"
		RefineWindow = region ["n_region"]
	}
	Refinement "RefinementPlacement_n_1" {
		Reference = "RefinementDefinition_n_1"
		RefineWindow = region ["n_region_1"]
	}
}

