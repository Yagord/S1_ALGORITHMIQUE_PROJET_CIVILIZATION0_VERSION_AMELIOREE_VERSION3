unit UnitRecord;

interface

uses unitConst;

// Une recherche
type
  Recherche = record
    titre: string[255];
    description: string[255];
    cout: Integer;
    fini: Boolean;
    prerequis: array [1 .. 3] of Integer;
    effet: array [1 .. 3] of String[255];
    ratio: array [1 .. 26] of Real;
    bonus: array [1 .. 26] of Real;
  end;

  // Une troupe composé d'unités et avec un nom
type
  Troupe = record
    nom: string[255];
    unites: array [1 .. NOMBRE_UNITE] of Integer;
    origine: pointer;
  end;

  // La ville qui contient son nom,population,nourriture ainsi que ses données de construction
type
  Ville = record
    nom: string[255];
    nourriture: Integer;
    population: Integer;
    batiments: array [1 .. NOMBRE_BATIMENT] of Integer;
    construction: Integer;
    avancementConstruction: Real;
  end;

  // La civilisation qui contient son nom, ses données militaires, de recherche ainsi que ses villes
type
  Civilisation = record
    nom: string[255];
    Ville: array [1 .. 5] of Ville;
    nbVille: Integer;
    Troupe: Troupe;
    recrutement: Integer;
    argent: Integer;
    recherches: array [1 .. NOMBRE_RECHERCHE] of Recherche;
    rechercheCourante: Integer;
    avancementRecherche: Integer;
    relation: array [1 .. 5] of Integer;
    actionDiplomatique: Integer;
    bonus: array [1 .. 26] of Real;
    ratio: array [1 .. 26] of Real;
    joueur: Boolean;
    mort: Boolean;
  end;

  // Un pointeur vers une civilisation
type
  TPCivilisation = ^Civilisation;

  // Le jeu qui contient l'ensemble des données
type
  Game = record
    fini: Boolean;
    tour: Integer;
    Civilisations: array [1 .. 5] of Civilisation;
    difficulte: Integer;
    attaque: Boolean;
    victoire: Boolean;
  end;

implementation

end.
