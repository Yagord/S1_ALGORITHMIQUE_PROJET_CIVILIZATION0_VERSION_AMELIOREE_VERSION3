unit UnitVille;

interface

uses UnitRecord;

function codeBatiment(nom: string): integer;
// renvoie l'id du batiment de nom 'nom'
function nomBatiment(code: integer): string;
// renvoie le nom du batiment d'id 'code'

function nombreBatiment(v: Ville): integer;
// renvoie le nombre de batiment different de la ville 'v'
function sommeBatiment(v: Ville): integer;
// renvoie le nombre de batiment construits (niveau compris) de la ville 'v'
function niveauBatimentTotal(c: Civilisation; nb: integer): integer;
// renvoie la somme des niveau du batiement nb de la civilisation 'c' dans chaque ville

function proprietaire(var g: Game; nom: string): TPCivilisation;
// renvoie un pointeur vers la proprietaire de la ville de nom 'nom'

function nourritureParTour(c: Civilisation; v: Ville): integer;
// renvoie le nombre de nourriture produite par tour
function nourriturePourCroissance(c: Civilisation; v: Ville): integer;
// renvoie la nourriture requise pour que la population augmente
function tourPourCroissance(c: Civilisation; v: Ville): integer;
// renvoie le nombre de tour requis pour que la population augmente

function travailParTour(c: Civilisation; v: Ville): real;
// renvoie le travail par tour de la ville 'v'
function travailRequis(g: Game; c: Civilisation; v: Ville): integer;
// renvoie le travail requis pour construire le batiment en cours

function argentParTourVille(c: Civilisation; v: Ville): integer;
// renvoie l'or produite par tour par la ville 'v'
function argentParTour(c: Civilisation): integer;
// renvoie l'or produite par tour par la civilisation 'c'

function recrutementParTour(c: Civilisation): integer;
// renvoie les point de recrutement par tour de la civilisation 'c'

function rechercheParTourVille(c: Civilisation; v: Ville): integer;
// point de recherche fait par tour par la ville 'v'
function rechercheParTour(c: Civilisation): integer;
// point de recherche fait par tour par la civilisation 'c'

function bonheur(c: Civilisation; v: Ville): integer;
// renvoie le niveau de bonheur de la ville 'v'

function actionPossible(c: Civilisation): integer;
// renvoie le nombre d'action diplomatique possible

implementation

uses UnitAffichage, UnitConst, Math, typinfo;

function nomBatiment(code: integer): string;
// renvoie le nom du batiment d'id 'code'
begin
  result := LISTE_BATIMENT[code];
end;

function codeBatiment(nom: string): integer;
// renvoie l'id du batiment de nom 'nom'
var
  i: integer;
  pos: integer;
begin
  for i := 1 to length(LISTE_BATIMENT) do
  begin
    if LISTE_BATIMENT[i] = nom then
      pos := i;
  end;
  result := pos;
end;

function nombreBatiment(v: Ville): integer;
// renvoie le nombre de batiment different de la ville 'v'
var
  nb: integer; // entier comptant le nombre de batiment
  i: integer; // compteur
begin
  nb := 0;

  for i := 1 to length(v.batiments) do
  begin
    if (v.batiments[i] > 0) or (v.construction = i) then
      nb := nb + 1;
  end;

  result := nb;
end;

function sommeBatiment(v: Ville): integer;
// renvoie le nombre de batiment construits (niveau compris) de la ville 'v'
var
  i: integer; // compteur allant de 1 a NOMBRE_BATIMENT
  nb: integer;
  // entier comptant le nombre de batiment * leur niveaux respectifs
begin
  nb := 0;
  for i := 1 to NOMBRE_BATIMENT do
  begin
    nb := nb + v.batiments[i];
  end;

  result := nb;
end;

function niveauBatimentTotal(c: Civilisation; nb: integer): integer;
// renvoie la somme des niveau du batiement nb de la civilisation 'c' dans chaque ville
var
  niveau: integer;
  i: integer;
begin
  niveau := 0;
  for i := 1 to c.nbVille do
  begin
    niveau := niveau + c.Ville[i].batiments[nb];
  end;
  result := niveau;
end;

function proprietaire(var g: Game; nom: string): TPCivilisation;
// renvoie un pointeur vers la proprietaire de la ville de nom 'nom'
var
  i, j: integer;
  c: TPCivilisation;
begin
  c := nil;
  for i := 1 to 5 do
  begin
    for j := 1 to g.Civilisations[i].nbVille do
    begin
      // si la ville a le même nom que la ville recherché
      if g.Civilisations[i].Ville[j].nom = nom then
      begin
        c := @g.Civilisations[i];
      end;
    end;
  end;
  result := c;
end;

function travailParTour(c: Civilisation; v: Ville): real;
// renvoie le travail par tour de la ville 'v'
var
  travail: real; // entier comptant le travail effectué par tour
