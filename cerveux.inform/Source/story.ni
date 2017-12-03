"Faute De Servo" by Tana Ostrova

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
Use no scoring.

Chapter Globals

DebugFlag is a truth state that varies. DebugFlag is true.
BlockChatterFlag is a truth state that varies. BlockChatterFlag is false.

Chapter The Player

The player has a number called consciousness. The consciousness of the player is 0. The curedFlag of the player is a truth state that varies. The curedFlag of the player is false.

[Niveau					après avoir mangé….
0					rien
1					une souris
2					un chien
3					un morceau de cerveau d'un garde
4					le cerveau d'un scientifique
]

The player has a number called knownCommands. The knownCommands of the player is 0.

[Niveau					Action
1					East
2					West
3					simple Eating
4					simple Opening
5					North
6					South
7					Push Button
8					Unlock
9					Talk
10					Repair]

Chapter Exit Lister

To decide whether unicodage is enabled:
	(-  glk_gestalt(gestalt_Unicode, 0) -)

Rule for constructing the status line:
	center "[exitList]" at row 1;
	rule succeeds.

To say exitList:
	let L be {up, west, north, south, east, down};
	repeat with way running through L:
		if the room the way from the location is not nothing:
			if the way is:
				-- west:
					say "[if unicodage is enabled][unicode 8592][otherwise]<[end if] ";
				-- north:
					say "[if unicodage is enabled][unicode 8593][otherwise]^[end if] ";
				-- south:
					say "[if unicodage is enabled][unicode 8595][otherwise]v[end if] ";
				-- east:
					say "[if unicodage is enabled][unicode 8594][otherwise]>[end if] ";

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

Palette is a list of glulx color values that varies. Palette is {g-red, g-white, g-MidGray, g-lime, g-indigo,  g-tiffany, g-blue, g-yellow, g-green, g-peptobismol}.

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
A thing can be broken. Things are usually not broken.

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
		say ". Au mileau du mur à l'est, un bouton brille avec une lueur rouge";
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
	
		
After going east from Couloir 2 when the ascenseur2door is open for the first time:
	now the BlockChatterFlag is true;
	say "[quotation mark][italic type]Lucky, comment as-tu su comment ouvrir la boîte magique?[line break]-- J'ai vu un bouton ; je l'ai appuyé. C'est ce que je fais. Alors, raconte-moi cette histoire de [apostrophe]boîte magique[apostrophe].[line break]-- Les géants… [line break]-- Ça veut dire les humains?[line break]-- Oui, probablement. Ben, les humains, ils entrent dans la boîte et ils disparraissent. Plus tard, des autres apparraissent à leur place. C'est magique.[line break]-- On verra.[roman type][quotation mark][paragraph break]".
			

Section Laboratoire Zoologique

Laboratoire Zoologique is a room. The description of Laboratoire Zoologique is "[descLabZoo]." The printed name of Laboratoire Zoologique is "[pnLabZoo]".

To say descLabZoo:
	if the consciousness of the player is:
		-- 1:
			say "De sa cage le loup méchant vous dévisage constamment";
		-- 2:
			say "La pièce dans laquelle ils vous avaient appris à appuyer le bouton rouge sur le distributeur de friandises";
		-- 3:
			say "Une cage occupe la moitié de la pièce et le reste de l'espace est dédié au dressage des animaux";
		-- 4:
			say "Les animaux sont maintenus dans une cage d'une superficie de 15 mètres carrés, ce qui leur permet de rester actifs pendant des expériences qui peuvent durer des semaines. Un des dispositifs utilisés pour leur entraînement se trouve du côté de la cage[one of]. Vous constatez que la cage apporte un placard: [quotation mark]Sujet 205-Alpha[quotation mark][or][stopping]."
			

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
			say "En récompense, quelques croquettes tombent au sol. Vous les mangez, mais le repas ne satisfait pas votre faim.";
		-- 3:
			say "Vous n'avez la moindre envie de manger les croquettes de nourriture de chien qui tombent à vos pieds.";
			move the tas de nourriture de chien to the Laboratoire Zoologique;
		-- 4:
			say "Le dispositif de conditionnement opérant produit les cubes de nourriture de chien qui s'accumulent sur le sol.";
			move the tas de nourriture de chien to the Laboratoire Zoologique.
			
The tas de nourriture de chien is in the void.

Every turn when the chien is in the cage and the player is in the Laboratoire Zoologique:
	if a random chance of 3 in 8 succeeds:
		say "Le loup [one of]aboie bruyamment[or]mord les barres de sa cage[or]gratte les oreilles[or]fait les cent pas dans sa boîte métallique[or]hurle a pleine poumons[or]renifle l'air[or]renifle sa cage[or]renifle lui-meme[or]léche les pattes[or]vous montre ses dents[or]grogne de manière menaçante[or]vous ignore[or]court de coté à coté dans sa cage, vous dévisageant[in random order]."		
	
		 
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
				say " et le mur s'ouvre vous permettant d'aller à l'est.";
			-- otherwise:
				say " et la porte de l'ascenseur à l'est glisse ouverte.";
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

Laboratoire Biochimique is a room. The description of Laboratoire Biochimique is "[descLabBio]." The printed name of the Laboratoire Biochimique is "[pnLabBio]". 

The labBioDoor is a female locked door. It is south of Couloir 2 and north of Laboratoire Biochimique. The printed name of the labBioDoor is "[pnLabBioDoor]".

