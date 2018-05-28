LOAD CSV WITH HEADERS FROM "file:///niceride/2010/Nice_Ride_2010_station_locations.csv" AS line
CREATE (station: Station {station_id: TOINT(line.Terminal), Latitude: TOFLOAT(line.Latitude), Longitude: TOFLOAT(line.longitude), name: line.station, number_of_docks: TOINT(line.`Nb docks`)})


LOAD CSV WITH HEADERS FROM "file:///niceride/2010/Nice_Ride_trip_history_2010_season.csv" AS line 
CREATE (trip: Trip {start_terminal : line.`Start terminal`, start_date: line.`Start date`, stop_terminal: line.`End terminal`, stop_date: line.`End date` })

CREATE
  (trip)-[:FROM {Station:['']}]->(JerryMaguire),

CREATE
  (TomC)-[:ACTED_IN {roles:['Jerry Maguire']}]->(JerryMaguire),


MATCH (s:Station), (t:Trip) 
   WHERE a.name = "nameofnode1" AND b.name = " nameofnode2" 
CREATE (a)-[: Relation]->(b) 
RETURN a,b 

MATCH (a:LabeofNode1), (b:LabeofNode2) 
   WHERE a.name = "nameofnode1" AND b.name = " nameofnode2" 
CREATE (a)-[: Relation]->(b) 
RETURN a,b 