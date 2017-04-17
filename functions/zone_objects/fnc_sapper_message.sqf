if!(local player) exitWith {};
_sapper = _this;
if(local _sapper) then 
{
    _chat = localize "STR_sapper_message";
	[ format [ "<t size='0.65' align='center' color='#ff0000'>%1</t>",_chat],0,0.25,4,1,0,7025] spawn bis_fnc_dynamicText;
};
if(true) exitWith {};