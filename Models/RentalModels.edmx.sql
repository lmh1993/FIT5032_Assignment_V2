
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/14/2019 21:03:22
-- Generated from EDMX file: C:\Users\Mingh\source\repos\FIT5032_Assignment_V2\Models\RentalModels.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [aspnet-FIT5032_Assignment_V2-20190914035852];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'BookingSet'
CREATE TABLE [dbo].[BookingSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [BookingTime] nvarchar(max)  NOT NULL,
    [RentStartDate] nvarchar(max)  NOT NULL,
    [RentEndDate] nvarchar(max)  NOT NULL,
    [TotalPrice] nvarchar(max)  NOT NULL,
    [ExtraServicePackage] nvarchar(max)  NOT NULL,
    [Vehicle_Id] int  NOT NULL,
    [Transaction_Id] int  NOT NULL
);
GO

-- Creating table 'VehicleSet'
CREATE TABLE [dbo].[VehicleSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Model] nvarchar(max)  NOT NULL,
    [YearMade] nvarchar(max)  NOT NULL,
    [RentalRate] nvarchar(max)  NOT NULL,
    [MaintenanceStatus] nvarchar(max)  NOT NULL,
    [RentalStatus] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'TransactionSet'
CREATE TABLE [dbo].[TransactionSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [TranDate] nvarchar(max)  NOT NULL,
    [TranAmount] nvarchar(max)  NOT NULL,
    [TranDesc] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'MaintenanceSet'
CREATE TABLE [dbo].[MaintenanceSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [MainDesc] nvarchar(max)  NOT NULL,
    [MainCost] nvarchar(max)  NOT NULL,
    [MainStart] nvarchar(max)  NOT NULL,
    [MainEnd] nvarchar(max)  NOT NULL,
    [VehicleId] int  NOT NULL,
    [Transaction_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'BookingSet'
ALTER TABLE [dbo].[BookingSet]
ADD CONSTRAINT [PK_BookingSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'VehicleSet'
ALTER TABLE [dbo].[VehicleSet]
ADD CONSTRAINT [PK_VehicleSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TransactionSet'
ALTER TABLE [dbo].[TransactionSet]
ADD CONSTRAINT [PK_TransactionSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MaintenanceSet'
ALTER TABLE [dbo].[MaintenanceSet]
ADD CONSTRAINT [PK_MaintenanceSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Vehicle_Id] in table 'BookingSet'
ALTER TABLE [dbo].[BookingSet]
ADD CONSTRAINT [FK_BookingVehicle]
    FOREIGN KEY ([Vehicle_Id])
    REFERENCES [dbo].[VehicleSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BookingVehicle'
CREATE INDEX [IX_FK_BookingVehicle]
ON [dbo].[BookingSet]
    ([Vehicle_Id]);
GO

-- Creating foreign key on [VehicleId] in table 'MaintenanceSet'
ALTER TABLE [dbo].[MaintenanceSet]
ADD CONSTRAINT [FK_VehicleMaintenance]
    FOREIGN KEY ([VehicleId])
    REFERENCES [dbo].[VehicleSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_VehicleMaintenance'
CREATE INDEX [IX_FK_VehicleMaintenance]
ON [dbo].[MaintenanceSet]
    ([VehicleId]);
GO

-- Creating foreign key on [Transaction_Id] in table 'BookingSet'
ALTER TABLE [dbo].[BookingSet]
ADD CONSTRAINT [FK_TransactionBooking]
    FOREIGN KEY ([Transaction_Id])
    REFERENCES [dbo].[TransactionSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TransactionBooking'
CREATE INDEX [IX_FK_TransactionBooking]
ON [dbo].[BookingSet]
    ([Transaction_Id]);
GO

-- Creating foreign key on [Transaction_Id] in table 'MaintenanceSet'
ALTER TABLE [dbo].[MaintenanceSet]
ADD CONSTRAINT [FK_TransactionMaintenance]
    FOREIGN KEY ([Transaction_Id])
    REFERENCES [dbo].[TransactionSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TransactionMaintenance'
CREATE INDEX [IX_FK_TransactionMaintenance]
ON [dbo].[MaintenanceSet]
    ([Transaction_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------