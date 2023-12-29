USE [DBstudent]
GO

/****** Object:  Table [dbo].[vehicle_mst]    Script Date: 6/13/2019 5:05:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[vehicle_mst](
	[vehicle_id] [bigint] IDENTITY(1,1) NOT NULL,
	[vehicle_no] [nvarchar](50) NOT NULL,
	[vehicle_name] [nvarchar](200) NOT NULL,
	[reg_status] [int] NOT NULL,
	[reg_date_time] [datetime] NOT NULL,
	[reg_by] [bigint] NOT NULL,
 CONSTRAINT [PK_vehicle_mst] PRIMARY KEY CLUSTERED 
(
	[vehicle_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


