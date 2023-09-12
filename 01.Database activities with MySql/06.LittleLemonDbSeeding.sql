USE littlelemondb;

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE Cuisines;
TRUNCATE Starters;
TRUNCATE Courses;
TRUNCATE Sides;
TRUNCATE Drinks;
TRUNCATE Desserts;
TRUNCATE DeliveryTypes;
TRUNCATE Countries;
TRUNCATE DeliveryDetails;
TRUNCATE Customers;
TRUNCATE Orders;
TRUNCATE Menus;
TRUNCATE OrderDetails;
TRUNCATE BookingStates;
TRUNCATE Bookings;
TRUNCATE StaffRoles;
TRUNCATE Staff;

SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO Cuisines
VALUES (1, "Greek")
	,(2, "Italian")
	,(3, "Turkish");
	
INSERT INTO Starters
VALUES (1, "Olives")
	,(2, "Flatbread")
	,(3, "Minestrone")
	,(4, "Tomato bread")
	,(5, "Falafel")
	,(6, "Hummus");

INSERT INTO Courses
VALUES (1, "Greek salad")
	,(2, "Bean soup")
	,(3, "Pizza")
	,(4, "Carbonara")
	,(5, "Kabasa")
	,(6, "Shwarma");

INSERT INTO Sides 
VALUES (1, "Tapas")
	,(2, "Potato salad")
	,(3, "Bruschetta")
	,(4, "Focaccia")
	,(5, "Meatballs")
	,(6, "Fries");

INSERT INTO Drinks 
VALUES (1, "Athens White wine")
	,(2, "Corfu Red Wine")
	,(3, "Italian Coffee")
	,(4, "Roma Red wine")
	,(5, "Ankara White Wine")
	,(6, "Turkish Coffee");
	
INSERT INTO Desserts
VALUES (1, "Greek yoghurt")
	,(2, "Ice cream")
	,(3, "Cheesecake")
	,(4, "Affogato")
	,(5, "Turkish yoghurt")
	,(6, "Baklava");
	
INSERT INTO DeliveryTypes
VALUES (1, "Standard")
	,(2, "Air")
	,(3, "Priority")
	,(4, "Express")
	,(5, "Express Air");

INSERT INTO Countries
VALUES (1, "North Korea", "KP")
	,(2, "Libya", "LY")
	,(3, "Russia", "RU")
	,(4, "Portugal", "PT")
	,(5, "Panama", "PA")
	,(6, "Colombia", "CO")
	,(7, "Germany", "DE")
	,(8, "Indonesia", "ID")
	,(9, "Armenia", "AM")
	,(10, "Czech Republic", "CZ")
	,(11, "Canada", "CA")
	,(12, "Ukraine", "UA")
	,(13, "Azerbaijan", "AZ")
	,(14, "Brazil", "BR")
	,(15, "Belarus", "BY")
	,(16, "Honduras", "HN")
	,(17, "Japan", "JP")
	,(18, "Nigeria", "NG")
	,(19, "Peru", "PE")
	,(20, "Togo", "TG")
	,(21, "Thailand", "TH")
	,(22, "Kazakhstan", "KZ")
	,(23, "Mexico", "MX")
	,(24, "China", "CN")
	,(25, "Sweden", "SE")
	,(26, "Zambia", "ZM");