To say descLabBio:
	if the consciousness of the player is:
		-- 3:
			say "Normalement, la pièce déborde d[apostrophe]équipements high-techs avec les lumières clignotantes et le bruit continuel des moteurs robotiques. Pourtant, en ce moment toutes les équipements sont éteintes et il n'y a le moindre son";
		-- 4:
			if the disjoncteurs are not broken:
				say "L'alimentation électrique rétablie, la pièce est bien illuminé, les ordinateurs sont allumés, et les équipements semblent en mésure de réaliser les synthèses biochimiques les plus complexes";
			otherwise:
				say "Le système robotique de synthèse moléculaire semble en état de fonctionner sauf pour la manque d[apostrophe]électricité"
	
To say pnLabBio:
	if the consciousness of the player is:
		-- 3:
			say "Laboratoire Biochimique";
		-- 4:
			say "Laboratoire De Synthèse Moléculaire".
			
To say pnLabBioDoor:
	say "porte de la laboratoire".
	

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
			say "Vous avez vous-même sélectionnée les équipments dernier cri trouvés dans cette laboratoire ultramoderne qui s'occupe de la préparation et de l'analyse des échantillons de tissus".
	
The frigo is a closed openable container in the Laboratoire de Pathologie. The frigo is closed. The printed name of the frigo is "[pnFrigo]".

To say pnFrigo:
	if the consciousness of the player is:
		-- 2:
			say "frigo";
		-- 3:
			say "congélo";
		-- 4:
			say "congélateur pour spécimens de pathologie".

The boîte en plastique is a female closed openable container in the frigo. The boîte en plastique is closed.

The morceau de cerveau is a male edible thing in the boîte en plastique.

After opening the labPathDoor:
	say "[openNord]."
	
After going north from Couloir 1 when the labPathDoor is open for the first time:
	now the BlockChatterFlag is true;
	say "[quotation mark][italic type]Oh là là! dit Lucky avec joie.[line break]-- Pourquoi es-tu si content?[line break]-- Vois-tu cette boîte-là? Voilà la vraie boîte magique: le frigo![line break]-- Est-ce qu'on fait des voyages dans un frigo?[line break]-- Non, on mange ce qu'on trouve là-dedans![roman type][quotation mark][paragraph break]";
	try looking.


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
		say "toilette (dont le couvercle est soulevé)". 
		
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
				say "En rendez-vous compte combien d'espèces de bactéries pathogènes se trouvent dans cette eau? Pas de la question."
				
After going south from Couloir 1 when the consciousness of the player is 3 for the first time:
		now the BlockChatterFlag is true;
		say "Quand vous entrez dans les toilettes, un mouvement attire votre attention.[paragraph break][italic type]Est-ce quelqu'un d'autre ici?[roman type][paragraph break]Un costaud vêtu d'un uniforme en lambeaux vous dévisage sans sourciller. Son teint blafard, ses yeux cernes, et ses joues creuses rappellent un cadavre.[paragraph break]Cette rencontre maladroite continue pendant plusieurs minutes, jusqu'au moment où vous vous rendez compte que vous regardez votre propre reflet dans un miroir.";
		try looking.
	
After going south from Couloir 1 when the consciousness of the player is 4 for the first time:
	now the BlockChatterFlag is true;
	say "Vous voyez votre reflet dans le miroir et vous le regardez un longue moment. Vous reconnaissez immédiatement Julien, vêtu de son uniforme de gardien bleu et contre toute attente portant toujours son chapeau officiel.";
	try looking.

Section Salle de Décontamination

Salle de Décontamination is a room. The description of Salle de Décontamination is "[descDecon]." The printed name of the Salle de Décontamination is "[pnDecon]".

The deconDoor is a female locked door. It is west of Couloir 1 and east of Salle de Décontamination. The printed name of the deconDoor is "[pnDeconDoor]".

To say descDecon:
	if the consciousness of the player is:
		-- 3:
			say "Des pommeaux de douche visent le centre de la pièce qui est baigné à perpétuité dans une lumière violette";
		-- 4: 
			say "Des jets à haute pression entourent la pièce afin d'arroser le personnel d'une solution antiseptique lorsqu'ils entrent et sortent des zones potentiellement contaminées. La pièce est continuellement éclairée par les lumières germicides";
	say ". La porte à l'est mène au couloir et celle au nord à l'escalier"

To say pnDecon:
	if the consciousness of the player is:
		-- 3:
			say "Les Douches";
		-- 4:
			say "Salle de Décontamination".
			
To say pnDeconDoor:
	if the consciousness of the player is:
		-- 3:
			say "porte de la salle de bain";
		-- 4:
			say "porte de la salle de décontamination".

Section Escalier 1

Escalier 1 is a room. The description of Escalier 1  is "[descEscalier1]." The printed name of Escalier 1 is "Escalier (premier niveau)".

The esc1door is a female locked door. It is north of Salle de Décontamination and south of Escalier 1.

The printed name of esc1door is "porte entre la salle de [if the consciousness of the player is 3]bain[otherwise]décontamination[end if] et l'escalier".

To say descEscalier1:
	say "L'escalier remonte vers le nord et relie [if the consciousness of the player is 3]la salle de bain[otherwise]la salle de décontamination[end if] au sud avec les niveaux plus hauts de l'installation".
	
After going north from Salle de Décontamination:
	say "[upNorth].";
	try looking.
	
After going south from Escalier 2:
	say "[downSouth].";
	try looking.
	
