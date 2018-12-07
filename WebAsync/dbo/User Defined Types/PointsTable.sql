CREATE TYPE [dbo].[PointsTable] AS TABLE (
    [Points_id]     INT             NOT NULL,
    [ptsCustomerNo] NVARCHAR (50)   NULL,
    [ptsTotal]      INT             NULL,
    [ptsValue]      DECIMAL (12, 2) NULL,
    [ptsDiscount]   DECIMAL (12, 2) NULL,
    [ptsMode]       NVARCHAR (1)    NULL,
    [ptsLocation]   NVARCHAR (50)   NOT NULL,
    [ptsJSON]       NVARCHAR (MAX)  NOT NULL,
    [ptsTStamp]     ROWVERSION      NULL,
    PRIMARY KEY CLUSTERED ([Points_id] ASC));

