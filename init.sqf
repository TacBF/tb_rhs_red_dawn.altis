#include "\ice\tb_main\sys\gameModes\aad_init.sqf";

Func_explosives_dammage = compile preprocessFile "functions\zone_objects\fnc_explosives_dammage.sqf";

if(isServer)  then 
{
    [LHD_pos1,LHD_sim] call compile preprocessfile "functions\lhd\lhd_start.sqf";
};


if(!isServer || local player) then
{

waitUntil { player == player};
waitUntil { alive player};
waitUntil { local player};
waitUntil { !isNull(findDisplay 46) };

[] execVM "functions\lhd\client.sqf";
[] execVM "functions\aug\client.sqf";
[] execVM "functions\vehicles\client.sqf";
[] execVM "functions\zone_objects\client.sqf";
[] execVM "functions\shelling_zones\client.sqf";

};
