unit UnitAffichage;

interface

uses UnitRecord;

var
  messageGlobal: string = ''; // la variable qui contient les message d'erreur a afficher
  messageCombat: string = ''; // la variable qui contient le message de combat

procedure afficheAccueil;
// affiche le menu principal
procedure afficheVille(g: Game; c: Civilisation; v: Ville);
// affiche l'ecran de gestion de la ville
procedure afficheMilitaire(g: Game; c: Civilisation);
// affiche l'ecran de gestion militaire
procedure afficheCombat(g: Game; t, tE: Troupe);
// affiche l'ecran de combat
procedure afficheCivilisation(g: Game; c: Civilisation);
// affiche l'ecran de gestion de la civilisation
procedure affichePopup(g: Game; titre, str: string);
// affiche un popup avec le texte 'str' et le titre 'titre'
procedure afficheChoixDifficulte;
// affiche l'ecran de choix de difficulté
procedure afficheChoixAttaque;
// affiche l'ecran de choix des attaques barbares
procedure afficheChoixCivilisation;
// affiche l'ecran de choix de civilisation
procedure afficheFenetre(g: Game; str: string; taille: integer);
// affiche une fenetre de base avec l'entete et le corps, de titre 'str'
procedure afficheRecherche(g: Game; c: Civilisation; pos: integer);
// affiche l'ecran de gestion des recherches
procedure afficheDiplomatie(g: Game; c: Civilisation);
// affiche l'ecran de gestion diplomatique
procedure afficheSave(decal: integer);
// affiche le menu de sauvegarde
function afficheQuestion(str: String): string;
// pose une question 'str' a l'utilisateur et renvoie un string
procedure afficheMessage();overload;
// affiche le message global en bas a droite
procedure afficheDetailDiplomatie(g: Game; num: integer);
// affiche le menu de choix diplomatique
procedure afficheSaisie; overload;
// affiche le cadre en bas a droite et place le curseur

implementation

uses UnitVille, UnitMilitaire, UnitConst, UnitRecherche, GestionEcran, Windows,
  System.SysUtils, Math;

function repetChar(c: char; count: integer): string;
// renvoie 'count' fois le caractere 'c'
var
  i: integer; // compteur allant de 1 a 'count'
  str: string; // la chaine de sortie
begin
  str := '';
  for i := 1 to count do
  begin
    str := str + c;
  end;
  result := str;
end;

procedure writeMilieu(str: string; x, y, x2: integer);
// affiche une chaine au abscisse centre des coordonnées x x2, et en ordonnées y
begin
  deplacerCurseurXY(round((x2 + x) / 2 - length(str) / 2), y);
  write(str)
end;

procedure writeColor(str: string);
// affiche une chaine 'str' avec chaque caractere une couleur aleatoire (très utile)
var
  i: integer;
  // compteur allant de 1 a la longueur de la chaine a afficher en couleurs
begin
  for i := 1 to length(str) do
  begin
    couleurTexte(random(15) + 1);
    write(str[i]);
  end;
end;

procedure write3Color(str: string; c1, c2, c3: Byte);
// affiche une chaine 'str' avec le premier, deuxieme et troisieme tier en couleur 'c1', 'c2' et 'c3'
var
  i: integer;
  // compteur allant de 1 a la longueur de la chaine a afficher en trois couleurs
begin
  for i := 1 to length(str) do
  begin
    couleurTexte(c1);
    if i > length(str) / 3 then
      couleurTexte(c2);

    if length(str) mod 3 = 0 then
    begin
      if i > 2 * length(str) / 3 then
        couleurTexte(c3);
    end
    else
    begin
      if i >= 2 * ceil(length(str) / 3) then
        couleurTexte(c3);
    end;

    write(str[i]);
  end;
  couleurTexte(15);
end;

procedure afficheEntete(g: Game);
// affiche l'entete en haut de la fenetre
var
  str: string; // chaine a affiché au milieu (montant du trésor)
