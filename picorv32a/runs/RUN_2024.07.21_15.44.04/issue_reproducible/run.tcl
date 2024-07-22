#!/usr/bin/env openroad
set ::env(GPL_CELL_PADDING) "0";
set ::env(GRT_MACRO_EXTENSION) "0";
set ::env(PACKAGED_SCRIPT_0) "openlane/scripts/openroad/gpl.tcl";
set ::env(PL_BASIC_PLACEMENT) "0";
set ::env(PL_ROUTABILITY_DRIVEN) "1";
set ::env(PL_SKIP_INITIAL_PLACEMENT) "0";
set ::env(PL_TARGET_DENSITY) "0.4";
set ::env(PL_TIME_DRIVEN) "1";
set ::env(PL_WIRELENGTH_COEF) "0.25";
source $::env(PACKAGED_SCRIPT_0)
