if!(local player ) exitWith {};
Func_create_marker = compile preprocessFile "functions\vehicles\fnc_create_marker.sqf";
sleep 20;

[] spawn 
{ 
    {
        if(_x getVariable ['CapturedVehicle',false]) then 
		{
		    if!( _x getVariable ["CapturedVehicle_action",false]) then
            {			
		        [_x] execVM 'functions\vehicles\CaptureVehicle.sqf';
		    };
		};
    } forEach vehicles;		
};