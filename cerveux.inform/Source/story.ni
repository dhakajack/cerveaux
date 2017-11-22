"Faute de Servo" by Tana Ostrova

The story headline is "Un voyageur sans ésprit".
The story genre is "horror".
The release number is 1.
The story creation year is 2017.
The story description is "On ne se manque jamais de mémoire."

Include French by Eric Forgeot. 
Use French Language. 

Include Basic Screen Effects by Emily Short.
Include Glimmr Canvas-Based Drawing by Erik Temple.
Include Glimmr Graphic Hyperlinks by Erik Temple.
Include Glimmr Bitmap Font by Erik Temple.
Include Glulx Input Loops by Erik Temple.

Chapter Exit Lister

To decide whether unicodage is enabled:
	(-  glk_gestalt(gestalt_Unicode, 0) -)
	
Rule for constructing the status line:
	center "[exitList]" at row 1;
	rule succeeds.

To say exitList: [based on Eric Eve's exit lister code]
	let L be {up, west, north, south, east, down};
	repeat with way running through L:
		if the room the way from the location is not nothing:
			if unicodage is enabled:
				if the way is:
					-- up:
						say "[unicode 8710] ";
					-- west:
						say "[unicode 8592] ";
					-- north:
						say "[unicode 8593] ";
					-- south:
						say "[unicode 8595] ";
					-- east:
						say "[unicode 8594] ";
					-- down:
						say "[unicode 8711] ";
			otherwise:	
				if the way is:
					-- up:
						say "H ";
					-- west:
						say "O ";
					-- north:
						say "N ";
					-- south:
						say "S ";
					-- east:
						say "E ";
					-- down:
						say "B ".


Chapter Disable Keyboard

[TODO: re-enable to kill keyboard. The focal event type of main input is hyperlink-event.]

Chapter Suppress Mention of Doors

For printing a locale paragraph about a door (called the item)
	(this is the don't mention doors in room descriptions rule):
	set the locale priority of the item to 0;
	continue the activity.

Chapter Button Setup

The graphics-window is a graphlink g-window spawned by the main-window. The position is g-placebelow. The scale method is g-fixed-size. The measurement is 70. The back-colour is g-Black.

The graphics-canvas is a g-canvas. The canvas-width is 350. The canvas-height is 70.
The associated canvas of the graphics-window is the graphics-canvas.
The associated canvas of a g-element is the graphics-canvas.

The back-colour of the main-window is g-White.

Table of Common Color Values (continued)
glulx color value	assigned number
g-LightGray	15066597
g-MidGray	12829635
g-salmon	16751515
g-peach	16763291
g-vanilla	16646043
g-tiffany	10223608
g-sky	10075900
g-peptobismol	16554446
g-barnie	14064124

		

A button is a kind of stroked rectangle primitive. The associated canvas of a button is the graphics-canvas. The tint of a button is g-LightGray. The background tint of a button is g-MidGray. The graphlink status of a button is g-active.

A label is a kind of bitmap-rendered string. The associated canvas of a label is the graphics-canvas. The scaling factor of a label is 0.25. The display-layer of a label is 2. The alignment of a label is center-aligned. The tint is g-black. The text-string is "0".

A button has a label called the associated label.

Label_1, Label_2, Label_3, Label_4, Label_5, Label_6 are labels.
Label_7, Label_8, Label_9, Label_10, Label_11, Label_12 are labels.

Some buttons are defined by the Table of Glimmr Buttons.

Table of Glimmr Buttons
button	origin	endpoint	associated label	 
Button_1	{ 10, 7 }	{ 60, 28 }	Label_1	 
Button_2	{ 65, 7 }	{ 115, 28 }	Label_2
Button_3	{ 120, 7 }	{ 170, 28 }	Label_3
Button_4	{ 175, 7 }	{ 225, 28 }	Label_4
Button_5	{ 230, 7 }	{ 280, 28 }	Label_5
Button_6	{ 285, 7 }	{ 335, 28 }	Label_6
Button_7	{ 10, 42 }	{ 60, 63 }	Label_7
Button_8	{ 65, 42 }	{ 115, 63 }	Label_8
Button_9	{ 120, 42 }	{ 170, 63 }	Label_9
Button_10	{ 175, 42 }	{ 225, 63 }	Label_10
Button_11	{ 230, 42 }	{ 280, 63 }	Label_11
Button_12	{ 285, 42 }	{ 335, 63 }	Label_12

instead of smelling:
	now the text-string of Label_1 is "x me";
	now the tint of Button_1 is g-red;
	now the tint of Button_2 is g-peach;
	now the tint of Button_3 is g-vanilla;
	now the tint of Button_4 is g-lime;
	now the tint of Button_5 is g-indigo;
	now the tint of Button_6 is g-tiffany;
	now the tint of Button_7 is g-blue;
	now the tint of Button_8 is g-yellow;
	now the tint of Button_9 is g-green;
	now the tint of Button_10 is g-peptobismol;
	now the tint of Button_11 is g-white;
	now the tint of Button_12 is g-LightGray;
	follow the refresh windows rule.

Chapter Button Handling

First graphlink processing rule:
	say current graphlink row;
	if the current graphlink row is:
		-- 1:
			try going west;
		-- 2:
			try going east;
		-- 3:
			try smelling;	
		-- otherwise:
			say "No actions.";
	the rule succeeds.


Chapter Start of Play

When play begins:
	repeat with item running through buttons:
		let the current-label be the associated label of item;
		now the origin of the current-label is the center-point of item;
		now entry 2 of the origin of the current-label is 47;
		replace the text "0" in text-string of the current-label with the linked replacement-command of item;
	open up the graphics-window;
	[TODO: re-enable to kill keyboard:   now the command prompt is ""].

After printing the banner text:
	say "[line break]Introductory text of some sort.[paragraph break]".
	
Chapter Geography

Section Location Generalities

The printed name of a room is usually "Ici".

Doors are usually closed. Doors are usually not locked.

Section Doors

Instead of going through a closed door (called la porte):
	if la porte is locked:
		say "The door is locked.";
	otherwise:
		say "The door is closed."
		
Section Bloc Opératoire

Bloc Opératoire is a room. The description of Bloc Opératoire is "[descBlocOperatoire]." Couloir 2 is east from Bloc Opératoire. The player is in Bloc Opératoire. 

To say descBlocOperatoire:
	say "The operating room".

Section Couloir 2

Couloir 2 is a room. The description of Couloir 2 is "[descCouloir2]." The labZooDoor is a door. It is north of Couloir 2 and south of Laboratoire Zoologique.

To say descCouloir2:
	say "Hall level 2".

Section Laboratoire Zoologique

Laboratoire Zoologique is a room. The description of Laboratoire Zoologique is "[descLabZoo]." 

To say descLabZoo:
	say "Animal Lab".
	
Section Ascenseur 2

Ascenseur 2 is a room. The description of Ascenseur 2 is "[descAscenseur1]." The Ascenseur2door is a door. It is east of Couloir 2 and west of Ascenseur 2.

Section Laboratoire Biochimique

Laboratoire Biochimique is a room. The description of Laboratoire Biochimique is "[descLabBio]." The labBioDoor is a locked door. It is south of Couloir 2 and north of Laboratoire Biochimique. 

To say descLabBio:
	say "Bio Lab".

Section Couloir 1

Couloir 1 is a room. The description of Couloir 1  is "[descCouloir1]."

To say descCouloir1:
	say "Hall level 1".

Section Ascenseur 1

Ascenseur 1 is a room. The description of Ascenseur 1 is "[descAscenseur1]." The Ascenseur1door is a door. It is east of Couloir 1 and west of Ascenseur 1.

To say descAscenseur1:
	say "Elevator 1".

Section Laboratoire Pathologique

Laboratoire Pathologique is a room. The description of Laboratoire Pathologique is "[descLabPath]." The labPathDoor is a door. It is north of Couloir 1 and south of Laboratoire Pathologique.

To say descLabPath:
	say "Path Lab".
	
The frigo is a closed openable container in the Laboratoire Pathologique. The frigo is closed.

The boite en plastique is a female closed openable container in the frigo. The boite en plastique is closed.

The moreau de cerveau is a male edible thing in the boite en plastique.

Section Salle de Décontamination

Salle de Décontamination is a room. The description of Salle de Décontamination is "[descSalleDecon]." The deconDoor is a door. It is west of Couloir 1 and east of Salle de Décontamination. 

To say descSalleDecon:
	say "Decon Zone".

Section Escalier 1

Escalier 1 is a room. The description of Escalier 1  is "[descEscalier1]." The esc1door is a locked door. It is north of Salle de Décontamination and south of Escalier 1. 

To say descEscalier1:
	say "Stairs 1".

Section Escalier 2

Escalier 2 is a room. The description of Escalier 2  is "[descEscalier2]." Escalier 2 is up from Escalier 1 and down from Escalier 3.

To say descEscalier2:
	say "Stairs 2".

Section Escalier 3

Escalier 3 is a room. The description of Escalier 3 is "[descEscalier3]."

To say descEscalier3:
	say "Stairs 3".

Section Sas

Sas is a room. The description of Sas is "[descSas]." The sasDoor is a locked door. It is north of Escalier 3 and south of Sas.

To say descSas:
	say "Airlock".

Chapter Verbs

Section simpleUnlocking

simpleUnlocking is an action applying to nothing. Understand "simpleUnlock" as simpleUnlocking.

Carry out simpleUnlocking:
	repeat with way running through directions:
		if the door the way of the location is locked:
			now the door the way from the location is unlocked;
			say "Door to the [way], unlocked.";
			stop the action;
	say "Nothing to unlock here."
	
Section simpleOpening
	
simpleOpening is an action applying to nothing. Understand "simpleOpen" as simpleOpening.

Carry out simpleOpening:
	repeat with the way running through directions:
		if the door the way of the location is closed:
			now the door the way from the location is open;
			say "Door to the [way], opened.";
			stop the action;
	repeat with the item running through visible containers:
		if the item is closed:
			try opening the item;
			stop the action;
	say "Nothing to open."

Section simpleEating

simpleEating is an action applying to nothing. Understand "simpleEat" as simpleEating.

Carry out simpleEating:
	repeat with the item running through edible things:
		try eating the item;
		stop the action;
	say "Nothing to eat."
		