INSERT INTO DeliveryDetails
VALUES (1, "2020-3-26", 4, 9930031, "China", (select id from countries where code="CN"))
	,(2, "2020-7-17", 3, 216282, "North Korea", (select id from countries where code="KP"))
	,(3, "2020-4-24", 5, 663246, "Peru", (select id from countries where code="PE"))
	,(4, "2020-4-13", 5, 9870352, "Japan", (select id from countries where code="JP"))
	,(5, "2021-2-2", 5, 35101, "Libya", (select id from countries where code="LY"))
	,(6, "2020-1-13", 4, 93995, "Mexico", (select id from countries where code="MX"))
	,(7, "2019-10-26", 4, 641360, "Russia", (select id from countries where code="RU"))
	,(8, "2020-12-27", 2, 3810760, "Portugal", (select id from countries where code="PT"))
	,(9, "2021-4-16", 4, 692769, "Russia", (select id from countries where code="RU"))
	,(10, "2021-11-13", 5, 6496326, "China", (select id from countries where code="CN"))
	,(11, "2019-11-28", 3, 33619, "Nigeria", (select id from countries where code="NG"))
	,(12, "2021-4-17", 4, 9930031, "Japan", (select id from countries where code="JP"))
	,(13, "2022-1-7", 5, 216282, "China", (select id from countries where code="CN"))
	,(14, "2020-7-5", 5, 663246, "Panama", (select id from countries where code="PA"))
	,(15, "2020-3-17", 4, 9870352, "Russia", (select id from countries where code="RU"))
	,(16, "2021-11-27", 1, 35101, "Colombia", (select id from countries where code="CO"))
	,(17, "2022-10-14", 2, 93995, "Germany", (select id from countries where code="DE"))
	,(18, "2019-12-3", 3, 641360, "China", (select id from countries where code="CN"))
	,(19, "2022-4-6", 5, 3810760, "Indonesia", (select id from countries where code="ID"))
	,(20, "2019-12-29", 1, 692769, "Armenia", (select id from countries where code="AM"))
	,(21, "2020-12-30", 2, 6496326, "China", (select id from countries where code="CN"))
	,(22, "2021-12-15", 1, 33619, "Czech Republic", (select id from countries where code="CZ"))
	,(23, "2021-9-28", 2, 1188725, "Indonesia", (select id from countries where code="ID"))
	,(24, "2020-1-5", 1, 1736090, "China", (select id from countries where code="CN"))
	,(25, "2020-2-4", 5, 9930031, "Indonesia", (select id from countries where code="ID"))
	,(26, "2020-10-11", 3, 216282, "China", (select id from countries where code="CN"))
	,(27, "2022-9-3", 3, 663246, "Canada", (select id from countries where code="CA"))
	,(28, "2020-4-19", 4, 9870352, "China", (select id from countries where code="CN"))
	,(29, "2020-11-6", 1, 35101, "Indonesia", (select id from countries where code="ID"))
	,(30, "2022-11-19", 2, 93995, "Russia", (select id from countries where code="RU"))
	,(31, "2021-3-12", 4, 641360, "China", (select id from countries where code="CN"))
	,(32, "2022-8-31", 1, 3810760, "Ukraine", (select id from countries where code="UA"))
	,(33, "2020-8-25", 1, 692769, "China", (select id from countries where code="CN"))
	,(34, "2019-12-16", 2, 6496326, "Azerbaijan", (select id from countries where code="AZ"))
	,(35, "2022-1-24", 4, 33619, "Brazil", (select id from countries where code="BR"))
	,(36, "2021-4-4", 2, 2004138, "China", (select id from countries where code="CN"))
	,(37, "2020-10-9", 4, 2451102, "Indonesia", (select id from countries where code="ID"))
	,(38, "2021-5-6", 3, 9930031, "Belarus", (select id from countries where code="BY"))
	,(39, "2022-12-19", 4, 216282, "Panama", (select id from countries where code="PA"))
	,(40, "2021-1-25", 3, 663246, "Honduras", (select id from countries where code="HN"))
	,(41, "2022-1-7", 4, 9870352, "Japan", (select id from countries where code="JP"))
	,(42, "2020-12-5", 5, 35101, "Kazakhstan", (select id from countries where code="KZ"))
	,(43, "2022-3-12", 4, 93995, "Russia", (select id from countries where code="RU"))
	,(44, "2021-3-18", 1, 641360, "Nigeria", (select id from countries where code="NG"))
	,(45, "2019-11-12", 3, 3810760, "Thailand", (select id from countries where code="TH"))
	,(46, "2022-12-30", 3, 692769, "Peru", (select id from countries where code="PE"))
	,(47, "2021-4-17", 1, 6496326, "Zambia", (select id from countries where code="ZM"))
	,(48, "2022-8-31", 5, 33619, "Togo", (select id from countries where code="TG"))
	,(49, "2021-12-28", 1, 367793, "Mexico", (select id from countries where code="MX"))
	,(50, "2021-9-8", 5, 527841, "Thailand", (select id from countries where code="TH"))
	,(51, "2020-11-8", 1, 687889, "China", (select id from countries where code="CN"))
	,(52, "2022-9-1", 3, 9930031, "Kazakhstan", (select id from countries where code="KZ"))
	,(53, "2021-11-26", 4, 216282, "Mexico", (select id from countries where code="MX"))
	,(54, "2021-3-21", 2, 663246, "Indonesia", (select id from countries where code="ID"))
	,(55, "2021-1-2", 1, 9870352, "China", (select id from countries where code="CN"))
	,(56, "2022-2-20", 5, 35101, "China", (select id from countries where code="CN"))
	,(57, "2020-5-12", 1, 93995, "Indonesia", (select id from countries where code="ID"))
	,(58, "2020-8-26", 5, 641360, "Sweden", (select id from countries where code="SE"))
	,(59, "2021-6-2", 2, 3810760, "Zambia", (select id from countries where code="ZM"));