begin
  dessinerCadreXY(0, 0, 119, 4, simple, 15, 0);

  deplacerCurseurXY(2, 2);
  write('Civilisation : ');
  if (g.Civilisations[1].nom = 'France') then
    write3Color(g.Civilisations[1].nom, 9, 15, 12);
  if (g.Civilisations[1].nom = 'Allemagne') then
    write3Color(g.Civilisations[1].nom, 8, 14, 4);
  if (g.Civilisations[1].nom = 'Italie') then
    write3Color(g.Civilisations[1].nom, 2, 15, 4);
  if (g.Civilisations[1].nom = 'Espagne') then
    write3Color(g.Civilisations[1].nom, 4, 14, 4);
  if (g.Civilisations[1].nom = 'Russie') then
    write3Color(g.Civilisations[1].nom, 15, 1, 4);

  couleurTexte(14);
  str := 'Montant du trésor : ' + IntToStr(g.Civilisations[1].argent);
  // deplacerCurseurXY(round((119 - length(str)) / 2), 2);
  writeMilieu(str, 0, 2, 120);
  couleurTexte(15);

  deplacerCurseurXY(108, 2);
  write('Tour : ', g.tour);
end;

procedure afficheSaisie(pos: integer); overload;
// affiche le rectangle en bas a droite a la hauteur pos et place le curseur au milieu
begin
  dessinerCadreXY(108, pos, 116, 2 + pos, double, 14, 0);
  deplacerCurseurXY(112, 1 + pos);
  couleurTexte(15);
end;

procedure afficheSaisie; overload;
// affiche le rectangle en bas a droite et place le curseur au milieu
begin
  dessinerCadreXY(108, 36, 116, 38, double, 14, 0);
  deplacerCurseurXY(112, 37);
  couleurTexte(15);
end;

procedure afficheMessage; overload;
// affiche le texte d'erreur eventuel a gauche du rectangle de saisie
begin
  deplacerCurseurXY(106 - length(messageGlobal), 37);
  write(messageGlobal);
  messageGlobal := '';
end;

procedure afficheMessage(pos: integer); overload;
// affiche le texte d'erreur eventuel a gauche du rectangle de saisie a la hauteur pos
begin
  deplacerCurseurXY(106 - length(messageGlobal), pos);
  write(messageGlobal);
  messageGlobal := '';
end;

procedure afficheTitre(str: String);
// affiche le titre str au centre de la fenetre
begin
  writeMilieu(str, 0, 6, 120);
  couleurTexte(12);
  writeMilieu(repetChar('-', length(str)), 0, 7, 120);
  couleurTexte(15);
end;

function afficheQuestion(str: String): string;
// pose une question 'str' a l'utilisateur et renvoie un string
var
  i: integer;
begin
  dessinerCadreXY(min(40, round(60 - length(str) / 2) - 2), 17, max(80, round(60 + length(str) / 2) + 2), 24, simple, 15, 0);
  deplacerCurseurXY(round(60 - length(str) / 2), 19);
  write(str);
  deplacerCurseurXY(round(60 - length(str) / 2) + 1, 22);
  write('■ ');
  readln(result);
end;

procedure affichePopup(g: Game; titre, str: string);
// affiche un popup 'str' qui se passe en appuyant sur entrée
begin
  effacerEcran;
  afficheEntete(g);
  afficheTitre(titre);

  writeMilieu(repetChar('-', length(str)), 0, 19, 120);
  writeMilieu(str, 0, 20, 120);
  writeMilieu(repetChar('-', length(str)), 0, 21, 120);

  afficheMessage;

  afficheSaisie;
  readln;
end;

procedure afficheFenetre(g: Game; str: string; taille: integer);
// affiche ce qui compose une fenetre de base : entete,cadre,titre
begin
  effacerEcran;
  afficheEntete(g);
  dessinerCadreXY(0, 4, 119, taille - 1, simple, 15, 0);
  afficheTitre(str);
end;

