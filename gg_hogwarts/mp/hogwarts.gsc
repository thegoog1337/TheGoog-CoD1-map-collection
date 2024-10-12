// --------------------------------------------------------------------------------
// PLS READ
// --------------------------------------------------------------------------------
// gsc for gg_hogwarts
// Im (TheGoog) a loser in scripting so i copied a lot of functionality from other maps gsc's.
// Most stuff i was able to get from Jef's V_Forgottentomb. Thank you Jef for being awesome!
// The Discolights i was able to get from Fabios Miniharbor.
// Big thanks to raph for making the Fluff(l)y work and helping me with harry and ron :D <3
// --------------------------------------------------------------------------------
// Resources where i learn from:
// https://cod1.eu/script/
// https://www.youtube.com/watch?v=1ahHTW4hhzk&t=18s&ab_channel=IceGrenade


main()
{
	maps\mp\_load::main();

	//level settings
	game["allies"] = "british";
	game["axis"] = "german";
	game["british_soldiertype"] = "commando";
	game["british_soldiervariation"] = "normal";
	game["german_soldiertype"] = "kriegsmarine";
	game["german_soldiervariation"] = "normal";
// 	game["layoutimage"] = "mp_harbor";
	
	setCullFog (0, 6500, .8, .8, .8, 0);
	ambientPlay("ambient_mp_harbor");

	// Fx and sounds

	water = getEnt("water","targetname");
	mandrake1 = getEnt("mandrake_scream1","targetname");
	mandrake2 = getEnt("mandrake_scream2","targetname");
	mandrake3 = getEnt("mandrake_scream3","targetname");
	mandrake4 = getEnt("mandrake_scream4","targetname");
	fire1 = getent("fire1", "targetname");
	fire2 = getent("fire2", "targetname");
	fire3 = getent("fire3", "targetname");
	//fluffy = getEnt("sound_fluffy","targetname");

	thread loopSound("WaterRunning", 10, water, "water", 1, false);
	thread loopSound("mandrake_sound1", 1.2, mandrake1, "mandrake1", 1, false);
	thread loopSound("mandrake_sound2", 1, mandrake2, "mandrake2", 1, false);
	thread loopSound("mandrake_sound3", 1.4, mandrake3, "mandrake3", 1, false);
	thread loopSound("mandrake_sound4", .8, mandrake4, "mandrake4", 1, false);
	thread loopSound("sound_fire", 10, fire1, "fire1", 1, false);
	thread loopSound("sound_fire", 10, fire2, "fire2", 1, false);
	thread loopSound("sound_fire", 10, fire3, "fire3", 1, false);
	//thread loopSound("sound_fluffy", 10, fluffy, "fluffy", 1, false);


	level.smallbon_1stalin = loadfx ("fx/fire/smallbon_1stalin.efx");
	level.fire = loadfx ("fx/fire/tinybon.efx");
	level.firesmall = loadfx ("fx/fire/firesmall.efx");
	level.firebig = loadfx ("fx/fire/pathfinder_extreme.efx");
	level.smoke = loadfx ("fx/smoke/chimneysmoke.efx");


	level._effect["smallbon_1stalin"] = loadfx ("fx/fire/smallbon_1stalin.efx");
	level._effect["fire"] = loadfx ("fx/fire/tinybon.efx");
	level._effect["firesmall"] = loadfx ("fx/fire/firesmall.efx");
	level._effect["firebig"] = loadfx ("fx/fire/pathfinder_extreme.efx");
	level._effect["smoke"] = loadfx ("fx/smoke/ash_smoke.efx");

	
	maps\mp\_fx::loopfx("fire", (536, 160, 80), 0.6);				// entrance left
	maps\mp\_fx::loopfx("fire", (536, -285, 80), 0.6);				// entrance right
	maps\mp\_fx::loopfx("fire", (960, 3320, 168), 0.6);				// fireplace great hall
	maps\mp\_fx::loopfx("fire", (1024, 3320, 168), 0.4);			// fireplace great hall
	maps\mp\_fx::loopfx("fire", (2200, 3240, 192), 0.4);			// metalgate great hall
	maps\mp\_fx::loopfx("fire", (2766, 2356, 872), 0.4);			// 250gap great hall
	maps\mp\_fx::loopfx("fire", (3550, 1538, 438), 0.4);			// everburning fire
	maps\mp\_fx::loopfx("fire", (2272, 610, 318), 0.4);				// fire outside
	maps\mp\_fx::loopfx("fire", (2272, 792, 318), 0.4);				// fire outside
	maps\mp\_fx::loopfx("fire", (-56, 62, 119), 0.3);				// Gapshallway right
	maps\mp\_fx::loopfx("fire", (-56, 302, 119), 0.3);				// Gapshallway left	
	maps\mp\_fx::loopfx("fire", (2739, 4180, -1391), 0.6);			// below Owl tower
	maps\mp\_fx::loopfx("fire", (2739, 3998, -1391), 0.6);			// below Owl tower
	maps\mp\_fx::loopfx("fire", (2387, 4180, -1391), 0.6);			// below Owl tower
	maps\mp\_fx::loopfx("fire", (2387, 4000, -1391), 0.6);			// below Owl tower
	maps\mp\_fx::loopfx("fire", (1982, 4216, -76), 0.6);			// sewer
	maps\mp\_fx::loopfx("fire", (1986, 3825, -77), 0.6);			// sewer
	maps\mp\_fx::loopfx("fire", (1218, 3825, -76), 0.6);			// sewer
	maps\mp\_fx::loopfx("fire", (1214, 4220, -76), 0.6);			// sewer
	maps\mp\_fx::loopfx("fire", (567, 3879, -79), 0.6);				// basement
	maps\mp\_fx::loopfx("fire", (-656, 4848, 112), 0.6);			// before fluffy
	maps\mp\_fx::loopfx("fire", (-432, 5231, 112), 0.6);			// before fluffy
	maps\mp\_fx::loopfx("fire", (-655, 5616, 112), 0.6);			// before fluffy
	maps\mp\_fx::loopfx("fire", (-432, 5808, 112), 0.6);			// before fluffy
	maps\mp\_fx::loopfx("fire", (-656, 5808, 112), 0.6);			// before fluffy
	maps\mp\_fx::loopfx("fire", (-1327, 2351, 334), 0.6);			// fireplace commonroom
	maps\mp\_fx::loopfx("fire", (-1327, 2420, 334), 0.6);			// fireplace commonroom
	maps\mp\_fx::loopfx("fire", (-1691, 3432, 840), 0.6);			// fireplace before girlstoilet
	maps\mp\_fx::loopfx("fire", (-1708, 3374, 840), 0.6);			// fireplace before girlstoilet
	maps\mp\_fx::loopfx("fire", (-2652, 6224, 72), 0.6);			// Disco Room
	maps\mp\_fx::loopfx("fire", (-3388, 6224, 72), 0.6);			// Disco Room
	maps\mp\_fx::loopfx("fire", (-3388, 5775, 72), 0.6);			// Disco Room
	maps\mp\_fx::loopfx("fire", (-2652, 5775, 72), 0.6);			// Disco Room
	maps\mp\_fx::loopfx("smoke", (-2652, 6224, 120), 0.7);			// Disco Room
	maps\mp\_fx::loopfx("smoke", (-3388, 6224, 120), 0.7);			// Disco Room
	maps\mp\_fx::loopfx("smoke", (-3388, 5775, 120), 0.7);			// Disco Room
	maps\mp\_fx::loopfx("smoke", (-2652, 5775, 120), 0.7);			// Disco Room
	maps\mp\_fx::loopfx("firebig", (-2600, -1824, -2032), 0.7);		// final gaps
	maps\mp\_fx::loopfx("firebig", (-2152, -1824, -2032), 0.7);		// final gaps
	maps\mp\_fx::loopfx("firebig", (-1640, -1824, -2032), 0.7);		// final gaps
	maps\mp\_fx::loopfx("firebig", (-1128, -1824, -2032), 0.7);		// final gaps
	maps\mp\_fx::loopfx("firebig", (-2600, -2912, -2032), 0.7);		// final gaps
	maps\mp\_fx::loopfx("firebig", (-2152, -2912, -2032), 0.7);		// final gaps
	maps\mp\_fx::loopfx("firebig", (-1640, -2912, -2032), 0.7);		// final gaps
	maps\mp\_fx::loopfx("firebig", (-1128, -2912, -2032), 0.7);		// final gaps
	maps\mp\_fx::loopfx("smoke", (536, 160, 120), 0.7);				// entrance left
	maps\mp\_fx::loopfx("smoke", (536, -285, 120), 0.7);			// entrance right
	
	// threads
	thread intro_credit();
	thread towyEntrance();
	thread bust_statue();
	thread activate_firetail();
	thread music_hogwarts_main();
	thread music_hogwarts_main2();
	thread music_hogwarts_disco();
//	thread searchlights();
	thread setupDog();
//	thread setupFightingGuys();
	thread setupRon();
	thread setupHarry();
	thread music_towy();
	thread common_room_book();
	thread mysterious_water();
	thread hagrid();
	thread book_start();
	thread filch();
	thread filch2();
	thread finish();
	thread gap250();
	thread gap260();
	thread gap270();
	thread gap280();
	thread fawkes();
	thread setupFawkes();



	entTransporter = getentarray("tele","targetname");
	if(isdefined(entTransporter)){
		for(lp=0;lp<entTransporter.size;lp=lp+1)entTransporter[lp] thread Transporter();
	}
/*	
	// floating candles bobbing 8 units
	entitiesCandles = getEntArray("floatingcandle", "targetname");
	for(i=0; i<entitiesCandles.size; i++){
		entitiesCandles [i] thread floatingCandles();
	}
	
	// platforms bobbing 4 units
	entities = getEntArray("bobbing4u", "targetname");
	for(i=0; i<entities.size; i++){
		entities [i] thread bobbing4u();
	}*/

/*	// floating platforms in the sewer
	entities = getEntArray("moving_crate", "targetname");

	for(i=0; i<entities.size; i++){
		entities [i] thread moving_crate();		
	}*/
}

