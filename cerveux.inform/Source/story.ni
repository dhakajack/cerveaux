"Faute de Servo" by Tana Ostrova

The story headline is "Un voyageur sans esprit".
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

Chapter Globals

DebugFlag is a truth state that varies. DebugFlag is true.
BlockMonologueFlag is a truth state that varies. BlockMonologueFlag is false.

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
	
[The room description paragraphs about objects rule is not listed in any rulebook.]

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

A thing can be buttoned. Things are usually not buttoned.

Instead of going through a closed door (called la porte):
	if the consciousness of the player is less than 3:
		say "[bougePas].";
	otherwise:
		if la porte is locked:
			say "Cette porte est sous le contrôle d'une serrure électronique.";
		otherwise:
			if la porte is buttoned:
				say "D'abord, ";
				if the player is in an elevator:
					say "il faut sélectionner l[apostrophe]étage.";
				otherwise:
					say "il faut appeler l'ascenseur.";
			otherwise:
				say "La porte est fermée."
			
To say bougePas:
	say "Le mur ne bouge pas"
			
Section Bloc Opératoire

Bloc Opératoire is a room. The description of Bloc Opératoire is "[descBlocOperatoire]." Couloir 2 is east from Bloc Opératoire. The player is in Bloc Opératoire. The printed name of the Bloc Opératoire is "[pnBlocOpératoire]".

To say descBlocOperatoire:
	if the consciousness of the player is:
		-- 0:
			say "Une pièce sombre. Rien d'intéressant ici";
		-- 1:
			say "Il peu de sang ici -- une grande pièce bleu avec les murs métalliques";
		-- 2:
			say "La salle où les humains coupent les animaux et enlevent leurs tripes";
		-- 3:
			say "La table d'opération trone au centre de la pièce, entouré d[apostrophe]équipement chirurgical";
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
			say "Un grand couloir blanc qui relie l'endroit affreux à l'ouest à la tanière du loup féroce au nord" ;
		-- 2:
			say "Le couloir qui mène de mon coin confortable au nord à la chambre de torture à l'ouest";
			say "[liftDoorDogStatus]";
		-- 3:
			say "Le couloir central du deuxième niveau. La salle d'opérations se trouve à l'ouest, le chenil au nord, la laboratoire au sud, et l'ascenseur à l'est";
		-- 4:
			say "Le couloir central du deuxième niveau. Le bloc opérational se trouve à l'ouest, la laboratoire zoologique au nord, la laboratoire biochimique au sud, et l'ascenseur à l'est".
			
To say liftDoorDogStatus:
	if the door east from the location is closed:
		say ". Au mileau du mur à l'est, un bouton brille avec la lumière rouge";
	otherwise:
		say ". La mur à l'est est disparu".
			
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

Laboratoire Zoologique is a room. The description of Laboratoire Zoologique is "[descLabZoo]." The printed name of Laboratoire Zoologique is "[pnLabZoo]".

To say descLabZoo:
	if the consciousness of the player is:
		-- 1:
			say "De sa cage le loup méchant vous dévisage constamment";
		-- 2:
			say "La pièce dans laquelle ils vous ont enseigné à appuyer le bouton rouge sur le distributeur de friandises";
		-- 3:
			say "the dog cage";
		-- 4:
			say "the canine facility"
			

To say pnLabZoo:
	if the consciousness of the player is:
		-- 1:
			say "La tanière du loup";
		-- 2:
			say "Chez moi";
		-- 3:
			say "Le chenil";
		-- 4:
			say "Laboratoire Zoologique".
	
To say openNord:
		say "Le mur au nord se glisse ouvert, revelant la pièce voisine".

	
The cage is an openable closed female container in the Laboratoire Zoologique. 

The chien is an edible male thing. It is in the cage. The printed name of the chien is "[if the consciousness of the player is 1]loup[otherwise]chien[end if]". The chien can be dead. The chien is not dead.

The corps de chien is a male thing. It is in the void.

The distributeur de nourriture is in the Laboratoire Zoologique. It is buttoned and male. 