INSERT INTO Customers
VALUES (1, "Laney Fadden", 58475269, "laney.fadden@email.com")
	,(2, "Giacopo Bramich", 28732934, "giacopo.bramich@email.com")
	,(3, "Lia Bonar", 38774561, "lia.bonar@email.com")
	,(4, "Merrill Baudon", 69073923, "merrill.baudon@email.com")
	,(5, "Tasia Fautly", 61375278, "tasia.fautly@email.com")
	,(6, "Angel Veschambre", 61543514, "angel.veschambre@email.com")
	,(7, "Sheilah Maestro", 44546242, "sheilah.maestro@email.com")
	,(8, "Audie Willcocks", 43145437, "audie.willcocks@email.com")
	,(9, "Mart Malsher", 23801258, "mart.malsher@email.com")
	,(10, "Magdalen Lacheze", 53676466, "magdalen.lacheze@email.com")
	,(11, "Margarita Mancktelow", 62411808, "margarita.mancktelow@email.com")
	,(12, "Ashil Brogini", 56902810, "ashil.brogini@email.com")
	,(13, "Arthur Mathewson", 34102372, "arthur.mathewson@email.com")
	,(14, "Ennis Dungate", 86404927, "ennis.dungate@email.com")
	,(15, "Tiffani Halstead", 49825600, "tiffani.halstead@email.com")
	,(16, "Roddie Winterbotham", 69963831, "roddie.winterbotham@email.com")
	,(17, "Pincas Stearn", 75078834, "pincas.stearn@email.com")
	,(18, "Tony Crabtree", 43208142, "tony.crabtree@email.com")
	,(19, "Tamarah Filasov", 17862094, "tamarah.filasov@email.com")
	,(20, "Pen Pruce", 21309087, "pen.pruce@email.com")
	,(21, "Boot Burree", 26607570, "boot.burree@email.com")
	,(22, "Sabra Calbreath", 25578575, "sabra.calbreath@email.com")
	,(23, "Obidiah Zanicchi", 94812662, "obidiah.zanicchi@email.com")
	,(24, "Anders Stowe", 68227408, "anders.stowe@email.com")
	,(25, "Locke Janaway", 67863967, "locke.janaway@email.com")
	,(26, "Kaylyn Colebourne", 67687081, "kaylyn.colebourne@email.com")
	,(27, "Noni Quickenden", 46127843, "noni.quickenden@email.com")
	,(28, "Alan Paskell", 32736338, "alan.paskell@email.com")
	,(29, "Anny Pattemore", 15478221, "anny.pattemore@email.com")
	,(30, "Les Harmson", 12945674, "les.harmson@email.com")
	,(31, "Horatio Lundy", 51107267, "horatio.lundy@email.com")
	,(32, "Sibley Rodder", 83411724, "sibley.rodder@email.com")
	,(33, "Dniren Copperwaite", 50790087, "dniren.copperwaite@email.com")
	,(34, "Sorcha Beesley", 73688490, "sorcha.beesley@email.com")
	,(35, "Alison Jamieson", 17124559, "alison.jamieson@email.com")
	,(36, "Dre Danher", 86352479, "dre.danher@email.com")
	,(37, "Chris Gummer", 61566824, "chris.gummer@email.com")
	,(38, "Adiana Shirtliff", 28630713, "adiana.shirtliff@email.com")
	,(39, "Derry Davis", 65841199, "derry.davis@email.com")
	,(40, "Lenci McFadzean", 76427714, "lenci.mcfadzean@email.com")
	,(41, "Uriel Grooby", 44503456, "uriel.grooby@email.com")
	,(42, "Jillayne Gaiford", 62852763, "jillayne.gaiford@email.com")
	,(43, "Tiertza Doogan", 23679521, "tiertza.doogan@email.com")
	,(44, "Ilario Michie", 40834971, "ilario.michie@email.com")
	,(45, "Sarah Plaschke", 45026610, "sarah.plaschke@email.com")
	,(46, "Skipp Lowater", 33295105, "skipp.lowater@email.com")
	,(47, "Maddalena Wolfinger", 65905777, "maddalena.wolfinger@email.com")
	,(48, "Mariquilla Labbe", 39218205, "mariquilla.labbe@email.com")
	,(49, "Cornelius Harkess", 49494168, "cornelius.harkess@email.com")
	,(50, "Erv Padrick", 83915517, "erv.padrick@email.com")
	,(51, "Fielding Struys", 59007128, "fielding.struys@email.com")
	,(52, "Purcell Eyer", 70014616, "purcell.eyer@email.com")
	,(53, "Pietra Dibdall", 66006619, "pietra.dibdall@email.com")
	,(54, "Dyanne Labbet", 86101451, "dyanne.labbet@email.com")
	,(55, "Elsworth Stannas", 11231394, "elsworth.stannas@email.com")
	,(56, "Marlo McGeaney", 38400933, "marlo.mcgeaney@email.com")
	,(57, "Calvin Aucock", 48865916, "calvin.aucock@email.com")
	,(58, "Prudence Eastlake", 77085758, "prudence.eastlake@email.com")
	,(59, "Gwenora Beauchamp", 18644049, "gwenora.beauchamp@email.com");
    