//loopsound copied from Jef
loopSound(soundName, soundTime, entity, loopingVariable, waitTime, isLocalSound){	
	i = 0;
	continueLooping = true;
	
	while(continueLooping){	
		//Check wheter the looping must stop or not by linking global variables
		//ContinueLooping cant be a local parameter for this to work -> use switch for global variable
		switch(loopingVariable){
			case "radio": continueLooping = level.loopRadio;
					break;
			case "clubMusicPlayer": continueLooping =  true;
					break;
			default:
					continueLooping = true;
					break;
		}	
		wait(waitTime);
		if(i >= soundTime){
			if(!isLocalSound){entity playsound(soundName);} 
			else{entity playlocalsound(soundName);}
			i = 0;
		}
		else{
			i++;
		}	
	}
}

fawkes()
{
	fawkes = getent("fawkes","targetname");
	
	while(1)
	{
		fawkes waittill("trigger", user);
		user thread shader();
		//user playlocalsound(getRandomScream());
		wait 2;
	}
}

shader()
{
	self.blind = newClientHudElem(self);
	self.blind.x = 0;
	self.blind.y = 0;
	self.blind.alpha = 0;
	self.blind setshader("black", 640, 480);
	self.blind fadeovertime(.2);
	self.blind.alpha = 1;
	wait 2;
	self.blind fadeovertime(2);
	self.blind.alpha = 0;
	wait 2.5;
	self.blind destroy();
}


