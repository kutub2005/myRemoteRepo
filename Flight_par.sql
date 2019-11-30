
create table Flight_partition(
flight_data STRING,
 	carrier_code STRING, 
	origin STRING, 
	dest STRING,
	depart_time STRING, 
	depart_delta STRING, 
	depart_delay STRING, arrive_time STRING, 
	arrive_delta STRING,
	arrive_delay STRING, 
	is_cancelled STRING, 
	cancellation_code STRING, 
	distance STRING, 
	carrier_delay STRING,
	weather_delay STRING, 
	nas_delay STRING, 
	security_delay STRING, 
	late_aircraft_delay STRING
	)
partitioned by  (airline_code INT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY "\t";


create table Flight_LAST(
	flight_data STRING,  
	airline_code STRING, 
	carrier_code STRING, 
	origin STRING, 
	dest STRING,
	depart_time STRING, 
	depart_delta STRING, 
	depart_delay STRING, 
	arrive_time STRING, 
	arrive_delta STRING,
	arrive_delay STRING, 
	is_cancelled STRING, 
	cancellation_code STRING, 
	distance STRING, 
	carrier_delay STRING,
	weather_delay STRING, 
	nas_delay STRING, 
	security_delay STRING, 
	late_aircraft_delay STRING
	)
ROW FORMAT DELIMITED FIELDS TERMINATED BY "\t";



# TO ENABLE DYNAMI PARTITION (by Default its Disable)
set hive.exec.dynamic.partition.mode=nonstrict;

INSERT OVERWRITE table Flight_partition
PARTITION(airline_code)
select columns.......airline_code FROM Flight_partition