INSERT INTO Orders
VALUES (1, "2020-6-15", 1, 1)
	,(2, "2020-8-25", 2, 2)
	,(3, "2021-8-17", 3, 3)
	,(4, "2021-8-14", 4, 4)
	,(5, "2020-12-20", 5, 5)
	,(6, "2020-3-1", 6, 6)
	,(7, "2021-10-4", 7, 7)
	,(8, "2021-10-9", 8, 8)
	,(9, "2021-12-27", 9, 9)
	,(10, "2020-3-5", 10, 10)
	,(11, "2019-7-20", 11, 11)
	,(12, "2022-6-26", 12, 12)
	,(13, "2020-12-3", 13, 13)
	,(14, "2022-4-13", 14, 14)
	,(15, "2020-8-22", 15, 15)
	,(16, "2020-9-30", 16, 16)
	,(17, "2019-9-4", 17, 17)
	,(18, "2021-4-29", 18, 18)
	,(19, "2020-4-14", 19, 19)
	,(20, "2020-4-24", 20, 20)
	,(21, "2019-9-30", 21, 21)
	,(22, "2021-6-8", 22, 22)
	,(23, "2020-6-1", 23, 23)
	,(24, "2021-11-3", 24, 24)
	,(25, "2020-2-2", 25, 25)
	,(26, "2019-9-13", 26, 26)
	,(27, "2020-8-25", 27, 27)
	,(28, "2021-4-22", 28, 28)
	,(29, "2019-8-9", 29, 29)
	,(30, "2022-4-12", 30, 30)
	,(31, "2022-1-28", 31, 31)
	,(32, "2021-4-2", 32, 32)
	,(33, "2021-11-23", 33, 33)
	,(34, "2022-4-5", 34, 34)
	,(35, "2019-8-10", 35, 35)
	,(36, "2022-2-27", 36, 36)
	,(37, "2019-8-8", 37, 37)
	,(38, "2022-5-4", 38, 38)
	,(39, "2020-10-5", 39, 39)
	,(40, "2021-1-27", 40, 40)
	,(41, "2019-8-14", 41, 41)
	,(42, "2021-11-25", 42, 42)
	,(43, "2019-9-29", 43, 43)
	,(44, "2022-4-13", 44, 44)
	,(45, "2020-12-10", 45, 45)
	,(46, "2022-11-19", 46, 46)
	,(47, "2021-8-16", 47, 47)
	,(48, "2021-6-13", 48, 48)
	,(49, "2021-2-2", 49, 49)
	,(50, "2022-3-7", 50, 50)
	,(51, "2022-12-2", 51, 51)
	,(52, "2019-12-16", 52, 52)
	,(53, "2022-5-27", 53, 53)
	,(54, "2020-3-29", 54, 54)
	,(55, "2021-1-12", 55, 55)
	,(56, "2022-8-12", 56, 56)
	,(57, "2022-3-27", 57, 57)
	,(58, "2022-2-15", 58, 58)
	,(59, "2021-10-11", 59, 59);

