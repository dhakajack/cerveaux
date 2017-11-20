"Faute de Servo" by Tana Ostrova

The story headline is "Un voyageur sans ésprit".
The story genre is "horror".
The release number is 1.
The story creation year is 2017.
The story description is "Jamais on ne se manque de mémoire."

Include French by Eric Forgeot. 
Use French Language. 

Include Glimmr Canvas-Based Drawing by Erik Temple.
Include Glimmr Graphic Hyperlinks by Erik Temple.
Include Glimmr Bitmap Font by Erik Temple.

Use No Scoring.


The graphics-window is a graphlink g-window spawned by the main-window. The position is g-placebelow. The scale method is g-fixed-size. The measurement is 70. The back-colour is g-White.

The graphics-canvas is a g-canvas. The canvas-width is 350. The canvas-height is 70.
The associated canvas of the graphics-window is the graphics-canvas.
The associated canvas of a g-element is the graphics-canvas.

The back-colour of the main-window is g-White.

Hello is a room.

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
	open up the graphics-window.

A button is a kind of stroked rectangle primitive. The associated canvas of a button is the graphics-canvas. The tint of a button is g-LightGray. The background tint of a button is g-MidGray. The graphlink status of a button is g-active.

A label is a kind of bitmap-rendered string. The associated canvas of a label is the graphics-canvas. The scaling factor of a label is 0.25. The display-layer of a label is 2. The alignment of a label is center-aligned. The tint is g-black. The text-string is "0".

A button has a label called the associated label.

Label_1, Label_2, Label_3, Label_4, Label_5, Label_6 are labels.
Label_7, Label_8, Label_9, Label_10, Label_11, Label_12 are labels.

Some buttons are defined by the Table of Glimmr Buttons.

Table of Glimmr Buttons
button	origin	endpoint	associated label	linked replacement-command
Button_1	{ 10, 7 }	{ 60, 28 }	Label_1	"Wave"
Button_2	{ 65, 7 }	{ 115, 28 }	Label_2	"Jump"
Button_3	{ 120, 7 }	{ 170, 28 }	Label_3	"Sing" 
Button_4	{ 175, 7 }	{ 225, 28 }	Label_4	"Listen"
Button_5	{ 230, 7 }	{ 280, 28 }	Label_5	"go East"
Button_6	{ 285, 7 }	{ 335, 28 }	Label_6	"Invent"
Button_7	{ 10, 42 }	{ 60, 63 }	Label_7	"Look"
Button_8	{ 65, 42 }	{ 115, 63 }	Label_8	"Go Up"
Button_9	{ 120, 42 }	{ 170, 63 }	Label_9	"Go Down"
Button_10	{ 175, 42 }	{ 225, 63 }	Label_10	"Go North"
Button_11	{ 230, 42 }	{ 280, 63 }	Label_11	"Go South"
Button_12	{ 285, 42 }	{ 335, 63 }	Label_12	"Open"

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


After printing the banner text:
	say "[line break]This is one of two very similar examples for the Glimmr Canvas-Based Drawing extension. It demonstrates a simple set of UI buttons. The buttons are not sprites. In other words, they are created without the need to make an external PNG or JPEG image for each one. Instead, we use Glimmr's functions for easily drawing rectangles and more complex elements. A bitmap-rendered string provides the button's text, and this is superimposed on a stroked rectangle primitive that creates the body of the button. No image files at all are used. A simple animation allows the button to change color briefly when pressed, to provide visual feedback.[paragraph break]".