To say upNorth:
	say "Vous montez l'escalier au nord".
	
To say downSouth:
	say "Vous descendez l'escalier au sud".

Section Escalier 2

Escalier 2 is a room. The description of Escalier 2  is "[descEscalier2]." Escalier 2 is north from Escalier 1. The printed name of Escalier 2 is "Escalier (deuxième niveau)".

To say descEscalier2:
	say "L'escalier remonte vers le nord et relie l[apostrophe]escalier au sud avec le sas au nord".
	
After going north from Escalier 1:
	say "[upNorth].";
	try looking.
	
After going south from Sas:
	say "[downSouth].";
	try looking.

Section Sas

Sas is a room. The description of Sas is "[descSas]." The printed name of the sas is "Sas".

The sasDoor is a female locked door. It is north of Escalier 2 and south of Sas. The printed name of the sasDoor is "porte blindée du sas".

The Docteur Rambaud is an edible thing in the sas. Docteur Rambaud has a truth state called introducedFlag. The introducedFlag of Docteur Rambaud is false. Docteur Rambaud has a number called conversations. The conversations of Docteur Rambaud is 0.

The indefinite article of the Docteur Rambaud is "[if the introducedFlag of Docteur Rambaud is true]le[otherwise]une[end if]". The printed name of Docteur Rambaud is "[if the introducedFlag of Docteur Rambaud is true]Docteur Rambaud[otherwise]scientifique[end if]".

To say descSas:
	if the consciousness of the player is:
		-- 3:
			say "Une longue pièce tubulaire baignée de lumière rouge";
		-- 4:
			say "Les lourdes portes blindées, le manque de fenêtres et la forme tubulaire de la pièce vous rapellent un sous marin. La lumière au-dessus de la porte à l'autre extrémité de la pièce signifie qu'elle est verrouillée".
			
Instead of going north when the player is in the sas:
	if Docteur Rambaud is in the sas:
		say "Vous auriez besoin de dépasser la scientifique, et elle n'a pas l'air coopérative. De plus, vous ne connaissez pas le code pour ouvrir la porte extérieur, il serait donc inutile d'essayer.";
	otherwise:
		say "Futile. La porte est hermétiquement fermée et ne peut être ouverte que par ceux qui se trouve dans la salle de côntrole."
			
Before eating Docteur Rambaud when the conversations of Docteur Rambaud are less than 5:
	now the BlockChatterFlag is true;
	say "[one of]La scientifique vous repousse avec son pied-de-biche. Fois hors de portéé de votre bouche menaçante, elle appuie un bouton sur l'interphone et dit: [quotation mark]Attention: salle de contrôle. Ici le sas, le docteur Rambaud parlant. Julien est ici avec moi. Malheuresement, je dois vous signaler que l'expérience a raté.  En aucune cas, ne déverrouillez la porte extérieur[quotation mark][or]Le docteur Rambaud ne bouge pas de sa position derrière le bureau, mais lorsque vous l'approchez, elle lance une série de coups avec son pied-de-biche qui vous fait reconsidérer vos actions[or]La scientifique vous confie: [quotation mark]Je vous fais crédit de votre persévérance, neanmoins… [quotation mark] et elle vous frappe carrement au nez. Ébranlé, vous trébuchez un peu et vous hâtez de reculer[or]Le docteur Rambaud vous bat avec le pied-de-biche à plusieurs reprises[stopping].";
	stop the action.
	

Chapter Verbs

Section simpleUnlocking

simpleUnlocking is an action applying to nothing. Understand "déverrouiller
" as simpleUnlocking.

Carry out simpleUnlocking:
	repeat with way running through directions:
		if the door the way of the location is locked:
			now the door the way from the location is unlocked;
			say "Vous entrez le code sur le pavé numérique et entendez déverrouiller la porte ";
			if the way is east or the way is west:
				say "à l[apostrophe]";
			otherwise:
				say "au ";
			say "[way].";
			stop the action;
	say "Vous ne voyez aucune porte verrouillée."
	
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

Check simpleTalking:
	if the player is not in the sas:
		say "Personne n'est present. À qui parlez vous[one of]?[paragraph break]Voulez-vous que toute le monde pense que vous êtes débile[or][stopping]?";
		stop the action;
	otherwise:
		if the dépouille saignante du Docteur Rambaud is in the sas:
			if the interphone is not live:
				say "Pour parler avec la salle de contrôle, il faut d'abord allumer l'interphone.";
				stop the action.
				
