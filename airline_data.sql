use airline;

select * from flightdata;

-- show unique years for which data is available.

select distinct [Year] from flightdata;

-- show data for month of april.

select * from flightdata where [Month] = 4 ;


-- show data for month od april and day 4 of week;

select * from flightdata where [Month] = 4 and [DayofMonth] = 4;

-- show unique tail numbers available for flights

SELECT distinct [TailNum] from flightdata;

-- show flight numbers going to jfk

select distinct [FlightNum], [Dest] from flightdata where [Dest] = 'jfk';


-- show flight number, destination from jfk where airtime is greater than 70 in ascending order:
select [FlightNum], [Dest] from flightdata where [AirTime] > 70 and [Origin] = 'JFK'  order by [FlightNum];


--show flight numbers where departure time is between 1500 and 1800 hours from JFK:
select [FlightNum] from flightdata where [DepTime] between 1500 and 1800 and [Origin] = 'jfk';

-- show average air hours for each flight
select AVG([AirTime]) as Avg_hour, [FlightNum] from flightdata group by [FlightNum];

-- show flight number, air time, origin, dest from table where dest is like BO%:
select [FlightNum], [AirTime], [Origin], [Dest] from flightdata where [Dest] like 'BO%';

-- show UNIQUE  number of flights flying from LGB:
select COUNT(distinct [FlightNum]) AS Flight_Counts from flightdata WHERE [Origin] = 'LGB';


-- Handling null values

-- count null values for each column
select count(*) - COUNT([Year]) as Years, count(*) - count([MONTH]) as Months, count(*) - count([DayofMonth]) as DayofMonth,
count(*)- count([DepTime]) as DepTime, count(*) - count([CRSDepTime]) as CRSDepTime, count(*)-count([ArrTime]) as ArrTime, count(*) - count([CRSArrTime]) AS CRSArrTime,
count(*) - count(UniqueCarrier) as UniqueCarrie, count(*) - count(FlightNum) as FlightNum, count(*) - count(TailNum) as TailNum, COUNT(*) - count([ActualElapsedTime]) as ActualElapsedTime,
count(*) - COUNT([CRSElapsedTime]) as CRSElapsedTime, count(*) - count(AirTime) as AirTime, count(*) - count(ArrDelay) as ArrDelay,
count(*) - count(DepDelay) as DepDelay, count(*) - count(Origin) as Origin, count(*) - count(Dest) as Dest, count(*) - count(Distance) as Distance,
count(*) - count(TaxiIn) as TaxiIn, count(*) - count(TaxiOut) as TaxiOut, count(*) - count(Cancelled) as Cancelled, count(*) - count(CancellationCode) as CancellationCode,
count(*) - COUNT(Diverted) as Diverted, count(*)-count(CarrierDelay) as CarrierDelay, count(*) - count(WeatherDelay) as WeatherDelay, 
count(*) - count(NASDelay) as NASDelay, count(*) - count(SecurityDelay) as SecurityDelay, count(*) - count(LateAircraftDelay) as LateAircraftDelay  from flightdata;



-- check table schema

EXEC sp_help 'flightdata'

-- update ArrTime with avg ArrTime:
update flightdata set ArrTime = (select avg([ArrTime]) from flightdata) where ArrTime is null;

-- verify null values
select count(*) - count(ArrTime) from flightdata;


-- delete null values for TailNum:
delete from flightdata where TailNum is null;


-- update multiple columns with avg() for null values for all columns
update flightdata set ActualElapsedTime = (select avg([ActualElapsedTime]) from flightdata),
CRSElapsedTime = (select avg([CRSElapsedTime]) from flightdata),
AirTime = (select avg([AirTime]) from flightdata),
ArrDelay = (select avg([ArrDelay]) from flightdata),
TaxiIn = (select avg([TaxiIn]) from flightdata),
TaxiOut = (select avg([TaxiOut]) from flightdata),
CarrierDelay = (select avg([CarrierDelay]) from flightdata),
WeatherDelay = (select avg([WeatherDelay]) from flightdata),
NASDelay = (select avg([NASDelay]) from flightdata),
SecurityDelay = (select avg([SecurityDelay]) from flightdata),
LateAircraftDelay = (select avg([LateAircraftDelay]) from flightdata)  where ActualElapsedTime is null or CRSElapsedTime is null or AirTime is null or ArrDelay is null or TaxiIn is null or TaxiOut is null or CarrierDelay is null or WeatherDelay is null or NASDelay is null or SecurityDelay is null or LateAircraftDelay is null;