INSERT INTO Menus
VALUES (1, "Menu #1", 1, 1, 1, 1, 1, 1)
	,(2, "Menu #2", 2, 2, 2, 2, 2, 2)
	,(3, "Menu #3", 2, 3, 3, 3, 3, 3)
	,(4, "Menu #4", 3, 4, 4, 4, 4, 4)
	,(5, "Menu #5", 1, 5, 5, 5, 5, 5)
	,(6, "Menu #6", 2, 6, 6, 6, 6, 6)
	,(7, "Menu #7", 2, 1, 1, 1, 1, 1)
	,(8, "Menu #8", 3, 2, 2, 2, 2, 2)
	,(9, "Menu #9", 1, 3, 3, 3, 3, 3)
	,(10, "Menu #10", 2, 4, 4, 4, 4, 4)
	,(11, "Menu #11", 2, 5, 5, 5, 5, 5)
	,(12, "Menu #12", 3, 6, 6, 6, 6, 6)
	,(13, "Menu #13", 3, 1, 2, 2, 2, 2)
	,(14, "Menu #14", 1, 2, 3, 3, 3, 3)
	,(15, "Menu #15", 2, 3, 4, 4, 4, 4)
	,(16, "Menu #16", 2, 4, 5, 5, 5, 5)
	,(17, "Menu #17", 3, 5, 6, 6, 6, 6)
	,(18, "Menu #18", 1, 6, 1, 1, 1, 1)
	,(19, "Menu #19", 2, 1, 2, 2, 2, 2)
	,(20, "Menu #20", 2, 2, 3, 3, 3, 3)
	,(21, "Menu #21", 3, 3, 4, 4, 4, 4)
	,(22, "Menu #22", 1, 4, 5, 5, 5, 5)
	,(23, "Menu #23", 2, 5, 6, 6, 6, 6)
	,(24, "Menu #24", 2, 6, 1, 1, 1, 1)
	,(25, "Menu #25", 2, 1, 3, 3, 3, 3)
	,(26, "Menu #26", 3, 2, 4, 4, 4, 4)
	,(27, "Menu #27", 1, 3, 5, 5, 5, 5)
	,(28, "Menu #28", 2, 4, 6, 6, 6, 6)
	,(29, "Menu #29", 2, 5, 1, 1, 1, 1)
	,(30, "Menu #30", 3, 6, 2, 2, 2, 2)
	,(31, "Menu #31", 1, 1, 3, 3, 3, 3)
	,(32, "Menu #32", 2, 2, 4, 4, 4, 4)
	,(33, "Menu #33", 2, 3, 5, 5, 5, 5)
	,(34, "Menu #34", 3, 4, 6, 6, 6, 6)
	,(35, "Menu #35", 1, 5, 1, 1, 1, 1)
	,(36, "Menu #36", 2, 6, 2, 2, 2, 2)
	,(37, "Menu #37", 2, 1, 4, 4, 4, 4)
	,(38, "Menu #38", 2, 2, 5, 5, 5, 5);