Carry out simpleTalking:
	if the dépouille saignante du Docteur Rambaud is in the sas:
		now the BlockChatterFlag is true;
		if the curedFlag of the player is not true:
			say "[one of]Vous expliquez votre plan. Le directeur de l'installation prende le micro et vous souhaite la bon chance. Par ailleurs, il vous dirige de lui appeler quand vouz avez réussi. Apart ça, il faut ne pas utiliser l'interphone[or]La salle de contrôle refuse de vous parler jusqu[apostrophe]à ce que vous ayez en main un remède efficace[stopping]. Il raccroche et l'interphone s[apostrophe]éteint.";
			now the interphone is not live;
		otherwise:
			say "Les cris de joie issuent de la salle de contrôle lorsque vous signalez votre succès. La porte extérieur du sas s'ouvre et vous commencez votre nouvelle vie.";
			terminate the game;
	otherwise:
		now the BlockChatterFlag is true;
		increase the conversations of Docteur Rambaud by 1;
		if the conversations of Docteur Rambaud is:
			-- 1:
				say "Vouz commencez à balbutier et la scientifique vous dévisage d'un regard inquisiteur.[paragraph break][quotation mark]C'est possible? demande-t-elle. Es-tu toujour capable de parler?[line break]-- Oui, vous grognez au prix d'un grand effort. Moi... parle.[line break]-- Incroyable! C'est un miracle, Julien. De quoi tu te souviens?[paragraph break][italic type]-- Julien? Qui est-ce? demande Lucky.[line break]-- C'est pas moi, reponde la voix miniscule de la souris. Peut-être que le nom appartient à notre ami, la tranche de cerveau?[line break]-- Je ne m'en souviens pas, mais bon, je pourrai aussi bien être ce Julien.[roman type][paragraph break]-- Rien. Rien de tout. Julien… C'est moi?[line break]-- Oui, Julien, c'est toi. Et moi, je suis ton Isabelle. Isabelle Rambaud, repond-elle d'un ton déçu.[quotation mark][paragraph break]";
			-- 2:
				say "[quotation mark][italic type]Elle a des jolies yeux (pour un géant), remarque la souris.[line break]-- Tais-toi, disent Lucky et la tranche de cerveua à l'unisson.[quotation mark][roman type][paragraph break]Vous vous efforcer à former les mots les uns après les autres.[paragraph break][quotation mark]Que faisons-nous ici?[line break]-- Écoute, Julien. Je n'ai pas beaucoup de temps. Je suis chercheur médical et tu es gardien. Nous travaillions dans une installation consacrée à trouver un remède contre le virus Zombie777 qui a désolé le monde entier.[line break]-- Un gardien?[line break]-- Oui. Fais attention, Julien, c'est important. Un foule d'individus infectés ont encerclé la laboratoire et tu me protégeais quand tu as été gratté. Pour éviter que tu ne deviennes un zombie, je t'ai administré le traitement expérimental.[line break]-- Alors, je suis guéri?[line break]-- Loin de ça, je dirais.[quotation mark][paragraph break]";
			-- 3:
				say "[quotation mark]Le traitement n'a pas marché? vous demandez.[line break]-- Pas entièrement, il me semble. J'ai éprouvé d'un problème avec le système microfluidique de synthèse biomoléculaire qui a produit le traitment. Je crois qu'un composant était omit de la formule. J[apostrophe]étais en train de faire des réparations sur l'unité de synthèse quand tu m'a pris au dépourvu. Tu m'a attaqué, mais j'ai réussi à m'enfuir au sas. Et voilà où nous en sommes.[line break]-- Désolé.[line break]-- Ce n[apostrophe]était pas toi. Tu étais completement transformé en zombie. Mais… comment se fait-il que tu puisse parler maintenant? Les zombies n'en sont capable.[quotation mark][paragraph break]";
			-- 4:
				say "[quotation mark]Nous avons beacoup de mal à parler.[line break]-- Naturellement, vos neurones sont en état de… attends… nous?[paragraph break][italic type]-- Raconte-lui de moi, implore la souris tout excité.[line break]-- Et de moi! ajoute Lucky.[roman type][paragraph break]-- Ouais, je dis [apostrophe]nous[apostrophe] parce qu'il y a trois esprits dans ma tête: la souris, le chien qui s'appelle Lucky, et la tranche de cerveau. Nous travaillons ensemble pour se déplacer et parler.[line break]-- Ben, elle marque un pause, ça explique tout. Votre cerveau était réinitialisé, c'est-à-dire effacé, par le virus, mais tu as réussi à le recharger d'un façon avec des cerveaux normales. La tranche dont tu parles s'agit d'une biospsie que j'ai pris de Julien avant que le virus avait atteint cet portion de son cerveau.[quotation mark][paragraph break]";
			-- 5:
				say "[quotation mark]Alors, nous sommes bel et bien foutus? dites-vous.[paragraph break][italic type]-- Tout à fait, grommele le souris[line break]-- Oui, il me semble, accorde Lucky.[roman type][paragraph break]-- Peut-être que non… [line break]-- As-tu un plan?[line break]-- Oui, je crois. Fais exactément ce que je te dis: Je suis en train de mourir, déjà je ne peut pas même bouger les jambes. Pourtant... Si tu manges mon cerveau -- attends, pas encore, laisse-moi arriver à la fin de mon discours -- si tu manges mon cerveau ma personalité fusionnera avec les tiens. Le virus est encore présent en toi et il va destruire votre cerveau, mais il était ralenti par la première dose du traitement. S'il reste assez de temps, on peut répararer l'unité de synthèse et cette fois produire un traitement curatif. Je viverai en toi, ensemble avec tes pensées.[line break]-- Alors, je dois manger ton cerveau maintenant?[line break]-- Allons-y![quotation mark][paragraph break]";
			-- otherwise:
				say "Il ne reste rien à dire."
				
												
Section simpleRepairing

simpleRepairing is an action applying to nothing. Understand "réparer" as simpleRepairing.

Carry out simpleRepairing:
	repeat with the item running through visible broken things:
		try touching the item;
		stop the action;
	say "Vous ne voyez rien à réparer."
	
Instead of touching something (called the item):
	now the item is not broken;
	say "Vouz  [the item]."
	[override touch with specific repair actions.]
	
Chapter Consciousness

To increment the consciousness of the player:
	increase the consciousness of the player by 1;
	try looking.

Chapter Known Commands