procedure afficheDetailVille(g: Game; c: Civilisation; v: Ville; decal: integer);
// affiche toutes les infos d'une ville
begin

  deplacerCurseurXY(4, decal);
  write('Nom : ', v.nom); // nom
  deplacerCurseurXY(4, decal + 1);
  write('Population : ');
  couleurTexte(15);
  write(v.population); // population
  couleurTexte(15);

  deplacerCurseurXY(26, decal);
  write('Nourriture : ');
  couleurTexte(10);
  write(v.nourriture); // nourriture
  couleurTexte(15);
  write(' / ');
  if nourriturePourCroissance(c, v) <> -1 then
  begin
    couleurTexte(2);
    write(nourriturePourCroissance(c, v)) // nourriture pour croissance
  end
  else
  begin
    couleurTexte(12);
    write('*');
  end;
  couleurTexte(15);

  deplacerCurseurXY(26, decal + 1);
  write('Nourriture par tour : ');

  if nourritureParTour(c, v) > 0 then
    couleurTexte(10)
  else
    couleurTexte(12);
  write(nourritureParTour(c, v)); // nourriture par tour
  couleurTexte(15);

  deplacerCurseurXY(26, decal + 2);
  write('Nb tour avant croissance : ');
  if tourPourCroissance(c, v) <> -1 then
  begin
    couleurTexte(2);
    write(tourPourCroissance(c, v)) // tour pour croissance
  end
  else
  begin
    couleurTexte(12);
    write('*');
  end;
  couleurTexte(15);

  deplacerCurseurXY(64, decal);
  write('Travail par tour : ');
  couleurTexte(7);
  write(travailParTour(c, v):1:2); // travail par tour
  couleurTexte(15);

  deplacerCurseurXY(64, decal + 1);
  if v.construction <> -1 then
  begin
    write('Construction : ');
    couleurTexte(8);
    write(nomBatiment(v.construction)); // nom de la construction en cours
    couleurTexte(15);
    deplacerCurseurXY(64, decal + 2);
    write('Avancement : ');
    couleurTexte(7);
    write(v.avancementConstruction:1:2); // avancement de la construction
    couleurTexte(15);
    write('/');
    couleurTexte(8);
    write(travailRequis(g, c, v));
    couleurTexte(15);
  end
  else
    write('Pas de construction');

  deplacerCurseurXY(95, decal);
  write('Argent par tour : ');
  if argentParTourVille(c, v) > 0 then
    couleurTexte(14)
  else
    couleurTexte(12);
  write(argentParTourVille(c, v)); // argent par tour
  couleurTexte(15);

  deplacerCurseurXY(95, decal + 1);
  write('Niveau bonheur : ');
  if (bonheur(c, v) >= 0) and (bonheur(c, v) < 25) then
    couleurTexte(12)
  else if (bonheur(c, v) >= 25) and (bonheur(c, v) < 50) then
    couleurTexte(14)
  else if (bonheur(c, v) >= 50) and (bonheur(c, v) <= 100) then
    couleurTexte(10);

  write(bonheur(c, v), '%'); // niveau de bonheur
  couleurTexte(15);

  deplacerCurseurXY(95, decal + 2);
  write('Rche par tour : ');
  couleurTexte(11);
  write(RechercheParTourVille(c, v)); // point de recherche par tour
  couleurTexte(15);
end;

procedure afficheBatiments(g: Game; c: Civilisation; v: Ville);
// affiche la liste des batiment construit
var
  decalage: integer;
  // entier donnant le decalage des ligne, evolue suivant le nombre de batiment a affiché
  i: integer; // compteur
begin
  decalage := 0;

  // pour chaque batiment on affiche son nom et niveau
  for i := 1 to NOMBRE_BATIMENT do
  begin
    deplacerCurseurXY(4, 14 + decalage);
    if (v.batiments[i] > 0) or (v.construction = i) then
    begin
      write('- ', nomBatiment(i), ' (niv ', v.batiments[i], ')');
      if v.construction = i then
      begin
        write(' (construction ', v.avancementConstruction:1:2, '/', travailRequis(g, c, v), ')');
      end;
      decalage := decalage + 1;
    end;
  end;

end;

procedure afficheVille(g: Game; c: Civilisation; v: Ville);
// affiche l'ecran de gestion de la ville
var
  decalage, i: integer;
  // entier donnant le decalage des ligne, evolue suivant le nombre de batiment a affiché
