CREATE TABLE [dbo].[Points] (
    [Points_id]       BIGINT          IDENTITY (1, 1) NOT NULL,
    [Document_id]     BIGINT          NULL,
    [ptsCustomerNo]   NVARCHAR (50)   NULL,
    [ptsFirstName]    NVARCHAR (50)   NULL,
    [ptsLastName]     NVARCHAR (50)   NULL,
    [ptsUnitType]     NVARCHAR (2)    NULL,
    [ptsMode]         NVARCHAR (2)    NULL,
    [ptsTotal]        DECIMAL (12, 2) NULL,
    [ptsValue]        DECIMAL (12, 2) NULL,
    [ptsValueRate]    DECIMAL (12, 2) NULL,
    [ptsDiscount]     DECIMAL (12, 2) NULL,
    [ptsDiscountrate] DECIMAL (12, 2) NULL,
    [ptsLocation]     NVARCHAR (20)   NULL,
    [ptsCashier]      NVARCHAR (20)   NULL,
    [ptsUnix]         NVARCHAR (50)   NULL,
    [ptsSalesDate]    DATETIME        NULL,
    [ptsInvoice]      NVARCHAR (50)   NULL,
    [ptsLimit]        NVARCHAR (20)   NULL,
    [ptsfcn]          NVARCHAR (50)   NULL,
    CONSTRAINT [PK_Points] PRIMARY KEY CLUSTERED ([Points_id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Points]
    ON [dbo].[Points]([ptsLocation] ASC, [Document_id] ASC, [ptsFirstName] ASC, [ptsLastName] ASC, [ptsSalesDate] ASC, [ptsCustomerNo] ASC, [ptsUnix] ASC);

