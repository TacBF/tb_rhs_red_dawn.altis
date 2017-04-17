class cfgMagazines
{
	class magazineLimitations
	{
		/*---------------------------------------------------------------------------
			Sets the amount of magazines you can have out of the following array (So in total!)
			You can specify a special number for resistance as well
		---------------------------------------------------------------------------*/
		class 40mm_HE
		{
			magazineArray[] = {"rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_VOG25", "rhs_VOG25P","rhs_VG40TB"};
			limit = 8;
			limtResistance = 8;
			categoryName = "40mm HE Grenades";
		};
		class 6x40mm_Grenades
		{
			magazineArray[] = {"rhsusf_mag_6Rnd_M441_HE","rhsusf_mag_6Rnd_M433_HEDP","rhsusf_mag_6Rnd_M576_Buckshot","rhsusf_mag_6Rnd_M781_Practice","rhsusf_mag_6Rnd_M714_white"};
			limit = 2;
			limtResistance = 2;
			categoryName = "6x40mm Grenades";
		};
		class Grenade
		{
			magazineArray[] = {"rhs_mag_rgd5","rhs_mag_m67","rhs_mag_rgn"};
			limit = 3;
			limtResistance = 3;
			categoryName = "HE Grenades";
		};
		class Stun_Grenade
		{
			magazineArray[] = {"rhs_mag_fakel", "rhs_mag_fakels", "rhs_mag_zarya2", "rhs_mag_plamyam", "rhs_mag_mk84", "rhs_mag_an_m14_th3", "rhs_mag_m7a3_cs", "rhs_mag_mk3a2"};
			limit = 2;
			limtResistance = 2;
			categoryName = "Stun Grenades";
		};
		
		class HE_Rockets
		{
			magazineArray[] = {"rhs_rpg7_OG7V_mag","rhs_rpg7_PG7VL_mag","rhs_rpg7_TBG7V_mag","rhs_rpg7_PG7VR_mag","CUP_M136_M","CUP_SMAW_HEDP_M","CUP_SMAW_HEAA_M","CUP_RPG18_M"};
			limit = 3;
			limtResistance = 3;
			categoryName = "RPG Rockets";
		};
		class HE_Shotgun
		{
			magazineArray[] = {"rhsusf_8Rnd_FRAG", "rhsusf_5Rnd_FRAG", "rhsusf_8Rnd_HE", "rhsusf_5Rnd_HE"};
			limit = 4;
			limtResistance = 4;
			categoryName = "HE Shotgun";
		};
		class MG_Ammo
		{
			magazineArray[] = {"rhs_100Rnd_762x54mmR","rhs_100Rnd_762x54mmR_green","rhs_200rnd_556x45_M_SAW","rhs_200rnd_556x45_B_SAW","rhs_200rnd_556x45_T_SAW","rhsusf_100Rnd_762x51","rhsusf_100Rnd_762x51_m61_ap","CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"};
			limit = 5;
			limtResistance = 5;
			categoryName = "MG Magazines";
		};
	};
};



