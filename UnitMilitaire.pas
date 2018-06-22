unit UnitMilitaire;

interface

uses UnitRecord;

procedure recruter(var c: Civilisation; unite: integer);
// recrute une unité de type 'unite' pour la civilisation 'c'
procedure attaquerBarbare(var g: Game; var c: Civilisation; niveau: integer; nom: string);
// commence un combat contre un camps de barbare de rang 'niveau' et de nom 'nom'
procedure attaquerVille(var g: Game; var c: Civilisation);
// attaque la ville de la civilisation 'c'
procedure attaqueDeBarbare(var g: Game; var v: Ville);
// lance une attaque barbare contre la ville 'v'
procedure attaqueDeCivilisation(var g: Game; var c: Civilisation; var v: Ville);
// lance un combat de la civilisation 'c' contre votre ville 'v'
function totalSoldat(t: Troupe): integer;
// renvoie le nombre de soldat d'une troupe 't'
function nomUnite(code: integer): string;
// renvoie le nom de l'unités d'id 'code'
function longueurMaxUnite: integer;
// renvoie la taille du plus grand nom d'unité
function combat(var g: Game; var t: Troupe; var tE: Troupe): boolean;
// commence un combat contre la troupe 'tE' avec la troupe 't' et retourne si c'est une victoire

implementation

uses UnitConst, UnitVille, UnitAffichage, Math, GestionEcran, System.SysUtils,
  typinfo;

function longueurMaxUnite: integer;
// renvoie la taille du plus grand nom d'unité
var
  i: integer; // compteur
  max: integer; // la longeur a renvoyer
begin
  max := 0;
  for i := 1 to NOMBRE_UNITE do
  begin
    if length(LISTE_UNITE[i]) > max then
    begin
      max := length(LISTE_UNITE[i]);
    end;
  end;

  result := max;
end;

function nomUnite(code: integer): string;
// renvoie le nom de l'unités d'id 'code'
begin
  result := LISTE_UNITE[code];
end;

function codeUnite(nom: string): integer;
// renvoie le code de l'unités de nom 'nom'
var
  i: integer; // compteur
  pos: integer; // le code a renvoyer
begin
  pos := -1;
  for i := 1 to length(LISTE_UNITE) do
  begin
    if LISTE_UNITE[i] = nom then
      pos := i;
  end;
  result := pos;
end;

function totalSoldat(t: Troupe): integer;
// renvoie le nombre de soldat d'une troupe 't'
var
  nb: integer; // variable qui compte le nombre de soldats
  i: integer; // compteur
begin
  nb := 0;
  for i := 1 to length(t.unites) do
  begin
    nb := nb + t.unites[i];
  end;

  result := nb;
end;

function puissanceTroupe(t: Troupe): integer;
// renvoie la puissance d'une troupe
var
  puissance: integer;
  i: integer; // compteur
begin
  puissance := 0;
  // ajoute la puissance de chaque type d'unites x leur quantité
  for i := 1 to length(t.unites) do
  begin
    puissance := puissance + t.unites[i] * PUISSANCE_UNITE[i];
  end;

  if t.origine = nil then
    result := puissance
  // si c'est une civilisation il y a des bonus de recherche
  else
    result := round((puissance + Civilisation(t.origine^).bonus[23]) * Civilisation(t.origine^).ratio[23]);

end;

procedure remplirTroupeBarbare(g: Game; var t: Troupe; niveau: integer; nom: string);
// remplie de maniere aleatoire un camps de barbare
var
  i: integer; // compteur
begin
  for i := 1 to NOMBRE_UNITE do
  begin
    t.unites[i] := (random(RANDOM_BARBARE[i]) + MINIMUM_BARBARE[i]) * niveau * g.difficulte;
  end;
  t.nom := nom;
  t.origine := nil;
end;

function combat(var g: Game; var t: Troupe; var tE: Troupe): boolean;
var
  cibleCorrecte: boolean; // boolean indiquant si une cible est correcte ou non
  saisie: char; // la saisie utilisateur
  cible: integer; // la cible visé par une attaque (1:soldat, 2:canon ...)
  kill: integer;
  // entier representant le nombre de victime faite par une attaque
  str: string; // chaine representant le message du popup de fin