begin
  afficheFenetre(g, 'Vue détaillée de : ' + v.nom, 40);

  afficheDetailVille(g, c, v, 9);

  deplacerCurseurXY(2, 13);
  write('Batiment construits :');

  afficheBatiments(g, c, v);

  decalage := nombreBatiment(v);

  // affichage des batiments possible
  for i := 1 to NOMBRE_BATIMENT do
  begin
    deplacerCurseurXY(2, 16 + decalage);
    write(i, ' - ', nomBatiment(i));
    decalage := decalage + 1;
  end;

  // affichage des choix
  deplacerCurseurXY(2, 18 + decalage);
  write('1..', length(v.batiments), ' - Construire/Améliorer batiment');

  deplacerCurseurXY(2, 21 + decalage);
  write('0 - Retour au menu principal');

  afficheMessage;

  afficheSaisie;
end;

procedure afficheMilitaire(g: Game; c: Civilisation);
// affiche l'ecran de gestion militaire
var
  i: integer; // compteur allant de 1 a NOMBRE_UNITE
  decalage: integer;
  // entier donnant le decalage des ligne, evolue suivant le nombre d'unités a affiché
begin

  afficheFenetre(g, 'Ecran de gestion militaire', 40);

  // details des troupe disponibles
  deplacerCurseurXY(2, 10);
  write('Liste des troupes disponibles :');
  deplacerCurseurXY(2, 11);
  write('-------------------------------');

  decalage := 0;
  // pour chaque unités on affiche sont nom et ça quantité
  for i := 1 to NOMBRE_UNITE do
  begin
    deplacerCurseurXY(4, 12 + decalage);
    write(i, ' - ', nomUnite(i), repetChar(' ', 1 + longueurMaxUnite() - length(nomUnite(i))), ': ', c.Troupe.unites[i]);
    decalage := decalage + 1;
  end;

  // les point de recrutements
  deplacerCurseurXY(2, 14 + decalage);
  write('Point de recrutements : ');
  if c.recrutement > 0 then
    couleurTexte(10)
  else
    couleurTexte(12);
  write(c.recrutement);
  couleurTexte(15);

  // affichage des choix
  deplacerCurseurXY(2, 16 + decalage);
  write('1..', NOMBRE_UNITE, ' - Recruter une unité ');

  deplacerCurseurXY(2, 18 + decalage);
  write('Lancer une attaque :');
  deplacerCurseurXY(2, 19 + decalage);
  write('--------------------');
  deplacerCurseurXY(2, 21 + decalage);
  write(NOMBRE_UNITE + 1, ' - Camp barbare');
  deplacerCurseurXY(2, 22 + decalage);
  write(NOMBRE_UNITE + 2, ' - Conquerir une cité ennemie');

  deplacerCurseurXY(2, 25 + decalage);
  write('0 - Retour au menu principal');

  afficheMessage;

  afficheSaisie;
end;

procedure afficheMessageCombat; // affiche le details de chaque tour de combat
var
  ligne1, ligne2, ligne3, ligne4: string;
  // chaine contenant la ligne 1, 2, 3 et 4 du detail du combat a afficher
begin
  // decoupage du message en 4 lignes
  ligne1 := Copy(messageCombat, 1, pos('et', messageCombat) - 1);
  Delete(messageCombat, 1, length(ligne1));
  ligne2 := Copy(messageCombat, 1, pos('.', messageCombat));
  Delete(messageCombat, 1, length(ligne2));
  ligne3 := Copy(messageCombat, 1, pos('et', messageCombat) - 1);
  Delete(messageCombat, 1, length(ligne3));
  ligne4 := Copy(messageCombat, 1, pos('.', messageCombat));
  // affichage des 4 lignes
  deplacerCurseurXY(59, 9);
  write(ligne1);
  deplacerCurseurXY(59, 10);
  write(ligne2);
  deplacerCurseurXY(59, 11);
  write(ligne3);
  deplacerCurseurXY(59, 12);
  write(ligne4);
  messageCombat := '';
end;

procedure afficheCombat(g: Game; t, tE: Troupe);
// affiche l'ecran de combat
var
  i: integer; // compteur allant de 1 a NOMBRE_UNITE
  decalage: integer;
  // entier donnant le decalage des ligne, evolue suivant le nombre d'unités a affiché