actionList is a list of text that varies. actionList is {"est", "ouest","manger","ouvrir","nord","sud","pousser","déverrouiller","parler","réparer"}

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
	say "[line break]De votre main, vous balayez aveuglément les recoins à la base du mur. Malgré votre manque de vitesse et dextérité, par miracle vous réussissez à coincer le petit rongeur contre le mur. Vous vous empressez de le saisir fermement et sentez quelque chose de chaude, poilue, et maintenant, mouillée fond dans votre main. Sans penser plus, vous le bouffez précipitamment.[paragraph break]Après un petit moment, les nouvelles pensées vous frappent. Pris au dépourvu, vous frissonnez.[paragraph break][italic type]Au secours! Un énorme monstre me poursuit! Il va me manger! il faut me dissimuler.[paragraph break]Je… euh.  Suis-je mort ou quoi? Je ne comprends pas.[roman type].";
	increment the consciousness of the player.
	
After going east when the consciousness of the player is 1 for the first time:
	try looking;
	now the BlockChatterFlag is true;
	say "[italic type]Ah, le grand couloir blanc.[paragraph break]Combien de fois est-ce que j'ai vu les géants marcher à travers les murs lisses pour entrer dans les pièces secrètes? Comment le font-ils?[roman type][paragraph break]";
	increment the knownCommands of the player.
	
After opening the labZooDoor:
	say "[openNord].";
	increment the knownCommands of the player.
	
After going north from Couloir 2 for the first time:
	say "Vous penetrez dans la tanière du loup, un endroit bien connu mais toujours effrayant. Comme d'habitude le loup est emprisonné dans sa cage et vous êtes libre d'explorer, hors de portée de ses mâchoires baveuses.";
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
	say "En mâchant la tranche de cerveau, vous constatez un saveur désagréable, mais ça s'estompe presque immédiatement.[paragraph break]Pendant quelques moments rien ne se passe et vous vous demandez si vous pouvez maintenant manger n'importe quoi en toute impunité.[paragraph break]Soudain, le monde passe du monochrome à la couleur vive. Une vague électrique parcourt votre esprit et vous vous effondrez, désorienté. Lorsque vous vous mettez debout, des nouvelles idées se mêlent aux vos pensées et vous voyez tout sous un nouveau jour.";
	increment the consciousness of the player;
	increment the knownCommands of the player.
	
After going north from Escalier 2 when the sasDoor is not locked for the first time:
	now the BlockChatterFlag is true;
	say "Une femme d'une quarantaine d'années vêtue d'une blouse blanche est assise derrière un bureau en métal. Elle est à mi-chemin entre vous et la porte à l'autre bout de la pièce. Elle semble gravement blessée et saigne d'une blessure au bras qu'elle a bandée de gaze stérile. Dans son autre main, elle brandit un pied-de-biche.";
	try looking;
	increment the knownCommands of the player.
	
After eating Docteur Rambaud:
	now the BlockChatterFlag is true;
	say "Vous dévorrez le cerveau de la scientifique. Immédiatement vous voyez le monde d'un point de vue plus raffiné et érudit.[paragraph break][quotation mark][italic type]C'est fait? demande la voix d'Isabelle avec hésitation.[line break]-- Oui, tu étais déliceuse, enthousiasme le souris.[line break]-- Le meilleur jusqu'ici, accorde Lucky.[line break]-- Excuse mes co-esprits, ils manque cruellement du tact, intervient la tranche de cerveau.[line break]-- Hé! gémissent la souris et le chien.[line break]-- Sois la bienvenue, Isabelle, continue la tranche de cerveau. On est à ta disposition.[line break]-- Bonjour, les gars, dit Isabelle avec chaleur.[quotation mark][paragraph break]";
	move the dépouille saignante du Docteur Rambaud to the sas;
	move the interphone to the sas;
	move the panneau électrique to escalier 1;
	move the unité de synthèse microfluidique to the Laboratoire Biochimique;
	increment the knownCommands of the player;
	increment the consciousness of the player.
		
Chapter Dialogue

Section Generate Dialogue

Every turn:
	if the curedFlag of the player is not true:
		if the disjoncteurs are not broken and the servomoteur is not broken and the player is in the Laboratoire Biochimique:
			now the BlockChatterFlag is true;
			say "L'appareil robotique émit un bip et du fluide fluo vert remplit un flacon. Vous le prenez anxieusement, portez un toast à votre propre santé, et buvez en grandes gorgées.[paragraph break][quotation mark]Je ne ressens rien, s'inquiète la tranche de cerveau.[line break]-- Attendez, rassure Isabelle.[line break]-- Moi non plus, opine la souris.[line break]-- Attendez, insiste la scientifique.[line break]-- Houlà! s'exclame Lucky. Quelque chose commence à…[line break]-- C'est parti! hurle le docteur.[quotation mark][paragraph break]Vous tremblez violentement et vous vous évanouissez. Lorsque vous vous levez, vous observer que votre peau a repris son teint natural et que vous pouvez vous déplacer sans trébucher. Bref, vous êtes guéri.[paragraph break]";
			now the curedFlag of the player is true;
	if the BlockChatterFlag is false:
		if the consciousness of the player is:
			-- 1:
				if the number of entries in mouseDialogue is greater than zero:
					say "[italic type][quotation mark][entry 1 of mouseDialogue][quotation mark][roman type][paragraph break]";
					remove entry 1 from mouseDialogue;
			-- 2:
				if the number of entries in mouseDogDialogue is greater than zero:
					say "[italic type][quotation mark][entry 1 of mouseDogDialogue][quotation mark][roman type][paragraph break]";
					remove entry 1 from mouseDogDialogue;
			-- 3:
				if the number of entries in mouseDogGuardDialogue is greater than zero:
					say "[italic type][quotation mark][entry 1 of mouseDogGuardDialogue][quotation mark][roman type][paragraph break]";
					remove entry 1 from mouseDogGuardDialogue;
			-- 4:
				if the curedFlag of the player is true:
					if the number of entries in CuredDialogue is greater than zero:
						say "[italic type][quotation mark][entry 1 of CuredDialogue][quotation mark][roman type][paragraph break]";
						remove entry 1 from CuredDialogue;
				otherwise:
					if the number of entries in EverybodyDialogue is greater than zero:
						say "[italic type][quotation mark][entry 1 of EverybodyDialogue][quotation mark][roman type][paragraph break]";
						remove entry 1 from EverybodyDialogue;
	now the BlockChatterFlag is false.
	
