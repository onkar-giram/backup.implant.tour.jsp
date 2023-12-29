USE [DBstudent]
GO

/****** Object:  Table [dbo].[tour_details]    Script Date: 6/13/2019 5:06:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tour_details](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[emp_id] [bigint] NOT NULL,
	[from_date] [date] NOT NULL,
	[to_date] [date] NOT NULL,
	[along_with] [nvarchar](max) NOT NULL,
	[reason] [nvarchar](max) NOT NULL,
	[vehicle_id] [bigint] NOT NULL,
	[bill_no] [nchar](20) NOT NULL,
	[km] [float] NOT NULL,
	[reg_by] [bigint] NOT NULL,
	[reg_date_time] [datetime] NOT NULL,
	[reg_status] [int] NOT NULL,
 CONSTRAINT [PK_tour_details] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


