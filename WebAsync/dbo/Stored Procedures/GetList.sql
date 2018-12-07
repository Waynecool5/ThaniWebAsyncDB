CREATE PROCEDURE [dbo].[GetList]
	@mode [varchar](10) = 'select'
WITH EXECUTE AS CALLER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	Declare @results NVARCHAR(MAX)--,@mode varchar(10) = 'select'
	SET NOCOUNT ON;

	If @mode = 'select'
		Begin
			-- Insert statements for procedure here
			--Set @results =Select (SELECT Main.Main_ID AS ID, Main.Comp_ID, RTRIM(Main.InternalRef) AS InternalRef, Company.Comp_ID as "Company.Comp_ID", Company.Company as "Company.CompName" , Company.VAT as "Company.VAT"
			--			 FROM  Main INNER JOIN
   --                      Company ON Main.Comp_ID = Company.Comp_ID
			--			FOR JSON PATH,INCLUDE_NULL_VALUES, WITHOUT_ARRAY_WRAPPER  )  as re--
					
			--Set @results = 
			--Select CAST ( JSON_QUERY((SELECT Main.Main_ID AS ID, Main.Comp_ID, RTRIM(Main.InternalRef) AS InternalRef, 
			--					Company.Comp_ID as "Company.Comp_ID", Company.Company as "Company.CompName" , Company.VAT as "Company.VAT"
			--			 FROM  Main INNER JOIN
   --                      Company ON Main.Comp_ID = Company.Comp_ID
			--			FOR JSON PATH,INCLUDE_NULL_VALUES  )) --as results) --, WITHOUT_ARRAY_WRAPPER
			--			-- For Json path, WITHOUT_ARRAY_WRAPPER
			--			as nvarchar(max)) as result
			 
		--Select  @results =	()JSON_QUERY	
		SELECT Company.Comp_ID, Company.Company as CompName , Company.VAT							
		FROM Company 

		SELECT   M.Comp_ID, RTRIM(M.InternalRef) AS InternalRef	,	M.Main_ID AS ID
		FROM Main as M


		--Select (SELECT  M.Main_ID AS ID, M.Comp_ID, RTRIM(M.InternalRef) AS InternalRef, 
		--	JSON_QUERY(( Select Company.Comp_ID, Company.Company as CompName , Company.VAT							
		--				 FROM Company 
		--				 Where  Company.Comp_ID = M.Comp_ID 
		--				 FOR JSON PATH,INCLUDE_NULL_VALUES, WITHOUT_ARRAY_WRAPPER
		--				 )) as CompList
		--FROM Main as M
		--FOR JSON PATH,INCLUDE_NULL_VALUES )  as result --, WITHOUT_ARRAY_WRAPPER, ROOT('DataDto')



--SELECT 'Text' as myText,  
--      JSON_QUERY((SELECT 12 day, 8 mon FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)) as myJson  
--FOR JSON PATH 

			--Select  @results as results, Current_timestamp as GetTime
			--return @results
		End
	Else if @mode = 'insert'
		Begin
		  INSERT INTO Main  
		  SELECT *   
		  FROM OPENJSON(@results)  
		  WITH (Comp_ID nvarchar(50), InternalRef nvarchar(50))


		  INSERT INTO Company  
		  SELECT *   
		  FROM OPENJSON(@results,  N'$.Company.CompanyArray')  
			WITH (--Comp_ID int			N'$.Company.Comp_ID', 
				  CompName nvarchar(50) N'$.Company.CompName', 
				  VAT nvarchar(50)      N'$.Company.VAT')
		  AS CompanyJsonData;

		End
	--Else if @mode = 'update'
	--	Begin
	--		UPDATE Main
	--		SET Company=JSON_MODIFY(Company,"$Company.CompName",'London')
	--		WHERE Main_ID=2
	--	End
	--Else if @mode = 'delete'
	--	Begin

	--	End


		--SET @town = JSON_VALUE(@jsonInfo, '$.info.address.town')  
END
