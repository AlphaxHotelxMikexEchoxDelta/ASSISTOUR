Create User 'Dominic'@Localhost Identified By 'Lapommedeterre<3' ;
Grant All Privileges On *.* To 'Dominic'@Localhost Identified By 'Lapommedeterre<3' ;
Flush Privileges ;

Create Database ASSISTOUR ;
Use ASSISTOUR ;

Create Table ADHERENT
(
	Numadh Int(255) Primary Key Not Null Auto_Increment,
	Nomadh Char(255) Default 'Non-Renseigner',
	Prenomadh Char(255) Default 'Non-Renseigner',
	Adresseadh Varchar(255) Default 'Non-Renseigner',
	Codepostaladh Int(255),
	Villeadh Char(255) Default 'Non-Renseigner',
	Telephoneadh Int(255)
);

Create Table TYPECONTRAT
(
	Idtypecontrat Int(255) Primary Key Not Null Auto_Increment,
	Nomtypecontrat Varchar(255)
);

Create Table CONTRAT
(
	Idcontrat Int(255) Primary Key Not Null Auto_Increment,
	Typecontrat Int(255),
	Adherent Int(255),
	Prixnegocie Int(255),
	Foreign Key(Typecontrat) References TYPECONTRAT(Idtypecontrat),
	Foreign Key(Adherent) References ADHERENT(Numadh)
);

Create Table TECHNICIENASSISTANCE
(
	Idta Int(255) Primary Key Not Null Auto_Increment,
	Nomta Char(255) Default 'Non-Renseigner',
	Prenomta Char(255) Default 'Non-Renseigner'
);

Create Table MODETRANSPORT
(
	Idmdt Int(255) Primary Key Not Null Auto_Increment,
	Horaires Time,
	Prix Int(255)
);

Create Table TRANSPORTEUR
(
	Idt Int(255) Primary Key Not Null Auto_Increment,
	Nom Char(255)
);

Create Table GARAGE
(
	Idg Int(255) Primary Key Not Null Auto_Increment,
	Nom Varchar(255) Default 'Non-Renseigner',
	Adresse Varchar(255) Default 'Non-Renseigner',
	Marque Varchar(255) Default 'Non-Renseigner',
	Tel Int(255),
	Forfaits Int(255),
	Avance_Accepte char(255)
);

Create Table DOSSIERSINISTRE
(
	Idds Int(255) Primary Key Not Null Auto_Increment,
	Technicienassistance Int(255),
	Garage Int(255),
	Contratvehicule Int(255),
	Datesinistre Date,
	Heuresinistre Time,
	Causesinistre Varchar(255) Default 'Non-Renseigner',
	Diagnosticsinistre Varchar(255),
	Lieusinistre Varchar(255) Default 'Non-Renseigner',
	Nbpersonnes Int(255) Default 1,
	Foreign Key(Technicienassistance) References TECHNICIENASSISTANCE(Idta),
	Foreign Key(Garage) References GARAGE(Idg),
	Foreign Key(Contratvehicule) References CONTRAT(Idcontrat)
);

Create Table PROPOSER
(
	Transporteur Int(255),
	Modetransport Int(255),
	Foreign Key(Transporteur) References TRANSPORTEUR(Idt),
	Foreign Key(Modetransport) References MODETRANSPORT(Idmdt)
);



Create Table ETAPE
(
	Dossiersinistre Int(255),
	Numordre Int(255) Primary Key Not Null Auto_Increment,
	Cout Int(255) Default 10,
	Transporteur Int(255),
	Modetransport Int(255),
	Villedepart Char(255) Default 'Non-Renseigner',
	Villearrivee Char(255) Default 'Non-Renseigner',
	Horaires Time,
	Foreign Key(Dossiersinistre) References DOSSIERSINISTRE(Idds),
	Foreign Key(Transporteur) References TRANSPORTEUR(Idt),
	Foreign Key(Modetransport) References MODETRANSPORT(Idmdt)
);

Create Table HOTEL
(
	Idh Int(255) Primary Key Not Null Auto_Increment,
	Nom Varchar(255) Default 'Non-Renseigner',
	Adresse Varchar(255) Default 'Non-Renseigner',
	Tel Int(255),
	Prixnuitee Int(255)
);

Create Table DATEE
(
	idDate Date Primary Key Not Null
);



Create Table HEBERGER
(
	idDate Date,
	Hotel Int(255),
	Dossiersinistre Int(255),
	Nbnuitee Int(255),
	Foreign Key(idDate) References DATEE(idDate),
	Foreign Key(Hotel) References HOTEL(Idh),
	Foreign Key(Dossiersinistre) References DOSSIERSINISTRE(Idds)
);


