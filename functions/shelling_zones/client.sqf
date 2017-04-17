if!(local player ) exitWith {};
Func_shelling_zone = compile preprocessFile "functions\shelling_zones\fnc_shelling_zone.sqf";

[] spawn
{   
	["shelling_zone_4",4,[EAST]] spawn Func_shelling_zone;
	["shelling_zone_3",3,[EAST]] spawn Func_shelling_zone;
};