#include "tb_defines.hpp"

zoneList[] =
{
/*
ID and PROFILE = not used
LINK = zones capturable after this one
DEPEND = auto-capture/enable upon these zones being held
DEPQTY = quantity of zones required for DEPEND i.e. can have only 2 of the 3 zones in DEPEND required
SYNC = required zones for progression

OBJECTS
select 0 = Required Destroyed (0 = all)
select 1 = Randomized Presence // TODO: future development to hide marker, title, hideObject and allwoDamage e.g. randomized TEs
select 2 = Required Placed // TODO: very future development to allow placement of objects = capture e.g. new Convoy gamemode
select 3 = Place Object Type // TODO: very future development to allow placement of objects = capture e.g. new Convoy gamemode
*/

//ID TEAM         SPAWNTYPE     LINK    SYNC   	OBJECTS   	DEPEND      DEPQTY  	ZONE_DESC
{ 0,     0, 		0, 		    {}, 	{}, 	{}, 			{}, 		0},
{ 1, TEAM_BLUE, 	SPAWN_XRAY, 	{}, 	{}, 	{}, 			{}, 		0, 			"U.S. Army Main Base" }, 
{ 2, TEAM_BLUE, SPAWN_NEVER, 	{1}, 	{}, 	{}, 			{}, 		0, 			"Observatory" }, 
{ 3, TEAM_BLUE, SPAWN_NEVER, 	{2}, 	{}, 	{}, 			{}, 		0, 			"Power station" }, 
{ 4, TEAM_BLUE, SPAWN_NEVER, 	{3}, 	{}, 	{}, 			{}, 		0, 			"Repair plant" }, 
{ 5, TEAM_BLUE, SPAWN_NEVER, 	{4}, 	{}, 	{}, 			{}, 		0, 			"Helicopter carrier" },
{ 6, TEAM_BLUE, SPAWN_NEVER, 	{5}, 	{}, 	{}, 			{}, 		0, 			"Radar station" },
{ 7, TEAM_RED, SPAWN_XRAY, 	{6}, 	{}, 	{}, 			{}, 		0, 			"Insurgent Main Base" },
{ 8, TEAM_RED   , SPAWN_INSTANT,    {}          , {}  	     ,{}      , {7,6,-4}       , 1    , "Insurgent FB" },
{ 9, TEAM_RED   , SPAWN_INSTANT,    {}          , {}  	     ,{}      , {7,5}       , 1    , "Insurgent FB" },
{ 10, TEAM_BLUE   , SPAWN_INSTANT,    {}          , {}  	     ,{}      , {1,6}       , 1    , "Helicopter carrier FB" }

 

//SPAWN_LARGEFB = can spawn during Battle Preparation time
//SPAWN_INSTANT = CANNOT spawn during Battle Preparation time
//Note: Base deployment to FB is based on centre of zone not flag
};
