unit UnitUpdate;

interface

uses UnitRecord;

procedure updateGame(var g: Game); // mise a jour du jeu entre chaque tour

implementation

uses UnitMilitaire, UnitConst, UnitVille, UnitGestion, UnitAffichage,
  GestionEcran;

procedure event(var g: Game);
// gerer le lancement d'evenement aleatoire comme les attaques barbares
var
  i: integer;
begin
  Randomize;

  // chance d'attaque barbare
  if (g.tour > TOUR_DEBUT_ATTAQUE) and (g.attaque) then
  begin
    if (random(CHANCE_ATTAQUE_PAR_TOUR) = 0) then
    begin
      attaqueDeBarbare(g, g.Civilisations[1].Ville[g.Civilisations[1].nbVille]);
    end;
  end;

  // chance d'attaque de civilisation ennemie
  for i := 2 to 5 do
  begin
    if (g.Civilisations[1].relation[i] = 0) and (not g.Civilisations[i].mort) and (totalSoldat(g.Civilisations[i].Troupe) > 0) then
    begin
      if (random(CHANCE_ATTAQUE_PAR_TOUR) = 0) then
      begin
        attaqueDeCivilisation(g, g.Civilisations[i], g.Civilisations[1].Ville[g.Civilisations[1].nbVille]);
      end;
    end;
  end;

  {
    if random(1000)=0 then
    begin
    affichePopup(g, '', 'Un tremblement de terre secoue votre ville');
    affichePopup(g, '', 'Un batiment est détruit');
    end;
  }
end;

procedure updateBatiments(var g: Game; var c: Civilisation; var v: Ville);
// mise a jour des batiments
begin

  // si une construction est en cours
  if v.construction <> -1 then
  begin
    v.avancementConstruction := v.avancementConstruction + travailParTour(c, v);
  end;

  // si une construction est terminée
  if v.avancementConstruction >= travailRequis(g, c, v) then
  begin
    v.batiments[v.construction] := v.batiments[v.construction] + 1;
    v.construction := -1;
    v.avancementConstruction := 0;
  end;

end;

procedure updateVille(var g: Game; var c: Civilisation; var v: Ville);
// mise a jour de la ville
begin

  // update de l'avancement des construction
  updateBatiments(g, c, v);

  v.nourriture := v.nourriture + nourritureParTour(c, v);

  // update de la croissance
  if nourriturePourCroissance(c, v) <> -1 then
  begin
    repeat
      if nourriturePourCroissance(c, v) <= v.nourriture then
      begin
        v.nourriture := round(v.nourriture - nourriturePourCroissance(c, v));
        v.population := v.population + 1;
      end;
    until nourriturePourCroissance(c, v) > v.nourriture;
  end;

  // si en perte de nourriture
  if v.nourriture < 0 then
  begin
    v.population := v.population + v.nourriture;
    if v.population < 0 then
    begin
      v.population := 0;
    end;
    v.nourriture := 0;
  end;

end;

procedure updateRatio(var c: Civilisation);
// met a jour les ratios et bonus pouvant etre apportée par les recherches
var
  i, j: integer;
begin

  // mise a jour des ratios
  for i := 1 to length(c.ratio) do
  begin
    c.ratio[i] := 1;
    c.bonus[i] := 0;
    for j := 1 to NOMBRE_RECHERCHE do
    begin
      if c.recherches[j].fini then
      begin
        c.ratio[i] := c.ratio[i] * c.recherches[j].ratio[i];
        c.bonus[i] := c.bonus[i] + c.recherches[j].bonus[i];
      end;

    end;
  end;
end;

procedure updateRecherche(var g: Game; var c: Civilisation);
// mise a jour des recherches si recherche en cours
var
  i: integer;
begin

  if c.rechercheCourante <> -1 then
  begin
    c.avancementRecherche := c.avancementRecherche + rechercheParTour(c);

    if c.avancementRecherche >= c.recherches[c.rechercheCourante].cout then
    begin
      affichePopup(g, '', 'Recherche terminée : ' + c.recherches[c.rechercheCourante].titre);
      c.recherches[c.rechercheCourante].fini := true;
      c.avancementRecherche := 0;
      c.rechercheCourante := -1;
    end;
  end;

  updateRatio(c);

end;

procedure updateIA(var g: Game; var c: Civilisation);
// fait jouer la civilisation ennemie
begin

  Randomize;

  // construction
  if c.Ville[1].construction = -1 then
    c.Ville[1].construction := random(8) + 1;

  // recrutement
  repeat
    if c.argent >= 2 then
    begin
      c.Troupe.unites[4] := c.Troupe.unites[4] + 1;
      c.argent := c.argent - 2;
    end;
  until (c.argent = 0);
  repeat
    if c.recrutement >= 1 then
    begin
      c.Troupe.unites[1] := c.Troupe.unites[1] + 1;
      c.recrutement := c.recrutement - 1;
    end;
  until (c.recrutement = 0);

end;

procedure updateCivilisation(var g: Game; var c: Civilisation);
// mise a jour de la civilisation
var
  i: integer;
begin

  if c.joueur = false then
    updateIA(g, c);

  // update de toute les villes
  for i := 1 to c.nbVille do
  begin
    updateVille(g, c, c.Ville[i]);

    if (c.Ville[i].population = 0) and (c.joueur) then
    begin
      affichePopup(g, '', 'Votre ville est detruite');
      c.nbVille := c.nbVille - 1;
    end;
  end;

  updateRecherche(g, c);

  c.recrutement := recrutementParTour(c);
  c.actionDiplomatique := 0;
  c.argent := c.argent + argentParTour(c);

end;

procedure updateGame(var g: Game);
var
  i: integer;
begin
  event(g);

  // update des civilisations
  for i := 1 to 5 do
  begin

    updateCivilisation(g, g.Civilisations[i]);

    // si plus aucune ville au joueur
    if (g.Civilisations[i].nbVille = 0) and (g.Civilisations[i].joueur) and (not g.Civilisations[i].mort) then
    begin
      g.Civilisations[i].mort := true;
      affichePopup(g, '', 'Votre civilisation est anéantie');
    end;
    // si plus aucune ville a une civilisation ennemie
    if (g.Civilisations[i].nbVille = 0) and (not g.Civilisations[i].joueur) and (not g.Civilisations[i].mort) then
    begin
      g.Civilisations[i].mort := true;
      affichePopup(g, '', g.Civilisations[i].nom + ' est anéantie');
    end;

  end;

  // si victoire
  if (g.Civilisations[2].nbVille + g.Civilisations[3].nbVille + g.Civilisations[4].nbVille + g.Civilisations[5].nbVille = 0) and (not g.victoire) then
  begin
    affichePopup(g, '', 'Bravo, vous avez tuer tout vos adversaire');
    g.victoire := true;
  end;

  // si defaite
  if g.Civilisations[1].mort then
  begin
    affichePopup(g, '', 'Game over');
    g.fini := true;
  end;

  g.tour := g.tour + 1;

end;

end.
