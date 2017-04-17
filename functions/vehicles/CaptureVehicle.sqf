private ["_veh","_side_veh","_Cname","_Dname","_condition"];

_veh = (_this select 0);
_veh setVariable [ 'CapturedVehicle', true , true ];

if(local player) then { _veh setVariable [ 'CapturedVehicle_action', true , false ] };

_Cname = typeOf _veh;
_Dname = getText (configFile >> "cfgVehicles" >> _Cname >> "displayName");
_condition = "((_target getVariable 'ICE_side') != (_this getVariable 'ICE_side')) and ( count crew _target < 1 ) and ((speed _target <= 1) AND (speed _target >= -1)) and (_this distance _target < 10)";

_veh addAction [ format [ "<t color='#FFFF33'>"+localize "STR_capture_vehicle"+"</t>",_Dname],"functions\vehicles\fnc_change_side.sqf",0,10,false,true,"",_condition];
	




