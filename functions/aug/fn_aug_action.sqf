private ["_veh","_object","_mounted_obj"];
_veh = _this select 0;
_mounted_obj = _veh getVariable [ "Aug_attached",objNull ];

if(isNull _mounted_obj) then
{    	
    _object = [ _veh ] call Func_aug_objects;
    if!(isNull _object) then
    {
        [ _veh,_object] call Func_attach_weapon;
    };
}	
else
{
    [ _veh,_mounted_obj] call Func_detach_weapon;
};
if(true) exitWith {};	