begin

  Randomize;

  while (totalSoldat(tE) > 0) AND (totalSoldat(t) > 0) do
  begin

    // demande une cible jusqu'a ce qu'elle soit correcte
    cibleCorrecte := false;
    repeat
      afficheCombat(g, t, tE);
      readln(saisie);
      if (saisie >= '1') and (saisie <= '9') then
      begin
        cible := StrToInt(saisie);
        if (cible >= 1) and (cible <= NOMBRE_UNITE) and (tE.unites[cible] > 0) then
          cibleCorrecte := true
        else
          messageGlobal := 'Cible incorrecte';
      end
      else
        messageGlobal := 'Cible incorrecte';

    until cibleCorrecte;

    // calcul le nombre de mort; si civilisation, bonus de recherche
    if tE.origine <> nil then
      kill := random(ceil(puissanceTroupe(t) / round((VIE_UNITE[cible] + Civilisation(tE.origine^).bonus[24]) * Civilisation(tE.origine^).ratio[24])))
    else
      kill := random(ceil(puissanceTroupe(t) / VIE_UNITE[cible]));

    messageCombat := 'Vous demander à vos troupe d''attaquer les ';
    messageCombat := messageCombat + lowerCase(nomUnite(cible)) + 's ';

    // cap le nombre de kill au nombre d'unités au maximum
    kill := max(0, min(tE.unites[cible], kill));
    tE.unites[cible] := tE.unites[cible] - kill;

    messageCombat := messageCombat + 'ennemis et elles en tuent ' + IntToStr(kill) + '.';

    // choix cible ennemie
    cibleCorrecte := false;
    repeat
      sleep(10);
      cible := random(NOMBRE_UNITE) + 1;
      if t.unites[cible] > 0 then
        cibleCorrecte := true;
    until cibleCorrecte;

    sleep(100);
    // nombre de mort, bonus de recherche
    kill := random(ceil(puissanceTroupe(tE) / round((VIE_UNITE[cible] + Civilisation(t.origine^).bonus[24]) * Civilisation(t.origine^).ratio[24])));

    messageCombat := messageCombat + 'Les forces ennemies attaquent vos ';

    // cap le nombre de kill au nombre d'unités au maximum
    kill := max(0, min(t.unites[cible], kill));
    t.unites[cible] := t.unites[cible] - kill;
    messageCombat := messageCombat + lowerCase(nomUnite(cible)) + 's ';

    messageCombat := messageCombat + 'et elles en tuent ' + IntToStr(kill) + '.';

  end;

  str := 'Combat contre : ' + tE.nom;

  // si perdu
  if totalSoldat(t) = 0 then
  begin
    affichePopup(g, str, 'Vous avez perdu le combat');
    messageCombat := '';
    result := false;
  end
  // si gagner
  else
  begin
    affichePopup(g, str, 'Vous avez gagnez le combat');
    messageCombat := '';
    result := true;
  end;
end;

procedure attaquerBarbare(var g: Game; var c: Civilisation; niveau: integer; nom: string);
var
  troupeE: Troupe; // La troupe ennemie
  gain: integer; // L'or trouver si victoire
  victoire: boolean; // Si le combat est un succés
begin

  Randomize;

  remplirTroupeBarbare(g, troupeE, niveau, nom);

  victoire := combat(g, c.Troupe, troupeE);

  // si victoire gain d'argent
  if victoire then
  begin
    gain := random(50) * niveau;
    c.argent := c.argent + gain;
    affichePopup(g, 'Combat contre : ' + troupeE.nom, 'Vous trouver ' + IntToStr(gain) + ' pièces d''or');
  end;

end;

procedure attaquerVille(var g: Game; var c: Civilisation);
var
  nom: string; // le nom de la ville a attqué
  gain: integer; // L'or trouver si victoire
  victoire: boolean; // Si le combat est un succés
  cE: TPCivilisation; // Le pointeur vers la cible
begin

  nom := afficheQuestion('Quelle ville attaquer ?');

  cE := proprietaire(g, nom);
  // si la ville existe
  if (cE <> nil) and (cE^.nom <> c.nom) then
  begin
    victoire := combat(g, c.Troupe, cE^.Troupe);

    // si victoire capture de la ville
    if victoire then
    begin
      affichePopup(g, 'Combat contre : ' + cE^.Troupe.nom, 'Vous avez conquis ' + nom + ' !');

      c.Ville[c.nbVille + 1] := cE^.Ville[1];
      c.nbVille := c.nbVille + 1;
      cE^.nbVille := cE^.nbVille - 1;
    end;
  end
  else
  begin
    messageGlobal := 'Cette ville n''existe pas';
  end;

end;

procedure recruter(var c: Civilisation; unite: integer);
var
  recrut: boolean; //si le recrutement est possible
