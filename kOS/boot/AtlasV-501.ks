GLOBAL vehicle IS LIST
(
	LEXICON(
		//	This is a sustainer-type stage. It ignites on the pad, but UPFG takes control over it mid-flight.
		//	Therefore, no ignition or separation happens, and the actual mass of the stage at activation is
		//	inferred automatically.
		"name", "Common Core Booster",
		"massTotal", 330838,
		"massDry", 46748,
		"gLim", 4.5,
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
		"massTotal", 23194,			//	RSB Centaur has too much oxygen in the tank
		"massDry", 2363,		//	these masses are for Centaur that has been reset and had tanks readjusted
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
	LEXICON("time", 190, "type", "throttle", "throttle", 0.5),
	LEXICON("time", 192, "type", "stage", "message", "PLF jettison", "massLost", 3524),
	LEXICON("time", 193, "type", "stage", "message", "FLR jettison", "massLost", 303)
).
GLOBAL controls IS LEXICON
(
	"launchTimeAdvance", 180,
	"verticalAscentTime", 41,	//	7 seconds work well for 5t payload, 8 good for 15t
	"pitchOverAngle", 7.0,
	"upfgActivation", 198
).
GLOBAL vehicleinfo IS LEXICON
(
	"launchVehicleName", "Atlas-V 501",
	"vehicleInitialMass", 354665,
	"suggestPeriapsis", 160,
	"suggestApoapsis", 1200,
	"suggestAltitude", 220
).
SET STEERINGMANAGER:ROLLTS TO 10.
SWITCH TO 0.
CLEARSCREEN.
PRINT "Loaded boot file: " + vehicleinfo["launchVehicleName"] + "!".
SET CORE:PART:TAG TO "Ascent Control".
RUN pegas_gui.