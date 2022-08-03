Table: Insurance

| Column Name | Type  |
| pid         | int   |
| tiv_2015    | float |
| tiv_2016    | float |
| lat         | float |
| lon         | float |
+---------------------+
pid is the primary key column for this table.
Each row of this table contains information
about one policy where:
pid is the policyholder's policy ID.
Tiv_2015 is the total investment value in 2015
and tiv 2016 is the total investment value in
2016.
lat is the latitude of the policy holder's
city. 
lan is the longitude of the policy holder's
city.

Write an SQL query to report the sum of all total
investment values in 2016 tiv_2016,for all policyholders
who:
• have the same tiv_2015 value as one or more
other policyholders,and
• are not located in the same city like any other
policyholder(i.e.,the(lat, lon) attribute pairs
must be unique).

Round tiv_2016 to two decimal places.