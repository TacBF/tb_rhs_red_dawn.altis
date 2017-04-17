if!(local player ) exitWith {};

BIS_Effects_Burn = compile preprocessFile "functions\lhd\burn.sqf";
Func_lhd_setpos = compile preprocessFile "functions\lhd\fnc_lhd_setpos.sqf";

[] spawn
{   
	[LHD_sim] call compile preprocessfile "functions\lhd\LHD_marker.sqf";
};