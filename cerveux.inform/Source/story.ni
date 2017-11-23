"Faute de Servo" by Tana Ostrova

The story headline is "Un voyageur sans ésprit".
The story genre is "horror".
The release number is 1.
The story creation year is 2017.
The story description is "On ne se manque jamais de mémoire."

Include French by Eric Forgeot. 
Include Basic Screen Effects by Emily Short.
Include Glimmr Canvas-Based Drawing by Erik Temple.
Include Glimmr Graphic Hyperlinks by Erik Temple.
Include Glimmr Bitmap Font by Erik Temple.
Include Glulx Input Loops by Erik Temple.

Use French Language. 

Use full-length room descriptions.

Chapter Debugging

DebugFlag is a truth state that varies. DebugFlag is true.

Chapter The Player

The player has a number called consciousness. The consciousness of the player is 0.

[Niveau					après avoir mangé….
0					rien
1					une souris
2					un chien
3					un morceau de cerveau d'un garde
4					le cerveau d'un scientifique
5					le remède]

The player has a number called knownCommands. The knownCommands of the player is 0.

[Niveau					Action
1					East
2					West
3					simple Eating
4					simple Opening
5					North
6					South
7					Push Button
8					Up
9					Down
10					Talk]

Chapter Exit Lister
	
Rule for constructing the status line:
	center "[exitList]" at row 1;
	rule succeeds.

To say exitList:
	let L be {up, west, north, south, east, down};
	repeat with way running through L:
		if the room the way from the location is not nothing:
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

[TODO: re-enable to kill keyboard. 
The focal event type of main input is hyperlink-event.]

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
g-tiffany	10223608
g-sky	10075900
g-peptobismol	16554446

Palette is a list of glulx color values that varies. Palette is {g-red, g-white, g-LightGray, g-lime, g-indigo,  g-tiffany, g-blue, g-yellow, g-green, g-peptobismol}.

A button is a kind of stroked rectangle primitive. The associated canvas of a button is the graphics-canvas. The tint of a button is g-black. The background tint of a button is g-MidGray. 

Some buttons are defined by the Table of Glimmr Buttons.

Table of Glimmr Buttons
button	origin	endpoint	linked replacement-command
Button_1	{ 10, 7 }	{ 60, 28 }	""
Button_2	{ 65, 7 }	{ 115, 28 }	""
Button_3	{ 120, 7 }	{ 170, 28 }	""
Button_4	{ 175, 7 }	{ 225, 28 }	""
Button_5	{ 230, 7 }	{ 280, 28 }	""	
Button_6	{ 10, 42 }	{ 60, 63 }	""
Button_7	{ 65, 42 }	{ 115, 63 }	""
Button_8	{ 120, 42 }	{ 170, 63 }	""
Button_9	{ 175, 42 }	{ 225, 63 }	""
Button_10	{ 230, 42 }	{ 280, 63 }	""
	
Chapter Start of Play

When play begins:
	open up the graphics-window;
	sort Palette in random order; 
	increment the knownCommands of the player.

After printing the banner text:
	say "[line break][italic type]Où suis-je? D'ailleurs… qui suis-je?[roman type][paragraph break]Vous vous reveillez tout seul dans une pièce plutôt banal et bleuâtre.[paragraph break][italic type]Pourqoui je ne me souviens de rien?[paragraph break]Concentrez! Qu'est-ce que c'est passé?[paragraph break]En tout cas, la solution n'est pas ici -- il faut explorer un peu.".
	
Chapter Geography

Section Location Generalities

The printed name of a room is usually "Ici".

Doors are usually closed. Doors are usually not locked.

Section Doors

Doors can be buttoned. Doors are usually not buttoned.

Instead of going through a closed door (called la porte):
	if la porte is locked:
		say "The door is locked.";
	otherwise:
		say "The door is closed."
		
Section Bloc Opératoire

Bloc Opératoire is a room. The description of Bloc Opératoire is "[descBlocOperatoire]." Couloir 2 is east from Bloc Opératoire. The player is in Bloc Opératoire. The printed name of the Bloc Opératoire is "[pnBlocOpératoire]".

