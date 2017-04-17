if!(local player) exitWith {};
private ["_vehicle","_Cname","_side","_markerName","_marker","_icon","_size","_arr","_vehicleEntry","_veh"];
_vehicle = (_this select 0);
_side = (_this select 1);

if(player getVariable 'ICE_Side' == _side ) then 
{
_Cname = typeOf _vehicle;
_markerName = (format [ "TB_vm_%1", _vehicle]);
_marker = createMarkerLocal [_markerName, [-1, -1, 0]];
_marker setMarkerShapeLocal "ICON";
_marker setMarkerAlphaLocal 0;
_marker setMarkerTypeLocal (_vehicle call TB_markers_fnc_getVehicleMarkerType);
_marker setMarkerSizeLocal [1.5, 1.5];
_icon = (getText (configFile/"cfgVehicles"/_Cname/"icon"));
_size = ((getNumber (configFile/"cfgVehicles"/_Cname/"mapSize")) * 0.075) / (worldSize / 8192);
_arr = [ _vehicle,_icon,_size,_marker ];

TB_markers_vehicleMarkerList pushBack _arr ;
}
else
{
    for "_i" from (count TB_markers_vehicleMarkerList - 1) to 0 step -1 do 
    {
		_vehicleEntry = TB_markers_vehicleMarkerList select _i;
		_veh = _vehicleEntry select 0;
		if(_veh == _vehicle ) then 
		{
            deleteMarkerLocal (_vehicleEntry select 3);
		    TB_markers_vehicleMarkerList deleteAt _i;
		};
	};       		
};
if(true) exitWith {};