Instead of pushing the distributeur de nourriture:
	say "Vous appuyez le bouton rouge. ";
	if the consciousness of the player is:
		-- 2:
			say "En récompense, quelques croquettes tombent au sol. Vous les mange avec délectation.";
		-- 3:
			say "Vous n'avez la moindre envie de manger les croquettes de nourriture de chien qui tombent à vos pieds.";
			move the tas de nourriture de chien to the Laboratoire Zoologique;
		-- 4:
			say "Le dispositif de conditionnement opérant produit les cubes de nourriture de chien qui s'accumulent sur le sol.";
			move the tas de nourriture de chien to the Laboratoire Zoologique.
			
The tas de nourriture de chien is in the void.

Every turn when the chien is in the cage and the player is in the Laboratoire Zoologique:
	if a random chance of 3 in 8 succeeds:
		say "Le loup [one of]aboie bruyamment[or]mord les barres de sa cage[or]gratte les oreilles[or]fait les cent pas dans sa boite métallique[or]hurle a pleine poumons[or]renifle l'air[or]renifle sa cage[or]renifle lui-meme[or]léche les pattes[or]vous montre ses dents[or]grogne de manière menaçante[or]vous ignore[or]court de coté à coté dans sa cage, vous dévisageant[in random order]."		
		
Every turn when the consciousness of the player is 2 and the chien is dead:
	if the blockMonologueFlag is false:
		if the number of entries in mouseDogDialogue is greater than zero:
			say "[italic type][quotation mark][entry 1 of mouseDogDialogue][quotation mark][roman type][paragraph break]";
			remove entry 1 from mouseDogDialogue;
	otherwise:
		now the blockMonologueFlag is false.
		
mouseDogDialogue is a list of text that varies. 

mouseDogDialogue is {
"Désolé[line break]-- Quoi, désolé?[line break]-- Moi, je suis désolé de t'as mangé[line break]-- De m'avoir mangé? Dis donc, qui es-tu?[line break]-- La souris.",
"La souris? Quelle souris?[line break]-- La souris qui habite ici.[line break]-- La maudite souris qui vole toujours les bribes autour de mon distributeur?[line break]-- Ouais, la même. Une fois de plus, je suis désolé de t'avoir dérangé.",
"Pas du tout.[line break]-- Merci.[line break]-- Dis, souris, as-tu un nom?[line break]-- Non. Nous les souris n'ont pas les noms. Tu peux m'appeler simplement [apostrophe]Souris[apostrophe]. Et tu? Comment tu t'appelles?[line break]-- [apostrophe]Lucky[apostrophe]. C'est le nom que ma famille m'ont donné avant que je suis arrivée ici. Les bourreaux me désigne [apostrophe]Sujet 205-Alpha[apostrophe], mais je préfère [apostrophe]Lucky[apostrophe].[line break]-- D'accord, Lucky.",
"Souris, peux-tu m'expliquer quelque chose? Je suis toujours perplexe. Comment se fait-il que tu, un souris, une animal tout petit, puisses manger un chien comme moi, quelque fois plus grand?[line break]-- Je me suis demandé la même chose. Tiens -- t'es un chien? Je pensais que tu étais un loup![line break]-- Non, un chien, j'en suis certain.",
"Bon, je ne sais pas exactment comment je l'ai fait.[line break]-- Qu'est-ce que tu te rapelles de l'événement?[line break]-- J[apostrophe]étais pris d'une folle envie de cerveaux.[line break]-- Quel cerveau?[line break]-- Dans ce cas, le tien.[line break]-- Ah, je vois."
}
		 
Section Ascenseur 2

An elevator is a kind of room. The description of an elevator is "[descAscenseur1]." The printed name of an elevator is "[pnAsc]".

An elevatorDoor is a kind of door. ElevatorDoors are buttoned. 

To say pnAsc:
	if the consciousness of the player is 2:
		say "La petite pièce";
		if Ascenseur 2 is visited:
			say " qui vibre";
	otherwise:
		say "L'ascenseur".

Ascenseur 2 is an elevator. The Ascenseur2door is an elevatorDoor. It is east of Couloir 2 and west of Ascenseur 2. 