begin

  afficheFenetre(g, 'Combat contre : ' + tE.nom, 40);

  // affiche la listes des troupes disponibles
  deplacerCurseurXY(2, 9);
  write('Descriptif de vos forces :');
  deplacerCurseurXY(2, 10);
  write('-------------------------------------');
  couleurTexte(1);
  decalage := 0;
  // pour chaque unités affiche son nom et sa quantité, et saute une ligne
  for i := 1 to NOMBRE_UNITE do
  begin
      deplacerCurseurXY(4, 11 + decalage);
      write(nomUnite(i), repetChar(' ', 1 + longueurMaxUnite() - length(nomUnite(i))), ': ', t.unites[i]);
      decalage := decalage + 1;
  end;
  couleurTexte(15);

  // affiche la listes des troupes ennemies
  deplacerCurseurXY(2, 13 + decalage);
  write('Descriptif des forces ennemies :');
  deplacerCurseurXY(2, 14 + decalage);
  write('-------------------------------------');
  couleurTexte(4);
  // pour chaque unités affiche son nom et sa quantité, et saute une ligne
  for i := 1 to NOMBRE_UNITE do
  begin
    deplacerCurseurXY(4, 15 + decalage);
    write(nomUnite(i), repetChar(' ', 1 + longueurMaxUnite() - length(nomUnite(i))), ': ', tE.unites[i]);
    decalage := decalage + 1;
  end;
  couleurTexte(15);

  // liste des choix
  for i := 1 to NOMBRE_UNITE do
  begin
    deplacerCurseurXY(2, 17 + decalage);
    write(i, '- Attaquer les ', LowerCase(nomUnite(i)), ' ennemis');
    decalage := decalage + 1;
  end;

  afficheMessageCombat;
  afficheMessage;

  afficheSaisie;

end;

procedure afficheDetailDiplomatie(g: Game; num: integer);
// affiche les options diplomatique apres avoir selectionné une civilisation
begin

  deplacerCurseurXY(4, 23);
  write('                                         ');
  deplacerCurseurXY(4, 23);
  write('Civilisation : ', g.Civilisations[num].nom);
  deplacerCurseurXY(4, 25);
  write('1 - Complimenter');
  deplacerCurseurXY(4, 26);
  write('2 - Envoyer argent');
end;

procedure afficheDiplomatie(g: Game; c: Civilisation);
// affiche l'ecran de gestion diplomatique
var
  i, j: integer;
  x1, x2: integer;
  decal: integer;
begin

  afficheFenetre(g, 'Gestion Diplomatique', 40);

  // affiche des 4 rectangle de civilisation
  for i := 2 to 5 do
  begin
    x1 := 28 * (i - 2) + (i - 2) + 3;
    x2 := 28 * (i - 1) + (i - 2) + 1;

    // affichage des cadres
    if g.Civilisations[i].nbVille = 0 then
      dessinerCadreXY(x1, 10, x2, 20, double, 0, 15)
    else
    begin
      if c.relation[i] <= 0 then
        dessinerCadreXY(x1, 10, x2, 20, double, 15, 12)
      else if c.relation[i] >= 100 then
        dessinerCadreXY(x1, 10, x2, 20, double, 15, 2)
      else
        dessinerCadreXY(x1, 10, x2, 20, double, 15, 0)
    end;
    // affichage des noms
    writeMilieu(g.Civilisations[i].nom, x1, 11, x2);
    writeMilieu(repetChar('-', length(g.Civilisations[i].nom)), x1, 12, x2);

    // affichage de l'etat de la relation
    deplacerCurseurXY(x1 + 3, 14);
    write('Relation : ');
    if c.relation[i] = 0 then
      write('En guerre');
    if (c.relation[i] > 0) and (c.relation[i] <= 25) then
      write('Tendu');
    if (c.relation[i] > 25) and (c.relation[i] < 75) then
      write('Neutre');
    if (c.relation[i] >= 75) and (c.relation[i] < 100) then
      write('Amicale');
    if c.relation[i] = 100 then
      write('Alliée');

    // affichage de la liste des villes
    deplacerCurseurXY(x1 + 3, 16);
    write('Ville : ');
    for j := 1 to g.Civilisations[i].nbVille do
    begin
      deplacerCurseurXY(x1 + 2, 17 + j);
      write('■ ', g.Civilisations[i].Ville[j].nom);
    end;
  end;
  couleurFond(0);
  couleurTexte(15);

  // affichage du nombre d'action possible
  writeMilieu('Action effectué (' + IntToStr(c.actionDiplomatique) + '/' + IntToStr(actionPossible(c)) + ')', 1, 22, 120);

  // affichage des choix
  deplacerCurseurXY(4, 23);
  write('1..4 - Interagir avec la civilisation');
  deplacerCurseurXY(4, 37);
  write('0 - Retour au menu principal');

  afficheMessage;

  afficheSaisie;

