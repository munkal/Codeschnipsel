insert into snowboard.entlehnstationen (Bezeichnung) value ('Salzburg');
insert into snowboard.entlehnstationen (Bezeichnung) value ('Hallein');
insert into snowboard.entlehnstationen (Bezeichnung) value ('Antering');
insert into snowboard.entlehnstationen (Bezeichnung) value ('Wals');

insert into snowboard (Bezeichnung, Marke) values ('Snowspace Racer 2000','Snowspace');
insert into snowboard (Bezeichnung, Marke) values ('Snowspace Racher 3000','Snowspace');
insert into snowboard (Bezeichnung, Marke) values ('Highland Actionboard','SSH');
insert into snowboard (Bezeichnung, Marke) values ('North Pole Bike','North Gear');

insert into snowboard.kunde (Vorname, Nachname,Registrierdatum,Adresse,PLZ,Ort) values ('Sebastian','Reifberger','2022-07-03','Himmelreichstrasse 36','5071','Wals');
insert into snowboard.kunde (Vorname, Nachname, Titel,Registrierdatum,Adresse,PLZ,Ort) values ('Max','Maximilian','Dr','2021-05-05','Hausstrasse 22','5050','Salzburg');
insert into snowboard.kunde (Vorname, Nachname,Registrierdatum,Adresse,PLZ,Ort) values ('Alexander','Klein','2021-03-23','Karrostrasse 43','1234','Stadt');
insert into snowboard.kunde (Vorname, Nachname, Titel,Registrierdatum,Adresse,PLZ,Ort) values ('Anna','Sturm','Dr','2020-01-01','Fadenstrasse 2','5678','Niemandslamd');

insert into snowboard.verleihvorgang (Entlehnungszeit,Rueckgabezeit,Kunde_idKunde,Entlehnstationen_idEntlehnstationen,Snowboard_idSnowboard) values ('2022-03-07 11:00:00:0 AM','2022-03-07 17:00:00:0 PM','1','4','4');
insert into snowboard.verleihvorgang (Entlehnungszeit,Rueckgabezeit,Kunde_idKunde,Entlehnstationen_idEntlehnstationen,Snowboard_idSnowboard) values ('2021/03/07 11:00:00:0 AM','2021/03/07 19:00:00:0 PM','2','1','2');
insert into snowboard.verleihvorgang (Entlehnungszeit,Rueckgabezeit,Kunde_idKunde,Entlehnstationen_idEntlehnstationen,Snowboard_idSnowboard) values ('2022/03/03 11:00:00:0 AM','2022/03/04 08:00:00:0 AM','4','2','2');
insert into snowboard.verleihvorgang (Entlehnungszeit,Rueckgabezeit,Kunde_idKunde,Entlehnstationen_idEntlehnstationen,Snowboard_idSnowboard) values ('2022/02/23 10:00:00:0 AM','2022/03/01 14:00:00:0 PM','1','4','1');
insert into snowboard.verleihvorgang (Entlehnungszeit,Rueckgabezeit,Kunde_idKunde,Entlehnstationen_idEntlehnstationen,Snowboard_idSnowboard) values ('2022/01/01 11:00:00:0 AM','2022/01/01 19:00:00:0 PM','3','4','4');
insert into snowboard.verleihvorgang (Entlehnungszeit,Rueckgabezeit,Kunde_idKunde,Entlehnstationen_idEntlehnstationen,Snowboard_idSnowboard) values ('2022/03/10 09:00:00:0 AM','2022/03/10 16:00:00:0 PM','2','1','1');
insert into snowboard.verleihvorgang (Entlehnungszeit,Rueckgabezeit,Kunde_idKunde,Entlehnstationen_idEntlehnstationen,Snowboard_idSnowboard) values ('2022/03/12 13:00:00:0 AM','2022/03/07 15:00:00:0 PM','4','3','3');
insert into snowboard.verleihvorgang (Entlehnungszeit,Rueckgabezeit,Kunde_idKunde,Entlehnstationen_idEntlehnstationen,Snowboard_idSnowboard) values ('2022/01/12 09:00:00:0 AM','2022/01/20 11:00:00:0 AM','2','2','2');
insert into snowboard.verleihvorgang (Entlehnungszeit,Rueckgabezeit,Kunde_idKunde,Entlehnstationen_idEntlehnstationen,Snowboard_idSnowboard) values ('2021/03/07 11:00:00:0 AM','2021/03/07 20:00:00:0 PM','1','1','2');
insert into snowboard.verleihvorgang (Entlehnungszeit,Rueckgabezeit,Kunde_idKunde,Entlehnstationen_idEntlehnstationen,Snowboard_idSnowboard) values ('2021/01/07 11:00:00:0 AM','2022/01/08 12:00:00:0 AM','2','4','2');