Section Mouse Dialogue

mouseDialogue is a list of text that varies. 
	
mouseDialogue is {
"Quoi qu'il en soit, il me semble que J'ai beaucoup grandi, hein.",
"Je désire quelque chose fortement, mais j'ai du mal à dire quoi.",
"Voyons, quel sont mes envies habituelles?",
"Dormir? Non. Boire? Non. Faire l'amour? Non.[paragraph break]Mon dieu! Non? Est-ce que je suis malade?",
"Eh bien, j'ai faim.",
"De quoi est-ce que j'ai envie de manger? Cela m[apostrophe]échappe pour le moment.",
"Du fromage? Non, pas vraiment.",
"Je cherche quelque chose plus moelleuse, plus juteuse",
"Je le saurai quand je le verrai, je suppose."
}.

Section MouseDog Dialogue	
		
mouseDogDialogue is a list of text that varies. 

mouseDogDialogue is {
"Désolé[line break]-- Quoi, désolé?[line break]-- Moi, je suis désolé de t'as mangé[line break]-- De m'avoir mangé? Dis donc, qui es-tu?[line break]-- La souris.",
"La souris? Quelle souris?[line break]-- La souris qui habite ici.[line break]-- La maudite souris qui vole toujours les bribes autour de mon distributeur?[line break]-- Ouais, la même. Une fois de plus, je suis désolé de t'avoir dérangé.",
"Pas du tout. J'aurais fait pareil.[line break]-- Bon, merci.[line break]-- Dis, souris, as-tu un nom?[line break]-- Non. Nous les souris n'ont pas les noms. Tu peux m'appeler simplement [apostrophe]Souris[apostrophe]. Et toi? Comment tu t'appelles?[line break]-- [apostrophe]Lucky[apostrophe]. C'est le nom que ma famille m'a donné avant que je suis arrivée ici. Les bourreaux me désigne [apostrophe]Sujet 205-Alpha[apostrophe], mais je préfère [apostrophe]Lucky[apostrophe].[line break]-- D'accord, Lucky.",
"Souris, peux-tu m'expliquer quelque chose? Je suis toujours perplexe. Comment se fait-il que tu, un souris, une animal tout petit, puisses manger un chien comme moi, quelque fois ta taille?[line break]-- Je me suis demandé la même chose. Tiens -- t'es un chien? Je pensais que tu étais un loup![line break]-- Non, un chien, j'en suis certain.",
"Je n'arrive pas à comprendre exactement comment j'ai réussi à vous manger.[line break]-- Qu'est-ce que tu te rapelles de l[apostrophe]événement?[line break]-- J[apostrophe]étais pris d'une folle envie de cerveaux.[line break]-- Quel cerveau?[line break]-- Dans ce cas, le tien.[line break]-- Ah, je vois.",
"As-tu toujours vécu ici, Souris?[line break]-- De générations de ma famille ont vécu ici, c'est notre propriété héréditaire. On le défende contre les envaihaisseurs, les souris de campagne qui ne sont que des cons et voleurs.[line break]-- As-tu jamais vu le monde en dehors d'ici?[line break]-- Je n'en ai envie. J'ai entendu des contes, bien sur: le ciel, les nuages, les champs, mais rien de tout cela ne m'intéresse.",
"Et toi, Lucky? Tu as mentionné une famille? As-tu une femme (nous les souris ne croyons pas au marriage, mais j'ai entendu que les chiens sont plus traditionnels).[line break]-- Une famille, oui, mais pas de femme (bien qu'il y avait un caniche à côté… euh, mais c'est une autre histoire). Non, lorsque je parle de famille, il s'agit d'un famille humain.",
"Tu étais leur ésclave? demande la souris.[line break]-- Non, ce n[apostrophe]était comme ça. J'ai joué avec les enfants, ils m'ont donné de la nourriture, ils m'ont carressé toute la journée, et j'avais même mon propre lit.[line break]-- Tu rêves. Je n'ai jamais vu de pareil. Les humains n'aime pas les animaux. Ils essaient toujours de nous écraser dessous leurs semelles!",
"Bah, tu ne connais que peu des humains, réfute Lucky.[line break]-- Je n'ai aucune envie de les connaître de plus près.[line break]-- Tu aurais aimé ma famille.[line break]-- Alors, pourquoi as-tu quitté de sa famille si remarquable?[line break]-- Pas par choix. Nous étions dans un forêt, j'ai vu un écureuil, et je me suis perdu.[line break]-- Ne me parles pas d[apostrophe]écureuils. Ils sont pire que les souris sauvages!",
"Lucky, penses-tu que tu retrouvera un jour ta famille?[line break]-- Je l'espère.[line break]-- Moi aussi. Je veux chasser les écureuils avec toi.[line break]-- Ça serait génial."
}


