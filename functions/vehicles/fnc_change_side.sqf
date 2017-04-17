if!(local player) exitWith {};
private ["_vehicle","_Cname","_Dname","_caller","_side","_chat"];
_vehicle = (_this select 0);
_Cname = typeOf _vehicle;
_Dname = getText (configFile >> "cfgVehicles" >> _Cname >> "displayName");
_caller = (_this select 1);
_side = _caller getVariable "ICE_side";
_chat = format [ localize "STR_captured_vehicle",_Dname];
_vehicle setVariable [ "ICE_side",_side,true ];
_vehicle setVariable [ "ICE_squadLocked", grpNull, true];

[ "c",{ _this spawn Func_create_marker },[_vehicle,_side]] call ICE_fnc_broadcast;

if(local _caller) then
{
   [ format [ "<t size='0.65' align='center' color='#00CC00'>%1</t>",_chat],0,0.25,4,1,0,7025] spawn bis_fnc_dynamicText;
};

if(true) exitWith {};