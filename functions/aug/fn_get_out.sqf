(_this select 2) allowdammage false;
(_this select 2) setPosATL ((_this select 0) modelToWorld ((_this select 0) getVariable 'getoutpos'));
[(_this select 2)] spawn 
{ 
    if(vehicle (_this select 0) == (_this select 0)) then 
    {
        waitUntil { (((getposATL (_this select 0)) select 2) < 0.1)};
        sleep 1;
        (_this select 0) allowdammage true ;
	}
	else
	{
	    sleep 1;
		(_this select 0) allowdammage true ;
	};
};