end;

procedure afficheSave(decal: integer);
// affiche les options de save
begin
  deplacerCurseurXY(4, 22 + decal);
  writeln('Voulez-vous sauvegardez ?');
  deplacerCurseurXY(4, 23 + decal);
  writeln('1 - Oui');
  deplacerCurseurXY(4, 24 + decal);
  writeln('2 - Non');
  deplacerCurseurXY(4, 25 + decal);
  write('0 - Annuler');
  deplacerCurseurXY(30, 22 + decal);
end;

procedure afficheCivilisation(g: Game; c: Civilisation);
// affiche l'ecran de gestion de la civilisation
var
  decal: integer;
  i: integer;
begin
  decal := 0;
  afficheFenetre(g, 'Ecran de gestion de la civilisation', max(40, 27 + 4 * c.nbVille));

  deplacerCurseurXY(2, 9);
  write('Liste des villes de la civilisation :');
  deplacerCurseurXY(2, 10);
  couleurTexte(14);
  write('-------------------------------------');
  couleurTexte(15);

  // affichage de la liste des villes
  for i := 1 to c.nbVille do
  begin
    dessinerCadreXY(2, 12 + decal, 117, 16 + decal, simple, 15, 0);
    afficheDetailVille(g, c, c.Ville[i], 13 + decal);
    decal := decal + 4;
  end;

  // affichage des choix
  deplacerCurseurXY(4, 14 + decal);
  write('1..5 - Gestion de ville');
  deplacerCurseurXY(4, 15 + decal);
  write('m - Gestion militaire');
  deplacerCurseurXY(4, 16 + decal);
  write('r - Recherches');
  deplacerCurseurXY(4, 17 + decal);
  write('d - Diplomatie');

  deplacerCurseurXY(4, 19 + decal);
  write('9 - Fin du tour');
  deplacerCurseurXY(4, 20 + decal);
  write('0 - Quitter la partie');

  afficheMessage(max(37, 24 + c.nbVille * 4));

  afficheSaisie(max(36, 23 + 4 * c.nbVille));
end;

procedure afficheRecherche(g: Game; c: Civilisation; pos: integer);
// affiche l'ecran de gestion des recherches
var
  i, decal: integer;
  car: char;
begin

  effacerEcran;
  afficheEntete(g);

  // affichage du cadre de gauche
  dessinerCadreXY(0, 5, 25, 39, simple, 15, 0);

  // affichage de l'entéte du cadre de gauche
  dessinerCadreXY(1, 6, 24, 10, double, 15, 0);
  deplacerCurseurXY(4, 7);
  write('Recherche en cours');
  deplacerCurseurXY(8, 9);
  if c.rechercheCourante = -1 then
    writeMilieu('Aucune', 0, 9, 25)
  else
    writeMilieu(c.recherches[c.rechercheCourante].titre + ' (' + IntToStr(c.avancementRecherche) + '/' + IntToStr(c.recherches[c.rechercheCourante].cout) + ')', 0, 9, 25);

  // affichage de la liste des recherches
  for i := 1 to length(c.recherches) do
  begin
    deplacerCurseurXY(5, 11 + i);
    if c.recherches[i].fini then
      couleurTexte(10);
    if i = c.rechercheCourante then
      couleurTexte(9);
    if not prerequis(i, c.recherches) then
      couleurTexte(12);
    write(c.recherches[i].titre);
    couleurTexte(15);
  end;

  // affichage du curseur
  deplacerCurseurXY(2, 11 + pos);
  write('->');

  // affichage du cadre de droite
  dessinerCadreXY(26, 5, 119, 39, simple, 15, 0);

  // affichage des details de la recherche selectionné
  writeMilieu('Recherche : ' + c.recherches[pos].titre, 26, 7, 119);
  writeMilieu(repetChar('-', length('Recherche : ' + c.recherches[pos].titre)), 26, 8, 119);
  deplacerCurseurXY(28, 10);
  write(c.recherches[pos].description);
  deplacerCurseurXY(28, 12);
  write('Effet : ');
  decal := 0;
  for i := 1 to length(c.recherches[pos].effet) do
  begin
    if c.recherches[pos].effet[i] <> '' then
    begin
      deplacerCurseurXY(28, 13 + decal);
      write('■ ', c.recherches[pos].effet[i]);
      decal := decal + 1;
    end;
  end;
  deplacerCurseurXY(28, 14 + decal);
  write('Point de recherche : ', c.recherches[pos].cout);
  deplacerCurseurXY(28, 16 + decal);
  write('Prerequis : ');
  for i := 1 to length(c.recherches[pos].prerequis) do
  begin
    if c.recherches[pos].prerequis[i] <> -1 then
    begin
      deplacerCurseurXY(28, 17 + decal);
      write('■ ', c.recherches[c.recherches[pos].prerequis[i]].titre);
      decal := decal + 1;
    end;
  end;

  // affichage des choix
  dessinerCadreXY(105, 30, 118, 35, simple, 15, 0);
  deplacerCurseurXY(107, 31);
  write('->     : +');
  deplacerCurseurXY(107, 32);
  write('<-     : -');
  deplacerCurseurXY(107, 33);
  write('Lancer : 1');
  deplacerCurseurXY(107, 34);
  write('Retour : 0');

  afficheMessage;

  afficheSaisie;