gap250()
{
	gap250 = getent("gap250","targetname");
		
	while(1)
	{
		gap250 waittill("trigger", user);
		if(!isDefined(user.hasFinished250))
			user.hasFinished250 = false;
			
		if(!user.hasFinished250)
		{
			user.hasFinished250 = true;
			iprintlnbold("Well done, "+user.name+"^7 has finished the 250 gap!");
			wait 4;
			user iprintlnbold("Keep improving!");
			wait 4;
		}
	}
}

gap260()
{
	gap260 = getent("gap260","targetname");
		
	while(1)
	{
		gap260 waittill("trigger", user);
		if(!isDefined(user.hasFinished260))
			user.hasFinished260 = false;
			
		if(!user.hasFinished260)
		{
			user.hasFinished260 = true;
			iprintlnbold("Well done, "+user.name+"^7 has finished the 260 gap!");
			wait 4;
			user iprintlnbold("Great work! Now try 270!");
			wait 4;
		}
	}
}

gap270()
{
	gap270 = getent("gap270","targetname");
		
	while(1)
	{
		gap270 waittill("trigger", user);
		if(!isDefined(user.hasFinished270))
			user.hasFinished270 = false;
			
		if(!user.hasFinished270)
		{
			user.hasFinished270 = true;
			iprintlnbold("Wooaahhhh, "+user.name+"^7 has finished the 270 gap!");
			wait 4;
			user iprintlnbold("You really did great there! But are you ready for the real challange?");
			wait 4;
			user iprintlnbold("Try to finish the 280 section to get the dark lord of jumping!");
			wait 0.5;
		}
	}
}

