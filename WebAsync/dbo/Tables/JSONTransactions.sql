CREATE TABLE [dbo].[JSONTransactions] (
    [Trans_id]          INT            IDENTITY (1, 1) NOT NULL,
    [Document_id]       BIGINT         NULL,
    [Points_id]         BIGINT         NULL,
    [transPointsJSON]   NVARCHAR (MAX) NULL,
    [transResponseData] NVARCHAR (MAX) NULL,
    [transTimeStamp]    DATETIME       NULL,
    CONSTRAINT [JSONTransactionsPk] PRIMARY KEY CLUSTERED ([Trans_id] ASC)
);

