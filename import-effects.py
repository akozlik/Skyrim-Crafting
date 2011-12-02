import sqlite3;
from datetime import datetime, date;
import time;
import csv;

inFile = csv.reader(open('Skyrim Relationships - Effects.csv'));
outConn = sqlite3.connect('Skyrim_Crafting.sqlite');
outCursor = outConn.cursor();

outConn.execute("insert into ZPOTION (ZNAME) values ('hidhihihi')");
for row in inFile:
	outConn.execute("insert into ZPOTION (ZNAME) values (?)", row);

outConn.commit();