gap280()
{
	gap280 = getent("gap280","targetname");
		
	while(1)
	{
		gap280 waittill("trigger", user);
		if(!isDefined(user.hasFinished280))
			user.hasFinished280 = false;
			
		if(!user.hasFinished280)
		{
			user.hasFinished280 = true;
			iprintlnbold("Wooaahhhh i cant belive it, "+user.name+"^7 has finished the 280 gap!");
			wait 3;
			iprintlnbold("He is a the dark lord of jumping!");
			wait 2;
			iprintlnbold("You better take your hats off for "+user.name+"!!!");
			wait 0.5;

		}
	}
}

intro_credit()
{	
	wait 3;
	iprintlnbold("Jumpmap: Hogwarts");
	wait 1.5;
	iprintlnbold("by TheGoog");
	wait 1.5;
	iprintlnbold("Enjoy ^1<3");
	wait 0.5;
}

finish()
{
	t = getent("finish_trig","targetname");
		
	while(1)
	{
		t waittill("trigger", user);
		if(!isDefined(user.hasFinishedMap))
			user.hasFinishedMap = false;
			
		if(!user.hasFinishedMap)
		{
			user.hasFinishedMap = true;
			iprintlnbold("Well done, "+user.name+"^7 has finished the map and killed the basilisk!");
			wait 4;
			user iprintlnbold("Use Fawx to fly back to the castle");
			wait 4;
			user iprintlnbold("I hope you enjoyed it!");
		}
	}
}

towyEntrance()
{
	towyRoomEntrance = getEnt("towy_entrance", "targetname");
	while(1)
	{
		towyRoomEntrance waittill("trigger", user);
		if(!isDefined(user.hasDiscovered))
			user.hasDiscovered = false;
			
		if(!user.hasDiscovered)
		{
			user.hasDiscovered = true;
			wait 0.5;
			user iprintlnbold("you entered Towy's");
			wait 0.5;
			user iprintlnbold("secret love cave");
			wait 1.5;
		}
	}
}

music_towy()
{
	
	musicTrigger = getent("music_towy", "targetname");
	
	while(1){
		musicTrigger waittill("trigger", user);
		ambientStop();
		ambientPlay("music_towyroom");
		wait(0.05);
		iPrintLnbold("^3-^7 Its Towy sexy time ^3-^7");
		iPrintLn("STRLGHT^3-^7 Clutch Epidemic Sound^7");
		wait(150);
		ambientStop();
		wait(0.05);
		ambientPlay("music_hogwarts_main");
		wait(0.05);
	}
}

