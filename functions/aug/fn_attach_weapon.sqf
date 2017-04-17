#include "config.sqh"

//=============================================================
_Func_add_outposdata = {
private ["_veh","_return"];
_veh = _this select 0;
_return = nil;
__FINDDATA(_veh,(_x select 0),_return,(_x select 1),__ALLCARARR);
_return
};

_Func_add_augdata = {
private ["_veh","_object","_return","_attach"];
_veh = _this select 0;
_object = _this select 1;
_attach = false ;
{if((typeOf _veh) in (_x select 0)) exitWith {_arr = _x;__FINDDATA(_object,_x,_attach,(_arr select (_foreachIndex + 3)),__ALLOBJARR)}} foreach __ALLCARARR;
_return = _attach;
_return
};

_func_attach = {
private ["_veh","_object","_attach","_att","_dir"];
_veh = _this select 0;
_object = _this select 1;
_attach = _this select 2;
_att = _attach select 0;
_object attachTo [_veh,_att];
if(count _attach > 1) then { _dir = _attach select 1;[_object, _dir] remoteExec [ "setDir",0,false]};
if(count _attach > 2) then { [_veh, ["HideDoor3", 1]] remoteExec [ "animate",0,false]};
_object setVariable ["ICE_cargo_transportable_PV", false,true];
_object setVariable [ "ICE_cargo_towable", false, true ];
};
//============================================================


private ["_veh","_object","_attach_data","_outposdata","_chat"];
_veh = _this select 0;
_object = _this select 1;

_attach_data = [_veh,_object] call _Func_add_augdata;

waitUntil {!(isNil '_attach_data')};

_outposdata = [_veh] call _Func_add_outposdata;
waitUntil {!(isNil '_outposdata')};

if(str (_attach_data) != 'false') then 
{
//hint str  _attach_data ;
[_veh,_object,_attach_data ] call _func_attach;
_veh setVariable ["Aug_attached",_object,true];
_object setVariable ["getoutpos",_outposdata,true];
_object setVariable ["Veh_attached",_veh,true];
}
else
{
_chat = localize "STR_no_mount";
[ format [ "<t size='0.65' align='center' color='#ff0000'>%1</t>",_chat],0,0.25,4,0,0,7025] spawn bis_fnc_dynamicText;
};
if(true) exitWith {};