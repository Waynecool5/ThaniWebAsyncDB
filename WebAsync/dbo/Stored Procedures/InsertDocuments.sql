CREATE PROCEDURE [dbo].[InsertDocuments]
	@Document [nvarchar](max)
WITH EXECUTE AS CALLER
AS
BEGIN
	SET NOCOUNT ON;

	Declare @document_ID bigint, @Points_id bigint, @timeStamp datetime 

	Begin Try

		Select @timeStamp= CURRENT_TIMESTAMP
		Set @Points_id = 0

		-- Insert statements for procedure here 
		-- OUTPUT Inserted.Document_id

		INSERT INTO JSONDocuments(docPointsJSON,docTimeStamp)
		VALUES (@Document,@timeStamp)
		SELECT @document_ID =  IDENT_CURRENT('JSONDocuments') 

		Execute InsertPoints @document_ID = @document_ID, @timeStamp = @timeStamp, @Points_id = @Points_id output

		--return new record details for JSON Object
		--Select(SELECT  Points_id, Document_id, ptsCustomerNo, ptsUnitType, ptsMode, 
		--				ptsTotal, ptsValue, ptsDiscount, ptsLocation, ptsCashier
		--		FROM Points 
		--		WHERE  (Points_id = @Points_id) 
		--		FOR JSON PATH,INCLUDE_NULL_VALUES, WITHOUT_ARRAY_WRAPPER
		--) as Points

		
		------ TESTING   ---Massy Points Message
		--SELECT P.Points_id, P.Document_id, '42100999892'as ptsCustomerNo,P.ptsFirstName,P.ptsLastName, 
		--       P.ptsUnitType, P.ptsMode, P.ptsTotal, 
		--       P.ptsValue, P.ptsValueRate, P.ptsDiscount, P.ptsDiscountrate, P.ptsCashier, 
		--	   P.ptsUnix, P.ptsSalesDate, P.ptsLocation, '' AS ptsQsa, 
		--		'9999' AS ptsMlid, Cast('00000' as nvarchar(5)) AS ptsPin,
		--		M.Secret_Code as ptsSecret
		--FROM  ThaniStoreCodes AS T RIGHT OUTER JOIN
		--	    Points AS P ON T.Store_Code = P.ptsLocation LEFT OUTER JOIN
		--		  MassyApiCodes AS M ON T.Secret_ID = M.Secret_ID
		--WHERE (P.Points_id = @Points_id)



		--Massy Points Message LIVE
		SELECT P.Points_id, P.Document_id, P.ptsCustomerNo,P.ptsFirstName,P.ptsLastName, 
		       P.ptsUnitType, P.ptsMode, P.ptsTotal, 
		       P.ptsValue, P.ptsValueRate, P.ptsDiscount, P.ptsDiscountrate, P.ptsCashier, 
			   P.ptsUnix, P.ptsSalesDate, P.ptsLocation, --'' AS ptsQsa, 
				M.Secret_Mlid AS ptsMlid, Cast('00000' as nvarchar(5)) AS ptsPin,
				M.Secret_Code as ptsSecret, Isnull(ptsInvoice,'') as ptsInvoice, 
				Isnull(ptsLimit,'') as ptsLimit, Isnull(ptsfcn,'') as ptsfcn
		FROM  ThaniStoreCodes AS T RIGHT OUTER JOIN
			    Points AS P ON T.Store_Code = P.ptsLocation LEFT OUTER JOIN
				  MassyApiCodes AS M ON T.Secret_ID = M.Secret_ID
		WHERE (P.Points_id = @Points_id)

	End Try
	Begin Catch
	SELECT ERROR_NUMBER() AS ErrorNumber,ERROR_SEVERITY() AS ErrorSeverity,ERROR_STATE() AS ErrorState ,ERROR_PROCEDURE() AS ErrorProcedure  
    ,ERROR_LINE() AS ErrorLine ,ERROR_MESSAGE() AS ErrorMessage;  
	End Catch

END

