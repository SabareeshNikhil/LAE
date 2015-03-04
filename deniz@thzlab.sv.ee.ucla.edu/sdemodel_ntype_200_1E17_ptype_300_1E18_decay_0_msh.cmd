Title ""

Controls {
}

Definitions {
	Constant "p_doping_definition" {
		Species = "BoronActiveConcentration"
		Value = 1e+18
	}
	Constant "n_doping_definition" {
		Species = "PhosphorusActiveConcentration"
		Value = 1e+17
	}
	Refinement "RefinementDefinition_sub" {
		MaxElementSize = ( 0.5 0.05 0.5 )
		MinElementSize = ( 0.5 0.05 0.1 )
	}
	Refinement "RefinementDefinition_p" {
		MaxElementSize = ( 0.05 0.02 0.5 )
		MinElementSize = ( 0.05 0.01 0.1 )
	}
	Refinement "RefinementDefinition_n" {
		MaxElementSize = ( 0.05 0.01 0.5 )
		MinElementSize = ( 0.05 0.005 0.1 )
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
	Refinement "RefinementPlacement_sub" {
		Reference = "RefinementDefinition_sub"
		RefineWindow = region ["substrate"]
	}
	Refinement "RefinementPlacement_n" {
		Reference = "RefinementDefinition_n"
		RefineWindow = region ["n_region"]
	}
	Refinement "RefinementPlacement_p" {
		Reference = "RefinementDefinition_n"
		RefineWindow = region ["p_region"]
	}
}

