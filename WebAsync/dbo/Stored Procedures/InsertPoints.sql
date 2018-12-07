CREATE PROCEDURE [dbo].[InsertPoints]
	@document_ID [bigint],
	@timeStamp [datetime] = null,
	@Points_id [bigint] OUTPUT
WITH EXECUTE AS CALLER
AS
BEGIN
	SET NOCOUNT ON;
	
	Declare @Points nvarchar(max)
	
	BEGIN TRY

		INSERT INTO dbo.Points (
			ptsCustomerNo,ptsFirstName,ptsLastName, ptsUnitType, ptsMode, ptsTotal, 
			ptsValue,ptsValueRate, ptsDiscount, ptsDiscountRate, ptsLocation, ptsCashier,
			ptsInvoice,ptsLimit,ptsfcn)
		SELECT 
		   ptsCustomerNo,ptsFirstName,ptsLastName, ptsUnitType, ptsMode, ptsTotal, 
		   ptsValue,ptsValueRate, ptsDiscount, ptsDiscountRate, ptsLocation, ptsCashier,
		   IsNull(ptsInvoice,'') as ptsInvoice, Isnull(ptsLimit,'') as ptsLimit, 
		   Isnull(ptsfcn,'') as ptsfcn
		FROM JSONDocuments
			CROSS APPLY
			OPENJSON(JSONDocuments.docPointsJSON) 
				WITH (
					ptsCustomerNo nvarchar(50), --N''''$.ptsCustomerNo'''',
					ptsFirstName nvarchar(50),
					ptsLastName nvarchar(50),
					ptsUnitType nvarchar(2),
					ptsMode nvarchar(2),
					ptsTotal decimal(12, 2),  --N''''$.ptsTotal'''',
					ptsValue decimal(12, 2),
					ptsValueRate decimal(12, 2),
					ptsDiscount decimal(12, 2),
					ptsDiscountRate decimal(12, 2),
					ptsLocation nvarchar(20),
					ptsCashier nvarchar(20),
					ptsInvoice nvarchar(50),
					ptsLimit nvarchar(20),
					ptsfcn nvarchar(50)
				)
		where Document_id = @document_ID

		SET @Points_id = IDENT_CURRENT('Points') --@@SCOPE_IDENTITY(Points)
	
		Update Points
		Set Document_id = @document_ID, ptsSalesDate = @timeStamp , ptsUnix = dbo.UNIX_TIMESTAMP(@timeStamp)
		Where Points_id = @Points_id

	END TRY
	BEGIN CATCH
		SELECT ERROR_NUMBER() AS ErrorNumber,ERROR_SEVERITY() AS ErrorSeverity,ERROR_STATE() AS ErrorState ,ERROR_PROCEDURE() AS ErrorProcedure  
				,ERROR_LINE() AS ErrorLine ,ERROR_MESSAGE() AS ErrorMessage;  
	END CATCH

END