end;

procedure afficheAccueil;
// affiche l'ecran d'acceuil
begin
  effacerEcran;
  couleurTexte(7);
  writeln('');
  writeln('');
  writeln('');
  writeln('                     ══════════════════════════════════════════════════════════════════════════════');
  writeln('');
  writeln('              ██████╗██╗██╗   ██╗██╗██╗     ██╗███████╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗     ██████╗ ');
  writeln('             ██╔════╝██║██║   ██║██║██║     ██║╚══███╔╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║    ██╔═████╗');
  writeln('             ██║     ██║██║   ██║██║██║     ██║  ███╔╝ ███████║   ██║   ██║██║   ██║██╔██╗ ██║    ██║██╔██║');
  writeln('             ██║     ██║╚██╗ ██╔╝██║██║     ██║ ███╔╝  ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║    ████╔╝██║');
  writeln('             ╚██████╗██║ ╚████╔╝ ██║███████╗██║███████╗██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║    ╚██████╔╝');
  writeln('              ╚═════╝╚═╝  ╚═══╝  ╚═╝╚══════╝╚═╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝     ╚═════╝ ');
  writeln('');
  writeln('                     ══════════════════════════════════════════════════════════════════════════════');
  writeln('');
  couleurTexte(15);
  writeln('Bienvenu dans CIVILIZATION 0 - Call to Coding');
  writeln('');
  write('Batissez un empire qui laissera sa marque dans l''histoire, depuis ses premiers pas à l''époque de l''Antiquité jusqu''en l''');
  write('an 3000. Lancez-vous dans une conquête au cours de laquelle chaque stratégie que vous concevez, chaque découverte techno');
  write('logique que vous faites et chaque guerre que vous déclarez a des répercussions sur l''avenir de votre empire. Répondez à ');
  writeln('l''appel du pouvoir. L''avenir est entre vos mains.');
  writeln('');
  writeln('     1 - Débuter une nouvelle partie');
  writeln('');
  writeln('     2 - Charger une partie');
  writeln('');
  writeln('     3 - Quitter le jeu');
  writeln('');
  write('     Choix : ');
end;

