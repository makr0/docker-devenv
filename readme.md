# Development Setup mit Docker

Das vorliegende Setup realisiert meine Entwicklungsumgebung für die Konferenz-App.
Als Namespace habe ich 'crashc0de' gewählt, da ich das erstmal privat verwendet habe.
Hier findet sich sicher noch was besseres für wegewerk.


Folgende Container sind in diesem Setup enthalten

- Daten-container
  - sorgt für die Existenz der gemeinsamen Daten-volumes 'config' und 'data'
  - diese Volumes werden in den anderen Containern unter /config bzw. /data gemounted

- samba-container
  - gibt die Daten-Volumes per Samba frei.

- webserver-container
  - Apache Webserver mit vhost-konfiguration aus /config/apache/vhosts
  - Als Hostnames habe ich <projektname>.loc.int gewählt. Auf meiner Windows-Kiste werden diese Namen lokal per hosts-Datei aufgelöst.

- CouchDB-container
  - eine CouchDB Instanz auf Port 5984. speichert Daten in /data/couchdb/igmcouch/data und die indizes in /data/couchdb/igmcouch/views. Das Verzeichniss /data/couchdb/igmcouch muss im Daten-container angelegt werden!

- devbox
  - bietet eine Shell über ssh.
  - enthält alle CLI Entwickler-Tools (bower, grunt, yo, npm, php-cli, usw.)
  - Du möchtest die authorized_keys anpassen.

Für Details bitte die Dockerfiles ansehen.
Die Dockerfiles befinden sich in einem Unterordner, zusammen mit einer build.sh und den Dateien die ins Image kopiert werden.
Ein neues Image erzeugt man mit der build.sh in /docker/dockerfiles/<containername>. Gestartet wird der Container mit run-<containername>.sh in /docker/
runall.sh in /docker/ beendet alle Container und startet sie wieder in der richtigen Reihenfolge.
