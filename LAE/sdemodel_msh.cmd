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
		MaxElementSize = ( 0.05 0.005 0.5 )
		MinElementSize = ( 0.05 0.001 0.1 )
	}
	Refinement "RefinementDefinition_n" {
		MaxElementSize = ( 0.05 0.001 0.5 )
		MinElementSize = ( 0.05 0.0002 0.1 )
	}
}

Placements {
	Constant "n_doping_placement_9" {
		Reference = "n_doping_definition"
		EvaluateWindow {
			Element = region ["n_region_9"]
		}
	}
	Constant "n_doping_placement_8" {
		Reference = "n_doping_definition"
		EvaluateWindow {
			Element = region ["n_region_8"]
		}
	}
	Constant "n_doping_placement_7" {
		Reference = "n_doping_definition"
		EvaluateWindow {
			Element = region ["n_region_7"]
		}
	}
	Constant "n_doping_placement_6" {
		Reference = "n_doping_definition"
		EvaluateWindow {
			Element = region ["n_region_6"]
		}
	}
	Constant "n_doping_placement_5" {
		Reference = "n_doping_definition"
		EvaluateWindow {
			Element = region ["n_region_5"]
		}
	}
	Constant "n_doping_placement_4" {
		Reference = "n_doping_definition"
		EvaluateWindow {
			Element = region ["n_region_4"]
		}
	}
	Constant "n_doping_placement_3" {
		Reference = "n_doping_definition"
		EvaluateWindow {
			Element = region ["n_region_3"]
		}
	}
	Constant "n_doping_placement_2" {
		Reference = "n_doping_definition"
		EvaluateWindow {
			Element = region ["n_region_2"]
		}
	}
	Constant "p_doping_placement_1" {
		Reference = "p_doping_definition"
		EvaluateWindow {
			Element = region ["p_region_1"]
		}
	}
	Constant "p_doping_placement_0" {
		Reference = "p_doping_definition"
		EvaluateWindow {
			Element = region ["p_region_0"]
		}
	}
	Refinement "RefinementPlacement_sub" {
		Reference = "RefinementDefinition_sub"
		RefineWindow = region ["substrate"]
	}
	Refinement "RefinementPlacement_n" {
		Reference = "RefinementDefinition_n"
		RefineWindow = region ["n_region_2"]
	}
	Refinement "RefinementPlacement_p" {
		Reference = "RefinementDefinition_p"
		RefineWindow = region ["p_region_0"]
	}
}

