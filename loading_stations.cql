PERIODIC COMMIT 1000
LOAD CSV WITH HEADERS FROM "file:///home/david/git/niceride/nice_rides_2010.csv" AS line 
CREATE (trip:Trip {start_terminal : line.`Start terminal`, start_date: SPLIT(line.`Start date`, ' ')[0], start_time: SPLIT(line.`Start date`, ' ')[1], stop_terminal: line.`End terminal`, stop_date: SPLIT(line.`End date`,' ')[0], stop_time: SPLIT(line.`End date`,' ')[1], duration:line.duration, type:line.type })
MERGE (s1:Station {station_id: toInteger(line.`Start terminal`)})
MERGE (s2:Station {station_id: toInteger(line.`End terminal`)})
CREATE (trip)<-[:FROM]-(s1)
CREATE (trip)-[:TO]->(s2)


LOAD CSV WITH HEADERS FROM "file:///2010/Nice_Ride_2010_station_locations.csv" AS line
MERGE (s:Station  {station_id: toInteger(line.Terminal)} )
SET s.Latitude = toFloat(line.Latitude), s.Longitude =  toFloat(line.Longitude),  
	s.geom = point({ latitude: toFloat(line.Latitude), longitude: toFloat(line.Longitude) }),
        s.name = line.station, s.number_of_docks = toInteger(line.`Nb docks`)

//This cleans up your database
MATCH (n)
DETACH DELETE n

