#!/bin/sh
dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
cd $dir;
export GPL_CELL_PADDING='0';
export GRT_MACRO_EXTENSION='0';
export PACKAGED_SCRIPT_0='openlane/scripts/openroad/gpl.tcl';
export PL_BASIC_PLACEMENT='0';
export PL_ROUTABILITY_DRIVEN='1';
export PL_SKIP_INITIAL_PLACEMENT='0';
export PL_TARGET_DENSITY='0.4';
export PL_TIME_DRIVEN='1';
export PL_WIRELENGTH_COEF='0.25';
TOOL_BIN=${TOOL_BIN:-openroad}
$TOOL_BIN -exit $PACKAGED_SCRIPT_0