begin
  if bonheur(c, v) <> 0 then
  begin
    travail := v.population;
    travail := travail + round(((v.batiments[codeBatiment('Mine')] * TRAVAIL_PAR_MINE) + c.bonus[2]) * c.ratio[2]);
    travail := travail + round(((v.batiments[codeBatiment('Carriere')] * TRAVAIL_PAR_CARRIERE) + c.bonus[3]) * c.ratio[3]);
    travail := travail * (bonheur(c, v) / 100);
    travail := round(travail * 100) / 100;

    result := round((travail + c.bonus[15]) * c.ratio[15]);
  end
  else
    result := 0;
end;

function travailRequis(g: Game; c: Civilisation; v: Ville): integer;
// renvoie le travail requis pour construire le batiment en cours
begin
  result := round((((v.batiments[v.construction] + 1) * COUT_BATIMENT[v.construction] * g.difficulte) + c.bonus[16]) * c.ratio[16]);
end;

function actionPossible(c: Civilisation): integer;
// renvoie le nombre d'action diplomatique possible
begin
  result := round((1 + c.bonus[22]) * c.ratio[22]);
end;

function bonheur(c: Civilisation; v: Ville): integer;
// renvoie le niveau de bonheur de la ville 'v'
var
  res: integer;
  // entier representant le niveau de bonheur de la ville 'v' (entre 1 et 100)
begin

  res := 100 - (v.population - 1) * BONHEUR_PAR_POPULATION;
  res := res - sommeBatiment(v) * BONHEUR_PAR_BATIMENT;
  res := res + round(((v.batiments[codeBatiment('Jardin')] * BONHEUR_PAR_JARDIN) + c.bonus[7]) * c.ratio[7]);

  if res > 100 then
    res := 100;
  if res <= 0 then
    res := 1;

  result := round((res + c.bonus[19]) * c.ratio[19]);;
end;

function argentParTourVille(c: Civilisation; v: Ville): integer;
// renvoie l'or produite par tour par la ville 'v'
var
  argent: integer; // entier comptant la production de nourriture par tour
begin
  argent := 0;
  argent := argent + round((v.batiments[codeBatiment('Marche')] * (ARGENT_PAR_MARCHE + c.bonus[6]) * c.ratio[6]));

  result := argent;
end;

function argentParTour(c: Civilisation): integer;
// renvoie l'or produite par tour par la civilisation 'c'
var
  argent: integer; // entier comptant la production de nourriture par tour
  i: integer;
begin
  argent := 0;
  for i := 0 to c.nbVille do
  begin
    argent := argent + argentParTourVille(c, c.Ville[i]);
  end;

  result := round((argent + c.bonus[18]) * c.ratio[18]);
end;

function nourritureParTour(c: Civilisation; v: Ville): integer;
// renvoie le nombre de nourriture produite par tour
var
  nourriture: integer; // entier comptant la production de nourriture par tour
begin
  nourriture := 0;

  nourriture := nourriture + round(((v.batiments[codeBatiment('Ferme')] * NOURRITURE_PAR_FERME) + c.bonus[1]) * c.ratio[1]);
  nourriture := nourriture + round(((v.batiments[codeBatiment('Etable')] * NOURRITURE_PAR_ETABLE) + c.bonus[5]) * c.ratio[5]);

  nourriture := nourriture - v.population + 2;

  result := round((nourriture + c.bonus[13]) * c.ratio[13]);
end;

function nourriturePourCroissance(c: Civilisation; v: Ville): integer;
// renvoie la nourriture requise pour que la population augmente
begin
  if bonheur(c, v) <> 0 then
    result := round((v.population * 10 + 10) * 100 / bonheur(c, v))
  else
    result := -1;
end;

function tourPourCroissance(c: Civilisation; v: Ville): integer;
// renvoie le nombre de tour requis pour que la population augmente
begin
  if (nourritureParTour(c, v) <= 0) or (nourriturePourCroissance(c, v) = -1) then
  begin
    result := -1;
  end
  else
  begin
    result := round(((ceil((nourriturePourCroissance(c, v) - v.nourriture) / nourritureParTour(c, v))) + c.bonus[14]) * c.ratio[14]);
  end;
end;

function recrutementParTour(c: Civilisation): integer;
// point de recherche fait par tour par la civilisation 'c'
var
  recrut: integer; // entier comptant les point de recrutement par tour
begin

  recrut := 0;
  recrut := recrut + round(((niveauBatimentTotal(c, codeBatiment('Caserne')) * RECRUTEMENT_PAR_CASERNE) + c.bonus[4]) * c.ratio[4]);

  result := round((recrut + c.bonus[21]) * c.ratio[21]);
end;

function rechercheParTourVille(c: Civilisation; v: Ville): integer;
// point de recherche fait par tour par la ville 'v'
begin
  result := round(((v.batiments[codeBatiment('Bibliotheque')] * RECHERCHE_PAR_BIBLIOTHEQUE) + c.bonus[8]) * c.ratio[8]);
end;

function rechercheParTour(c: Civilisation): integer;
// point de recherche fait par tour par la civilisation 'c'
var
  rech: integer;
  i: integer;
begin
  rech := 0;

  for i := 1 to c.nbVille do
  begin
    rech := rech + rechercheParTourVille(c, c.Ville[i]);
  end;
  result := round((rech + c.bonus[20]) * c.ratio[20]);
end;

end.