Section MouseDogGuard Dialogue

mouseDogGuardDialogue is a list of text that varies. 

mouseDogGuardDialogue is { 
"Il faut patrouiller! ordonne une nouvelle voix[line break]-- Patrouiller? Qu'est que ça veut dire? demande la souris.[line break]-- Cela signifie marcher partout, pour sécuriser l'installation répond la voix.[line break]-- J'aime bien faire des promenades! dit Lucky tout excité.",
"Si je puis poser une question, demande la souris, qui es-tu?[line break]-- Mon nom est… euh… voyons… un instant… bonne question. En effet, je ne me souviens pas. Le nom m[apostrophe]échappe pour l'instant. Que proposerais-tu?[line break]-- Appelons-le [apostrophe]La petite tranche de cerveau que nous avons trouvée dans le frigo et dont la saveur était un peu avariée[apostrophe], conseille le chien.[line break]-- Non, c'est vraiment trop long. Disons plutôt [apostrophe]la tranche de cerveau[apostrophe] tout just. Est-ce que ça te convient?[line break]-- Oui, dit la tranche de cerveau, de toute manière, j'au un préférence pour les noms courts.", 
"Avez-vous aussi des noms? questionne la tranche de cerveau.[line break]-- Oui, répond le chien. Pardonne notre manque de politesse. Je m'appele Lucky et mon ami la souris est tout simplement appelé [apostrophe]la souris[apostrophe].[line break]-- C'est exact, confirme la souris.[line break]-- C'est un plaisir de faire votre connaissance, mes nouveaux amis.", 
"Alors, tranche de cerveau, je me demande quel sorte d'animal tu étais avant d'arriver ici. J[apostrophe]étais chien et la souris a été toujours une souris[line break]-- J[apostrophe]étais quelque chose autre qu'une tranche de cerveau auparavant?[line break]-- Il me semble que tu étais un frigo, suggère la souris. J'ai mangé le cerveau d'un chien est Lucky est apparu. Puis nous avons ouvert et mangé un frigo et tu es apparu.[line break]-- Je ne crois pas qu'il marche comme ça, murmure Lucky.", 
"Quand tu es arrivé, tu as dit qu'il fallait [apostrophe]sécuriser l'installation[apostrophe]. Qu'est-ce que ça veut dire? demande Lucky. [line break]-- Cela signifie que nous devons regarder autour de l'installation pour la protéger contre tout ménace. [line break] - OK, dit la souris en essayant de suivre la conversation, mais c'est quoi une installation? [line break] - C'est le complexe des ... euh ... c'est un endroit où ... tout le monde travaille pour ... euh. Voilà où nous sommes, conclut la tranche de cerveau.", 
"De quelle ménace parles-tu? demande la souris[line break]-- Franchement, je ne sais pas, réponde la tranche de cerveau. Encore, je ne me souviens. Mais il y en a beacoup, j'en suis certain.[line break]-- Tu as l'air parano, dit le chien.[line break]-- Peut-être que si j'avais mes mémoires, je pourrais… non. Elles sont perdues.", 
"Peut-être qu'il y a un moyen de récupérer vos mémoires, suggère Lucky.[line break]-- Comment? J'ai essayé dur et rien ne me vient à l'esprit.[line break]-- Probablement parce tu n'es qu'une petite tranche de cerveau, suppose la souris.  Si nous pouvons trouver le reste du cerveau, qui doit être ici quelque part, nous pourrions le manger pour obtenir les mémoires manquantes, non?[line break]-- Hein? Tu le penses? questionne la tranche de cerveau.[line break]-- Oui, certainment, rassure le chien.", 
"Et si le reste du cerveau nous trouve avant que nous le trouve? demande la souris.[line break]-- Et alors? dit Lucky.[line break]-- Le reste de cerveau peut nous manger plutôt que nous le mange, réponde la souris.[line break]-- Ça changera quoi, exactament? demande la tranche de cerveau. Nous serons tous ensemble en tout cas.[line break]-- Oui. Mais. D'habitude je préfère manger des autres avant qu'ils me mangent.", 
"Savez-vous ce dont nous avons besoin? interroge Lucky. Un plan.[line break]-- Oui, je suis d'accord avec toi, dit la souris. Que proposes-tu?[line break] --Numéro un, explique le chien, il faut explorer un peu de plus, comme la tranche de cerveau a dit, pour sécuriser l'installation. Numéro deux: Chercher le cerveau manquant. Et numéro…euh, le numéro qui suit numéro deux: nous devons nous eschapper d'ici.[line break]-- Génial! Tu es génie, Lucky, dit la tranche de cerveau.",
"Dehors? demande la souris. Je suis tout à fait confortable ici. Que offre le monde extérieur? Rien que des ennuis. J'ai hérités des terres ici et même un titre -- vous rendez-vous compte que je suis un marquis? Oui, je ne plaisante pas. Je suis le dix-huitième marquis de ma ligne. Tu veux que je sacrificier tout ça?[line break]-- Il y a un monde entier! plaide le chien[line break]-- J'ai vécu là, ajoute la tranche de cerveau. Je crois que je vivais non loin d'ici avec ma copine… comment s'appelait-elle?", 
"Une petite amie, hein? demande Lucky, interessé.[line break]-- Raconte nous les détails! encourage la souris.[line break]-- À vraiment dire, je ne me souviens de beaucoup, pas même son nom. Cependent je me rapelle qu'elle était bigrement intelligente… elle avait un bon sens de l'humour et une rire plein d'entrain… et des yeux en amande d'un violet profonde… et elle avait des grandes… euh… Zut. J'ai oubli le mot.",
"Penses-tu que tu peux trouver votre maison si nous parvenons à sortir de l'installation? demande Lucky.[line break]-- Ah oui, assurément. Il n'y a que une dizaine de pièces de négocier et nous serons dehors. La maison est toute proche. On a juste de suivre la rue… je ne me souviens pas du nom de la rue, cependent je le reconnaîtrai.[line break]-- Ton amnésie ne m'inspire pas confiance, plaisante la souris.[line break]-- Si nous trouvons le reste du cerveau au cours de notre évasion tout sera réglé."
 }.

