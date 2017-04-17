if!(isServer) exitWith {};

#define _FUEL_TANKERS ["Land_Fuel_tank_stairs","Land_fuel_tank_small","Land_Fuel_tank_big"]
#define _BIG_BOOM "HelicopterExploBig"
#define _LHD_OTHEROBJS ["FootBridge_0_ACR","FootBridge_30_ACR","ICE_Land_runway_edgelight","ICE_Land_LampAirport_F","Flush_Light_green_F",\
"ICE_armamentsBox_west", "ICE_tableLargeWithGear","ICE_helicopterSupplies","ICE_helicopter_repair_container_West",\
"TB_mediumSupplyContainer_green","ICE_proxy_Box_NATO_Ammo_F","ICE_proxy_Box_NATO_Wps_F","ICE_proxy_Box_NATO_AmmoOrd_F",\
"Land_ladderEP1","Land_ladder_half_EP1","Land_ladder","Misc_Cargo1B_military","Misc_Cargo1Bo_military","Misc_cargo_cont_small",\
"Misc_cargo_cont_net1","Misc_cargo_cont_net2","Misc_cargo_cont_net3","Land_Pallet_MilBoxes_F","Land_PaperBox_closed_F","Land_PaperBox_open_full_F","Land_LampHarbour_F"]
#define _LHD_LADDERS ["Land_ladderEP1","Land_ladder_half_EP1","Land_ladder"]

_boom = {
private [ "_obj","_explose1"];
_obj = _this select 0;
_pos = _obj modelToWorld [ 0,0,1];
_other_obj = nearestObjects [ _pos, _FUEL_TANKERS, 20];

waitUntil {(getDammage _obj) > 0.5};
{ 
    if((_x !=_obj) and (alive _x)) then 
	{ 
	    _x setDammage 1;
		[ "cs",{ _this setDammage 1},_x] call ICE_fnc_broadcast;
	}
} foreach _other_obj;
sleep (random 1);
_explose1 = _BIG_BOOM createVehicle _pos;
_explose1 attachTo [ _obj,[0,0,2]];

sleep 2;
deleteVehicle _obj;
[ "cs",{ _this call ICE_fnc_deleteVehicle },_obj] call ICE_fnc_broadcast;
LHD_DOWN = true;
publicVariable "LHD_DOWN";
};

_delete = {
private [ "_obj"];
_obj = _this select 0;
waitUntil {LHD_DOWN};
if((typeOf _obj) in _LHD_LADDERS) then {
{[ "c",{(_this select 0) action [ "ladderOff", (_this select 1)]},[_x,_obj]] call ICE_fnc_broadcast } foreach ((getPosASL _obj) nearObjects ["Man", 5])};
//{_x action [ "ladderOff", _obj]} foreach ((getPosASL _obj) nearObjects ["Man", 5]);};
sleep 1;
if!(isNull _obj) then {
[ "cs",{ _this call ICE_fnc_deleteVehicle },_obj] call ICE_fnc_broadcast;
  };
};

private ["_sim"];
_sim =_this select 0;
//hint "FUEL";
sleep 2;
{
   if(typeOf _x in _FUEL_TANKERS) then {[_x] spawn _boom };
   if(typeOf _x in _LHD_OTHEROBJS) then {[_x] spawn _delete };
} forEach ((getPos _sim) nearObjects ["ALL", 200]);


