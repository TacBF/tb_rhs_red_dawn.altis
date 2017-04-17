#define _list_lhd ["Land_LHD_1", "Land_LHD_2", "Land_LHD_3", "Land_LHD_4", "Land_LHD_5", "Land_LHD_6", "Land_LHD_house_1", "Land_LHD_house_2", "Land_LHD_elev_R"]
#define _DIST 300
#define _WEIGHT -4.8
#define _OFFSET [0,-84,10]
#define _BURNOBJECT "HeliHEmpty"
#define _KOEF 30
#define _VECTZED 6
#define _BURNSIZE 15
#define _SMOKEPOS [ "Land_LHD_3", "Land_LHD_4", "Land_LHD_5"]

if!(isServer) exitWith {};

LHD_DOWN= false;
publicVariable 'LHD_DOWN';

//=============================================

func_setVelocity_veh = {
private ["_veh","_pos1","_pos2","_dist","_vx","_vy","_vecx","_vecy","_vectorVel"];
_veh = _this select 0;
if(_veh isKindOf 'Man') exitWith 
{ 
   if!(alive _veh) then 
   {
        private ["_man_pos"];
        _man_pos = getPosASL _veh;
        _man_pos set [2,-50];
       // _veh setpos _man_pos;
	   [ _veh, _man_pos] remoteExec ["setPosASL", 0, false];
       // [ "cs",{ (_this select 0) setpos (_this select 1) },[ _veh,_man_pos]] call ICE_fnc_broadcast;
   };
 };
_pos1 = _this select 1;
_pos2 = _veh modeltoWorld [0,0,0];
_dist = (_pos2 distance _pos1);
_vx = (_pos2 select 0) - (_pos1 select 0) ;
_vy = (_pos2 select 1) - (_pos1 select 1) ;
_vecx = (_vx / _dist) * _KOEF;
_vecy = (_vy / _dist) * _KOEF;
_vectorVel = [ ((velocity _veh) select 0) + _vecx, ((velocity _veh) select 1) + _vecy , ((velocity _veh) select 2) + _VECTZED];

//_veh setVelocity  _vectorVel ;
[ _veh, _vectorVel] remoteExec ["setVelocity", 0, false];
//[ "cs",{ (_this select 0) setVelocity (_this select 1) },[ _veh,_vectorVel]] call ICE_fnc_broadcast;
};

_func_smoke_gen = {

private ["_object","_burn"];
_object = _this select 0;
_burn = _BURNOBJECT createVehicle (position _object) ;
_burn attachTo [ _object,[ 0,0,_BURNSIZE]];
waitUntil {LHD_DOWN};
sleep (random 5);
[ "c",{ _this spawn BIS_Effects_Burn },[ _burn, _BURNSIZE, time, false, true ]] call ICE_fnc_broadcast;
};

_func_down_vehs = {
private ["_object","_vehs","_pos"];
_object = _this select 0;
_pos = _object modelToWorld [ 0,0,20];
waitUntil {LHD_DOWN};
_vehs = nearestObjects [ _pos, ["Air","LandVehicle","Man"], 50];
//hint str _vehs;
  {
    if!(_x getVariable ["veh_boom",false]) then 
	{
    	_x setVariable ["veh_boom",true];
        [_x,_pos] spawn func_setVelocity_veh;
    }	
  } foreach _vehs;
};

_func_del_weapons = {
private ["_object","_weapons"];
_object = _this select 0;
_pos = _object modelToWorld [ 0,0,15];
waitUntil {LHD_DOWN};
_weapons = nearestObjects [ _pos, ["ReammoBox"], 40];
{
if!(isNull _x) then {
[ "cs",{ _this call ICE_fnc_deleteVehicle},_x] call ICE_fnc_broadcast;
};
} forEach _weapons;

 
};

//===================================================

private ["_ship_pos","_ship_sim"];
_ship_pos = _this select 0;
_ship_sim = _this select 1;
_pos = getposASL _ship_pos;
_objects = nearestObjects [_pos ,_list_lhd,_DIST];
{
  _x setPosAsl [ getPosAsl _x select 0,getPosAsl _x select 1,_WEIGHT];
 [_x] spawn _func_del_weapons;
 [_x] spawn _func_down_vehs;
 if((typeOf _x) in _SMOKEPOS) then {[_x] spawn _func_smoke_gen};
 } foreach _objects;
_ship_sim attachTo [ _ship_pos,_OFFSET];
[ _ship_pos,_ship_sim ] execVM "functions\lhd\lhd_down.sqf";
[ _ship_sim ] execVM "functions\lhd\Fuel_boom.sqf";

if(true) exitWith {};