Instead of pushing an elevatorDoor:
	say "Vouz appuyez le bouton";
	if the player is in an elevator:
		if the consciousness of the player is:
			-- 2:
				say " avec votre museau[one of] (qui est devenu plus court que vous vous souvenez)[or][stopping] et remarquez que la pièce vibre subtilement. Un instant plus tard, le mur s'ouvre donnant sur un couloir à l'ouest.";
			-- otherwise:
				say ", l'ascenseur [if the location is Ascenseur 2]descend[otherwise]monte[end if], et les portes à l'ouest rouvre."; 
		if the player is in Ascenseur 2:
			move the player to Ascenseur 1, without printing a room description;
			now Ascenseur1door is open;
		otherwise:
			move the player to Ascenseur 2, without printing a room description;
			now Ascenseur2door is open;
	otherwise:
		if the consciousness of the player is:
			-- 2:
				say "et le mur s'ouvre vous permettant d'aller à l'est.";
			-- otherwise:
				say "et la porte de l'ascenseur à l'est glisse ouverte.";
		if the player is in Couloir 2:
			now Ascenseur2door is open;
		otherwise:
			now Ascenseur1door is open.
		
After going east from Couloir 2:
		say "[portesReferment].";
		try looking;
		now the Ascenseur2door is closed.
		
To say portesReferment:
	say "Vous ";
	if the player is in an elevator:
		say "entrez";
	otherwise:
		say "sortez";
	say " et ";
	if the consciousness of the player is less than 3:
		say "le mur se referme";
	otherwise:
		say "les portes se referement";
	say " silencieusement derrière vous".
	
After going west from an Ascenseur 2:
	say "[portesReferment].";
	try looking;
	now Ascenseur2door is closed.
	

Section Laboratoire Biochimique

Laboratoire Biochimique is a room. The description of Laboratoire Biochimique is "[descLabBio]." The labBioDoor is a locked door. It is south of Couloir 2 and north of Laboratoire Biochimique. 

To say descLabBio:
	say "Bio Lab".

Section Couloir 1

Couloir 1 is a room. The description of Couloir 1  is "[descCouloir1]." The printed name of Couloir 1 is "[pnCouloir1]".

To say descCouloir1:
	if the consciousness of the player is:
		-- 2:
			say "Un couloir qui ressemble au «corridor dangereux» près de chez vous. Vous voyez des sorties à l'ouest et au sud";
			say "[liftDoorDogStatus]"; 
		-- 3:
			say "Le corridor central du premier niveau se connecte aux toilettes au sud, les douches à l'ouest, un labo au nord, et l'ascenseur à l'est";
		-- 4:
			say "Le corridor central du premier niveau se connecte aux toilettes au sud, l'installation de décontamination à l'ouest, la laboratoire de pathologie au nord, et l'ascenseur à l'est".
		
To say pnCouloir1:
	if the consciousness of the player is:
		-- 2:
			say "Nouveau couloir";
		-- 3:
			say "Couloir, niveau 1";
		-- 4:
			say "Niveau 1: Bioconfinement".
			
After going east from Couloir 1:
		say "[portesReferment].";
		try looking;
		now the Ascenseur1door is closed.

Section Ascenseur 1

Ascenseur 1 is an elevator. The Ascenseur1door is an elevatorDoor. It is east of Couloir 1 and west of Ascenseur 1. 

To say descAscenseur1:
	say "Un bouton [if the player is in Ascenseur 1]vert[otherwise]jaune[end if] brille sur un panneau".
	
After going west from an Ascenseur 1:
	say "[portesReferment].";
	try looking;
	now Ascenseur1door is closed.

Section Laboratoire De Pathologie

Laboratoire de Pathologie is a room. The description of Laboratoire de Pathologie is "[descLabPath]." The labPathDoor is a door. It is north of Couloir 1 and south of Laboratoire de Pathologie. The printed name of Laboratoire de Pathologie is "[pnLabPath]".

To say pnLabPath:
	if the consciousness of the player is:
		-- 2:
			say "La cuisine";
		-- 3: 
			say "Le labo préparatoire";
		-- 4:
			say "La laboratoire de pathologie".

