#include "config.sqh"

private ["_veh","_return","_objects","_object"];
_veh = _this select 0;
_return = objNull;
_objects = nearestObjects [ _VEHPOS,__ALLOBJECT,_DIST];
 if(count _objects > 0) then 
 {
    _object = (_objects select 0);
	if(alive  _object) then
    {
        if(count (crew _object) < _CREW) then 
        {		
	        _attached = _object getVariable ["Veh_attached", objNull ];
		    if(isNull _attached) then
		    {
	            _return = _object;
		    };
		};
	};
};

_return