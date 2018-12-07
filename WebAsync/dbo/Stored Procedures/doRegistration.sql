CREATE PROCEDURE [dbo].[doRegistration]
	@Mode [int] = 0,
	@results [nvarchar](max) = ''
WITH EXECUTE AS CALLER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	DECLARE @Comp_ID nvarchar(10), @Reg_ID bigint, @found int
	SET NOCOUNT ON;

	--Registration
	If @Mode = 0
		Begin
			--DECLARE @results NVARCHAR(max)  = N'{  
			--  "Comp_ID" : "-1",  
			--  "Comp_Name": "Demo Company",  
			--  "Comp_Address": "23 Regency Park, Christ Church, Barbados.",  
			--  "Comp_Country": "BARBADOS",  
			--  "Comp_CtyAbb": "BB", 
			--  "Comp_VAT": "00012289", 
			--  "Comp_ImpNo": "56253",
			--  "Comp_DecNo": "23",
			--  "Comp_VISA": "1234123412341234-546",
			--  "Comp_Expire": "2018-12-31T12:00:00", 
			--  "Comp_CreateDate": "2017-12-27T12:00:00", 
			--  "Comp_Owner": "Financially Responsible", 
			--  "Comp_Email":"demo@webasync.com",
			--  "Comp_Password": "12345678"    
			--  }';  

			  INSERT INTO Registration  
			  ( Comp_ID,Comp_Name,Comp_Address,Comp_Country,
					Comp_CtyAbb,Comp_VAT,Comp_ImpNo ,Comp_DecNo,
					Comp_VISA ,Comp_Expire,Comp_CreateDate ,Comp_Owner,Comp_Email,
					Comp_Password	)--Comp_Active  
			  SELECT * 
			  FROM OPENJSON(@results) --@json)  
			  WITH (Comp_ID nvarchar(10),
					Comp_Name nvarchar(100),Comp_Address nvarchar(200) ,Comp_Country nvarchar(50),
					Comp_CtyAbb nvarchar(2),Comp_VAT nvarchar(20),Comp_ImpNo nvarchar(20),Comp_DecNo nvarchar(20),
					Comp_VISA nvarchar(50), Comp_Expire datetime, Comp_CreateDate datetime,Comp_Owner nvarchar(50),Comp_Email nvarchar(50),
					Comp_Password nvarchar(50))
				Select @Reg_ID = IDENT_CURRENT('Registration')   --@@IDENTITY

				Select @Comp_ID = Comp_CtyAbb + '' + format(Reg_ID,'00###') from Registration Where Reg_ID = @Reg_ID
				--Select Reg_ID, Comp_CtyAbb + '' + format(Reg_ID,'00###') as Comp_ID into #Temp_Comp from Registration Where Reg_ID = @Reg_ID

				--Update Registration
				UPDATE Registration
				SET  Comp_ID = @Comp_ID, Comp_Active = 1, CompJson = @results
				Where Reg_ID = @Reg_ID
				--From Registration inner join #Temp_Comp ON 
				--	Registration.Reg_ID = #Temp_Comp.Reg_ID
				

				--return Json
				Select  Cast ((Select Comp_ID from Registration where Reg_ID = @Reg_ID FOR JSON PATH, WITHOUT_ARRAY_WRAPPER) as nvarchar(max)) as results
		END
	Else if @Mode = 1  --Sreach for Active Registant
		Begin
			


			--return Json
			Select  Cast ((Select Isnull(Comp_Active,0) as Active from Registration
						   Where Comp_ID = @results
						   FOR JSON PATH, WITHOUT_ARRAY_WRAPPER) as nvarchar(max)) as results
		End

END
