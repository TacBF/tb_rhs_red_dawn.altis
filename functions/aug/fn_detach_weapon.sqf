#include "config.sqh"

//==========================================================
_Func_add_posdata = {
private ["_veh","_return"];
_veh = _this select 0;
_return = nil;
__FINDDATA(_veh,(_x select 0),_return,(_x select 2),__ALLCARARR);
_return
};

_func_detach = {
private ["_veh","_object","_object_data","_pos"];
_veh = _this select 0;
_object = _this select 1;
_object_data = _this select 2;

_pos = _POSMODEL(_veh,(_object_data select 0),(_object_data select 1),(_object_data select 2));
sleep 0.1;
_object attachTo [_veh,[0,-2,2.5]];
sleep 0.1;
detach _object;
_object setpos _pos;
sleep 1;
//hint str (getposASL _object);
[ _object,(getposASL _object)] remoteExec ["setPosASL", 0, false];
_object setVariable ["EH_GETOUT",nil,true];
_object setVariable ["ICE_cargo_transportable_PV", true,true];
_object setVariable [ "ICE_cargo_towable", true, true ];
};
//============================================================


private ["_veh","_object"];
_veh = _this select 0;
_object = _this select 1;
_veh setVariable ["Aug_attached",objNull,true];
_object setVariable ["Veh_attached",objNull,true];
_object setVariable ["getoutpos",nil,true];
[_object,["GetOut",(_object getVariable 'EH_GETOUT')]] remoteExec [ "removeEventHandler",0,false];

_data = [_veh] call _Func_add_posdata;
waitUntil {!(isNil '_data')};
//hint str _data;
[_veh,_object,_data] call _func_detach;