To say descBlocOperatoire:
	if the consciousness of the player is:
		-- 0:
			say "Une pièce sombre. Rien d'intéressant ici";
		-- 1:
			say "Il peu de sang ici: une pièce grande bleu avec les murs métalliques";
		-- 2:
			say "La salle ou les humains opèrent sur les animaux";
		-- 3:
			say "La table d'opération trone au centre de la pièce, entouré d'équipement chirurgical";
		-- 4:
			say "La table d'operation trone au centre de la salle, avec ses adaptations pour retenir les animaux pendant la chirurgie expérimentale. Juste à côté, il y a une machine d'anesthésie, des moniteurs de signes vitaux, et une unité de radiographie portable"
			
To say pnBlocOpératoire:
	if the consciousness of the player is:
		-- 0:
			say "L'endroit bleuâtre";
		-- 1:
			say "L'endroit affreux";
		-- 2:
			say "La chambre de torture";
		-- 3:
			say "Salle d'opérations";
		-- 4:
			say "Bloc Opératoire".

Section Couloir 2

Couloir 2 is a room. The description of Couloir 2 is "[descCouloir2]." The labZooDoor is a door. It is north of Couloir 2 and south of Laboratoire Zoologique. The printed name of Couloir 2 is "[pnCouloir2]".

To say descCouloir2:
	if the consciousness of the player is:
		-- 0:
			say "Un couloir blanc et sans meubles";
		-- 1:
			say "Un grand couloir blanc qui court de l'endroit affreux à l'ouest à la tanière du loup féroce au nord.[paragraph break]Rien à manger ici" ;
		-- 2:
			say "Le couloir qui mène de mon coin confortable au nord à la chambre de torture à l'ouest";
		-- 3:
			say "Le couloir central de niveau 2. La salle d'opérations se trouve à l'ouest, le chenil au nord, la laboratoire au sud, et l'ascenseur à l'est";
		-- 4:
			say "Le couloir central de niveau 2. Le bloc opérational se trouve à l'ouest, la laboratoire zoologique au nord, la laboratoire biochimique au sud, et l'ascenseur à l'est".
			
To say pnCouloir2:
	if the consciousness of the player is:
		-- 0:
			say "Couloir";
		-- 1:
			say "Grand couloir";
		-- 2:
			say "Couloir dangereux";
		-- 3:
			say "Couloir, niveau 2";
		-- 4:
			say "Niveau 2: Expériences Physiologiques".
			

Section Laboratoire Zoologique

Laboratoire Zoologique is a room. The description of Laboratoire Zoologique is "[descLabZoo]." 

To say descLabZoo:
	say "Animal Lab".
	
The cage is an openable closed transparent female container in the Laboratoire Zoologique. 

The chien is an edible male thing. It is in the cage.
	
Section Ascenseur 2

Ascenseur 2 is a room. The description of Ascenseur 2 is "[descAscenseur1]." The Ascenseur2door is a buttoned door. It is east of Couloir 2 and west of Ascenseur 2.

Section Laboratoire Biochimique

Laboratoire Biochimique is a room. The description of Laboratoire Biochimique is "[descLabBio]." The labBioDoor is a locked door. It is south of Couloir 2 and north of Laboratoire Biochimique. 

To say descLabBio:
	say "Bio Lab".

Section Couloir 1

Couloir 1 is a room. The description of Couloir 1  is "[descCouloir1]."

To say descCouloir1:
	say "Hall level 1".

Section Ascenseur 1

Ascenseur 1 is a room. The description of Ascenseur 1 is "[descAscenseur1]." The Ascenseur1door is a buttoned door. It is east of Couloir 1 and west of Ascenseur 1.

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

simpleUnlocking is an action applying to nothing. Understand "déverouiller
" as simpleUnlocking.

Carry out simpleUnlocking:
	repeat with way running through directions:
		if the door the way of the location is locked:
			now the door the way from the location is unlocked;
			say "Door to the [way], unlocked.";
			stop the action;
	say "Nothing to unlock here."
	
