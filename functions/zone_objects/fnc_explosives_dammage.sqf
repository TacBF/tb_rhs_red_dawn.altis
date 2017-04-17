#define _EXPLOSIVES ["DemoCharge_Remote_Ammo","SatchelCharge_Remote_Ammo","rhsusf_m112_ammo","HelicopterExploBig"] 

if!(isServer) exitWith {};
waitUntil {!(isNil 'TB_curBaseList')};

private ["_info","_obj","_dammage","_ammo","_obj_dammage","_sapper"];
_info = _this;
_obj = _info select 0;
_dammage = _info select 2;
_sapper = _info select 3;
_ammo = _info select 4;
_obj_dammage = _obj getVariable ['obj_dammage',0];


if(_ammo in _EXPLOSIVES) then 
{
    if((_obj getVariable 'TB_objectToZone') in TB_curBaseList) then 
	{
        _obj_dammage = (_obj_dammage + _dammage);	    
        _obj setVariable [ 'obj_dammage',_obj_dammage,false];
	} 
	else
	{
        [ "c",{ _this spawn Func_sapper_message},_sapper] call ICE_fnc_broadcast;
	};
	
};
if(_obj_dammage > 0.7) then 
{ 
_obj setDammage 1;
 [ "cs",{ _this setDammage 1},_obj] call ICE_fnc_broadcast ;
};


if(true) exitWith {};

