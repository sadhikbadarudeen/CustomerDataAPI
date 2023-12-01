/****** Object:  Table [ADMIN].[TBL_API_CLIENT]    Script Date: 12/1/2023 3:08:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ADMIN].[TBL_API_CLIENT](
	[ApiClientID] [bigint] IDENTITY(1,1) NOT NULL,
	[Company] [nvarchar](500) NULL,
	[ContactName] [nvarchar](500) NULL,
	[ContactNo] [nvarchar](50) NULL,
	[Email] [nvarchar](500) NULL,
	[Address] [nvarchar](500) NULL,
	[IsExpiry] [bit] NOT NULL,
	[ExpiryDate] [date] NULL,
	[ClientID] [nvarchar](50) NULL,
	[ClientSecret] [nvarchar](50) NULL,
	[Disable] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [bigint] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_TBL_API_CLIENT] PRIMARY KEY CLUSTERED 
(
	[ApiClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ADMIN].[TBL_API_CLIENT_TOKEN]    Script Date: 12/1/2023 3:08:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ADMIN].[TBL_API_CLIENT_TOKEN](
	[ApiTokenID] [bigint] IDENTITY(1,1) NOT NULL,
	[ApiClientID] [bigint] NULL,
	[Token] [nvarchar](max) NULL,
	[IssueDate] [datetime] NULL,
	[ExpriyDate] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_TBL_API_CLIENT_TOKEN] PRIMARY KEY CLUSTERED 
(
	[ApiTokenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_CustomerData]    Script Date: 12/1/2023 3:08:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_CustomerData](
	[CustomerID] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](200) NULL,
	[LastName] [nvarchar](200) NULL,
	[PhoneNumber] [varchar](15) NULL,
	[Email] [varchar](50) NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_TBL_CustomerData] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_CustomerData_Address]    Script Date: 12/1/2023 3:08:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_CustomerData_Address](
	[AddressID] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerID] [bigint] NULL,
	[City] [nvarchar](200) NULL,
	[Country] [nvarchar](200) NULL,
	[AddressLine] [nvarchar](200) NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_TBL_CustomerData_Address] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [ADMIN].[TBL_API_CLIENT] ON 
GO
INSERT [ADMIN].[TBL_API_CLIENT] ([ApiClientID], [Company], [ContactName], [ContactNo], [Email], [Address], [IsExpiry], [ExpiryDate], [ClientID], [ClientSecret], [Disable], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'CITY UNIVERSITY AJMAN', N'Sadhik', N'+971504295400', N's.badarudeen@cu.ac.ae', N'CITY UNIVERSITY AJMAN, Ajman', 0, NULL, N'CUA-000005', N'LG9D-KCJS-Y2Q4-MTAR-FOVN', 0, 1, 7775, CAST(N'2023-11-30T14:13:07.937' AS DateTime), 7775, CAST(N'2023-11-30T14:13:07.937' AS DateTime))
GO
SET IDENTITY_INSERT [ADMIN].[TBL_API_CLIENT] OFF
GO

SET IDENTITY_INSERT [dbo].[TBL_CustomerData] ON 
GO
INSERT [dbo].[TBL_CustomerData] ([CustomerID], [FirstName], [LastName], [PhoneNumber], [Email], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (1, N'Sadhik', N'Badarudeen', N'971504295400', N'sbkforyou@gmail.com', 0, CAST(N'2023-11-30T16:56:52.963' AS DateTime), CAST(N'2023-11-30T16:56:52.963' AS DateTime))
GO
INSERT [dbo].[TBL_CustomerData] ([CustomerID], [FirstName], [LastName], [PhoneNumber], [Email], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (2, N'Sulphi', N'Mytheen', N'971502164001', N'sulphi@gmail.com', 0, CAST(N'2023-11-30T17:01:28.913' AS DateTime), CAST(N'2023-11-30T17:01:28.913' AS DateTime))
GO
INSERT [dbo].[TBL_CustomerData] ([CustomerID], [FirstName], [LastName], [PhoneNumber], [Email], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (3, N'FN_TestFromPostman', N'LN_TestFromPostman', N'971501234567', N'FN_TestFromPostman@gmail.com', 0, CAST(N'2023-12-01T12:35:36.347' AS DateTime), CAST(N'2023-12-01T12:35:36.347' AS DateTime))
GO
INSERT [dbo].[TBL_CustomerData] ([CustomerID], [FirstName], [LastName], [PhoneNumber], [Email], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (4, N'FN_TestFromPostman_1', N'LN_TestFromPostman_1', N'971501234568', N'FN_TestFromPostman_1@gmail.com', 0, CAST(N'2023-12-01T12:49:59.550' AS DateTime), CAST(N'2023-12-01T12:49:59.550' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[TBL_CustomerData] OFF
GO
SET IDENTITY_INSERT [dbo].[TBL_CustomerData_Address] ON 
GO
INSERT [dbo].[TBL_CustomerData_Address] ([AddressID], [CustomerID], [City], [Country], [AddressLine], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (1, 1, N'Ajman', N'UAE', N'Mowaihat2', 0, CAST(N'2023-11-30T16:57:41.897' AS DateTime), CAST(N'2023-11-30T16:57:41.897' AS DateTime))
GO
INSERT [dbo].[TBL_CustomerData_Address] ([AddressID], [CustomerID], [City], [Country], [AddressLine], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (2, 1, N'Sharjah', N'UAE', N'Al Nabba', 0, CAST(N'2023-11-30T16:58:16.957' AS DateTime), CAST(N'2023-11-30T16:58:16.957' AS DateTime))
GO
INSERT [dbo].[TBL_CustomerData_Address] ([AddressID], [CustomerID], [City], [Country], [AddressLine], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (3, 2, N'Sharjah', N'UAE', N'Rolla', 0, CAST(N'2023-11-30T17:02:11.810' AS DateTime), CAST(N'2023-11-30T17:02:11.810' AS DateTime))
GO
INSERT [dbo].[TBL_CustomerData_Address] ([AddressID], [CustomerID], [City], [Country], [AddressLine], [IsDeleted], [CreatedOn], [ModifiedOn]) VALUES (4, 4, N'Ajman', N'UAE', N'Mowaihat2', 1, CAST(N'2023-12-01T13:03:26.240' AS DateTime), CAST(N'2023-12-01T13:11:22.610' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[TBL_CustomerData_Address] OFF
GO
ALTER TABLE [ADMIN].[TBL_API_CLIENT] ADD  CONSTRAINT [DF_TBL_API_CLIENT_IsExpiry]  DEFAULT ((0)) FOR [IsExpiry]
GO
ALTER TABLE [ADMIN].[TBL_API_CLIENT] ADD  CONSTRAINT [DF_TBL_API_CLIENT_Disable]  DEFAULT ((0)) FOR [Disable]
GO
ALTER TABLE [ADMIN].[TBL_API_CLIENT] ADD  CONSTRAINT [DF_TBL_API_CLIENT_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [ADMIN].[TBL_API_CLIENT] ADD  CONSTRAINT [DF_TBL_API_CLIENT_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [ADMIN].[TBL_API_CLIENT] ADD  CONSTRAINT [DF_TBL_API_CLIENT_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [ADMIN].[TBL_API_CLIENT_TOKEN] ADD  CONSTRAINT [DF_TBL_API_CLIENT_TOKEN_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [ADMIN].[TBL_API_CLIENT_TOKEN] ADD  CONSTRAINT [DF_TBL_API_CLIENT_TOKEN_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[TBL_CustomerData] ADD  CONSTRAINT [DF_TBL_CustomerData_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TBL_CustomerData] ADD  CONSTRAINT [DF_TBL_CustomerData_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[TBL_CustomerData] ADD  CONSTRAINT [DF_TBL_CustomerData_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[TBL_CustomerData_Address] ADD  CONSTRAINT [DF_TBL_CustomerData_Address_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TBL_CustomerData_Address] ADD  CONSTRAINT [DF_TBL_CustomerData_Address_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[TBL_CustomerData_Address] ADD  CONSTRAINT [DF_TBL_CustomerData_Address_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [ADMIN].[TBL_API_CLIENT_TOKEN]  WITH CHECK ADD  CONSTRAINT [FK_TBL_API_CLIENT_TOKEN_TBL_API_CLIENT] FOREIGN KEY([ApiClientID])
REFERENCES [ADMIN].[TBL_API_CLIENT] ([ApiClientID])
GO
ALTER TABLE [ADMIN].[TBL_API_CLIENT_TOKEN] CHECK CONSTRAINT [FK_TBL_API_CLIENT_TOKEN_TBL_API_CLIENT]
GO
ALTER TABLE [dbo].[TBL_CustomerData_Address]  WITH CHECK ADD  CONSTRAINT [FK_TBL_CustomerData_Address_TBL_CustomerData] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[TBL_CustomerData] ([CustomerID])
GO
ALTER TABLE [dbo].[TBL_CustomerData_Address] CHECK CONSTRAINT [FK_TBL_CustomerData_Address_TBL_CustomerData]
GO
/****** Object:  StoredProcedure [ADMIN].[USP_UMS_API_CLIENT_CU]    Script Date: 12/1/2023 3:08:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		MOHAMMED AMEEN
-- Create date: 2023-08-23
-- Description:	CREATE OR UPDATE API CLIENT
-- =============================================
CREATE PROCEDURE [ADMIN].[USP_UMS_API_CLIENT_CU]
	-- Add the parameters for the stored procedure here
	  @ApiClientID	BIGINT
	, @Company		NVARCHAR(500)
	, @ContactName	NVARCHAR(500)
	, @ContactNo	NVARCHAR(50)
	, @Email		NVARCHAR(500)
	, @Address		NVARCHAR(500)
	, @IsExpiry		BIT
	, @ExpiryDate	DATE
	, @Disable		BIT
	, @CREATEDBY	BIGINT
	, @LANG			VARCHAR(5)
	, @FLAG			INT = NULL		OUTPUT
	, @DESC			NVARCHAR(MAX)	OUTPUT
	, @UNID			BIGINT			OUTPUT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	BEGIN TRY
		BEGIN TRANSACTION

			SET @Flag = 0  
			SET @Desc = 'CLIENT WITH EMAIL ALREADY CREATED.'
						
			IF NOT EXISTS( SELECT * 
						   FROM [ADMIN].TBL_API_CLIENT 
						   WHERE Email = @Email
						   AND ( IsExpiry = 1 AND ExpiryDate > GETDATE() OR IsExpiry = 0 ) 
						   AND IsActive = 1 
						   AND ApiClientID <> @ApiClientID )
			BEGIN

				UPDATE	C SET
						C.Company		= @Company,
						C.ContactName	= @ContactName,
						C.ContactNo		= @ContactNo,
						C.Email			= @Email,
						C.[Address]		= @Address,
						C.[Disable]		= @Disable,
						C.ModifiedDate	= GETDATE(),
						C.ModifiedBy	= @CREATEDBY

				FROM [ADMIN].TBL_API_CLIENT C
				WHERE C.ApiClientID = @ApiClientID

				DECLARE @ClientSecret VARCHAR(24) = NULL
				SELECT @ClientSecret = COALESCE(@ClientSecret, '') + CASE WHEN ( LEN( @ClientSecret ) + 1 ) % 5 = 0 THEN '-' ELSE N END
				FROM (	SELECT TOP 24 CHAR(NUMBER) N 
						FROM MASTER..SPT_VALUES
						WHERE type = 'P' 
						AND (	 NUMBER BETWEEN ASCII(0)	AND ASCII(9)
							  OR NUMBER BETWEEN ASCII('A')	AND ASCII('Z'))
						ORDER BY NEWID()
					  ) A
				WHERE @ClientSecret IS NULL AND @ApiClientID = 0

				IF NOT EXISTS( SELECT ClientSecret FROM [ADMIN].TBL_API_CLIENT WHERE ClientSecret = @ClientSecret)
				BEGIN

					INSERT INTO [ADMIN].TBL_API_CLIENT( Company, ContactName, ContactNo, Email, [Address], 
														IsExpiry, ExpiryDate, ClientSecret, 
														CreatedBy, ModifiedBy )
					SELECT @Company, @ContactName, @ContactNo, @Email, @Address, 
						   @IsExpiry, @ExpiryDate, @ClientSecret, 
						   @CREATEDBY, @CREATEDBY
					WHERE @ApiClientID = 0
		
					SELECT @ApiClientID = @@IDENTITY WHERE @ApiClientID = 0
					
					UPDATE [ADMIN].TBL_API_CLIENT 
					SET ClientID = 'CUA-' + RIGHT( '000000' + CAST(ApiClientID AS NVARCHAR),6) 
					WHERE ApiClientID = @ApiClientID

				END

				IF @@Error = 0  AND @ApiClientID <> 0
					BEGIN
						SET @UNID = @ApiClientID
						SET @Flag = 1  
						SET @DESC =  'Saved successfully!.'
					END  
				ELSE  
					BEGIN  
						SET @Flag = 0  
						SET @Desc = 'Error occured, please try again.'  
					END
			END

		COMMIT								
		END TRY
		BEGIN CATCH
			ROLLBACK
			SET @FLAG = 0;        
			SET @DESC =  CASE WHEN @LANG ='E' 
							  THEN N'Error occurred on CLIENT info Update.' 
							  ELSE N'Error occurred on CLIENT info update.' END; -- ERROR_MESSAGE(); 
			RETURN;
		END CATCH
END
GO
/****** Object:  StoredProcedure [ADMIN].[USP_UMS_API_CLIENT_SELECT]    Script Date: 12/1/2023 3:08:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		MOHAMMED AMEEN
-- Create date: 2023-08-24
-- Description:	SELECT THE CLIENT INFOMATION.
-- =============================================
-- EXEC ADMIN.USP_UMS_API_CLIENT_SELECT
CREATE PROCEDURE [ADMIN].[USP_UMS_API_CLIENT_SELECT]
	-- Add the parameters for the stored procedure here
	  @ApiClientID	BIGINT = 0
	, @ClientID		NVARCHAR(50) = NULL
	, @ClientSecret	NVARCHAR(50) = NULL

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT C.ApiClientID
		 , C.Company
		 , C.ContactName
		 , C.ContactNo
		 , C.Email
		 , C.[Address]
		 , C.IsExpiry
		 , C.ExpiryDate
		 , C.ClientID
		 , C.ClientSecret
		 , C.[Disable]

	FROM [ADMIN].TBL_API_CLIENT C
	WHERE C.IsActive = 1
	AND ( C.ApiClientID = @ApiClientID OR @ApiClientID = 0 )
	AND ( C.[Disable] = 0  AND ( IsExpiry = 1 AND ExpiryDate > GETDATE() OR IsExpiry = 0 )  AND C.ClientID		= @ClientID		OR @ClientID		IS NULL )
	AND ( C.[Disable] = 0  AND ( IsExpiry = 1 AND ExpiryDate > GETDATE() OR IsExpiry = 0 )  AND C.ClientSecret	= @ClientSecret	OR @ClientSecret	IS NULL )
END
GO
/****** Object:  StoredProcedure [ADMIN].[USP_UMS_API_CLIENT_TOKEN_ADD]    Script Date: 12/1/2023 3:08:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		MOHAMMED AMEEN
-- Create date: 2023-08-24
-- Description:	STORE API CLIENT TOKEN DETAILS
-- =============================================
CREATE PROCEDURE [ADMIN].[USP_UMS_API_CLIENT_TOKEN_ADD]
	-- Add the parameters for the stored procedure here
	  @ClientID		NVARCHAR(50)
	, @Token		NVARCHAR(MAX)
	, @IssueDate	DATETIME
	, @ExpiryDate	DATETIME
	, @FLAG			INT = NULL		OUTPUT
	, @DESC			NVARCHAR(MAX)	OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	BEGIN TRY
		BEGIN TRANSACTION

			INSERT INTO [ADMIN].TBL_API_CLIENT_TOKEN( ApiClientID, Token, IssueDate, ExpriyDate )
			SELECT ApiClientID, @Token, @IssueDate, @ExpiryDate
			FROM [ADMIN].TBL_API_CLIENT
			WHERE ClientID = @ClientID

			IF @@Error = 0
				BEGIN
					SET @Flag = 1  
					SET @DESC =  'Saved successfully!.'
				END  
			ELSE  
				BEGIN  
					SET @Flag = 0  
					SET @Desc = 'Error occured, please try again.'  
				END

		COMMIT								
	END TRY
	BEGIN CATCH
		ROLLBACK
		SET @FLAG = 0;        
		SET @DESC =  N'Error occurred on Client token store.'; -- ERROR_MESSAGE(); 
		RETURN;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CustomerData_Address_CU]    Script Date: 12/1/2023 3:08:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_CustomerData_Address_CU]
@CustomerID BIGINT
,@AddressID BIGINT = 0
,@City NVARCHAR(200)
,@Country NVARCHAR(200)
,@AddressLine NVARCHAR(200)
,@FLAG BIT = 0 OUTPUT  
,@DESC NVARCHAR(MAX) OUTPUT  
,@UNID BIGINT = 0  OUTPUT  

AS  
BEGIN
	IF @AddressID = 0
	BEGIN
		DECLARE @Count AS INT
		SELECT @Count = COUNT(1) FROM TBL_CustomerData_Address WHERE IsDeleted=0 
		AND CustomerID = @CustomerID AND City = @City AND Country = @Country AND AddressLine = @AddressLine
		IF @Count > 0
		BEGIN
			SET @FLAG = 0;        
			SET @DESC =  'Customer address already exists'
			RETURN;
		END

		INSERT INTO TBL_CustomerData_Address(CustomerID,City,Country,AddressLine)  
		VALUES (@CustomerID,@City,@Country,@AddressLine)
		SET @AddressID = @@IDENTITY

		 SET @FLAG = 1;        
		 SET @DESC = 'Saved successfully!' 
		 SET @UNID =@AddressID   
	END
	ELSE
	BEGIN
		UPDATE TBL_CustomerData_Address SET City=@City,Country=@Country,AddressLine=@AddressLine
		,ModifiedOn= GETDATE() WHERE CustomerID = @CustomerID AND AddressID = @AddressID

		 SET @FLAG = 1;        
		 SET @DESC = N'Updated successfully!'        
		 SET @UNID = @AddressID 
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CustomerData_Address_DELETE]    Script Date: 12/1/2023 3:08:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_CustomerData_Address_DELETE]
@CustomerID BIGINT
,@AddressID BIGINT
,@FLAG BIT=NULL OUTPUT  
,@DESC NVARCHAR(MAX) OUTPUT  
AS  
BEGIN
	UPDATE TBL_CustomerData_Address SET IsDeleted=1, ModifiedOn=GETDATE() 
	WHERE  CustomerID = @CustomerID AND AddressID = @AddressID
	SET @FLAG = 1;        
	SET @DESC = 'Deleted successfully!';    
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CustomerData_CU]    Script Date: 12/1/2023 3:08:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_CustomerData_CU]
@CustomerID BIGINT = 0
,@FirstName nvarchar(200)
,@LastName nvarchar(200)
,@PhoneNumber VARCHAR(15)
,@Email VARCHAR(50)
,@FLAG BIT = 0 OUTPUT  
,@DESC NVARCHAR(MAX) OUTPUT  
,@UNID BIGINT = 0  OUTPUT  

AS  
BEGIN
	IF @CustomerID = 0
	BEGIN
		DECLARE @Count AS INT
		SELECT @Count = COUNT(1) FROM TBL_CustomerData WHERE IsDeleted=0 AND PhoneNumber = @PhoneNumber
		IF @Count > 0
		BEGIN
			SET @FLAG = 0;        
			SET @DESC =  'Customer with phone number already exists'
			RETURN;
		END

		INSERT INTO TBL_CustomerData(FirstName,LastName,PhoneNumber,Email)  
		VALUES (@FirstName,@LastName,@PhoneNumber,@Email)
		SET @CustomerID = @@IDENTITY

		 SET @FLAG = 1;        
		 SET @DESC = 'Saved successfully!' 
		 SET @UNID =@CustomerID   
	END
	ELSE
	BEGIN
		UPDATE TBL_CustomerData SET FirstName=@FirstName,LastName=@LastName,PhoneNumber=@PhoneNumber
		,Email=@Email,ModifiedOn= GETDATE() WHERE CustomerID = @CustomerID

		 SET @FLAG = 1;        
		 SET @DESC = N'Updated successfully!'        
		 SET @UNID = @CustomerID 
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CustomerData_SELECT]    Script Date: 12/1/2023 3:08:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--[SP_CustomerData_SELECT] 
CREATE PROC [dbo].[SP_CustomerData_SELECT]  
@CustomerID BIGINT = 0
,@PhoneNumber varchar(15) = NULL
,@City nvarchar(200) = NULL
AS  
BEGIN
	IF @CustomerID = 0
	BEGIN
		SELECT C.CustomerID, C.FirstName, C.LastName, C.PhoneNumber,C.Email, A.AddressID, A.City, A.Country, A.AddressLine FROM TBL_CustomerData C
		LEFT JOIN TBL_CustomerData_Address A ON A.CustomerID = C.CustomerID AND A.IsDeleted=0
		WHERE (C.PhoneNumber LIKE @PhoneNumber + '%' OR @PhoneNumber IS NULL) 
		AND (A.City = @City OR @City IS NULL) 
		AND C.IsDeleted=0 
		ORDER BY CustomerID ASC
	END
	ELSE
	BEGIN
		SELECT C.CustomerID, C.FirstName, C.LastName, C.PhoneNumber,C.Email, A.AddressID, A.City, A.Country, A.AddressLine FROM TBL_CustomerData C
		LEFT JOIN TBL_CustomerData_Address A ON A.CustomerID = C.CustomerID AND A.IsDeleted=0
		WHERE C.CustomerID = @CustomerID
	END
END
GO
