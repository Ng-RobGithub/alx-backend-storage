0x00. MySQL advanced

Here's an overview of some advanced topics in MySQL:
Stored Procedures and Functions: Stored procedures and functions are precompiled SQL statements that are stored in the database server.They can accept parameters, perform complex operations, and return results. Stored procedures offer advantages like improved performance, reduced network traffic, and enhanced security.
Triggers: Triggers are special types of stored procedures that automatically execute in response to specific events, such as INSERT, UPDATE, or DELETE operations on a table. Triggers are useful for enforcing data integrity rules, auditing changes, and implementing complex business logic within the database.
explanations related to each of these concepts:
Views: Views are virtual tables that are based on the result set of a SELECT query. They provide an abstraction layer over the underlying tables, allowing users to query the view as if it were a regular table. Views can simplify complex queries, improve data security by restricting access to certain columns, and facilitate data abstraction.
Transactions: Transactions are sequences of SQL statements that are executed as a single unit of work. Transactions ensure data consistency and integrity by either committing all changes to the database or rolling back the entire set of changes if an error occurs. MySQL supports ACID (Atomicity, Consistency, Isolation, Durability) properties, which are essential for reliable transaction processing.
Indexes and Query Optimization: Indexes are data structures that improve the speed of data retrieval operations by providing quick access paths to database records. Understanding how to create and use indexes effectively is crucial for optimizing query performance in MySQL. Additionally, techniques like query optimization, query tuning, and analyzing query execution plans can further enhance database performance.
Partitioning: Partitioning involves dividing large database tables into smaller, more manageable segments called partitions. Partitioning can improve query performance, facilitate data management, and enhance availability and scalability. MySQL offers several partitioning methods, such as range partitioning, hash partitioning, and list partitioning, each suited for different use cases.
Replication: Replication involves copying and distributing data from one MySQL database (master) to one or more replica databases (slaves). Replication provides redundancy, fault tolerance, and scalability by enabling read scalability, high availability, and load balancing across multiple database servers. MySQL replication can be configured in various topologies, such as master-slave replication, master-master replication, and multi-source replication.
High Availability and Failover: Achieving high availability and failover in MySQL involves implementing strategies to minimize downtime and ensure continuous access to data even in the event of hardware failures, network issues, or other disruptions. Techniques like clustering, failover automation, and monitoring solutions help maintain database uptime and reliability.

Task:
0. Write a SQL script that creates a table users following these requirements:
With these attributes:
id, integer, never null, auto increment and primary key
email, string (255 characters), never null and unique
name, string (255 characters)
1. Write a SQL script that creates a table users following these requirements:
With these attributes:
id, integer, never null, auto increment and primary key
email, string (255 characters), never null and unique
name, string (255 characters)
country, enumeration of countries: US, CO and TN, never null (= default will be the first element of the enumeration, here US)
2. Write a SQL script that ranks country origins of bands, ordered by the number of (non-unique) fans
Requirements:
Import this table dump: metal_bands.sql.zip
Column names must be: origin and nb_fans
Your script can be executed on any database
3. Write a SQL script that lists all bands with Glam rock as their main style, ranked by their longevity
Requirements:
Import this table dump: metal_bands.sql.zip
Column names must be: band_name and lifespan (in years until 2022 - please use 2022 instead of YEAR(CURDATE()))
You should use attributes formed and split for computing the lifespan
Your script can be executed on any database
...
13. Write a SQL script that creates a stored procedure ComputeAverageWeightedScoreForUsers that computes and store the average weighted score for all students.
Requirements:
Procedure ComputeAverageWeightedScoreForUsers is not taking any input.
Tips:

Calculate-Weighted-Average
