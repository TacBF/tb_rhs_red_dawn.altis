if!(alive LHD_sim) exitWith {};
private ["_LHD", "_dir", "_pos", "_marker"];
_LHD = _this select 0;
_pos = [getPosASL _LHD select 0, getPosASL _LHD select 1, 0];
_marker = str _LHD;
[_marker, _pos] spawn {
	params ["_marker", "_pos"];

	waitUntil {!isNil "ICE_fnc_createMarker"};

	{
		[_marker, "", getPos _x, "rectangle", [20, 130], "colorBlack", "", getDir _x, "solid",true ] call ICE_fnc_createMarker;
		[_marker+"Elev1Box_"+str _x, "", _x modelToWorld [20,-70,0], "rectangle", [9, 9], "colorBlack", "", getDir _x, "solid",true ] call ICE_fnc_createMarker;
		[_marker+"Elev2Box_"+str _x, "", _x modelToWorld [-20,-22,0], "rectangle", [9, 9], "colorBlack", "", getDir _x, "solid",true ] call ICE_fnc_createMarker;
		[_marker+"TowerBox_"+str _x, "", _x modelToWorld [10,22,0], "rectangle", [8, 43], "colorRed", "", getDir _x, "border",true ] call ICE_fnc_createMarker;
	} forEach (nearestObjects [_pos, ["Land_LHD_4"], 150]);

};