To say descLabPath:
	If the consciousness of the player is:
		-- 2:
			say "[one of]Cette pièce vous évoque les temps joyeux que vous avez passé avec la famille -- avant d[apostrophe]être enlevé. D'après les comptoirs, les étagères replies de denrées, les éviers, et les grands appareils, il s'agit sans question de la pièce la plus importante de la maison: la cuisine[or]Une cuisine ordinaire, meublé en noir[stopping]";
		-- 3:
			say "C'est ici où les scientifiques préparent les lames de microscope.[paragraph break]Vous reconnaissez une trancheuse à viande et un four à micro-ondes, mais la plupart de l[apostrophe]équipement sur le comptoir n'est pas familier";
		-- 4:
			say "Vous avez vous-même sélectionné les équipments dernier cri trouvés dans cette laboratoire ultramoderne qui le laboratoire s'occupe de la préparation et de l'analyse des échantillons de tissus".
	
The frigo is a closed openable container in the Laboratoire de Pathologie. The frigo is closed. The printed name of the frigo is "[pnFrigo]".

To say pnFrigo:
	if the consciousness of the player is:
		-- 2:
			say "frigo";
		-- 3:
			say "congélo";
		-- 4:
			say "congélateur pour spécimens de pathologie".

The boite en plastique is a female closed openable container in the frigo. The boite en plastique is closed.

The morceau de cerveau is a male edible thing in the boite en plastique.

After opening the labPathDoor:
	say "[openNord]."

Section Les Toilettes

Les Toilettes is a room. The description of Les Toilettes is "[descToilettes]." Les Toilettes are south of Couloir 1. The printed name of Les Toilettes is "[pnToilettes]". 

To say descToilettes:
	if the consciousness of the player is less than 3:
		say "L'odeur d'urine est forte ici[one of]. Beacoup ont marqué leur territoire ici. Ce doit être un endroit très convoité[or][stopping]";
	otherwise:
		say "Un sol carrelé en noir et blanc, des cabinets, urinoirs, et lavabos"
	
To say pnToilettes:
	if the consciousness of the player is less than 3:
		say "La pièce carrelée";
	otherwise:
		say "Les toilettes".
		
Instead of simpleOpening when the player is in Les Toilettes:
	if the consciousness of the player is less than 3:
		say "En soulevant la couverture d'un meuble, vous révélez un bol plein d'eau.";
	otherwise:
		say "Vous soulevez le couvercle d'une toilette.";
	now the potty is in Les Toilettes.
	
The potty is a female thing in the void. The printed name of the potty is "[pnPotty]".

To say pnPotty:
	if the consciousness of the player is less than 3:
		say "bol plein de l'eau";
	otherwise:
		say "toilette (avec le couvercle soulevé)". 
		
Instead of simpleEating when the player is in Les Toilettes:
	if the potty is in the void:
		continue the action;
	otherwise:
		if the consciousness of the player is:
			-- 2:
				say "Vous [one of]lapez l'eau dans le bol. C'est rafraîchissante[or]n'avez pas vraiment soif, mais vous avalez un pea plus d'eau[or]n'avez plus soif ayant déjà avalé quelques litres d'eau[stopping].";
			-- 3:
				say "Non, ça serait dégoûtant[one of] (même pour quelqu'un qui mange les cerveaux)[or][stopping]."; 
			-- 4:
				say "En rendez-vous compte combien d'espèces de bactéries pathogènes se trouvent dans les eaux de toilette? Pas de la question."

Section Salle de Décontamination

Salle de Décontamination is a room. The description of Salle de Décontamination is "[descSalleDecon]." The deconDoor is a locked door. It is west of Couloir 1 and east of Salle de Décontamination. 

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
	say "Rien à ouvrir ici." 

Section simpleEating

simpleEating is an action applying to nothing. Understand "manger" as simpleEating.

Carry out simpleEating:
	repeat with the item running through visible edible things:
		try eating the item;
		stop the action;
	say "Il n'y a rien à manger";
	if the tas de nourriture de chien is in the location:
		say " (du moins, rien dont vous avez envie à manger)";
	say "."
	
Section simplePushing

simplePushing is an action applying to nothing. Understand "pousser" as simplePushing.

Carry out simplePushing:
	repeat with the item running through visible buttoned things:
		try pushing the item;
		stop the action;
	say "Rien à appuyer ici."
	
