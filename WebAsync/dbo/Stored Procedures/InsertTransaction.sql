CREATE PROCEDURE [dbo].[InsertTransaction]
	@Document [nvarchar](max)='',
	@Response [nvarchar](max)='',
	@Card_id nvarchar(50)='42100999892',
	@Time_id nvarchar(50)='1543620586'
WITH EXECUTE AS CALLER
AS
BEGIN
	SET NOCOUNT ON;

	Declare @Trans_id int, @Document_id bigint, @Points_id bigint, @timeStamp datetime 

	Begin Try
		Set @Document_id = 0
		Select  @timeStamp= CURRENT_TIMESTAMP
		
		Select Top 1 @Document_id = Document_id, @Points_id = Points_id 
		from Points	
		where  ptsCustomerNo = Rtrim(@Card_id) and ptsUnix = Rtrim(@Time_id)

		if @Document_id > 0
		Begin
			INSERT INTO JSONTransactions
									 (Document_id, Points_id, transPointsJSON, transResponseData, transTimeStamp)
			VALUES        (@document_id,@Points_id,@Document,@Response,@timeStamp)
			SELECT @Trans_id =  IDENT_CURRENT('JSON_Transactions') 
		End

	End Try
	Begin Catch
		SELECT ERROR_NUMBER() AS ErrorNumber,ERROR_SEVERITY() AS ErrorSeverity,ERROR_STATE() AS ErrorState ,ERROR_PROCEDURE() AS ErrorProcedure  
		,ERROR_LINE() AS ErrorLine ,ERROR_MESSAGE() AS ErrorMessage;  
	End Catch

END

