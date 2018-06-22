unit UnitGestion;

interface

uses UnitRecord;

procedure gestionAcceuil(var g:Game;var choix:char);
// gere les actions a partir du menu principal
procedure gestionCivilisation(var g: Game; var c: Civilisation);
// gere les actions a partir de l'ecran civilisation
procedure gestionChoixDifficulte(var g: Game);
// gere les actions a partir du menu de choix de difficulté
procedure gestionChoixAttaque(var g: Game);
// gere les actions a partir du menu de choix des attaques barbares
procedure gestionChoixCivilisation(var g: Game);
// gere les actions a partir du menu de choix de civilisation

implementation

uses UnitMilitaire, UnitAffichage, UnitVille, UnitConst,
  UnitRecherche, UnitSave, UnitInit, math, GestionEcran, System.SysUtils;

function valideInt(str: string): boolean;
// renvoie si une chaine est bien un nombre
var
  valide: boolean;
  i: integer;
begin
  valide := true;
  // pour chaque caractere on verifie que c'est un chiffre
  for i := low(str) to high(str) do
  begin
    if not((str[i] >= '0') and (str[i] <= '9')) then
    begin
      valide := false;
    end;
    result := valide;
  end;
end;

procedure gestionMilitaire(var g: Game; var c: Civilisation);
// gere les actions a partir du menu militaire
var
  choix: Char; // caractere saisie par l'utilisateur
  niveau: string;
begin
  repeat
    repeat
      afficheMilitaire(g, c);
      readln(choix);
    until (choix >= '0') and (choix <= '9');

    case StrToInt(choix) of
      // recrutement
      1 .. NOMBRE_UNITE:
        begin
          recruter(c, StrToInt(choix));
        end;

      // attaque
      NOMBRE_UNITE + 1 .. NOMBRE_UNITE + 2:
        begin
          if totalSoldat(c.Troupe) > 0 then
          begin
            // attaque contre barabre
            if StrToInt(choix) = NOMBRE_UNITE + 1 then
            begin
              niveau := afficheQuestion('Niveau du camps à attaquer (1..3)');
              if valideInt(niveau) then
                if (StrToInt(niveau) >= 1) AND (StrToInt(niveau) <= 3) then
                  attaquerBarbare(g, c, StrToInt(niveau), 'Camps barbare');
            end
            // attaue contre ville
            else if StrToInt(choix) = NOMBRE_UNITE + 2 then
            begin
              attaquerVille(g, c);
            end;
          end
          else
          begin
            messageGlobal := ' Aucune troupe ';
          end;
        end;
    end;
  until (choix = '0');
end;

procedure gestionVille(var g: Game; var c: Civilisation; var v: ville);
// gere les actions a partir de menu de ville
var
  choix: Char; // caractere saisie par l'utilisateur
begin
  repeat
    afficheVille(g, c, v);
    readln(choix);

    // construction
    if (choix >= '1') and (choix <= IntToStr(length(v.batiments))) then
    begin
      // si aucune construction en cours
      if v.construction = -1 then
      begin
        // si assez de population
        if sommeBatiment(v) < round((v.population + c.bonus[17]) * c.ratio[17]) then
        begin
          // construction etable sous condition
          if choix = IntToStr(codeBatiment('Etable')) then
          begin
            if v.batiments[codeBatiment('Etable')] < v.batiments[codeBatiment('Ferme')] then
              v.construction := StrToInt(choix)
            else
              messageGlobal := 'Impossible ferme niveau insuffisant';
          end
          else
            v.construction := StrToInt(choix);
        end
        else
          messageGlobal := 'Impossible population insuffisante';
      end
      else if (v.construction = StrToInt(choix)) then
      begin
        v.construction := -1;
        v.avancementConstruction := 0;
        messageGlobal := 'Construction annulée';
      end
      else if (choix >= '1') and (choix <= IntToStr(length(v.batiments))) then
        messageGlobal := 'Impossible construction deja en cours';
    end;

  until (choix = '0');
end;

procedure gestionRecherche(var g: Game; var c: Civilisation);
var
  choix: Char;
  // caractere saisie par l'utilisateur
  pos: integer;
  // La position du curseur de selection de recherche
begin
  pos := 1;
  repeat
    afficheRecherche(g, g.Civilisations[1], pos);
    readln(choix);
    case choix of
      // descendre
      '+':
        pos := pos + 1;
      // monter
      '-':
        pos := pos - 1;
      // lancer la recherche
      '1':
        begin
          // si pas de recherche en cours
          if c.rechercheCourante = -1 then
          begin
            // si les prerequis sont verifiés
            if prerequis(pos, c.recherches) then
            begin
              if not c.recherches[pos].fini then
                c.rechercheCourante := pos
              else
                messageGlobal := 'Recherche déjà effectué';
            end
            else
              messageGlobal := 'Vous n''avez pas les prérequis';
          end
          else
            messageGlobal := 'Une recherche est déjà en cours';
        end;
    end;

    // bouclage du curseur
    if pos > length(g.Civilisations[1].recherches) then
      pos := 1;
    if pos < 1 then
      pos := length(g.Civilisations[1].recherches);

  until (choix = '0');
end;

procedure gestionDiplomatie(var g: Game; var c: Civilisation);
var
  choix, action: Char;
  montant: string;
  cible: string;