procedure afficheChoixCivilisation;
// affiche l'ecran de choix de civilisation
begin
  effacerEcran;
  couleurTexte(7);
  writeln('');
  writeln('');
  writeln('');
  writeln('');
  writeln('                     ══════════════════════════════════════════════════════════════════════════════');
  writeln('');
  writeln('                    ██████╗██╗██╗   ██╗██╗██╗     ██╗███████╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗');
  writeln('                   ██╔════╝██║██║   ██║██║██║     ██║██╔════╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║');
  writeln('                   ██║     ██║██║   ██║██║██║     ██║███████╗███████║   ██║   ██║██║   ██║██╔██╗ ██║');
  writeln('                   ██║     ██║╚██╗ ██╔╝██║██║     ██║╚════██║██╔══██║   ██║   ██║██║   ██║██║╚██╗██║');
  writeln('                   ╚██████╗██║ ╚████╔╝ ██║███████╗██║███████║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║');
  writeln('                    ╚═════╝╚═╝  ╚═══╝  ╚═╝╚══════╝╚═╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝');
  writeln('');
  writeln('                     ══════════════════════════════════════════════════════════════════════════════');
  writeln('');
  writeln('');
  writeln('');
  couleurTexte(15);
  writeln('    Choix de votre civilisation :');
  writeln('');
  writeln('     1 : France');
  writeln('');
  writeln('     2 : Allemagne');
  writeln('');
  writeln('     3 : Espagne');
  writeln('');
  writeln('     4 : Italie');
  writeln('');
  writeln('     5 : Russie');
  writeln('');
  write('     Choix : ');

end;

procedure afficheChoixDifficulte;
// affiche l'ecran de choix de difficulté
begin
  effacerEcran;
  couleurTexte(7);
  writeln('');
  writeln('');
  writeln('');
  writeln('');
  writeln('                     ══════════════════════════════════════════════════════════════════════════════');
  writeln('');
  writeln('                      ██████╗ ██╗███████╗███████╗██╗ ██████╗██╗   ██╗██╗  ████████╗███████╗███████╗ ');
  writeln('                      ██╔══██╗██║██╔════╝██╔════╝██║██╔════╝██║   ██║██║  ╚══██╔══╝██╔════╝██╔════╝  ');
  writeln('                      ██║  ██║██║█████╗  █████╗  ██║██║     ██║   ██║██║     ██║   █████╗  ███████╗ ');
  writeln('                      ██║  ██║██║██╔══╝  ██╔══╝  ██║██║     ██║   ██║██║     ██║   ██╔══╝  ╚════██║  ');
  writeln('                      ██████╔╝██║██║     ██║     ██║╚██████╗╚██████╔╝███████╗██║   ███████╗███████║  ');
  writeln('                      ╚═════╝ ╚═╝╚═╝     ╚═╝     ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝   ╚══════╝╚══════╝  ');
  writeln('');
  writeln('                     ══════════════════════════════════════════════════════════════════════════════');
  writeln('');
  writeln('');
  writeln('');
  couleurTexte(15);
  writeln('     1 - Difficulte Paysan (facile)');
  writeln('');
  writeln('     2 - Difficulte Seigneur Feodal (intermediaire)');
  writeln('');
  writeln('     3 - Difficulte Empereur (difficile)');
  writeln('');
  write('     Choix : ');

end;

procedure afficheChoixAttaque;
// affiche l'ecran de choix des attaques barbares
begin
  effacerEcran;
  couleurTexte(7);
  writeln('');
  writeln('');
  writeln('');
  writeln('');
  writeln('                     ══════════════════════════════════════════════════════════════════════════════');
  writeln('');
  writeln('                                █████╗ ████████╗████████╗ █████╗  ██████╗ ██╗   ██╗███████╗');
  writeln('                               ██╔══██╗╚══██╔══╝╚══██╔══╝██╔══██╗██╔═══██╗██║   ██║██╔════╝');
  writeln('                               ███████║   ██║      ██║   ███████║██║   ██║██║   ██║█████╗  ');
  writeln('                               ██╔══██║   ██║      ██║   ██╔══██║██║▄▄ ██║██║   ██║██╔══╝  ');
  writeln('                               ██║  ██║   ██║      ██║   ██║  ██║╚██████╔╝╚██████╔╝███████╗');
  writeln('                               ╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚═╝  ╚═╝ ╚══▀▀═╝  ╚═════╝ ╚══════╝');
  writeln('');
  writeln('                     ══════════════════════════════════════════════════════════════════════════════');
  writeln('');
  writeln('');
  writeln('');
  couleurTexte(15);
  writeln('     Voulez vous activez les attaques de barbares ? (à chaque fin de tour il y a un risque d''attaque)');
  writeln('');
  writeln('     1 - Oui');
  writeln('');
  writeln('     2 - Non');
  writeln('');
  write('     Choix : ');
end;

end.