filch()
{
	filch = getent("filch", "targetname");

	while(1)
	{
		filch waittill("trigger", user);
		if(!isDefined(user.hasSeenFilch))
			user.hasSeenFilch = false;
			
		if(!user.hasSeenFilch)
		{
			user.hasSeenFilch = true;
			user iPrintLnbold("^3 Filch^7 You are not allowed to be here! ^7");
			wait 2;
			user iPrintLnbold("^7 Go Back and better not enter again! ^7");
			wait 0.5;
		}
	}
}

filch2()
{
	filch2 = getent("filch2", "targetname");

		while(1)
	{
		filch2 waittill("trigger", user);
		if(!isDefined(user.hasSeenFilch2))
			user.hasSeenFilch2 = false;
			
		if(!user.hasSeenFilch2)
		{
			user.hasSeenFilch2 = true;
			user iPrintLnbold("^3 Filch^7 I warned you!!! ^7");
			wait 2;
			user iPrintLnbold("^7 Now go back! ^7");
			wait 0.5;
		}
	}
}


hagrid()
{
	
	musicTrigger = getent("hagrid", "targetname");
	
	while(1){
		musicTrigger waittill("trigger", user);
		user PlayLocalSound("sound_hagrid");
		wait(0.05);
	}
}

book_start()
{
	book_start = getent("book_start", "targetname");
	
	while(1){
		book_start waittill("trigger", user);
		wait(0.05);
		user iPrintLnbold("^3-^7 Book of Hogwarts^3-^7");
		wait (2);
		user iPrintLnbold("^7 to start you journey ^7");
		user iPrintLnbold("^7 walk up the stairs and go to the left. ^7");
		user iPrintLnbold("^7 Try your best and be friendly to fellow jumping wizards ^7");
		wait(0.05);
	}
}

common_room_book()
{
	common_room_book = getent("common_room_book", "targetname");
	
	while(1){
		common_room_book waittill("trigger", user);
		wait(0.05);
		user iPrintLnbold("^3-^7 Old Book ^3-^7");
		wait (1);
		user iPrintLnbold("^7 Grenades can be used ^7");
		user iPrintLnbold("^7 as flewpowder in the fireplace ^7");
		wait(0.05);
	}
}

Transporter()
{
	while(true)
	{
		self waittill("trigger",other);
		entTarget = getent(self.target, "targetname");
	
		wait(0.10);
		other setorigin(entTarget.origin);
		other setplayerangles(entTarget.angles);
		wait(0.10);
	}
}

music_hogwarts_main()
{
	musicTrigger = getEnt("music_start", "targetname");

	while(1){
		musicTrigger waittill("trigger", user);
		ambientStop();
		wait(0.05);
		user playlocalsound("Silent");
		ambientPlay("music_hogwarts_main");
		wait(0.05);
	}		
}

music_hogwarts_main2()
{
	musicTrigger2 = getEnt("music_start2", "targetname");

	while(1){
		musicTrigger2 waittill("trigger", user);
		ambientStop();
		wait(0.05);
		user playlocalsound("Silent");
		ambientPlay("music_hogwarts_main");
		wait(0.05);
	}		
}

music_hogwarts_disco()
{	
	musicTrigger = getent("music_disco", "targetname");
	
	while(1){
		musicTrigger waittill("trigger", user);
		ambientStop();
		wait(0.05);
		user playlocalsound("Silent");
		ambientPlay("music_hogwarts_disco");
		wait(0.05);
	}		
}


floatingCandles()
{
	candles = getEntArray("floatingcandle","targetname");
	wait (randomfloat (1.5)); 										// Generate a random Number of Seconds Between Bobbings
	timer = 1; 														// Speed of the Bobbing - Higer Number Slower Bobbing
	while (1)
{
	self movez ((8), timer, timer*0.5, timer*0.5); 					
	wait (timer);
	self movez ((-8), timer, timer*0.5, timer*0.5);
	wait (timer);
	}
}