Section simpleTalking

simpleTalking is an action applying to nothing. Understand "parler" as simpleTalking.

Carry out simpleTalking:
	say "TODO: simpleTalking."
	
Chapter Consciousness

To increment the consciousness of the player:
	increase the consciousness of the player by 1;
	try looking.
	
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
	
After going west from Couloir 2 for the first time:
	move the petite créature grise to the Bloc Opératoire;
	say "Un petit animal gris se cache dans les ombres, tremblant.";
	increment the knownCommands of the player.
	
After eating the petite créature grise:
	say "[line break]De votre main, vous balayez aveuglément les recoins à la base du mur. Malgré votre manque de vitesse et dextérité, par miracle vous réussissez à coincer le petit rongeur contre le mur. Vous vous empressez de le saisir fermement et sentez quelque chose de chaude, poilue, et maintenant, mouillée fond dans votre main. Sans penser plus, vous le bouffez précipitamment.[paragraph break]Après un petit moment, les nouvelles pensées vous frappent. Pris au dépourvu, vous frissonnez.[paragraph break][italic type]Au secours! Un énorme monstre me poursuit! Il va me manger! il faut me dissimuler.[paragraph break]Je… euh.  Suis-je mort ou quoi? Je ne comprends pas.[paragraph break]Quoi qu'il en soit, il me semble que J'ai beaucoup grandi, hein[roman type].";
	increment the consciousness of the player.
	
After going east when the consciousness of the player is 1 for the first time:
	try looking;
	say "[italic type]Ah, le grand couloir blanc.[paragraph break]Combien de fois est-ce que j'ai vu les géants marcher à travers les murs lisses pour entrer dans les pièces secrètes? Comment le font-ils?[roman type][paragraph break]";
	increment the knownCommands of the player.
	
After opening the labZooDoor:
	say "[openNord].";
	increment the knownCommands of the player.
	
After going north from Couloir 2 for the first time:
	say "Vous penetrez dans la tanière du loup, un endroit bien connu mais toujours effrayant. Comme d'habitude le loup est emprisonné dans sa cage et vous êtes libre d'explorer, hors de portée de ses machoires baveuses.";
	try looking;
	increment the knownCommands of the Player.
	
After opening the cage:
	say "Vous ouvrez la cage mais le loup reste prudemment là-dedans."
	
After eating the chien:
	now the chien is dead;
	now the corps de chien is in the cage;
	say "Par instinct, vous dévorez son cerveau et jetez le corps dans la cage. Encore une fois, de nouvelles pensées envahissent votre esprit.[paragraph break][italic type]Je vous préviens: si vous approchez de ma cage, je vous mordrai. Arretez! Sans blague… [paragraph break]Mais, qu'est-ce qui se passe? De quoi s'agit le chien mort dans ma cage… qui coule du sang sur mon coussin préféré?[paragraph break]Et pourquoi est-ce que je me tiens debout sur deux jambes à la façon des êtres humains? C'est en fait plus facile que j'aurais pensé.";
	increment the consciousness of the player;
	increment the knownCommands of the player.
	
After eating the morceau de cerveau:
	say "En mâchant la tranche de cerveau, vous constatez un saveur désagréable, mais ça s'estompe presque immédiatement.[paragraph break]Pendant quelques moments rien ne se passe et vous vous demandez si vous pouvez maintenant manger n'importe quoi en toute impunité.[paragraph break]Soudain, le monde passe du monochrome à la couleur vive. Un vague électrique parcourt votre esprit et vous vous effondrez, désorienté. Lorsque vous vous mettez debout, des nouvelles idées se mêlent aux vos pensées et vous voyez tout sous un nouveau jour.";
	increment the consciousness of the player;
	increment the knownCommands of the player.
		
Chapter The Void

The void is a room.

The petite créature grise is an edible female thing. It is in the void.

Chapter Testing

Test me with "est / ouest / manger / est / ouvrir / nord / ouvrir / manger / pousser / sud / pousser / est / pousser / ouest / sud / ouvrir / manger / manger / manger / nord / ouvrir / nord / ouvrir / ouvrir / manger "