Section Everybody Dialogue

EverybodyDialogue is a list of text that varies. 

EverybodyDialogue is { "" }.

Section Cured Dialogue

CuredDialogue is a list of text that varies. 
	
CuredDialogue is { "" }.

Chapter The Void

The void is a room.

The petite créature grise is an edible female thing. It is in the void.

The dépouille saignante du Docteur Rambaud is a female thing in the void. The indefinite article of dépouille saignante du Docteur Rambaud is "la".

The interphone is a buttoned thing in the void. The interphone can be live. The interphone is not live. The interphone is broken.

Instead of pushing the interphone:[only present at consciousness 4]
	if the interphone is not live:
		say "Une petite LED rouge sur l'interphone s'allume indiquant que vous êtes en direct avec la salle de contrôle.";
		now the interphone is live;
	otherwise:
		say "Vouz avez déjà activé l'interphone et sa LED reste allumée."

The panneau électrique is an openable closed container in the void. The disjoncteurs are in the panneau électrique. The disjoncteurs are plural-named. The disjoncteurs are broken. The indefinite article of disjoncteurs is "des". The printed name of the disjoncteurs is "disjoncteurs[if the disjoncteurs are broken] sautés[end if]".

Instead of touching the disjoncteurs:
	say "Vous remettez les disjoncteurs.";
	now the disjoncteurs are not broken;
	if the servomoteur is broken, the breakers flip in two turns from now.

At the time when the breakers flip:
	if the player is in Escalier 1:
		say "Le panneau électrique fait un bruit sec et vous constatez que les disjoncteurs ont de nouveau sautés.";
	now the disjoncteurs are broken.

The unité de synthèse microfluidique is an openable closed container in the void. 

The servomoteur is in the unité de synthèse microfluidique. The servomoteur is broken. The printed name of the servomoteur is "[pnServo]".

To say pnServo:
	say "servomoteur";
	if the servomoteur is not broken:
		say " en état de marche".

After opening the unité de synthèse microfluidique:
	say "Vous ouvrez le panneau d'accès et tout de suite reconnaissez le problème: un écaille de soudure est tombée sur les terminaux d'un servomoteur, créant un court-circuit."
	
Instead of touching the servomoteur:
	now the servomoteur is not broken;
	say "Vous écartez le morceau de soudure. La machine doit fonctionner normalement maintenant."

Chapter End Game

To terminate the game:
	repeat with N running from 1 to 10:
		now the tint of the button in row N of the Table of Glimmr Buttons is g-black;
		now the linked replacement-command of the button in row N of the Table of Glimmr Buttons is "";
	follow the refresh windows rule;
	say "[VictoryText]".
		
To say VictoryText:
	say "[paragraph break][bold type]        *** VOUS AVEZ GAGNÉ ***[roman type][paragraph break]Vouz avez sauvé le monde du fléau du virus zombie777.[paragraph break][bold type]>infos[roman type][line break]Ce jeu participe au Concours Francophone de Fictions Interactives (2017). Il a été écrit en Inform 7.[paragraph break][bold type]>remerciements[roman type][paragraph break]Je voudrais remercier:[paragraph break]* Les organisateurs du concours.[paragraph break]* Graham Nelson pour avoir conçu et écrit la langue Inform 7.[paragraph break]* Les auteurs des modules utilisés dans cet oeuvre: Eric Forgeot, Emily Short, et Erik Temple.[paragraph break]* Ben Collins-Sussman, qui a peint l'art de la couverture à l'aquarelle.[paragraph break]* Les beta-testeurs extraordinaires.[paragraph break][bold type]FIN."
	
Chapter Testing

Test me with "est / ouest / manger / est / ouvrir / nord / ouvrir / manger / pousser / sud / pousser / est / pousser / ouest / sud / ouvrir / manger / manger / manger / nord / ouvrir / nord / ouvrir / ouvrir ".


[ manger / sud / ouest / déverrouiller / ouvrir / ouest / déverrouiller / ouvrir / nord / nord / déverrouiller / ouvrir / nord / parler / parler / parler / parler / parler / manger / sud / sud / sud / est / pousser / est / pousser / ouest / déverrouiller / ouvrir / sud / ouvrir / réparer / nord / pousser / est / pousser / ouest / ouest / nord / ouvrir / réparer / sud / est / pousser / est / pousser / ouest / sud / nord / pousser / est / pousser / ouest / ouest / nord / nord / nord / pousser / parler ".

]






