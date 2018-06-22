unit UnitSprite;

interface
uses GestionEcran;

    procedure gestionSprite(fps, duree : Integer);
    // gestion de l'animation avec le nombre d'image par seconde et la durée en ms passé en paramètre
    procedure kingFrame1(p, h : Integer);
    // première image de l'animation
    procedure kingFrame2(p, h : Integer);
    // deuxième image de l'animation
    procedure kingFrame3(p, h : Integer);
    // troisième image de l'animation
    procedure kingFrame4(p, h : Integer);
    // quatrième image de l'animation

implementation

    procedure gestionSprite(fps, duree : Integer);
    var
      i : Integer;
      temps : Integer;
    begin
      temps := 1000 div fps;
      for i := 1 to duree div (4*temps)  do
      begin
        kingFrame1(50,0);
        attendre(temps);
        effacerEcran();
        kingFrame2(50,0);
        attendre(temps);
        effacerEcran();
        kingFrame3(50,0);
        attendre(temps);
        effacerEcran();
        kingFrame4(50,0);
        attendre(temps);
        effacerEcran();
      end;
    end;

    procedure kingFrame1(p, h : Integer);
    begin
      deplacerCurseurXY(p+14,h);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+18,h);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+22,h);
      couleurTexte(4);
      write('██');


      deplacerCurseurXY(p+14,h+1);
      couleurTexte(14);
      write('████████');

      deplacerCurseurXY(p+22,h+1);
      couleurTexte(4);
      write('██');


      deplacerCurseurXY(p+14,h+2);
      couleurTexte(14);
      write('██████');

      deplacerCurseurXY(p+20,h+2);
      couleurTexte(4);
      write('████');


      deplacerCurseurXY(p+14,h+3);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+18,h+3);
      couleurTexte(7);
      write('██████');


      deplacerCurseurXY(p+14,h+4);
      couleurTexte(0);
      write('████████');

      deplacerCurseurXY(p+22,h+4);
      couleurTexte(7);
      write('██');


      deplacerCurseurXY(p+14,h+5);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+16,h+5);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+20,h+5);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+22,h+5);
      couleurTexte(7);
      write('██');


      deplacerCurseurXY(p+14,h+6);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+16,h+6);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+20,h+6);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+22,h+6);
      couleurTexte(7);
      write('██');


      deplacerCurseurXY(p+6,h+7);
      couleurTexte(14);
      write('████');

      deplacerCurseurXY(p+10,h+7);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+12,h+7);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+14,h+7);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+16,h+7);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+20,h+7);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+22,h+7);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+24,h+7);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+26,h+7);
      couleurTexte(14);
      write('██████');


      deplacerCurseurXY(p+4,h+8);
      couleurTexte(14);
      write('████');

      deplacerCurseurXY(p+8,h+8);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+10,h+8);
      couleurTexte(0);
      write('████████████');

      deplacerCurseurXY(p+24,h+8);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+26,h+8);
      couleurTexte(14);
      write('████████');


      deplacerCurseurXY(p+4,h+9);
      couleurTexte(14);
      write('████');

      deplacerCurseurXY(p+8,h+9);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+9);
      couleurTexte(8);
      write('██████████████');

      deplacerCurseurXY(p+24,h+9);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+26,h+9);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+28,h+9);
      couleurTexte(14);
      write('██████');


      deplacerCurseurXY(p+2,h+10);
      couleurTexte(4);
      write('██████');

      deplacerCurseurXY(p+8,h+10);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+10);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+12,h+10);
      couleurTexte(15);
      write('████████████');

      deplacerCurseurXY(p+24,h+10);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+26,h+10);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+28,h+10);
      couleurTexte(4);
      write('████████');


      deplacerCurseurXY(p+4,h+11);
      couleurTexte(0);
      write('██████');

      deplacerCurseurXY(p+10,h+11);
      couleurTexte(15);
      write('██████████████');

      deplacerCurseurXY(p+24,h+11);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+26,h+11);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+28,h+11);
      couleurTexte(0);
      write('██████');


      deplacerCurseurXY(p+2,h+12);
      couleurTexte(4);
      write('████');

      deplacerCurseurXY(p+6,h+12);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+6,h+12);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+10,h+12);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+12,h+12);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+12);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+16,h+12);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+18,h+12);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+20,h+12);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+22,h+12);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+26,h+12);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+28,h+12);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+30,h+12);
      couleurTexte(4);
      write('████');

      deplacerCurseurXY(p+2,h+13);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+6,h+13);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+13);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+12,h+13);
      couleurTexte(4);
      write('██████████');

      deplacerCurseurXY(p+22,h+13);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+26,h+13);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+28,h+13);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+32,h+13);
      couleurTexte(0);
      write('██');


      deplacerCurseurXY(p+2,h+14);
      couleurTexte(4);
      write('████');

      deplacerCurseurXY(p+6,h+14);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+14);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+12,h+14);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+14);
      couleurTexte(15);
      write('██████');

      deplacerCurseurXY(p+20,h+14);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+22,h+14);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+24,h+14);
      couleurTexte(7);
      write('████');

      deplacerCurseurXY(p+28,h+14);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+30,h+14);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+32,h+14);
      couleurTexte(4);
      write('████');


      deplacerCurseurXY(p+2,h+15);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+6,h+15);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+15);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+12,h+15);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+15);
      couleurTexte(15);
      write('██████');

      deplacerCurseurXY(p+20,h+15);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+22,h+15);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+24,h+15);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+26,h+15);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+30,h+15);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+34,h+15);
      couleurTexte(0);
      write('██');


      deplacerCurseurXY(p+2,h+16);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+4,h+16);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+6,h+16);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+16);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+12,h+16);
      couleurTexte(4);
      write('██████████');

      deplacerCurseurXY(p+22,h+16);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+24,h+16);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+26,h+16);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+30,h+16);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+34,h+16);
      couleurTexte(4);
      write('██');


      deplacerCurseurXY(p,h+17);
      couleurTexte(8);
      write('██████');

      deplacerCurseurXY(p+6,h+17);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+17);
      couleurTexte(15);
      write('██████████████');

      deplacerCurseurXY(p+24,h+17);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+26,h+17);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+30,h+17);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+32,h+17);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+34,h+17);
      couleurTexte(0);
      write('██');


      deplacerCurseurXY(p,h+18);
      couleurTexte(14);
      write('████');

      deplacerCurseurXY(p+4,h+18);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+18);
      couleurTexte(8);
      write('████████████');

      deplacerCurseurXY(p+22,h+18);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+26,h+18);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+28,h+18);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+30,h+18);
      couleurTexte(14);
      write('████');

      deplacerCurseurXY(p+34,h+18);
      couleurTexte(0);
      write('██');


      deplacerCurseurXY(p,h+19);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+2,h+19);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+4,h+19);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+19);
      couleurTexte(8);
      write('██████');

      deplacerCurseurXY(p+16,h+19);
      couleurTexte(0);
      write('████████');

      deplacerCurseurXY(p+24,h+19);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+26,h+19);
      couleurTexte(14);
      write('████');

      deplacerCurseurXY(p+30,h+19);
      couleurTexte(0);
      write('████');


      deplacerCurseurXY(p,h+20);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+2,h+20);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+4,h+20);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+20);
      couleurTexte(7);
      write('██████████████');

      deplacerCurseurXY(p+24,h+20);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+28,h+20);
      couleurTexte(0);
      write('████');


      deplacerCurseurXY(p,h+21);
      couleurTexte(14);
      write('████');

      deplacerCurseurXY(p+4,h+21);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+21);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+14,h+21);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+16,h+21);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+18,h+21);
      couleurTexte(14);
      write('██████');

      deplacerCurseurXY(p+24,h+21);
      couleurTexte(8);
      write('██████');

      deplacerCurseurXY(p+30,h+21);
      couleurTexte(14);
      write('██████');


      deplacerCurseurXY(p,h+22);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+2,h+22);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+6,h+22);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+10,h+22);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+14,h+22);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+16,h+22);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+18,h+22);
      couleurTexte(15);
      write('██████');

      deplacerCurseurXY(p+24,h+22);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+26,h+22);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+28,h+22);
      couleurTexte(7);
      write('████████');

      deplacerCurseurXY(p+36,h+22);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p,h+23);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+6,h+23);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+10,h+23);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+12,h+23);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+23);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+23);
      couleurTexte(15);
      write('████████████');

      deplacerCurseurXY(p+28,h+23);
      couleurTexte(7);
      write('██████████');

      deplacerCurseurXY(p+38,h+23);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+2,h+24);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+10,h+24);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+12,h+24);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+24);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+24);
      couleurTexte(15);
      write('██████████████');

      deplacerCurseurXY(p+30,h+24);
      couleurTexte(7);
      write('████████');

      deplacerCurseurXY(p+38,h+24);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+10,h+25);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+12,h+25);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+25);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+25);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+20,h+25);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+22,h+25);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+26,h+25);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+28,h+25);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+30,h+25);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+32,h+25);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+34,h+25);
      couleurTexte(7);
      write('████');

      deplacerCurseurXY(p+38,h+25);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+26);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+12,h+26);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+26);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+26);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+20,h+26);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+22,h+26);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+26,h+26);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+28,h+26);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+30,h+26);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+32,h+26);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+34,h+26);
      couleurTexte(7);
      write('████');

      deplacerCurseurXY(p+38,h+26);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+27);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+12,h+27);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+27);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+27);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+20,h+27);
      couleurTexte(4);
      write('██████████████');

      deplacerCurseurXY(p+34,h+27);
      couleurTexte(7);
      write('████');

      deplacerCurseurXY(p+38,h+27);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+28);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+12,h+28);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+28);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+28);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+20,h+28);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+22,h+28);
      couleurTexte(15);
      write('████████');

      deplacerCurseurXY(p+30,h+28);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+32,h+28);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+34,h+28);
      couleurTexte(7);
      write('████');

      deplacerCurseurXY(p+38,h+28);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+29);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+12,h+29);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+29);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+29);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+20,h+29);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+22,h+29);
      couleurTexte(15);
      write('████████');

      deplacerCurseurXY(p+30,h+29);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+32,h+29);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+34,h+29);
      couleurTexte(7);
      write('████');

      deplacerCurseurXY(p+38,h+29);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+30);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+12,h+30);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+30);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+30);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+20,h+30);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+22,h+30);
      couleurTexte(15);
      write('████████');

      deplacerCurseurXY(p+30,h+30);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+32,h+30);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+34,h+30);
      couleurTexte(7);
      write('████');

      deplacerCurseurXY(p+38,h+30);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+31);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+12,h+31);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+31);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+31);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+20,h+31);
      couleurTexte(4);
      write('██████████████');

      deplacerCurseurXY(p+34,h+31);
      couleurTexte(7);
      write('████');

      deplacerCurseurXY(p+38,h+31);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+32);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+10,h+32);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+12,h+32);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+32);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+32);
      couleurTexte(15);
      write('██████████████');

      deplacerCurseurXY(p+30,h+32);
      couleurTexte(7);
      write('████████');

      deplacerCurseurXY(p+38,h+32);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+33);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+12,h+33);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+14,h+33);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+16,h+33);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+18,h+33);
      couleurTexte(15);
      write('████████████');

      deplacerCurseurXY(p+30,h+33);
      couleurTexte(7);
      write('██████');

      deplacerCurseurXY(p+36,h+33);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+34);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+12,h+34);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+14,h+34);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+16,h+34);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+18,h+34);
      couleurTexte(15);
      write('██████████');

      deplacerCurseurXY(p+28,h+34);
      couleurTexte(7);
      write('████████');

      deplacerCurseurXY(p+36,h+34);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+10,h+35);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+14,h+35);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+16,h+35);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+18,h+35);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+20,h+35);
      couleurTexte(15);
      write('████████');

      deplacerCurseurXY(p+28,h+35);
      couleurTexte(7);
      write('██████');

      deplacerCurseurXY(p+34,h+35);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+10,h+36);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+14,h+36);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+16,h+36);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+18,h+36);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+20,h+36);
      couleurTexte(15);
      write('████████');

      deplacerCurseurXY(p+28,h+36);
      couleurTexte(7);
      write('██████');

      deplacerCurseurXY(p+34,h+36);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+10,h+37);
      couleurTexte(14);
      write('████');

      deplacerCurseurXY(p+14,h+37);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+18,h+37);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+20,h+37);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+22,h+37);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+26,h+37);
      couleurTexte(7);
      write('██████');

      deplacerCurseurXY(p+32,h+37);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+10,h+38);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+12,h+38);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+20,h+38);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+22,h+38);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+24,h+38);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+26,h+38);
      couleurTexte(7);
      write('████');

      deplacerCurseurXY(p+30,h+38);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+32,h+38);
      couleurTexte(0);
      write('██');


      deplacerCurseurXY(p+8,h+39);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+10,h+39);
      couleurTexte(0);
      write('██████');

      deplacerCurseurXY(p+22,h+39);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+24,h+39);
      couleurTexte(14);
      write('██████');

      deplacerCurseurXY(p+30,h+39);
      couleurTexte(0);
      write('████');
    end;

    procedure kingFrame2(p, h : Integer);
    begin

      deplacerCurseurXY(p+14,h+1);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+18,h+1);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+22,h+1);
      couleurTexte(4);
      write('██');


      deplacerCurseurXY(p+14,h+2);
      couleurTexte(14);
      write('████████');

      deplacerCurseurXY(p+22,h+2);
      couleurTexte(4);
      write('██');


      deplacerCurseurXY(p+14,h+3);
      couleurTexte(14);
      write('██████');

      deplacerCurseurXY(p+20,h+3);
      couleurTexte(4);
      write('████');


      deplacerCurseurXY(p+14,h+4);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+18,h+4);
      couleurTexte(7);
      write('██████');


      deplacerCurseurXY(p+14,h+5);
      couleurTexte(0);
      write('████████');

      deplacerCurseurXY(p+22,h+5);
      couleurTexte(7);
      write('██');


      deplacerCurseurXY(p+14,h+6);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+16,h+6);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+20,h+6);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+22,h+6);
      couleurTexte(7);
      write('██');


      deplacerCurseurXY(p+6,h+7);
      couleurTexte(14);
      write('██████');

      deplacerCurseurXY(p+10,h+7);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+12,h+7);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+14,h+7);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+16,h+7);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+20,h+7);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+22,h+7);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+24,h+7);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+26,h+7);
      couleurTexte(14);
      write('██████');


      deplacerCurseurXY(p+4,h+8);
      couleurTexte(14);
      write('██████');

      deplacerCurseurXY(p+10,h+8);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+12,h+8);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+14,h+8);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+16,h+8);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+20,h+8);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+22,h+8);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+24,h+8);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+26,h+8);
      couleurTexte(14);
      write('████████');


      deplacerCurseurXY(p+4,h+9);
      couleurTexte(14);
      write('████');

      deplacerCurseurXY(p+8,h+9);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+10,h+9);
      couleurTexte(0);
      write('██████████████');

      deplacerCurseurXY(p+26,h+9);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+28,h+9);
      couleurTexte(14);
      write('██████');


      deplacerCurseurXY(p+2,h+10);
      couleurTexte(4);
      write('██████');

      deplacerCurseurXY(p+8,h+10);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+10);
      couleurTexte(8);
      write('████████████████');

      deplacerCurseurXY(p+26,h+10);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+28,h+10);
      couleurTexte(4);
      write('████████');


      deplacerCurseurXY(p+4,h+11);
      couleurTexte(0);
      write('██████');

      deplacerCurseurXY(p+10,h+11);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+12,h+11);
      couleurTexte(15);
      write('████████████');

      deplacerCurseurXY(p+24,h+11);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+26,h+11);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+28,h+11);
      couleurTexte(0);
      write('██████');


      deplacerCurseurXY(p+2,h+12);
      couleurTexte(4);
      write('████');

      deplacerCurseurXY(p+6,h+12);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+10,h+12);
      couleurTexte(15);
      write('██████████████');

      deplacerCurseurXY(p+24,h+12);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+26,h+12);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+30,h+12);
      couleurTexte(4);
      write('████');


      deplacerCurseurXY(p+2,h+13);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+6,h+13);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+13);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+12,h+13);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+13);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+16,h+13);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+18,h+13);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+20,h+13);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+22,h+13);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+26,h+13);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+28,h+13);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+32,h+13);
      couleurTexte(0);
      write('██');


      deplacerCurseurXY(p+2,h+14);
      couleurTexte(4);
      write('████');

      deplacerCurseurXY(p+6,h+14);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+14);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+12,h+14);
      couleurTexte(4);
      write('██████████');

      deplacerCurseurXY(p+22,h+14);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+26,h+14);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+28,h+14);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+30,h+14);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+32,h+14);
      couleurTexte(4);
      write('████');


      deplacerCurseurXY(p+2,h+15);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+6,h+15);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+15);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+12,h+15);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+15);
      couleurTexte(15);
      write('██████');

      deplacerCurseurXY(p+20,h+15);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+22,h+15);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+24,h+15);
      couleurTexte(7);
      write('████');

      deplacerCurseurXY(p+28,h+15);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+30,h+15);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+34,h+15);
      couleurTexte(0);
      write('██');


      deplacerCurseurXY(p+2,h+16);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+4,h+16);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+6,h+16);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+16);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+12,h+16);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+16);
      couleurTexte(15);
      write('██████');

      deplacerCurseurXY(p+20,h+16);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+22,h+16);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+24,h+16);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+26,h+16);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+30,h+16);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+34,h+16);
      couleurTexte(4);
      write('██');


      deplacerCurseurXY(p,h+17);
      couleurTexte(8);
      write('██████');

      deplacerCurseurXY(p+6,h+17);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+17);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+12,h+17);
      couleurTexte(4);
      write('██████████');

      deplacerCurseurXY(p+22,h+17);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+24,h+17);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+26,h+17);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+30,h+17);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+32,h+17);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+34,h+17);
      couleurTexte(0);
      write('██');


      deplacerCurseurXY(p,h+18);
      couleurTexte(14);
      write('████');

      deplacerCurseurXY(p+4,h+18);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+18);
      couleurTexte(15);
      write('██████████████');

      deplacerCurseurXY(p+24,h+18);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+26,h+18);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+28,h+18);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+30,h+18);
      couleurTexte(14);
      write('████');

      deplacerCurseurXY(p+34,h+18);
      couleurTexte(0);
      write('██');


      deplacerCurseurXY(p,h+19);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+2,h+19);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+4,h+19);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+19);
      couleurTexte(8);
      write('████████████');

      deplacerCurseurXY(p+22,h+19);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+26,h+19);
      couleurTexte(14);
      write('████');

      deplacerCurseurXY(p+30,h+19);
      couleurTexte(0);
      write('████');


      deplacerCurseurXY(p,h+20);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+2,h+20);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+4,h+20);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+20);
      couleurTexte(8);
      write('██████');

      deplacerCurseurXY(p+16,h+20);
      couleurTexte(0);
      write('████████');

      deplacerCurseurXY(p+24,h+20);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+28,h+20);
      couleurTexte(0);
      write('████');


      deplacerCurseurXY(p,h+21);
      couleurTexte(14);
      write('████');

      deplacerCurseurXY(p+4,h+21);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+21);
      couleurTexte(7);
      write('██████');

      deplacerCurseurXY(p+16,h+21);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+18,h+21);
      couleurTexte(14);
      write('██████');

      deplacerCurseurXY(p+24,h+21);
      couleurTexte(8);
      write('██████');

      deplacerCurseurXY(p+30,h+21);
      couleurTexte(14);
      write('██████');


      deplacerCurseurXY(p,h+22);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+2,h+22);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+6,h+22);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+10,h+22);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+14,h+22);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+16,h+22);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+18,h+22);
      couleurTexte(15);
      write('██████');

      deplacerCurseurXY(p+24,h+22);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+26,h+22);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+28,h+22);
      couleurTexte(7);
      write('████████');

      deplacerCurseurXY(p+36,h+22);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p,h+23);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+6,h+23);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+10,h+23);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+12,h+23);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+23);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+23);
      couleurTexte(15);
      write('████████████');

      deplacerCurseurXY(p+28,h+23);
      couleurTexte(7);
      write('██████████');

      deplacerCurseurXY(p+38,h+23);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+2,h+24);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+10,h+24);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+12,h+24);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+24);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+24);
      couleurTexte(15);
      write('██████████████');

      deplacerCurseurXY(p+30,h+24);
      couleurTexte(7);
      write('████████');

      deplacerCurseurXY(p+38,h+24);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+10,h+25);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+12,h+25);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+25);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+25);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+20,h+25);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+22,h+25);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+26,h+25);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+28,h+25);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+30,h+25);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+32,h+25);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+34,h+25);
      couleurTexte(7);
      write('████');

      deplacerCurseurXY(p+38,h+25);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+26);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+12,h+26);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+26);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+26);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+20,h+26);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+22,h+26);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+26,h+26);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+28,h+26);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+30,h+26);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+32,h+26);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+34,h+26);
      couleurTexte(7);
      write('████');

      deplacerCurseurXY(p+38,h+26);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+27);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+12,h+27);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+27);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+27);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+20,h+27);
      couleurTexte(4);
      write('██████████████');

      deplacerCurseurXY(p+34,h+27);
      couleurTexte(7);
      write('████');

      deplacerCurseurXY(p+38,h+27);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+28);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+12,h+28);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+28);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+28);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+20,h+28);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+22,h+28);
      couleurTexte(15);
      write('████████');

      deplacerCurseurXY(p+30,h+28);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+32,h+28);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+34,h+28);
      couleurTexte(7);
      write('████');

      deplacerCurseurXY(p+38,h+28);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+29);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+12,h+29);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+29);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+29);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+20,h+29);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+22,h+29);
      couleurTexte(15);
      write('████████');

      deplacerCurseurXY(p+30,h+29);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+32,h+29);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+34,h+29);
      couleurTexte(7);
      write('████');

      deplacerCurseurXY(p+38,h+29);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+30);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+12,h+30);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+30);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+30);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+20,h+30);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+22,h+30);
      couleurTexte(15);
      write('████████');

      deplacerCurseurXY(p+30,h+30);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+32,h+30);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+34,h+30);
      couleurTexte(7);
      write('████');

      deplacerCurseurXY(p+38,h+30);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+31);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+12,h+31);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+31);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+31);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+20,h+31);
      couleurTexte(4);
      write('██████████████');

      deplacerCurseurXY(p+34,h+31);
      couleurTexte(7);
      write('████');

      deplacerCurseurXY(p+38,h+31);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+32);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+12,h+32);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+32);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+32);
      couleurTexte(15);
      write('██████████████');

      deplacerCurseurXY(p+30,h+32);
      couleurTexte(7);
      write('████████');

      deplacerCurseurXY(p+38,h+32);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+33);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+12,h+33);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+14,h+33);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+16,h+33);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+18,h+33);
      couleurTexte(15);
      write('████████████');

      deplacerCurseurXY(p+30,h+33);
      couleurTexte(7);
      write('██████');

      deplacerCurseurXY(p+36,h+33);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+34);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+12,h+34);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+14,h+34);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+16,h+34);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+18,h+34);
      couleurTexte(15);
      write('██████████');

      deplacerCurseurXY(p+28,h+34);
      couleurTexte(7);
      write('████████');

      deplacerCurseurXY(p+36,h+34);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+35);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+14,h+35);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+16,h+35);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+18,h+35);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+20,h+35);
      couleurTexte(15);
      write('████████');

      deplacerCurseurXY(p+28,h+35);
      couleurTexte(7);
      write('██████');

      deplacerCurseurXY(p+34,h+35);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+10,h+36);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+14,h+36);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+16,h+36);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+18,h+36);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+20,h+36);
      couleurTexte(15);
      write('████████');

      deplacerCurseurXY(p+28,h+36);
      couleurTexte(7);
      write('██████');

      deplacerCurseurXY(p+34,h+36);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+10,h+37);
      couleurTexte(14);
      write('████');

      deplacerCurseurXY(p+14,h+37);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+18,h+37);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+20,h+37);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+22,h+37);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+26,h+37);
      couleurTexte(7);
      write('██████');

      deplacerCurseurXY(p+32,h+37);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+10,h+38);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+12,h+38);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+20,h+38);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+22,h+38);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+24,h+38);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+26,h+38);
      couleurTexte(7);
      write('████');

      deplacerCurseurXY(p+30,h+38);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+32,h+38);
      couleurTexte(0);
      write('██');


      deplacerCurseurXY(p+8,h+39);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+10,h+39);
      couleurTexte(0);
      write('██████');

      deplacerCurseurXY(p+22,h+39);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+24,h+39);
      couleurTexte(14);
      write('██████');

      deplacerCurseurXY(p+30,h+39);
      couleurTexte(0);
      write('████');
    end;

    procedure kingFrame3(p, h : Integer);
    begin

      deplacerCurseurXY(p+14,h+1);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+18,h+1);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+22,h+1);
      couleurTexte(4);
      write('██');


      deplacerCurseurXY(p+14,h+2);
      couleurTexte(14);
      write('████████');

      deplacerCurseurXY(p+22,h+2);
      couleurTexte(4);
      write('██');


      deplacerCurseurXY(p+14,h+3);
      couleurTexte(14);
      write('██████');

      deplacerCurseurXY(p+20,h+3);
      couleurTexte(4);
      write('████');


      deplacerCurseurXY(p+14,h+4);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+18,h+4);
      couleurTexte(7);
      write('██████');


      deplacerCurseurXY(p+14,h+5);
      couleurTexte(0);
      write('████████');

      deplacerCurseurXY(p+22,h+5);
      couleurTexte(7);
      write('██');


      deplacerCurseurXY(p+14,h+6);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+16,h+6);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+20,h+6);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+22,h+6);
      couleurTexte(7);
      write('██');


      deplacerCurseurXY(p+14,h+7);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+16,h+7);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+20,h+7);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+22,h+7);
      couleurTexte(7);
      write('██');


      deplacerCurseurXY(p+6,h+8);
      couleurTexte(14);
      write('████');

      deplacerCurseurXY(p+10,h+8);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+12,h+8);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+14,h+8);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+16,h+8);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+20,h+8);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+22,h+8);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+24,h+8);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+26,h+8);
      couleurTexte(14);
      write('██████');


      deplacerCurseurXY(p+4,h+9);
      couleurTexte(14);
      write('████');

      deplacerCurseurXY(p+8,h+9);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+10,h+9);
      couleurTexte(0);
      write('████████████');

      deplacerCurseurXY(p+24,h+9);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+26,h+9);
      couleurTexte(14);
      write('████████');


      deplacerCurseurXY(p+4,h+10);
      couleurTexte(14);
      write('████');

      deplacerCurseurXY(p+8,h+10);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+10);
      couleurTexte(8);
      write('██████████████');

      deplacerCurseurXY(p+24,h+10);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+26,h+10);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+28,h+10);
      couleurTexte(14);
      write('██████');


      deplacerCurseurXY(p+2,h+11);
      couleurTexte(4);
      write('██████');

      deplacerCurseurXY(p+8,h+11);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+11);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+12,h+11);
      couleurTexte(15);
      write('████████████');

      deplacerCurseurXY(p+24,h+11);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+26,h+11);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+28,h+11);
      couleurTexte(4);
      write('████████');


      deplacerCurseurXY(p+4,h+12);
      couleurTexte(0);
      write('██████');

      deplacerCurseurXY(p+10,h+12);
      couleurTexte(15);
      write('██████████████');

      deplacerCurseurXY(p+24,h+12);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+26,h+12);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+28,h+12);
      couleurTexte(0);
      write('██████');


      deplacerCurseurXY(p+2,h+13);
      couleurTexte(4);
      write('████');

      deplacerCurseurXY(p+6,h+13);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+6,h+13);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+10,h+13);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+12,h+13);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+13);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+16,h+13);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+18,h+13);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+20,h+13);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+22,h+13);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+26,h+13);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+28,h+13);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+30,h+13);
      couleurTexte(4);
      write('████');

      deplacerCurseurXY(p+2,h+14);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+6,h+14);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+14);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+12,h+14);
      couleurTexte(4);
      write('██████████');

      deplacerCurseurXY(p+22,h+14);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+26,h+14);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+28,h+14);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+32,h+14);
      couleurTexte(0);
      write('██');



      deplacerCurseurXY(p+2,h+15);
      couleurTexte(4);
      write('████');

      deplacerCurseurXY(p+6,h+15);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+15);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+12,h+15);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+15);
      couleurTexte(15);
      write('██████');

      deplacerCurseurXY(p+20,h+15);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+22,h+15);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+24,h+15);
      couleurTexte(7);
      write('████');

      deplacerCurseurXY(p+28,h+15);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+30,h+15);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+32,h+15);
      couleurTexte(4);
      write('████');


      deplacerCurseurXY(p+2,h+16);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+6,h+16);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+16);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+12,h+16);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+16);
      couleurTexte(15);
      write('██████');

      deplacerCurseurXY(p+20,h+16);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+22,h+16);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+24,h+16);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+26,h+16);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+30,h+16);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+34,h+16);
      couleurTexte(0);
      write('██');


      deplacerCurseurXY(p+2,h+17);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+4,h+17);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+6,h+17);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+17);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+12,h+17);
      couleurTexte(4);
      write('██████████');

      deplacerCurseurXY(p+22,h+17);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+24,h+17);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+26,h+17);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+30,h+17);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+34,h+17);
      couleurTexte(4);
      write('██');


      deplacerCurseurXY(p,h+18);
      couleurTexte(8);
      write('██████');

      deplacerCurseurXY(p+6,h+18);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+18);
      couleurTexte(15);
      write('██████████████');

      deplacerCurseurXY(p+24,h+18);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+26,h+18);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+28,h+18);
      couleurTexte(4);
      write('████');

      deplacerCurseurXY(p+32,h+18);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+34,h+18);
      couleurTexte(0);
      write('██');


      deplacerCurseurXY(p,h+19);
      couleurTexte(14);
      write('████');

      deplacerCurseurXY(p+4,h+19);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+19);
      couleurTexte(8);
      write('████████████');

      deplacerCurseurXY(p+22,h+19);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+26,h+19);
      couleurTexte(14);
      write('████████');

      deplacerCurseurXY(p+34,h+19);
      couleurTexte(0);
      write('██');


      deplacerCurseurXY(p,h+20);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+2,h+20);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+4,h+20);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+20);
      couleurTexte(8);
      write('██████');

      deplacerCurseurXY(p+16,h+20);
      couleurTexte(0);
      write('████████');

      deplacerCurseurXY(p+24,h+20);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+28,h+20);
      couleurTexte(0);
      write('████');


      deplacerCurseurXY(p,h+21);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+2,h+21);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+4,h+21);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+21);
      couleurTexte(7);
      write('██████');

      deplacerCurseurXY(p+16,h+21);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+18,h+21);
      couleurTexte(14);
      write('██████');

      deplacerCurseurXY(p+24,h+21);
      couleurTexte(8);
      write('██████');

      deplacerCurseurXY(p+30,h+21);
      couleurTexte(14);
      write('██████');


      deplacerCurseurXY(p,h+22);
      couleurTexte(14);
      write('████');

      deplacerCurseurXY(p+4,h+22);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+22);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+14,h+22);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+16,h+22);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+18,h+22);
      couleurTexte(15);
      write('██████');

      deplacerCurseurXY(p+24,h+22);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+26,h+22);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+28,h+22);
      couleurTexte(7);
      write('████████');

      deplacerCurseurXY(p+36,h+22);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p,h+23);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+2,h+23);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+6,h+23);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+10,h+23);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+12,h+23);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+23);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+23);
      couleurTexte(15);
      write('████████████');

      deplacerCurseurXY(p+28,h+23);
      couleurTexte(7);
      write('██████████');

      deplacerCurseurXY(p+38,h+23);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p,h+24);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+6,h+24);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+10,h+24);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+12,h+24);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+24);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+24);
      couleurTexte(15);
      write('██████████████');

      deplacerCurseurXY(p+30,h+24);
      couleurTexte(7);
      write('████████');

      deplacerCurseurXY(p+38,h+24);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+2,h+25);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+10,h+25);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+12,h+25);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+25);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+25);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+20,h+25);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+22,h+25);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+26,h+25);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+28,h+25);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+30,h+25);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+32,h+25);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+34,h+25);
      couleurTexte(7);
      write('████');

      deplacerCurseurXY(p+38,h+25);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+26);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+12,h+26);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+26);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+26);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+20,h+26);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+22,h+26);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+26,h+26);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+28,h+26);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+30,h+26);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+32,h+26);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+34,h+26);
      couleurTexte(7);
      write('████');

      deplacerCurseurXY(p+38,h+26);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+27);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+12,h+27);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+27);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+27);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+20,h+27);
      couleurTexte(4);
      write('██████████████');

      deplacerCurseurXY(p+34,h+27);
      couleurTexte(7);
      write('████');

      deplacerCurseurXY(p+38,h+27);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+28);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+12,h+28);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+28);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+28);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+20,h+28);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+22,h+28);
      couleurTexte(15);
      write('████████');

      deplacerCurseurXY(p+30,h+28);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+32,h+28);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+34,h+28);
      couleurTexte(7);
      write('████');

      deplacerCurseurXY(p+38,h+28);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+29);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+12,h+29);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+29);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+29);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+20,h+29);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+22,h+29);
      couleurTexte(15);
      write('████████');

      deplacerCurseurXY(p+30,h+29);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+32,h+29);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+34,h+29);
      couleurTexte(7);
      write('████');

      deplacerCurseurXY(p+38,h+29);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+30);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+12,h+30);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+30);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+30);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+20,h+30);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+22,h+30);
      couleurTexte(15);
      write('████████');

      deplacerCurseurXY(p+30,h+30);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+32,h+30);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+34,h+30);
      couleurTexte(7);
      write('████');

      deplacerCurseurXY(p+38,h+30);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+31);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+12,h+31);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+31);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+31);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+20,h+31);
      couleurTexte(4);
      write('██████████████');

      deplacerCurseurXY(p+34,h+31);
      couleurTexte(7);
      write('████');

      deplacerCurseurXY(p+38,h+31);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+32);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+12,h+32);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+32);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+32);
      couleurTexte(15);
      write('██████████████');

      deplacerCurseurXY(p+30,h+32);
      couleurTexte(7);
      write('████████');

      deplacerCurseurXY(p+38,h+32);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+33);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+12,h+33);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+14,h+33);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+16,h+33);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+18,h+33);
      couleurTexte(15);
      write('████████████');

      deplacerCurseurXY(p+30,h+33);
      couleurTexte(7);
      write('██████');

      deplacerCurseurXY(p+36,h+33);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+34);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+12,h+34);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+14,h+34);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+16,h+34);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+18,h+34);
      couleurTexte(15);
      write('██████████');

      deplacerCurseurXY(p+28,h+34);
      couleurTexte(7);
      write('████████');

      deplacerCurseurXY(p+36,h+34);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+35);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+14,h+35);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+16,h+35);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+18,h+35);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+20,h+35);
      couleurTexte(15);
      write('████████');

      deplacerCurseurXY(p+28,h+35);
      couleurTexte(7);
      write('██████');

      deplacerCurseurXY(p+34,h+35);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+10,h+36);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+14,h+36);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+16,h+36);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+18,h+36);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+20,h+36);
      couleurTexte(15);
      write('████████');

      deplacerCurseurXY(p+28,h+36);
      couleurTexte(7);
      write('██████');

      deplacerCurseurXY(p+34,h+36);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+10,h+37);
      couleurTexte(14);
      write('████');

      deplacerCurseurXY(p+14,h+37);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+18,h+37);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+20,h+37);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+22,h+37);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+26,h+37);
      couleurTexte(7);
      write('██████');

      deplacerCurseurXY(p+32,h+37);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+10,h+38);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+12,h+38);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+20,h+38);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+22,h+38);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+24,h+38);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+26,h+38);
      couleurTexte(7);
      write('████');

      deplacerCurseurXY(p+30,h+38);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+32,h+38);
      couleurTexte(0);
      write('██');


      deplacerCurseurXY(p+8,h+39);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+10,h+39);
      couleurTexte(0);
      write('██████');

      deplacerCurseurXY(p+22,h+39);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+24,h+39);
      couleurTexte(14);
      write('██████');

      deplacerCurseurXY(p+30,h+39);
      couleurTexte(0);
      write('████');
    end;

    procedure kingFrame4(p, h : Integer);
    begin
      deplacerCurseurXY(p+14,h);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+18,h);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+22,h);
      couleurTexte(4);
      write('██');


      deplacerCurseurXY(p+14,h+1);
      couleurTexte(14);
      write('████████');

      deplacerCurseurXY(p+22,h+1);
      couleurTexte(4);
      write('██');


      deplacerCurseurXY(p+14,h+2);
      couleurTexte(14);
      write('██████');

      deplacerCurseurXY(p+20,h+2);
      couleurTexte(4);
      write('████');


      deplacerCurseurXY(p+14,h+3);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+18,h+3);
      couleurTexte(7);
      write('██████');


      deplacerCurseurXY(p+14,h+4);
      couleurTexte(0);
      write('████████');

      deplacerCurseurXY(p+22,h+4);
      couleurTexte(7);
      write('██');


      deplacerCurseurXY(p+14,h+5);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+16,h+5);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+20,h+5);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+22,h+5);
      couleurTexte(7);
      write('██');


      deplacerCurseurXY(p+14,h+6);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+16,h+6);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+20,h+6);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+22,h+6);
      couleurTexte(7);
      write('██');


      deplacerCurseurXY(p+14,h+7);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+16,h+7);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+20,h+7);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+22,h+7);
      couleurTexte(7);
      write('██');


      deplacerCurseurXY(p+6,h+8);
      couleurTexte(14);
      write('████');

      deplacerCurseurXY(p+10,h+8);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+12,h+8);
      couleurTexte(0);
      write('████████████');

      deplacerCurseurXY(p+24,h+8);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+26,h+8);
      couleurTexte(14);
      write('██████');


      deplacerCurseurXY(p+4,h+9);
      couleurTexte(14);
      write('████');

      deplacerCurseurXY(p+8,h+9);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+10,h+9);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+14,h+9);
      couleurTexte(8);
      write('██████████');

      deplacerCurseurXY(p+24,h+9);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+26,h+9);
      couleurTexte(14);
      write('████████');


      deplacerCurseurXY(p+4,h+10);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+8,h+10);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+10,h+10);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+12,h+10);
      couleurTexte(15);
      write('████████████');

      deplacerCurseurXY(p+24,h+10);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+26,h+10);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+28,h+10);
      couleurTexte(14);
      write('██████');


      deplacerCurseurXY(p+2,h+11);
      couleurTexte(4);
      write('██████');

      deplacerCurseurXY(p+8,h+11);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+11);
      couleurTexte(15);
      write('██████████████');

      deplacerCurseurXY(p+24,h+11);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+26,h+11);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+28,h+11);
      couleurTexte(4);
      write('████████');


      deplacerCurseurXY(p+4,h+12);
      couleurTexte(0);
      write('██████');

      deplacerCurseurXY(p+10,h+12);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+12,h+12);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+12);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+16,h+12);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+18,h+12);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+20,h+12);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+22,h+12);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+26,h+12);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+28,h+12);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+30,h+12);
      couleurTexte(0);
      write('██');


      deplacerCurseurXY(p+2,h+13);
      couleurTexte(4);
      write('████');

      deplacerCurseurXY(p+6,h+13);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+6,h+13);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+10,h+13);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+12,h+13);
      couleurTexte(4);
      write('██████████');

      deplacerCurseurXY(p+22,h+13);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+26,h+13);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+28,h+13);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+30,h+13);
      couleurTexte(4);
      write('████');


      deplacerCurseurXY(p+2,h+14);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+6,h+14);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+14);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+12,h+14);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+14);
      couleurTexte(15);
      write('██████');

      deplacerCurseurXY(p+20,h+14);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+22,h+14);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+24,h+14);
      couleurTexte(7);
      write('████');

      deplacerCurseurXY(p+28,h+14);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+32,h+14);
      couleurTexte(0);
      write('██');


      deplacerCurseurXY(p+2,h+15);
      couleurTexte(4);
      write('████');

      deplacerCurseurXY(p+6,h+15);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+15);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+12,h+15);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+15);
      couleurTexte(15);
      write('██████');

      deplacerCurseurXY(p+20,h+15);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+22,h+15);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+24,h+15);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+26,h+15);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+30,h+15);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+32,h+15);
      couleurTexte(4);
      write('████');


      deplacerCurseurXY(p+2,h+16);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+6,h+16);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+16);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+12,h+16);
      couleurTexte(4);
      write('██████████');

      deplacerCurseurXY(p+22,h+16);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+24,h+16);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+26,h+16);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+30,h+16);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+34,h+16);
      couleurTexte(0);
      write('██');


      deplacerCurseurXY(p+2,h+17);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+4,h+17);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+6,h+17);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+17);
      couleurTexte(15);
      write('██████████████');

      deplacerCurseurXY(p+24,h+17);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+26,h+17);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+30,h+17);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+34,h+17);
      couleurTexte(4);
      write('██');


      deplacerCurseurXY(p,h+18);
      couleurTexte(8);
      write('██████');

      deplacerCurseurXY(p+6,h+18);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+18);
      couleurTexte(8);
      write('████████████');

      deplacerCurseurXY(p+22,h+18);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+26,h+18);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+28,h+18);
      couleurTexte(4);
      write('████');

      deplacerCurseurXY(p+32,h+18);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+34,h+18);
      couleurTexte(0);
      write('██');


      deplacerCurseurXY(p,h+19);
      couleurTexte(14);
      write('████');

      deplacerCurseurXY(p+4,h+19);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+19);
      couleurTexte(8);
      write('██████');

      deplacerCurseurXY(p+16,h+19);
      couleurTexte(0);
      write('████████');

      deplacerCurseurXY(p+24,h+19);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+26,h+19);
      couleurTexte(14);
      write('████████');

      deplacerCurseurXY(p+34,h+19);
      couleurTexte(0);
      write('██');


      deplacerCurseurXY(p,h+20);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+2,h+20);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+4,h+20);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+20);
      couleurTexte(7);
      write('██████████████');

      deplacerCurseurXY(p+24,h+20);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+28,h+20);
      couleurTexte(0);
      write('████');



      deplacerCurseurXY(p,h+21);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+2,h+21);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+4,h+21);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+21);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+14,h+21);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+16,h+21);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+18,h+21);
      couleurTexte(14);
      write('██████');

      deplacerCurseurXY(p+24,h+21);
      couleurTexte(8);
      write('██████');

      deplacerCurseurXY(p+30,h+21);
      couleurTexte(14);
      write('██████');


      deplacerCurseurXY(p,h+22);
      couleurTexte(14);
      write('████');

      deplacerCurseurXY(p+4,h+22);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+10,h+22);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+14,h+22);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+16,h+22);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+18,h+22);
      couleurTexte(15);
      write('██████');

      deplacerCurseurXY(p+24,h+22);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+26,h+22);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+28,h+22);
      couleurTexte(7);
      write('████████');

      deplacerCurseurXY(p+36,h+22);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p,h+23);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+2,h+23);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+6,h+23);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+10,h+23);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+12,h+23);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+23);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+23);
      couleurTexte(15);
      write('████████████');

      deplacerCurseurXY(p+28,h+23);
      couleurTexte(7);
      write('██████████');

      deplacerCurseurXY(p+38,h+23);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p,h+24);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+6,h+24);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+10,h+24);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+12,h+24);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+24);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+24);
      couleurTexte(15);
      write('██████████████');

      deplacerCurseurXY(p+30,h+24);
      couleurTexte(7);
      write('████████');

      deplacerCurseurXY(p+38,h+24);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+2,h+25);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+10,h+25);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+12,h+25);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+25);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+25);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+20,h+25);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+22,h+25);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+26,h+25);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+28,h+25);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+30,h+25);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+32,h+25);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+34,h+25);
      couleurTexte(7);
      write('████');

      deplacerCurseurXY(p+38,h+25);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+26);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+12,h+26);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+26);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+26);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+20,h+26);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+22,h+26);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+26,h+26);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+28,h+26);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+30,h+26);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+32,h+26);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+34,h+26);
      couleurTexte(7);
      write('████');

      deplacerCurseurXY(p+38,h+26);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+27);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+12,h+27);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+27);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+27);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+20,h+27);
      couleurTexte(4);
      write('██████████████');

      deplacerCurseurXY(p+34,h+27);
      couleurTexte(7);
      write('████');

      deplacerCurseurXY(p+38,h+27);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+28);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+12,h+28);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+28);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+28);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+20,h+28);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+22,h+28);
      couleurTexte(15);
      write('████████');

      deplacerCurseurXY(p+30,h+28);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+32,h+28);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+34,h+28);
      couleurTexte(7);
      write('████');

      deplacerCurseurXY(p+38,h+28);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+29);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+12,h+29);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+29);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+29);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+20,h+29);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+22,h+29);
      couleurTexte(15);
      write('████████');

      deplacerCurseurXY(p+30,h+29);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+32,h+29);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+34,h+29);
      couleurTexte(7);
      write('████');

      deplacerCurseurXY(p+38,h+29);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+30);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+12,h+30);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+30);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+30);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+20,h+30);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+22,h+30);
      couleurTexte(15);
      write('████████');

      deplacerCurseurXY(p+30,h+30);
      couleurTexte(7);
      write('██');

      deplacerCurseurXY(p+32,h+30);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+34,h+30);
      couleurTexte(7);
      write('████');

      deplacerCurseurXY(p+38,h+30);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+31);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+12,h+31);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+31);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+31);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+20,h+31);
      couleurTexte(4);
      write('██████████████');

      deplacerCurseurXY(p+34,h+31);
      couleurTexte(7);
      write('████');

      deplacerCurseurXY(p+38,h+31);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+32);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+10,h+32);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+12,h+32);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+14,h+32);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+16,h+32);
      couleurTexte(15);
      write('██████████████');

      deplacerCurseurXY(p+30,h+32);
      couleurTexte(7);
      write('████████');

      deplacerCurseurXY(p+38,h+32);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+33);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+12,h+33);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+14,h+33);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+16,h+33);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+18,h+33);
      couleurTexte(15);
      write('████████████');

      deplacerCurseurXY(p+30,h+33);
      couleurTexte(7);
      write('██████');

      deplacerCurseurXY(p+36,h+33);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+8,h+34);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+12,h+34);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+14,h+34);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+16,h+34);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+18,h+34);
      couleurTexte(15);
      write('██████████');

      deplacerCurseurXY(p+28,h+34);
      couleurTexte(7);
      write('████████');

      deplacerCurseurXY(p+36,h+34);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+10,h+35);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+14,h+35);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+16,h+35);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+18,h+35);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+20,h+35);
      couleurTexte(15);
      write('████████');

      deplacerCurseurXY(p+28,h+35);
      couleurTexte(7);
      write('██████');

      deplacerCurseurXY(p+34,h+35);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+10,h+36);
      couleurTexte(8);
      write('████');

      deplacerCurseurXY(p+14,h+36);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+16,h+36);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+18,h+36);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+20,h+36);
      couleurTexte(15);
      write('████████');

      deplacerCurseurXY(p+28,h+36);
      couleurTexte(7);
      write('██████');

      deplacerCurseurXY(p+34,h+36);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+10,h+37);
      couleurTexte(14);
      write('████');

      deplacerCurseurXY(p+14,h+37);
      couleurTexte(0);
      write('██');

      deplacerCurseurXY(p+18,h+37);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+20,h+37);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+22,h+37);
      couleurTexte(15);
      write('████');

      deplacerCurseurXY(p+26,h+37);
      couleurTexte(7);
      write('██████');

      deplacerCurseurXY(p+32,h+37);
      couleurTexte(14);
      write('██');


      deplacerCurseurXY(p+10,h+38);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+12,h+38);
      couleurTexte(0);
      write('████');

      deplacerCurseurXY(p+20,h+38);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+22,h+38);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+24,h+38);
      couleurTexte(15);
      write('██');

      deplacerCurseurXY(p+26,h+38);
      couleurTexte(7);
      write('████');

      deplacerCurseurXY(p+30,h+38);
      couleurTexte(14);
      write('██');

      deplacerCurseurXY(p+32,h+38);
      couleurTexte(0);
      write('██');


      deplacerCurseurXY(p+8,h+39);
      couleurTexte(8);
      write('██');

      deplacerCurseurXY(p+10,h+39);
      couleurTexte(0);
      write('██████');

      deplacerCurseurXY(p+22,h+39);
      couleurTexte(4);
      write('██');

      deplacerCurseurXY(p+24,h+39);
      couleurTexte(14);
      write('██████');

      deplacerCurseurXY(p+30,h+39);
      couleurTexte(0);
      write('████');
    end;

end.

  {    Black        = 0;
      Blue         = 1;
      Green        = 2;
      Cyan         = 3;
      Red          = 4;
      Magenta      = 5;
      Brown        = 6;
      LightGray    = 7;
      DarkGray     = 8;
      LightBlue    = 9;
      LightGreen   = 10;
      LightCyan    = 11;
      LightRed     = 12;
      LightMagenta = 13;
      Yellow       = 14;
      White        = 15;
    }