bobbing4u()
{
	candles = getEntArray("bobbing4u","targetname");
	timer = 1; 														// Speed of the Bobbing - Higer Number Slower Bobbing
	while (1)
{
	self movez ((4), timer, timer*0.5, timer*0.5); 					
	wait (timer);
	self movez ((-4), timer, timer*0.5, timer*0.5);
	wait (timer);
	}
}

/*moving_crate()
{
	crates = getEntArray("moving_crate","targetname");

	wait (randomfloat (2.5)); 	
	timer = 3; 														// Speed of the Bobbing - Higer Number Slower Bobbing
	while (1)
{
	self MoveY ((300), timer, timer*0.5, timer*0.5); 					
	wait (timer);
	self MoveY ((-300), timer, timer*0.5, timer*0.5);
	wait (timer);
	}
}*/

bust_statue()
{
	trig = getent("bust_statue","targetname");
	
	trig waittill ("trigger", player);
	player iPrintLnbold( " ^3-^7 Hello my jumping wizard ^3-^7 ");
	wait 1.5;
	player iPrintLnbold( " there are many secrets in hogwarts ");
	wait 1;
	player iPrintLnbold( " but beware, not every secret may be welcoming  ");
	wait 1;
	player iPrintLnbold( " take your time and keep exploring.  ");
}

mysterious_water()
{
	trig = getent("mysterious_water","targetname");
	
	trig waittill ("trigger", player);
	player iPrintLnbold( " ^3-^7 You drinnk from the mysterious water... ^3-^7 ");
	wait 2;
	player iPrintLnbold( " Darkness flooded your senses, ");
	wait 2;
	player iPrintLnbold( " numbing your soul.  ");
		player.onSmoke = true;
        thread smoketail(player);
	wait 2;
	player iPrintLnbold( " It seems the you follow the dark lord now!  ");	
	thread mysterious_water();
}


smoketail( player )
{	
	while(player.onSmoke && player.sessionstate == "playing")
	{
            playfx(level.smoke, player.origin);
			wait 0.15;
	}
	
}


activate_firetail()
{
	trig = getent("activate_firetail","targetname");
	trig waittill("trigger", player);
	player iPrintLn("^2You catched fire!!!");
	player.onFire = true;
    thread firetail(player);
}
firetail(player)
{	
	while(player.onFire && player.sessionstate == "playing")
	{
		playfx(level.smallbon_1stalin, player.origin);
		wait 0.15;
	}
}


