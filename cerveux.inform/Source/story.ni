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
	repeat with way running through directions:
		if the room the way from the location is not nothing:
			if unicodage is enabled:
				if the way is:
					-- north:
						say "[unicode 8593] ";
					-- south:
						say "[unicode 8595] ";
					-- west:
						say "[unicode 8592] ";
					-- east:
						say "[unicode 8594] ";
					-- up:
						say "[unicode 8710] ";
					-- down:
						say "[unicode 8711] ";
			otherwise:	
				if the way is:
					-- north:
						say "N ";
					-- south:
						say "S ";
					-- west:
						say "O ";
					-- east:
						say "E ";
					-- up:
						say "H ";
					-- down:
						say "B ".


Chapter Disable Keyboard

[TODO: re-enable to kill keyboard. The focal event type of main input is hyperlink-event.]

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

The printed name of a room is usually "Ici".

Section Bloc Opératoire

Bloc Opératoire is a room. The description of Bloc Opératoire is "[descBlocOperatoire]." Couloir Niveau 2 is east from Bloc Opératoire. The player is in Bloc Opératoire. 

To say descBlocOperatoire:
	say "The operating room".

Section Couloir Niveau 2

Couloir Niveau 2 is a room. The description of Couloir Niveau 2 is "[descCouloir2]." 

To say descCouloir2:
	say "Hall level 2".

Section Laboratoire Zoologique

Laboratoire Zoologique is a room. The description of Laboratoire Zoologique is "[descLabZoo]."

To say descLabZoo:
	say "Animal Lab".

Section Ascenseur 1

Ascenseur1 is a room. The description of Ascenseur1 is "[descAscenseur1]."

To say descAscenseur1:
	say "Elevator 1".
	
Section Ascenseur 2

Ascenseur2 is a room. The description of Ascenseur2 is "[descAscenseur1]."

Section Laboratoire Biochimique

Laboratoire Biochimique is a room. The description of Laboratoire Biochimique is "[descLabBio]."

To say descLabBio:
	say "Bio Lab".

Section Couloir Niveau 1

Couloir Niveau 1 is a room. The description of Couloir Niveau 1  is "[descCouloir1]."

To say descCouloir1:
	say "Hall level 1".

Section Laboratoire Pathologique

Laboratoire Pathologique is a room. The description of Laboratoire Pathologique is "[descLabPath]."

To say descLabPath:
	say "Path Lab".

Section Salle de Décontamination

Salle de Décontamination is a room. The description of Salle de Décontamination is "[descSalleDecon]."

To say descSalleDecon:
	say "Decon Zone".

Section Escalier Niveau 1

Escalier Niveau 1 is a room. The description of Escalier Niveau 1  is "[descEscalier1]."

To say descEscalier1:
	say "Stairs 1".

Section Escalier Niveau 2

Escalier Niveau 2 is a room. The description of Escalier Niveau 2  is "[descEscalier2]."

To say descEscalier2:
	say "Stairs 2".

Section Escalier Niveau 3

Escalier Niveau 3 is a room. The description of Escalier Niveau 3 is "[descEscalier3]."

To say descEscalier3:
	say "Stairs 3".

Section Sas

Sas is a room. The description of Sas is "[descSas]."

To say descSas:
	say "Airlock".












