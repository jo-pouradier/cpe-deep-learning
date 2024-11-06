% charger les fichiers
:- [data/tp2].

% Requetes
:- begin_tests(queries).

test(liste_eleves_groupe) :-
    eleves_dans_groupe('Groupe1', Nom, Prenom),
    writeln(Nom-Prenom).

test(moyenne_notes_eleve) :-
    moyenne_notes('Dupont', 'Marie', 'Math', Moyenne),
    writeln(Moyenne).

:- end_tests(queries).