Section simpleOpening

Definition: A door is simpleOpenable if it is closed and it is not locked and it is not buttoned.
	
simpleOpening is an action applying to nothing. Understand "ouvrir" as simpleOpening.

Carry out simpleOpening:
	repeat with the way running through directions:
		if the door the way of the location is simpleOpenable:
			try opening the door the way from the location;
			stop the action;
	repeat with the item running through visible containers:
		if the item is closed:
			try opening the item;
			stop the action;
	say "Nothing to open."

Section simpleEating

simpleEating is an action applying to nothing. Understand "manger" as simpleEating.

Carry out simpleEating:
	repeat with the item running through visible edible things:
		try eating the item;
		stop the action;
	say "Nothing to eat.".
	
Section simplePushing

simplePushing is an action applying to nothing. Understand "pousser" as simplePushing.

Carry out simplePushing:
	say "TODO: simplePushing."
	
Section simpleTalking

simpleTalking is an action applying to nothing. Understand "parler" as simpleTalking.

Carry out simpleTalking:
	say "TODO: simpleTalking."
	
Chapter Consciousness

To increment the consciousness of the player:
	increase the consciousness of the player by 1;
	if the consciousness of the player is:
		-- 1:
			raiseConsciousnessToLevel1;
		-- 2:
			raiseConsciousnessToLevel2;
		-- 3:
			raiseConsciousnessToLevel3;
		-- 4:
			raiseConsciousnessToLevel4;
		-- 5:
			raiseConsciousnessToLevel5;
	try looking.
			

To raiseConsciousnessToLevel1:
	say "Level 1!".
	
To raiseConsciousnessToLevel2:
	say "Level 2".
	
To raiseConsciousnessToLevel3:
	say "Level 3!".
	
To raiseConsciousnessToLevel4:
	say "Level 4!".
	
To raiseConsciousnessToLevel5:
	say "[VictoryText]";
	end the story finally saying "Memory lives on!"
	
To say VictoryText:
	say "This is the victory text! Woot!".

Chapter Known Commands

actionList is a list of text that varies. actionList is {"est", "ouest","manger","ouvrir","nord","sud","pousser","monter","descendre","parler"}

The commandList is a list of numbers that varies. The commandList is {}.

To increment the knownCommands of the player:
	increase the knownCommands of the player by 1;
	add the knownCommands of the player to commandList;
	sort commandList in random order;
	let R be the number of entries in commandList;
	repeat with N running from 1 to R:
		let E be entry N of commandList;
		now the tint of the button in row N of the Table of Glimmr Buttons is entry E of Palette;
		now the linked replacement-command of the button in row N of the Table of Glimmr Buttons is entry E of actionList;
	now the graphlink status of the button in row R of the Table of Glimmr Buttons is g-active;
	follow the refresh windows rule.
				
Chapter Milestones

After going east for the first time:
	try looking;
	say "Une petite créature se jette de nulle parte, se faulfile entre vos pieds, et s'enfuit vers l'ouest.";
	increment the knownCommands of the player.
	
After going west for the first time:
	move the petite créature grise to the Bloc Opératoire;
	try looking;
	say "Le petit animal se cache dans les ombres, tremblant.";
	increment the knownCommands of the player.
	
After eating the petite créature grise:
	say "Mouse thoughts***. Just ate a mouse. Smarter now.";
	increment the consciousness of the player.
	
After going east when the consciousness of the player is 1 for the first time:
	try looking;
	say "Ah, doors! Stuff to open!";
	increment the knownCommands of the player.
	
After opening a door for the first time:
	say "Now that the door is opened, can go that direction.";
	increment the knownCommands of the player.
	
After going north for the first time:
	try looking;
	say "And now south is a command too.";
	increment the knownCommands of the Player.
	
After eating the chien:
	say "Dog thoughts***. Just at a dog. Smarter now.";
	increment the consciousness of the player;
	increment the knownCommands of the player.
		
Chapter The Void

The void is a room.

The petite créature grise is an edible female thing. It is in the void.








