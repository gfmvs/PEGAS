GLOBAL vehicle IS LIST
(
	LEXICON(
		//	This is a sustainer-type stage. It ignites on the pad, but UPFG takes control over it mid-flight.
		//	Therefore, no ignition or separation happens, and the actual mass of the stage at activation is
		//	inferred automatically.
		"name", "Common Core Booster",
		"massTotal", 332315,
		"massDry", 48225,
		"gLim", 5.0,
		"engines", LIST(LEXICON("isp", 338.4, "thrust", 4152000)),
		"staging", LEXICON
		(
			"jettison", FALSE,
			"ignition", FALSE
		)
	),
	LEXICON
	(
		"name", "Centaur (DEC)",
		"massTotal", 25321,			//	RSB Centaur has too much oxygen in the tank
		"massDry", 4444,		//	these masses are for Centaur that has been reset and had tanks readjusted
		"engines", LIST(LEXICON("isp", 451, "thrust", 99200)),
		"staging", LEXICON
		(
			"jettison", TRUE,
			"waitBeforeJettison", 1,
			"ignition", TRUE,
			"waitBeforeIgnition", 2,
			"ullage", "rcs",
			"ullageBurnDuration", 5,
			"postUllageBurn", 2
		)
	)
).
GLOBAL sequence IS LIST
(
	LEXICON("time", -10.0, "type", "stage", "message", "Disconnect Fuel Line"),
	LEXICON("time", -2.0, "type", "stage", "message", "RD-180 ignition"),
	LEXICON("time", 0, "type", "stage", "message", "LIFTOFF"),
	LEXICON("time", 94, "type", "stage", "message", "SRB Jettison"),
	LEXICON("time", 245, "type", "stage", "message", "PLF jettison", "massLost", 2127)
).
GLOBAL controls IS LEXICON
(
	"launchTimeAdvance", 170,
	"verticalAscentTime", 12,	//	7 seconds work well for 5t payload, 8 good for 15t
	"pitchOverAngle", 11.0,
	"upfgActivation", 170
).
GLOBAL vehicleinfo IS LEXICON
(
	"launchVehicleName", "Atlas-V 421",
	"vehicleInitialMass", 434745
).
SET STEERINGMANAGER:ROLLTS TO 10.
SWITCH TO 0.
CLEARSCREEN.
PRINT "Loaded boot file: " + vehicleinfo["launchVehicleName"] + "!".
SET CORE:PART:TAG TO "Ascent Control".
RUN pegas_gui.