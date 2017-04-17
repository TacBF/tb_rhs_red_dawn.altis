#include "config.sqh"

private ["_veh","_veh_name","_return","_object","_object_name","_mounted_obj"];
_veh = (_this select 0);
_veh_name = _GETNAME(_veh);
_mounted_obj = _veh getVariable [ "Aug_attached",objNull ];
_return =['',''];

if(isNull _mounted_obj) then
{    	
    _object = [ _veh ] call Func_aug_objects;	
    if!(isNull _object) then
    {
	    private [ "_trailer","_object_name","_text"];
	    _trailer = _veh getVariable "ICE_towing";
		if(isNil "_trailer") then 
		{
			if(isNull (gunner _object)) then
            {
	            _object_name = _GETNAME(_object);
                _text = format [ __TEXTMOUNT,_object_name,_veh_name];
			    _return = [ _text ,''];
			};
		};
    };
}	
else
{
    private [ "_text1","_text2","_object_name","_EH_GETOUT"];
	_object_name = _GETNAME(_mounted_obj);		    
	if(isNull (gunner _mounted_obj)) then
    {
	    _veh setVariable ["move_gunner",true,false];
		_text1 = format [ __TEXTDISMOUNT,_object_name];
	    _text2 = format [ __TEXTGOGUNNER,_object_name];
	    _return = [ _text1 ,_text2];
	}
	else
	{
	    _veh setVariable ["move_gunner",false,false];
	};
	_EH_GETOUT = _mounted_obj getVariable 'EH_GETOUT';	
	if(isNil '_EH_GETOUT') then 
	{
		_mounted_obj setVariable [ 'EH_GETOUT',_mounted_obj addEventHandler [ 'GetOut',{_this call Func_get_out}],false ];
	};
	_go_vehicle = _mounted_obj getVariable 'action_go_vehicle';
	if(isNil '_go_vehicle') then 
	{  
        private ["_action_go_vehicle"];	
	    _condition = "(_this in crew _target) and !(isNull (_target getVariable ['Veh_attached',objNull])) and (vehicle _this != _this) and (_this distance _target < 2) ";
        _action_go_vehicle = _mounted_obj addAction [ "",{_this call Func_go_driver},0,10,false,false,"",_condition];
        _mounted_obj setUserActionText [ _action_go_vehicle, format [ __TEXTGOVEHICLE,_veh_name]];		
	    _mounted_obj setVariable ['action_go_vehicle',_action_go_vehicle,false];
	}
	else
	{
	    _mounted_obj setUserActionText [ _go_vehicle, format [ __TEXTGOVEHICLE,_veh_name]];
    };
};
	
_return