begin
  recrut := true;

  // si assez d'argent
  if c.argent >= COUT_UNITE_OR[unite] then
  begin
    // si assez de point
    if c.recrutement >= COUT_UNITE[unite] then
    begin
      // si caserne
      if (unite = codeUnite('Soldat')) and (niveauBatimentTotal(c, codeBatiment('Caserne')) < 1) then
      begin
        recrut := false;
        messageGlobal := 'Pas de caserne';
      end
      // si caserne lvl 2
      else if (unite = codeUnite('Cavalier')) and (niveauBatimentTotal(c, codeBatiment('Caserne')) < 2) then
      begin
        recrut := false;
        messageGlobal := 'Caserne niv.2 requise';
      end
      // si mine
      else if (unite = codeUnite('Canon')) and (niveauBatimentTotal(c, codeBatiment('Mine')) < 1) then
      begin
        recrut := false;
        messageGlobal := 'Pas de mine';
      end
    end
    else
    begin
      recrut := false;
      messageGlobal := 'Pas de point de recrutement';
    end;
  end
  else
  begin
    recrut := false;
    messageGlobal := 'Pas assez d''or';
  end;

  // si ok on recrut
  if recrut = true then
  begin
    c.Troupe.unites[unite] := c.Troupe.unites[unite] + 1;
    c.recrutement := c.recrutement - COUT_UNITE[unite];
    c.argent := c.argent - round((COUT_UNITE_OR[unite] + c.bonus[25]) * c.ratio[25]);
  end;

end;

// renvoie la vie du batiment qui a le moins de vie
function minimum(t: array of integer): integer;
var
  i: integer; // compteur
  minimum: integer; // le minimum a renvoyer
begin
  minimum := t[1];
  for i := 2 to NOMBRE_BATIMENT do
  begin
    if t[i] < minimum then
      minimum := t[i];
  end;
  result := minimum;
end;

procedure attaqueDeBarbare(var g: Game; var v: Ville);
// lance une attaque de barbare contre la ville 'v'
var
  tE: Troupe; // La troupe barbare
  victoire: boolean; // Victoire ou non
  puissanceRestante: integer;
  // La puissance de la troupe barbare si elle entre dans la ville
  bat: integer; // Le batiment a detruire
begin

  Randomize;

  affichePopup(g, '', 'Les barbares attaquent ' + v.nom + ' !');
  remplirTroupeBarbare(g, tE, 1, 'Troupe barbare');

  victoire := combat(g, g.Civilisations[1].Troupe, tE);

  // si defaite
  if not victoire then
  begin
    puissanceRestante := puissanceTroupe(tE);
    affichePopup(g, '', 'Les barbares envahissent la ville !');
    // destruction des batiments
    repeat
      bat := random(NOMBRE_BATIMENT) + 1;
      attendre(1);
      if v.batiments[bat] > 0 then
      begin
        puissanceRestante := puissanceRestante - VIE_BATIMENT[bat];
        v.batiments[bat] := v.batiments[bat] - 1;
        affichePopup(g, '', 'Batiment détruit : ' + nomBatiment(bat) + ' (niveau ' + IntToStr(v.batiments[bat] + 1) + ')');
      end;
    until (puissanceRestante < minimum(VIE_BATIMENT)) or (nombreBatiment(v) = 0);

    // si plus aucune batiment, tue la population
    if nombreBatiment(v) = 0 then
    begin
      affichePopup(g, '', 'Population tuée : ' + IntToStr(min(v.population, floor(puissanceRestante / 10))));
      v.population := v.population - min(v.population, floor(puissanceRestante / 10));
    end;

  end;

end;

procedure attaqueDeCivilisation(var g: Game; var c: Civilisation; var v: Ville);
var
  tE: Troupe; // La troupe
  victoire: boolean; // Victoire ou non
  puissanceRestante: integer;
  // La puissance de la troupe si elle entre dans la ville
  bat: integer; // Le batiment a detruire
begin

  Randomize;

  affichePopup(g, '', c.nom + ' attaque ' + v.nom + ' !');

  victoire := combat(g, g.Civilisations[1].Troupe, c.Troupe);

  // si defaite
  if not victoire then
  begin
    puissanceRestante := puissanceTroupe(tE);
    affichePopup(g, '', 'Votre ville est envahis !');
    // destruction des batiments
    repeat
      bat := random(NOMBRE_BATIMENT) + 1;
      attendre(1);
      if v.batiments[bat] > 0 then
      begin
        puissanceRestante := puissanceRestante - VIE_BATIMENT[bat];
        v.batiments[bat] := v.batiments[bat] - 1;
        affichePopup(g, '', 'Batiment détruit : ' + nomBatiment(bat) + ' (niveau ' + IntToStr(v.batiments[bat] + 1) + ')');
      end;
    until (puissanceRestante < minimum(VIE_BATIMENT)) or (nombreBatiment(v) = 0);

    // si plus aucune batiment, tue la population
    if nombreBatiment(v) = 0 then
    begin
      affichePopup(g, '', 'Population tuée : ' + IntToStr(min(v.population, floor(puissanceRestante / 10))));
      v.population := v.population - min(v.population, floor(puissanceRestante / 10));
    end;

  end;

end;

end.
