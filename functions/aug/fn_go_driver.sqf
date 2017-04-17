private ["_veh","_driver","_gun"];

_gun = _this select 0;
_driver = _this select 1;
_veh = _gun getVariable "Veh_attached";
//hint format [ '%1', _veh];

if!(isNil '_veh') then 
{
    
    _driver allowdammage false;
    if(isNull (driver _veh)) then
    {
	    100025 cutText [ "", "BLACK FADED", 0];
        _driver action ["getOut",(vehicle _driver)];
        waitUntil { vehicle _driver == _driver};
	    _driver moveinDriver _veh;
		waitUntil { _driver in crew _veh};
        _driver allowdammage true;
		[] spawn {sleep 1; 100025 cutText [ "", "BLACK IN", 1]};
	}
	else
	{	
        100025 cutText [ "", "BLACK FADED", 0];    
        _driver action ["getOut",(vehicle _driver)];
        waitUntil { vehicle _driver == _driver};
	    _driver moveinCargo [_veh, (count (crew _veh))];
		waitUntil { _driver in crew _veh};
        _driver allowdammage true;
		[] spawn {sleep 1; 100025 cutText [ "", "BLACK IN", 1]};
	};
};

