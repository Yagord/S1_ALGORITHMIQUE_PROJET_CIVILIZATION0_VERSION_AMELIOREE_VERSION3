unit UnitRecherche;

interface

uses UnitRecord;

function prerequis(r : integer; t : array of Recherche):boolean;
// retourne si la recherche 'r' a ses prerequis de validées
procedure initRecherche(var c:Civilisation);
// initialise les recherche de la civilisation 'c'

implementation

uses UnitConst;

function prerequis(r: integer; t: array of Recherche): boolean;
// retourne si la recherche 'r' a ses prerequis de validées
var
  i: integer;
  verif: boolean;
begin
  r := r - 1;
  verif := true;
  for i := 1 to length(t[r].prerequis) do
  begin
    if t[r].prerequis[i] <> -1 then
    begin
      if not t[t[r].prerequis[i] - 1].fini then
        verif := false;
    end;
  end;
  result := verif;
end;

procedure initRecherche(var c:Civilisation);
// initialise les recherche de la civilisation 'c'
var
  i,j : integer;
  n:integer;
begin

  // information par defaut
  for i := 1 to NOMBRE_RECHERCHE do
  begin
    c.recherches[i].titre := 'Une recherche';
    c.recherches[i].description := 'Petit message de description';
    c.recherches[i].cout := 5;
    c.recherches[i].fini := false;
    for j := 1 to 3 do
    begin
      c.recherches[i].prerequis[j] := -1;
    end;
    for j := 1 to 3 do
    begin
      c.recherches[i].effet[j] := '';
    end;

    for j := 1 to 26 do
    begin
      c.recherches[i].ratio[j] := 1;
    end;

    for j := 1 to 26 do
    begin
        c.recherches[i].bonus[j] := 0;
    end;
  end;

   // ------ Remplissage de toute les recherches --------

    n:=1;
    c.recherches[n].titre := 'Forge';
    c.recherches[n].description := 'Meilleurs traitement des métaux';
    c.recherches[n].cout := 10;
    c.recherches[n].effet[1] := '+10% degats des soldats';
    c.recherches[n].ratio[9] := 1.1;

    n:=2;
    c.recherches[n].titre := 'Metallurgie';
    c.recherches[n].description :=
      'Vos soldats seront equipés de meilleurs armes et armure';
    c.recherches[n].cout := 10;
    c.recherches[n].prerequis[1] := 1;
    c.recherches[n].effet[1] := '+15% degats des soldats';
    c.recherches[n].ratio[9] := 1.15;

    n:=3;
    c.recherches[n].titre := 'Fonderie';
    c.recherches[n].description := 'Une forge pour les forger tous';
    c.recherches[n].cout := 10;
    c.recherches[n].prerequis[1] := 1;
    c.recherches[n].prerequis[2] := 2;
    c.recherches[n].effet[1] := '+20% degats des soldats';
    c.recherches[n].ratio[9] := 1.2;

    n:=4;
    c.recherches[n].titre := 'Etude des sols';
    c.recherches[n].description := 'Permet une meilleurs exploitation agricole';
    c.recherches[n].cout := 10;
    c.recherches[n].effet[1] := '+50% production nourriture';
    c.recherches[n].effet[2] := '+1 production de nourriture';
    c.recherches[n].ratio[13] := 1.5;
    c.recherches[n].bonus[13] := 1;

    n:=5;
    c.recherches[n].titre := 'Herbologie';
    c.recherches[n].description :='Une etudes trés poussée des fleurs pour rendre vos jardin plus beau';
    c.recherches[n].cout := 10;
    c.recherches[n].effet[1] := '+10% bonheur sur les jardin';
    c.recherches[n].ratio[7] := 1.1;

    n:=6;
    c.recherches[n].titre := 'Architecture';
    c.recherches[n].description :='';
    c.recherches[n].cout := 5;
    c.recherches[n].effet[1] := '+100% vitesse de construction';
    c.recherches[n].ratio[15] := 2;

    n:=7;
    c.recherches[n].titre := 'Enrolement';
    c.recherches[n].description :='';
    c.recherches[n].cout := 1;
    c.recherches[n].effet[1] := '+1 point de recrutement par tour';
    c.recherches[n].bonus[21] := 1;

    n:=8;
    c.recherches[n].titre := 'Multitache';
    c.recherches[n].description :='';
    c.recherches[n].cout := 1;
    c.recherches[n].effet[1] := '+1 construction possible';
    c.recherches[n].bonus[17] := 1;

    n:=9;
    c.recherches[n].titre := 'Camp entrainement';
    c.recherches[n].description :='';
    c.recherches[n].cout := 1;
    c.recherches[n].effet[1] := '+10% dégats des unités';
    c.recherches[n].ratio[23] := 1.1;

    n:=10;
    c.recherches[n].titre := 'Route commerciale';
    c.recherches[n].description :='';
    c.recherches[n].cout := 1;
    c.recherches[n].effet[1] := '+1 or par marché';
    c.recherches[n].bonus[6] := 1;

    n:=11;
    c.recherches[n].titre := 'Religion';
    c.recherches[n].description :='';
    c.recherches[n].cout := 1;
    c.recherches[n].effet[1] := '+5% de bonheur';
    c.recherches[n].bonus[19] := 5;

    n:=12;
    c.recherches[n].titre := 'Emissaire';
    c.recherches[n].description :='';
    c.recherches[n].cout := 1;
    c.recherches[n].effet[1] := '+1 action diplomatique';
    c.recherches[n].bonus[22] := 1;

    n:=13;
    c.recherches[n].titre := 'Autodafé';
    c.recherches[n].description :='Plus un peuple est idiot plus il est heureux';
    c.recherches[n].cout := 1;
    c.recherches[n].effet[1] := '+10 point de bonheur';
    c.recherches[n].effet[2] := '-1 point de recherche';
    c.recherches[n].bonus[19] := 10;
    c.recherches[n].bonus[20] := -1;
    c.recherches[n].prerequis[1] := 11;

end;

end.