INSERT INTO OrderDetails
VALUES (1, 33, 2, 187.5, 125, 20, 60.51)
	,(2, 25, 1, 352.5, 235, 15, 96.75)
	,(3, 38, 3, 112.5, 75, 10.52, 36.37)
	,(4, 28, 3, 330, 220, 11.23, 5.49)
	,(5, 27, 2, 480, 320, 51.05, 63.64)
	,(6, 9, 1, 315, 210, 89.84, 5.04)
	,(7, 8, 2, 465, 310, 17.4, 56.95)
	,(8, 28, 3, 337.5, 225, 91.41, 91.05)
	,(9, 7, 2, 285, 190, 9.71, 86.28)
	,(10, 14, 1, 147, 98, 80.34, 31.34)
	,(11, 36, 3, 252.405, 168.27, 54.08, 85.08)
	,(12, 3, 3, 152.4, 101.6, 98.01, 25.98)
	,(13, 35, 2, 139.695, 93.13, 99.24, 96.84)
	,(14, 38, 1, 66.855, 44.57, 30, 31.22)
	,(15, 36, 2, 137.76, 91.84, 37.04, 88.76)
	,(16, 31, 3, 199.755, 133.17, 24, 63.21)
	,(17, 25, 2, 78.12, 52.08, 10, 17.25)
	,(18, 29, 1, 125.985, 83.99, 53.53, 39.3)
	,(19, 32, 3, 104.07, 69.38, 23, 53.56)
	,(20, 29, 3, 179.7, 119.8, 73.09, 28.6)
	,(21, 19, 2, 187.5, 125, 20.33, 61.97)
	,(22, 12, 1, 352.5, 235, 9.12, 36.98)
	,(23, 9, 2, 112.5, 75, 67.77, 27.07)
	,(24, 16, 3, 330, 220, 35.44, 60.52)
	,(25, 38, 2, 480, 320, 31.2, 56.51)
	,(26, 37, 1, 315, 210, 61.49, 10.69)
	,(27, 35, 3, 465, 310, 91.14, 95.63)
	,(28, 9, 3, 337.5, 225, 97.48, 27.41)
	,(29, 17, 2, 285, 190, 68.89, 41.35)
	,(30, 10, 1, 147, 98, 47.84, 81.65)
	,(31, 37, 2, 252.405, 168.27, 94.76, 29.39)
	,(32, 12, 3, 152.4, 101.6, 20, 80.78)
	,(33, 11, 2, 139.695, 93.13, 15, 89.49)
	,(34, 8, 1, 66.855, 44.57, 10.52, 85.67)
	,(35, 4, 3, 137.76, 91.84, 11.23, 3.41)
	,(36, 31, 3, 199.755, 133.17, 51.05, 84.09)
	,(37, 26, 2, 78.12, 52.08, 89.84, 49.69)
	,(38, 12, 1, 125.985, 83.99, 17.4, 15.9)
	,(39, 11, 2, 104.07, 69.38, 91.41, 80.86)
	,(40, 26, 3, 179.7, 119.8, 9.71, 33.7)
	,(41, 37, 2, 187.5, 125, 80.34, 18.6)
	,(42, 36, 1, 352.5, 235, 54.08, 86.02)
	,(43, 29, 3, 112.5, 75, 98.01, 35.33)
	,(44, 23, 3, 330, 220, 99.24, 31.82)
	,(45, 13, 2, 480, 320, 30, 54.59)
	,(46, 13, 1, 315, 210, 37.04, 51.93)
	,(47, 10, 2, 465, 310, 24, 45.57)
	,(48, 18, 3, 337.5, 225, 10, 78.35)
	,(49, 16, 2, 285, 190, 53.53, 17.19)
	,(50, 38, 1, 147, 98, 23, 83.86)
	,(51, 6, 3, 252.405, 168.27, 73.09, 91.47)
	,(52, 35, 3, 186.93, 124.62, 20.33, 60.4)
	,(53, 6, 2, 216.135, 144.09, 9.12, 22.02)
	,(54, 29, 1, 152.4, 101.6, 67.77, 32.74)
	,(55, 8, 2, 139.695, 93.13, 35.44, 51.13)
	,(56, 26, 3, 66.855, 44.57, 31.2, 54.68)
	,(57, 29, 2, 137.76, 91.84, 61.49, 62.4)
	,(58, 18, 1, 199.755, 133.17, 91.14, 63.51)
	,(59, 17, 3, 78.12, 52.08, 97.48, 3.76);

INSERT INTO BookingStates
VALUES (1, "Confirmed")
	,(2, "Cancelled");

INSERT INTO Bookings
VALUES (1, 2, 4, "2023-09-07", 1, 1)
	,(2, 5, 6, "2023-09-07", 2, 1)
	,(3, 3, 1, "2023-09-07", 3, 1)
	,(4, 3, 8, "2023-09-07", 4, 2)
	,(5, 7, 3, "2023-09-13", 4, 1)
	,(6, 9, 5, "2023-09-13", 2, 1)
	,(7, 12, 2, "2023-09-13", 7, 1)
	,(8, 12, 2, "2023-09-13", 8, 2);
    
INSERT INTO StaffRoles
VALUES (1, "Waiter/Waitress")
	,(2, "Commis")
	,(3, "Sous Chef")
	,(4, "Chef")
	,(5, "Assistant")
	,(6, "CEO");

INSERT INTO Staff
VALUES (1, "Jhon", "Smith", 12500, 1)
	,(2, "Gianna", "Green", 14500, 1)
	,(3, "Adam", "Black", 16700, 2)
	,(4, "Sandra", "Red", 18000, 3)
	,(5, "Robert", "Gray", 20500, 4)
	,(6, "Evelin", "Blue", 15700, 5)
	,(7, "Sara", "Purple", 35000, 6);