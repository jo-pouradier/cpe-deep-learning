% TP2 - Prolog

% Informations des élèves
eleve('Dupont', 'Marie', '2001-05-12').
eleve('Martin', 'Paul', '2002-08-25').
eleve('Durand', 'Jean', '2001-02-10').
eleve('Dubois', 'Pierre', '2001-12-05').
eleve('Lefevre', 'Julie', '2001-09-30').
eleve('Leroy', 'Sophie', '2001-11-20').
eleve('Moreau', 'Luc', '2001-07-15').
eleve('Lefevre', 'Julie', '2001-09-30').

% Groupes de projet
groupe_projet('Groupe1', 'Dupont', 'Marie').
groupe_projet('Groupe1', 'Martin', 'Paul').
groupe_projet('Groupe1', 'Durand', 'Jean').
groupe_projet('Groupe1', 'Dubois', 'Pierre').
groupe_projet('Groupe3', 'Lefevre', 'Julie').
groupe_projet('Groupe3', 'Leroy', 'Sophie').
groupe_projet('Groupe4', 'Moreau', 'Luc').


% Modules
module('Math', 'Mathematics Course').
module('Physique', 'Physics Course').
module('Anglais', 'English Course').
module('Informatique', 'Computer Science Course').
module('Chimie', 'Chemistry Course').
module('Biologie', 'Biology Course').
module('Histoire', 'History Course').
module('Geographie', 'Geography Course').
module('Economie', 'Economics Course').

% Notes
note('Dupont', 'Marie', 'Math', 15).
note('Dupont', 'Marie', 'Physique', 14).
note('Martin', 'Paul', 'Math', 12).
note('Martin', 'Paul', 'Physique', 13).
note('Durand', 'Jean', 'Math', 10).
note('Durand', 'Jean', 'Physique', 11).
note('Dubois', 'Pierre', 'Math', 9).
note('Dubois', 'Pierre', 'Physique', 8).
note('Lefevre', 'Julie', 'Math', 16).
note('Lefevre', 'Julie', 'Physique', 17).
note('Leroy', 'Sophie', 'Math', 14).
note('Leroy', 'Sophie', 'Physique', 15).
note('Moreau', 'Luc', 'Math', 11).
note('Moreau', 'Luc', 'Physique', 12).

eleves_dans_groupe(NomGroupe, NomEleve, PrenomEleve) :-
    groupe_projet(NomGroupe, NomEleve, PrenomEleve).

moyenne_notes(NomEleve, PrenomEleve, NomModule, Moyenne) :-
    findall(Note, note(NomEleve, PrenomEleve, NomModule, Note), ListeNotes),
    sum_list(ListeNotes, Somme),
    length(ListeNotes, NombreNotes),
    NombreNotes > 0,
    Moyenne is Somme / NombreNotes.

modules_suivis_par_eleve(NomEleve, PrenomEleve, NomModule) :-
    note(NomEleve, PrenomEleve, NomModule, _).


