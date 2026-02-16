/*
==========================================
Create Database and Schemas 
==========================================
Script purpose:
This script creates a new database named "DataWarehouse" after checking if it already exists.
If the database exists, it is dropped and recreated.
*/

USE master;
GO

-- 1. THE MISSING PIECE: Check if it exists, kill connections, and drop it
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    -- Force other users off the database so we can drop it without error
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END
GO

-- 2. Now we can safely create it fresh
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- 3. Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
