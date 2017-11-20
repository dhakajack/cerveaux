"Faute de Servo" by Tana Ostrova

The story headline is "Un voyageur sans ésprit".
The story genre is "horror".
The release number is 1.
The story creation year is 2017.
The story description is "Jamais on ne se manque de mémoire."

Include French by Eric Forgeot. 
Use French Language. 

Include Basic Screen Effects by Emily Short.
Include Glimmr Canvas-Based Drawing by Erik Temple.
Include Glimmr Graphic Hyperlinks by Erik Temple.
Include Glimmr Bitmap Font by Erik Temple.
Include Glulx Input Loops by Erik Temple.

The focal event type of main input is hyperlink-event.

The graphics-window is a graphlink g-window spawned by the main-window. The position is g-placebelow. The scale method is g-fixed-size. The measurement is 70. The back-colour is g-Black.

The graphics-canvas is a g-canvas. The canvas-width is 350. The canvas-height is 70.
The associated canvas of the graphics-window is the graphics-canvas.
The associated canvas of a g-element is the graphics-canvas.

The back-colour of the main-window is g-White.

Location1 is a room. The player is in Location1. The printed name of Location1 is "Chez moi".

Location2, Location3, Location4, Location5, Location6, and Locaiton7 are rooms.

Location2 is west from Location1. 
Location3 is east from Location1.
Location4 is north from Location1.
Location5 is south from Location1.
Location6 is up from Location2.
Location7 is down from Location3.

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


When play begins:
	repeat with item running through buttons:
		let the current-label be the associated label of item;
		now the origin of the current-label is the center-point of item;
		now entry 2 of the origin of the current-label is 47;
		replace the text "0" in text-string of the current-label with the linked replacement-command of item;
	open up the graphics-window;
	now the command prompt is "".

	
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
	now the tint of Button_1 is g-salmon;
	now the tint of Button_2 is g-peach;
	now the tint of Button_3 is g-vanilla;
	now the tint of Button_4 is g-lime;
	now the tint of Button_5 is g-barnie;
	now the tint of Button_6 is g-tiffany;
	now the tint of Button_7 is g-sky;
	now the tint of Button_8 is g-yellow;
	now the tint of Button_9 is g-lavender;
	now the tint of Button_10 is g-peptobismol;
	now the tint of Button_11 is g-white;
	now the tint of Button_12 is g-LightGray;
	follow the refresh windows rule.
	
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
	
After printing the banner text:
	say "[line break]Introductory text of some sort.[paragraph break]".


