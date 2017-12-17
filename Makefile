NOM=PROJET_IN301

all: slider

test: slider
	./slider fichier1.slider

# Edition de liens
slider: slider.o lire_ecrire.o afficher.o jeu.o deplacements.o listes_memo.o editeur.o
	gcc slider.o lire_ecrire.o afficher.o jeu.o deplacements.o listes_memo.o editeur.o -o slider -luvsqgraphics `sdl-config --libs` -lm -lSDL_ttf

# Compilation
slider.o: slider.c mes_types.h lire_ecrire.h afficher.h  listes_memo.h editeur.h
	gcc -c -Wall `sdl-config --cflags` slider.c

# Compilation
lire_ecrire.o: lire_ecrire.c mes_types.h
	gcc -c -Wall `sdl-config --cflags` lire_ecrire.c

# Compilation
afficher.o: afficher.c mes_types.h
	gcc -c -Wall `sdl-config --cflags` afficher.c

# Compilation
listes_memo.o: listes_memo.c mes_types.h afficher.h
	gcc -c -Wall `sdl-config --cflags` listes_memo.c	

# Compilation
deplacements.o: deplacements.c mes_types.h afficher.h
	gcc -c -Wall `sdl-config --cflags` deplacements.c

# Compilation	
jeu.o: jeu.c deplacements.h afficher.h listes_memo.h
	gcc -c -Wall `sdl-config --cflags` jeu.c
	
editeur.o: editeur.c mes_types.h afficher.h
	gcc -c -Wall `sdl-config --cflags` editeur.c

indent:
	indent *.c

editeur:
	geany Makefile *.c *.h

# Pour creer le zip a deposer sur e-campus
zip:
	rm -fr $(NOM)
	rm -f $(NOM).zip
	mkdir $(NOM)
	cp *.c $(NOM)
	cp *.h $(NOM)
	cp Makefile $(NOM)
#	cp -f *.slider $(NOM)
	zip $(NOM).zip $(NOM)/*
#	rm -fr $(NOM)


clean:
	rm -rf $(NOM)
	rm -f $(NOM).zip
	rm -f *.o
	

git:
	make clean
	git add *
	git commit
	git push