searchlights() 
{ 
	thread searchlight1();
	wait (1 + randomfloat(0.5));
	thread searchlight2();
	wait (1 + randomfloat(0.5));
	thread searchlight3();
	wait (1 + randomfloat(0.5));
	thread searchlight4();
	wait (1 + randomfloat(0.5));
	thread searchlight5();
	wait (1 + randomfloat(0.5));
	thread searchlight6();
	wait (1 + randomfloat(0.5));
	thread searchlight7();
	wait (1 + randomfloat(0.5));
	thread searchlight8();
	wait (1 + randomfloat(0.5));
	thread searchlight9();
	wait (1 + randomfloat(0.5));
	thread searchlight10();
	wait (1 + randomfloat(0.5));
	thread searchlight11();
	wait (1 + randomfloat(0.5));
	thread searchlight12();

}
searchlight1() 
{ 
	searchlight = getent ("light1","targetname"); 

	while (1) 
		{ 
		searchlight rotateroll (60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotateroll (-120,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotatepitch (-60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotatepitch (60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotateroll (60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));
 		} 
}
searchlight2() 
{ 
	searchlight = getent ("light2","targetname"); 

	while (1) 
		{ 
		searchlight rotateroll (-60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotateroll (120,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotatepitch (60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotatepitch (-60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotateroll (-60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));
 		} 
}
searchlight3() 
{ 
	searchlight = getent ("light3","targetname"); 

	while (1) 
		{ 
		searchlight rotateroll (60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotateroll (-120,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotatepitch (-60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotatepitch (60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotateroll (60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));
 		} 
}
searchlight4() 
{ 
	searchlight = getent ("light4","targetname"); 

	while (1) 
		{ 
		searchlight rotateroll (-60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotateroll (120,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotatepitch (60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotatepitch (-60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotateroll (-60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));
 		} 
}
searchlight5() 
{ 
	searchlight = getent ("light5","targetname"); 

	while (1) 
		{ 
		searchlight rotateroll (60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotateroll (-120,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotatepitch (-60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotatepitch (60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotateroll (60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));
 		} 
}
searchlight6() 
{ 
	searchlight = getent ("light6","targetname"); 

	while (1) 
		{ 
		searchlight rotateroll (-60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotateroll (120,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotatepitch (60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotatepitch (-60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotateroll (-60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));
 		} 
}
searchlight7() 
{ 
	searchlight = getent ("light7","targetname"); 

	while (1) 
		{ 
		searchlight rotateroll (60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotateroll (-120,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotatepitch (-60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotatepitch (60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotateroll (60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));
 		} 
}
searchlight8() 
{ 
	searchlight = getent ("light8","targetname"); 

	while (1) 
		{ 
		searchlight rotateroll (60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotateroll (-120,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotatepitch (-60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotatepitch (60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotateroll (60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));
 		} 
}
searchlight9() 
{ 
	searchlight = getent ("light9","targetname"); 

	while (1) 
		{ 
		searchlight rotateroll (60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotateroll (-120,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotatepitch (-60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotatepitch (60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotateroll (60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));
 		} 
}
searchlight10() 
{ 
	searchlight = getent ("light10","targetname"); 

	while (1) 
		{ 
		searchlight rotateroll (60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotateroll (-120,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotatepitch (-60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotatepitch (60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotateroll (60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));
 		} 
}
searchlight11() 
{ 
	searchlight = getent ("light11","targetname"); 

	while (1) 
		{ 
		searchlight rotateroll (60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotateroll (-120,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotatepitch (-60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotatepitch (60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotateroll (60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));
 		} 
}
searchlight12() 
{ 
	searchlight = getent ("light12","targetname"); 

	while (1) 
		{ 
		searchlight rotateroll (60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotateroll (-120,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotatepitch (-60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotatepitch (60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));

		searchlight rotateroll (60,1);
		searchlight waittill ("rotatedone");
		wait (0.5 + randomfloat(0.5));
 		} 
}

setupDog()
{
	// /setviewpos -548 6072 36 95
	
	wait .05; // Wait a server frame, damage doesn't follow dog without it

	dog = getEnt("fluffly", "targetname");
	dog_sound = getEnt("sound_fluffy","targetname");
	dog_damage = getEnt("fluffly_hurt", "targetname");
	dog_trigger = getEnt("trig_fluffy", "targetname");

	dog_sound linkTo(dog);
	dog_damage enableLinkTo();
	dog_damage linkTo(dog);
	dog_sound thread dogSound();
	dog thread dogAttacksPlayer();
	
	for(;;)
	{
		dog_trigger waittill("trigger", player);
		player.attackedByDog = true;
		wait .05;
	}
}
dogAttacksPlayer()
{
	for(;;)
	{
		dogAttacks = false;
		players = getEntArray("player", "classname");
		for(i = 0; i < players.size; i++)
		{
			if(isDefined(players[i].attackedByDog))
			{
				if(!isAlive(players[i]))
					players[i].attackedByDog = undefined;
				else
					dogAttacks = true;
			}
		}

		if(dogAttacks)
		{
			point = 470;
			time = 3;
			self moveY(point * -1, time); // = forward
			self waittill("movedone");
			self moveY(point, time); // = back
			self waittill("movedone");
		}

		wait .05;
	}
}
// From MiscMod
// Spawn an object and attach a sound to it, POWERSERVER
PlaySoundAtLocation(sound, location, iTime)
{
    org = spawn("script_model", location);
    wait 0.05;
    org show();
    org playSound(sound);
    wait iTime;
    org delete();
    return;
}
dogSound()
{
	i = 0;
	waitTime = 1;
	soundTime = 10;
	for(;;)
	{
		wait(waitTime);
		if(i >= soundTime)
		{
			thread PlaySoundAtLocation(self.targetname, self.origin, soundTime);
			i = 0;
		}
		else
			i++;
		wait .05;
	}
}

setupRon()
{
	ron = getEnt("flying_ron","targetname");
	ron thread flyingRon();
}
flyingRon()
{
	time = 2;
	for(;;)
	{
		self MoveTo( (-10, 3460, 1120),4,0.1,0.1 );
		wait 2;
		currentAngles = self.angles;
		newAngles = (currentAngles[0], currentAngles[1] - 180, currentAngles[2]);
		self RotateTo( newAngles, time );
		wait 2;
		self MoveTo( (-920, 4400, 944),3.5,0.1,0.1 );
		wait 2;
		currentAngles = self.angles;
		newAngles = (currentAngles[0], currentAngles[1] + 180, currentAngles[2]);
		self RotateTo( newAngles, time );
		wait 2;
		self MoveTo( (-900, 3436, 944),3.5,0.1,0.1 );
		wait 2;
		currentAngles = self.angles;
		newAngles = (currentAngles[0], currentAngles[1] + 180, currentAngles[2]);
		self RotateTo( newAngles, time );
		wait 2;
		self MoveTo( (-10, 4420, 1172),3.5,0.1,0.1 );
		wait 2;
		currentAngles = self.angles;
		newAngles = (currentAngles[0], currentAngles[1] - 180, currentAngles[2]);
		self RotateTo( newAngles, time );
		wait 2;
		// Rotate over 2 seconds
		//wait time; // instead of waittill("rotatedone") for a smoother result
	}
}

setupHarry()
{
	ron = getEnt("flying_harry","targetname");
	ron thread flyingHarry();
}
flyingHarry()
{
	time = 2;
	for(;;)
	{
		self MoveTo( (100, 3340, 840),3,0.1,0.1 );
		wait 3;
		self MoveTo( (-850, 4480, 1240),3,0.1,0.1 );
		wait 2;
		currentAngles = self.angles;
		newAngles = (currentAngles[0], currentAngles[1] - 180, currentAngles[2]);
		self RotateTo( newAngles, time );
		wait 2;
		self MoveTo( (100, 4480, 840),3,0.1,0.1 );
		wait 3;
		self MoveTo( (-850, 3340, 840),3,0.1,0.1 );
		wait 2;
		currentAngles = self.angles;
		newAngles = (currentAngles[0], currentAngles[1] + 180, currentAngles[2]);
		self RotateTo( newAngles, time );
		wait 2;
	}
}

setupFawkes()
{
	fawkes_rotate = getEnt("fawkes_rotate","targetname");
	fawkes_rotate thread fawkes_rotate();
}
fawkes_rotate()
{
	time = 2;
	for(;;)
	{
		
		currentAngles = self.angles;
		newAngles = (currentAngles[0], currentAngles[1] + 180, currentAngles[2]);
		self RotateTo( newAngles, time );
		wait 2;
		currentAngles = self.angles;
		newAngles = (currentAngles[0], currentAngles[1] + 180, currentAngles[2]);
		self RotateTo( newAngles, time );
		wait 2;
	}
}


/*
setupFightingGuys()
{
	// /setviewpos -1003 4424 1161 -41

	harry = getEnt("flying_harry", "targetname");
	ron = getEnt("flying_ron","targetname");
	angle = 360;
	harry thread rotateFighter(angle);
	ron thread rotateFighter(angle * -1);
}
rotateFighter(angle)
{
	time = 2;
	for(;;)
	{
		self rotateYaw(angle, time);
		wait time; // instead of waittill("rotatedone") for a smoother result
	}
}
*/