begin

  repeat
    afficheDiplomatie(g, c);
    readln(choix);

    // si choix valide
    if (choix >= '1') and (choix <= '4') then
    begin
      // si la civilisation n'est pas deja morte
      if not g.Civilisations[StrToInt(choix) + 1].mort then
      begin
        // si il reste des actions
        if c.actionDiplomatique < actionPossible(c) then
        begin
          afficheDetailDiplomatie(g, StrToInt(choix) + 1);
          afficheSaisie;
          readln(action);

          // si compliment
          if action = '1' then
          begin
            // si la relation est assez bonne
            if c.relation[StrToInt(choix) + 1] <> 0 then
            begin
              c.relation[StrToInt(choix) + 1] := min(100, c.relation[StrToInt(choix) + 1] + 1);
              g.Civilisations[StrToInt(choix) + 1].relation[1] := c.relation[StrToInt(choix) + 1];
              messageGlobal := 'Votre relation s''ameliore de 1 %';
              c.actionDiplomatique := c.actionDiplomatique + 1;
            end
            else
              messageGlobal := 'Action impossible avec une civilisation en guerre';
          end;

          // si envoie argent
          if action = '2' then
          begin
            // si la relation est assez bonne
            if c.relation[StrToInt(choix) + 1] <> 0 then
            begin
              montant := afficheQuestion('Combien envoyer ?');
              if valideInt(montant) then
              begin
                // si assez d'argent
                if StrToInt(montant) <= c.argent then
                begin
                  c.argent := c.argent - StrToInt(montant);
                  g.Civilisations[StrToInt(choix) + 1].argent := g.Civilisations[StrToInt(choix) + 1].argent + StrToInt(montant);
                  c.relation[StrToInt(choix) + 1] := min(100, c.relation[StrToInt(choix) + 1] + round(sqrt(StrToInt(montant))));
                  g.Civilisations[StrToInt(choix) + 1].relation[1] := c.relation[StrToInt(choix) + 1];
                  messageGlobal := 'Votre relation s''ameliore de ' + IntToStr(round(sqrt(StrToInt(montant)))) + ' %';
                  c.actionDiplomatique := c.actionDiplomatique + 1;
                end
                else
                  messageGlobal := 'Pas assez d''argent';
              end
              else
                messageGlobal := 'Montant invalide';
            end
            else
              messageGlobal := 'Action impossible avec une civilisation en guerre';
          end;
        end
        else
          messageGlobal := 'Plus d''action disponible';
      end
      else
        messageGlobal := 'Action impossible avec une civilisation detruite';
    end;

  until choix = '0';
end;

procedure gestionCivilisation(var g: Game; var c: Civilisation);
var
  choix, choixSave: Char;
  // caractere saisie par l'utilisateur
  cancel: boolean;
begin
  repeat
    cancel := false;
    afficheCivilisation(g, g.Civilisations[1]);
    readln(choix);
    case choix of
      // gestion ville
      '1' .. '5':
        begin
          if choix <= IntToStr(c.nbVille) then
            gestionVille(g, c, g.Civilisations[1].ville[StrToInt(choix)])
          else
            messageGlobal := 'Pas de ville correspondante';
        end;
      // gestion militaire
      'm':
        gestionMilitaire(g, g.Civilisations[1]);
      // gestion recherche
      'r':
        gestionRecherche(g, g.Civilisations[1]);
      // gestion diplomatique
      'd':
         gestionDiplomatie(g, g.Civilisations[1]);
      // si quitter
      '0':
        begin
          gestionSave(g, cancel);

          if not cancel then
            g.fini := true;
        end;
    end;
  until ((choix = '0') or (choix = '9')) and (not cancel);
end;

procedure gestionAcceuil(var g:Game;var choix:char);
begin
  afficheAccueil;
  readln(choix);

  if choix = '1' then // si le joueur commence une partie
  begin
  initGame(g);
  // initialisation du jeu (choix difficulté, civilisation ...)
  end;

  if choix = '2' then // si le joueur reprend une ancienne partie
  begin
  gestionLoad(g);
  end;

end;

procedure gestionChoixDifficulte(var g: Game);
var
  choix: Char; // caractere saisie par l'utilisateur

begin
  repeat
    afficheChoixDifficulte;
    readln(choix);
  until (choix >= '1') AND (choix <= '3');
  g.difficulte := StrToInt(choix);
end;

procedure gestionChoixAttaque(var g: Game);
var
  choix: Char; // caractere saisie par l'utilisateur

begin
  repeat
    afficheChoixAttaque;
    readln(choix);
    if choix = '1' then
      g.attaque := true
    else
      g.attaque := false;
  until (choix >= '1') AND (choix <= '2');
end;

procedure gestionChoixCivilisation(var g: Game);
var
  choix: Char; // caractere saisie par l'utilisateur
  i: integer;

begin
  repeat
    afficheChoixCivilisation;
    readln(choix);
    if (choix >= '1') and (choix <= '5') then
    begin
      for i := 1 to 5 do
      begin
        g.Civilisations[i].nom := LISTE_CIVILISATION[((StrToInt(choix) + i - 2) mod 5) + 1];
      end;
    end;
  until (choix >= '1') AND (choix <= '5');
end;

end.
