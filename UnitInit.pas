unit UnitInit;

interface

uses UnitRecord;

procedure initGame(var g: Game); // initialisation les données du jeu

implementation

uses UnitGestion, UnitConst, UnitVille, UnitRecherche, math, GestionEcran, System.SysUtils;

// initialisation les données d'une ville
procedure initVille(var g:Game; var v: Ville);
var
  i: integer;
begin

  v.nourriture := 0;
  v.population := 1;
  v.construction := -1;
  v.avancementConstruction := 0;

  for i := 1 to NOMBRE_BATIMENT do
  begin
    // si la ville appartient a l'ia
    if not proprietaire(g,v.nom)^.joueur then
      v.batiments[i] := 1
    // sinon
    else
      v.batiments[i] := 0;
  end;

end;

// initialisation les données d'une civilisation
procedure initCivilisation(var g:Game; var c: Civilisation);
var
  i, j: integer;
begin

  // si la civilisation est controler par le joueur ou l'ia
  if g.Civilisations[1].nom<>c.nom then
    c.joueur:=false
  else
    c.joueur:=true;

  // choix du nom de la ville suivant la civilisation
  if c.nom = 'France' then
    c.Ville[1].nom := 'Paris'
  else if c.nom = 'Allemagne' then
    c.Ville[1].nom := 'Berlin'
  else if c.nom = 'Espagne' then
    c.Ville[1].nom := 'Madrid'
  else if c.nom = 'Italie' then
    c.Ville[1].nom := 'Rome'
  else if c.nom = 'Russie' then
    c.Ville[1].nom := 'Moscou';

  // la civilisation n'est pas morte
  c.mort := false;

  // la civilisation a une seule ville
  c.nbVille := 1;

  c.argent := 0;
  c.recrutement := 0;
  c.troupe.nom := 'Troupe de ' + c.nom;
  c.troupe.origine := @c;
  c.actionDiplomatique := 0;

  // donne 10 unités de chaque
  for i := 1 to NOMBRE_UNITE do
  begin
    c.troupe.unites[i] := 10;
  end;

  //initialise les villes
  for j := 1 to c.nbVille do
  begin
    initVille(g,c.Ville[j]);
  end;

  c.rechercheCourante := -1;
  c.avancementRecherche := 0;
  initRecherche(c);

  // met les ratio/bonus au valeurs par defauts
  for i := 1 to length(c.ratio) do
  begin
    c.ratio[i] := 1;
  end;
  for i := 1 to length(c.bonus) do
  begin
    c.bonus[i] := 0;
  end;

  // regle les relations diplomatiques en neutre
  for i := 1 to 5 do
  begin
    c.relation[i] := 50;
  end;


end;

procedure initGame(var g: Game);
var
  i: integer;
begin

  // selection de la civilisation, difficulté et attaque barbare
  gestionChoixCivilisation(g);
  gestionChoixDifficulte(g);
  gestionChoixAttaque(g);

  g.tour := 1;
  g.fini := false;
  g.victoire := false;

  // initialise les civilisations
  for i := 1 to 5 do
  begin
    initCivilisation(g,g.Civilisations[i]);
  end;

  //g.Civilisations[1].troupe.unites[1] := 0;

end;

end.
