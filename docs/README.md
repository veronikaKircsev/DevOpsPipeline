UI für UI solltet Node.js installiert werden. In IntelliJ alle „dependencies“ mit npm install, wenn  editor es empfiehlt, installiert werden sollten.
In Readme findet man die benötigten weiteren Kommandozeile Befehlen.
Usermanual:
Select Book a Room link.

Dann solltet man Start und End Date wählen mit Anzahl der Gesten und aussuchen ob mit oder ohne Balkon sein soll. Dann Search.
Danach wird alle frei Zimmer für den gewählten Zeitraum angezeigt werden.

Beim gewünschten Zimmer klick auf Book this room und Formular ausfühlen. Man muss mehr wie 18 Jahre Alt sein, sonst Buchung geht nicht in Backend durch.

Our Customers Menü zeigt unsere Benützer an und gibt Möglichkeit neue anlegen, danach nicht wenn nicht 18 ist.

All Bookings zeigt alle Buchungen an und dort kann Buchung mit Id gelöscht werden.

Beim Backend soll alle drei App gestartet werden.

Danach solltet die System Ausgabe beachtet werden. 
Beim Typfehler leider muss man mit Befehl nochmal anfangen.
Kommandozeile bietet Möglichkeit Alle Events löschen und wieder herstellen.

Architektur Beschreibung
Backend besteht aus drei Teilen. CommandClient, EventBus, QueryClient alle Teilen kommunizieren miteinander mit REST endpoints. 
CommandClient:
WriteModell hat alle Domain Modell Klassen.
Command hat alle Command Klassen.
DomainRepositories hat alle Repositories.
Aggregate hat GuestService und ReservationService für Repositorie Verwaltung nach Kommandos.
Für Einfacher Kommando Verwaltung haben wir CommandHandler erzeugt, das sortiert Kommandos und weiterleitet zur Aggregates.
EventPublischer haben wir ausarbeitet und ruft die Events Endpoints beim EventBus auf.
CommandClientHandler verwaltet einkommende Kommandos und Endpoints und ruft EventPublisher auf.
CommandCliClientHandler erzeugt die Zimmer und nimmt Kommandozeile Befehle und Handelt die und ruft EvenPublisher auf.
EventBus:
Events hat alle Event Klassen
Rest hat EventRestController für verwalten RestEndpoints. Nimmt Events und leitet zur Repositorie weiter.
EventPublisher haben wir ausarbeitet und ruft die Events Endpoints auf on QueryClient.
EventRepository hat List von Events, nimmt, weitersendet, durch EventPublisher, und speichert die Events. Bietet zwei Funktion Event Speichern in Text, wenn alles gelöscht wird und liest Events von Text, wenn alle Events wieder hergestellt werden soll. Repositorie Löschen Event und Herstellung wird nicht mehr in Event List gespeichert. 
QueryClient:
ReadModell hat alle ReadModells.
ReadRepository hat alle Modell Repositories.
Projection hat GuestProjection und RoomProjection für Event Behandlung (weiterleitung zur Repositories).
EventProjection sortiert Events zur ziel Projection.
QueryHandler sortiert Queries zur ziel Projection.
QueryClientEventController nimmt Events auf definierte Endpoints an und ruft Projection.
QueryClientController nimmt Queries auf definierte Endpoints an und sendet Antwort als String zurück.
QueryClientCli behandelt Kommandozeile Befehle und schreibt als Konsole Ausgabe das Ergebnis zurück.
Für weiteren Information mit IntelliJ generierten wir Klassendiagramm für unsere Architektur.
Weiteren Anmerkungen:
Die Zimmern (1-40) haben wir überall hartcodiert. Das heißt CommandCliClient in run() Methode befühlt RoomRepository, QueryClientCli in run() Methode befühlt AvailableRoomRepositorie mit der benötigten Daten. Deshalb müssten wir hartcodiert wiederherstellen.
Die AvailableRooms werden immer ab Heute für 1000 Tagen automatisch freie gesetzt.
Beim Systemabfahrt werden alle daten gelöst.
Zimmer buchen muss man 18 Jahren alt sein. 
Events werden in Text gespeichert und davon herausgelesen.
Wir prüfen nicht, ob gültigen Adresse oder Name eingeben wird.
System funktioniert mit Swagger Ui und Postman auch. 
Selbstreflexion:
Wir haben unsere Ziele mit dem Projekt erreicht, da wir nicht nur die Projektbeschreibung erfüllt haben, sondern auch das Konzept verstanden haben. Jetzt sind wir auf dem richtigen Weg, um bewusst zu erkennen, wie wir es verbessern können.
Die Events sollten wir in .json-Dateien speichern anstatt in .txt-Dateien. Allerdings haben wir mehr als 10 Stunden damit verbracht und konnten die Daten nicht extrahieren. Deshalb haben wir als Notlösung auf Textdateien umgeschaltet.
Im Eventbus sollten wir die Aufgaben besser aufteilen, um eine sauberere Programmierung zu erreichen.
Generell sollten wir alle Prüfungen besser strukturieren und an der Kommunikation zwischen den Klassen arbeiten, um die Lesbarkeit zu verbessern.


[Download PDF documentation](./documentation.pdf)

