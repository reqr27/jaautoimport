USE [master]
GO
/****** Object:  Database [CarsImport]    Script Date: 26/04/2018 06:59:50 p.m. ******/
CREATE DATABASE [CarsImport]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CarsImport', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CarsImport.mdf' , SIZE = 10048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CarsImport_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CarsImport_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CarsImport] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CarsImport].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CarsImport] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CarsImport] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CarsImport] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CarsImport] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CarsImport] SET ARITHABORT OFF 
GO
ALTER DATABASE [CarsImport] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CarsImport] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CarsImport] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CarsImport] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CarsImport] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CarsImport] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CarsImport] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CarsImport] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CarsImport] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CarsImport] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CarsImport] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CarsImport] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CarsImport] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CarsImport] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CarsImport] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CarsImport] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CarsImport] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CarsImport] SET RECOVERY FULL 
GO
ALTER DATABASE [CarsImport] SET  MULTI_USER 
GO
ALTER DATABASE [CarsImport] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CarsImport] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CarsImport] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CarsImport] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CarsImport] SET DELAYED_DURABILITY = DISABLED 
GO
USE [CarsImport]
GO
/****** Object:  Table [dbo].[Ciudades]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ciudades](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPais] [int] NULL,
	[ciudad] [varchar](100) NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Clientes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cliente] [varchar](200) NOT NULL,
	[rnc_cedula] [varchar](50) NOT NULL,
	[direccion] [varchar](200) NULL,
	[telefono] [varchar](50) NOT NULL,
	[estado] [bit] NOT NULL,
	[id_pais] [int] NULL,
	[id_ciudad] [int] NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Colores]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Colores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[color] [varchar](100) NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Componentes]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Componentes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fabricante_id] [int] NOT NULL,
	[modelo_id] [int] NOT NULL,
	[año] [varchar](50) NOT NULL,
	[componente] [varchar](200) NOT NULL,
	[precio_rd] [decimal](18, 2) NOT NULL,
	[precio_usd] [decimal](18, 2) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_Componentes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CuentasCobrar]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuentasCobrar](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_vehiculo] [int] NULL,
	[id_factura] [int] NULL,
	[id_cliente] [int] NULL,
	[id_transaccion] [int] NULL,
	[monto_rd] [decimal](18, 2) NULL,
	[monto_usd] [decimal](18, 2) NULL,
	[balance_rd] [decimal](18, 2) NULL,
	[balance_usd] [decimal](18, 2) NULL,
	[fecha] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CuentasPagar]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuentasPagar](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_vehiculo] [int] NULL,
	[id_factura] [int] NULL,
	[id_vendedor] [int] NULL,
	[id_transaccion] [int] NULL,
	[id_gasto] [int] NULL DEFAULT ((0)),
	[monto_rd] [decimal](18, 2) NULL,
	[monto_usd] [decimal](18, 2) NULL,
	[balance_rd] [decimal](18, 2) NULL,
	[balance_usd] [decimal](18, 2) NULL,
	[fecha] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetalleComponentes]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleComponentes](
	[idVehiculo] [int] NOT NULL,
	[idComponente] [int] NOT NULL,
	[precioRD] [float] NOT NULL,
	[precioUSD] [float] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetalleGastosAduanales]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleGastosAduanales](
	[idVehiculo] [int] NOT NULL,
	[idGastoAduanal] [int] NOT NULL,
	[precioRD] [decimal](18, 2) NOT NULL,
	[precioUSD] [decimal](18, 2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetallePagosComprasVehiculoCredito]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DetallePagosComprasVehiculoCredito](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idVehiculo] [int] NULL,
	[montoRD] [decimal](18, 2) NULL,
	[montoUSD] [decimal](18, 2) NULL,
	[fechaPago] [date] NULL,
	[detalles] [varchar](100) NULL,
	[idTipoPago] [int] NULL,
	[pendienteRD] [decimal](18, 2) NULL,
	[pendienteUSD] [decimal](18, 2) NULL,
 CONSTRAINT [PK_DetallePagosComprasVehiculoCredito] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetallePagosVentasVehiculoCredito]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DetallePagosVentasVehiculoCredito](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idVehiculo] [int] NULL,
	[montoRD] [decimal](18, 2) NULL,
	[montoUSD] [decimal](18, 2) NULL,
	[fechaPago] [date] NULL,
	[detalles] [varchar](100) NULL,
	[idTipoPago] [int] NULL,
	[pendienteRD] [decimal](18, 2) NULL,
	[pendienteUSD] [decimal](18, 2) NULL,
 CONSTRAINT [PK_DetallePagosVentasVehiculoCredito] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetallesEfectivoGeneral]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DetallesEfectivoGeneral](
	[idVehiculo] [int] NULL,
	[tipoCuenta] [int] NULL,
	[montoRD] [decimal](18, 2) NULL,
	[montoUSD] [decimal](18, 2) NULL,
	[fecha] [date] NULL,
	[documento] [varchar](50) NULL,
	[numeroDocumento] [int] NULL,
	[id_transaccion] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetallesGastosReparaciones]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallesGastosReparaciones](
	[idVehiculo] [int] NOT NULL,
	[idMantenimiento] [int] NOT NULL,
	[idTaller] [int] NOT NULL,
	[precioRD] [float] NOT NULL,
	[precioUSD] [float] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Fabricantes]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Fabricantes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](50) NOT NULL,
	[fabricante] [varchar](50) NOT NULL,
	[estado] [bit] NOT NULL CONSTRAINT [DF_Fabricantes_estado]  DEFAULT ((1)),
 CONSTRAINT [PK_Fabricantes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[facturas]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[facturas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idVehiculo] [int] NOT NULL,
	[id_cliente] [int] NULL,
	[fecha] [date] NULL,
 CONSTRAINT [PK_facturas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FormaCompraVehiculo]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FormaCompraVehiculo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_vehiculo] [int] NULL,
	[id_transaccion] [int] NULL,
	[id_tipo_pago] [int] NULL,
	[id_factura] [int] NULL,
	[monto_rd] [decimal](18, 2) NULL,
	[monto_usd] [decimal](18, 2) NULL,
	[nota] [varchar](100) NULL,
	[fecha] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FormaVentaVehiculo]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FormaVentaVehiculo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_vehiculo] [int] NULL,
	[id_transaccion] [int] NULL,
	[id_tipo_pago] [int] NULL,
	[id_factura] [int] NULL,
	[monto_rd] [decimal](18, 2) NULL,
	[monto_usd] [decimal](18, 2) NULL,
	[nota] [varchar](100) NULL,
	[fecha] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Gastos]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gastos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](250) NOT NULL,
	[tipo] [varchar](50) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_Mantenimientos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GastoVehiculo]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GastoVehiculo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_vehiculo] [int] NULL,
	[id_gasto] [int] NULL,
	[id_proveedor] [int] NULL,
	[id_transaccion] [int] NULL,
	[monto_rd] [decimal](18, 2) NULL,
	[monto_usd] [decimal](18, 2) NULL,
	[fecha] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HistorialUbicaciones]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistorialUbicaciones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_vehiculo] [int] NULL,
	[id_ubicacion] [int] NULL,
	[fecha] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ImagenesClientes]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ImagenesClientes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idCliente] [int] NULL,
	[img] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ImagenesTraspasos]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ImagenesTraspasos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_factura] [int] NULL,
	[id_vehiculo] [int] NULL,
	[img] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Modelos]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Modelos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[noUso] [int] NULL,
	[fabricante_id] [int] NOT NULL,
	[codigo] [varchar](50) NOT NULL,
	[modelo] [varchar](50) NOT NULL,
	[estado] [bit] NOT NULL CONSTRAINT [DF_Modelos_estado]  DEFAULT ((1)),
 CONSTRAINT [PK_Modelos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PagosCuentasCobrar]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PagosCuentasCobrar](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_cuentaCobrar] [int] NULL,
	[id_tipoPago] [int] NULL,
	[monto_rd] [decimal](18, 2) NULL,
	[monto_usd] [decimal](18, 2) NULL,
	[fecha] [date] NULL,
	[nota] [varchar](100) NULL,
	[balance_rd] [decimal](18, 2) NULL,
	[balance_usd] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PagosCuentasPagar]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PagosCuentasPagar](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_cuentaPagar] [int] NULL,
	[id_tipoPago] [int] NULL,
	[monto_rd] [decimal](18, 2) NULL,
	[monto_usd] [decimal](18, 2) NULL,
	[fecha] [date] NULL,
	[nota] [varchar](100) NULL,
	[balance_rd] [decimal](18, 2) NULL,
	[balance_usd] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Paises]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Paises](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pais] [varchar](100) NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PreciosSeguroVehiculo]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreciosSeguroVehiculo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_vehiculo] [int] NULL,
	[precioRD] [decimal](18, 2) NULL,
	[precioUSD] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PreciosTraspasoVehiculo]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreciosTraspasoVehiculo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_vehiculo] [int] NULL,
	[precioRD] [decimal](18, 2) NULL,
	[precioUSD] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Propietarios]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Propietarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[telefono] [varchar](50) NULL,
	[estado] [bit] NOT NULL,
	[direccion] [varchar](200) NULL,
	[rncCedula] [varchar](50) NULL,
 CONSTRAINT [PK_Propietarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Seguros]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Seguros](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[telefono] [varchar](30) NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SeguroVehiculo]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeguroVehiculo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_vehiculo] [int] NULL,
	[id_seguro] [int] NULL,
	[duracion_dias] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SerialKeyActivation]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SerialKeyActivation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fechaActivacion] [date] NULL,
	[fechaVencimiento] [date] NULL,
 CONSTRAINT [PK_SerialKeyActivation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Settings]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[activado] [bit] NULL,
	[primeraCorrida] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Suplidores]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Suplidores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[suplidor] [varchar](100) NULL,
	[rnc_cedula] [varchar](100) NULL,
	[id_pais] [int] NULL,
	[id_ciudad] [int] NULL,
	[direccion] [varchar](100) NULL,
	[telefono] [varchar](100) NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TalleresRepuestos]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TalleresRepuestos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[taller] [varchar](100) NOT NULL,
	[direccion] [varchar](200) NOT NULL,
	[telefono1] [varchar](50) NULL,
	[telefono2] [varchar](50) NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_TalleresRepuestos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TasaDolar]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TasaDolar](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tasaDolar] [float] NULL,
	[fechaActualizado] [date] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TipoFormaCobroVentaVehiculo]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoFormaCobroVentaVehiculo](
	[id_vehiculo] [int] NOT NULL,
	[id_tipo_pago] [int] NULL,
	[pago_usd] [decimal](18, 2) NOT NULL,
	[pago_rd] [decimal](18, 2) NOT NULL,
	[fecha_pago] [date] NOT NULL,
	[detalles] [varchar](100) NULL,
	[balanceRD] [decimal](18, 2) NULL,
	[balanceUSD] [decimal](18, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoFormaPagoCompraVehiculo]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoFormaPagoCompraVehiculo](
	[idVehiculo] [int] NULL,
	[idTipoPago] [int] NULL,
	[montoRD] [decimal](18, 2) NULL,
	[montoUSD] [decimal](18, 2) NULL,
	[detalles] [varchar](100) NULL,
	[balanceRD] [decimal](18, 2) NULL,
	[balanceUSD] [decimal](18, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiposCuenta]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiposCuenta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipoCuenta] [varchar](50) NULL,
 CONSTRAINT [PK_TiposCuenta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiposGastos]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiposGastos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[gasto] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiposPago]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiposPago](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[formaPago] [varchar](50) NULL,
 CONSTRAINT [PK_TiposPago] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoTransaccion]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoTransaccion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[transaccion] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ubicaciones]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ubicaciones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_pais] [int] NULL,
	[id_ciudad] [int] NULL,
	[ubicacion] [varchar](100) NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](50) NULL,
	[clave] [varchar](50) NULL,
	[nombreApellido] [varchar](50) NULL,
	[tasaDolar] [bit] NULL CONSTRAINT [DF_Usuarios_tasaDolar]  DEFAULT ((0)),
	[crearUsuarios] [bit] NULL CONSTRAINT [DF_Usuarios_crearUsuarios]  DEFAULT ((0)),
	[fabricantesModelos] [bit] NULL CONSTRAINT [DF_Usuarios_fabricantesModelos]  DEFAULT ((0)),
	[piezasRepuestos] [bit] NULL CONSTRAINT [DF_Usuarios_piezasRepuestos]  DEFAULT ((0)),
	[crearTaller] [bit] NULL CONSTRAINT [DF_Usuarios_crearTaller]  DEFAULT ((0)),
	[crearPropietarios] [bit] NULL CONSTRAINT [DF_Usuarios_crearPropietarios]  DEFAULT ((0)),
	[crearClientes] [bit] NULL CONSTRAINT [DF_Usuarios_crearClientes]  DEFAULT ((0)),
	[crearGastos] [bit] NULL CONSTRAINT [DF_Usuarios_crearGastos]  DEFAULT ((0)),
	[importarVehiculo] [bit] NULL CONSTRAINT [DF_Usuarios_importarVehiculo]  DEFAULT ((0)),
	[compras] [bit] NULL CONSTRAINT [DF_Usuarios_deshabilitar]  DEFAULT ((0)),
	[cambiarEstadosVehiculo] [bit] NULL CONSTRAINT [DF_Usuarios_cambiarEstadosVehiculo]  DEFAULT ((0)),
	[agreagarGastos] [bit] NULL CONSTRAINT [DF_Usuarios_agreagarGastos]  DEFAULT ((0)),
	[agregarPiezas] [bit] NULL CONSTRAINT [DF_Usuarios_agregarPiezas]  DEFAULT ((0)),
	[facturacion] [bit] NULL CONSTRAINT [DF_Usuarios_verHacerPagos]  DEFAULT ((0)),
	[reportes] [bit] NULL CONSTRAINT [DF_Usuarios_reportes]  DEFAULT ((0)),
	[estadoUsuario] [bit] NULL CONSTRAINT [DF_Usuarios_estadoUsuario]  DEFAULT ((1)),
	[modificarVehiculo] [bit] NULL,
	[cuentasCobrar] [bit] NULL,
	[cuentasPagar] [bit] NULL,
	[actualizarDiarioTasa] [bit] NULL,
	[agregar_paises] [bit] NOT NULL DEFAULT ((1)),
	[agregar_ciudades] [bit] NOT NULL DEFAULT ((1)),
	[agregar_colores] [bit] NOT NULL DEFAULT ((1)),
	[agregar_ubicaciones] [bit] NOT NULL DEFAULT ((1)),
	[agregar_suplidores] [bit] NOT NULL DEFAULT ((1)),
	[agregar_seguros] [bit] NOT NULL DEFAULT ((1)),
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Vehiculos]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vehiculos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fabricante_id] [int] NOT NULL,
	[modelo_id] [int] NOT NULL,
	[año] [int] NOT NULL,
	[color] [varchar](50) NULL,
	[precioUSD] [decimal](18, 2) NOT NULL,
	[precioRD] [decimal](18, 2) NOT NULL,
	[id_cliente] [int] NULL,
	[id_propietario] [int] NOT NULL,
	[terminado] [bit] NOT NULL,
	[vendido] [bit] NOT NULL,
	[pagado] [bit] NOT NULL,
	[fecha_importe] [date] NOT NULL,
	[fecha_terminado] [date] NULL,
	[fecha_vendido] [date] NULL,
	[vin] [varchar](50) NOT NULL,
	[nota] [varchar](250) NULL,
	[estado] [bit] NOT NULL,
	[total_invertido_rd] [decimal](18, 2) NOT NULL,
	[total_invertido_usd] [decimal](18, 2) NOT NULL,
	[matricula] [bit] NULL,
	[cedula_vendedor] [bit] NULL,
	[acto_venta] [bit] NULL,
	[precioVentaRD] [decimal](18, 2) NULL,
	[precioVentaUSD] [decimal](18, 2) NULL,
	[id_suplidor] [int] NULL,
	[id_ubicacion] [int] NULL,
	[precio_estimado_rd] [decimal](18, 2) NULL,
	[precio_estimado_usd] [decimal](18, 2) NULL,
	[placa] [varchar](30) NULL,
	[numero_matricula] [varchar](100) NULL,
	[millaje] [varchar](100) NULL,
	[fuerza_motriz] [varchar](30) NULL,
 CONSTRAINT [PK_Vehiculos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Ciudades] ON 

INSERT [dbo].[Ciudades] ([id], [idPais], [ciudad], [estado]) VALUES (1, 1, N'SANTIAGO', 1)
INSERT [dbo].[Ciudades] ([id], [idPais], [ciudad], [estado]) VALUES (2, 1, N'SANTO DOMINGO', 1)
INSERT [dbo].[Ciudades] ([id], [idPais], [ciudad], [estado]) VALUES (3, 1, N'MOCA', 1)
INSERT [dbo].[Ciudades] ([id], [idPais], [ciudad], [estado]) VALUES (4, 1, N'LA ROMANA', 1)
INSERT [dbo].[Ciudades] ([id], [idPais], [ciudad], [estado]) VALUES (5, 1, N'SANTIAGO RODRIGUEZ', 1)
INSERT [dbo].[Ciudades] ([id], [idPais], [ciudad], [estado]) VALUES (6, 1, N'SAN JUAN', 1)
INSERT [dbo].[Ciudades] ([id], [idPais], [ciudad], [estado]) VALUES (7, 1, N'PUERTO PLATA', 1)
INSERT [dbo].[Ciudades] ([id], [idPais], [ciudad], [estado]) VALUES (8, 1, N'VALVERDE', 1)
INSERT [dbo].[Ciudades] ([id], [idPais], [ciudad], [estado]) VALUES (9, 1, N'DAJABON', 1)
INSERT [dbo].[Ciudades] ([id], [idPais], [ciudad], [estado]) VALUES (10, 1, N'MONTECRISTI', 1)
INSERT [dbo].[Ciudades] ([id], [idPais], [ciudad], [estado]) VALUES (11, 1, N'ELIAS PIÑA', 1)
INSERT [dbo].[Ciudades] ([id], [idPais], [ciudad], [estado]) VALUES (12, 1, N'BAHORUCO', 1)
INSERT [dbo].[Ciudades] ([id], [idPais], [ciudad], [estado]) VALUES (13, 1, N'INDEPENDENCIA', 1)
INSERT [dbo].[Ciudades] ([id], [idPais], [ciudad], [estado]) VALUES (14, 1, N'PEDERNALES', 1)
INSERT [dbo].[Ciudades] ([id], [idPais], [ciudad], [estado]) VALUES (15, 1, N'BARAHONA', 1)
INSERT [dbo].[Ciudades] ([id], [idPais], [ciudad], [estado]) VALUES (16, 1, N'AZUA', 1)
INSERT [dbo].[Ciudades] ([id], [idPais], [ciudad], [estado]) VALUES (17, 1, N'LA VEGA', 1)
INSERT [dbo].[Ciudades] ([id], [idPais], [ciudad], [estado]) VALUES (18, 1, N'SAN JOSE DE OCOA', 1)
INSERT [dbo].[Ciudades] ([id], [idPais], [ciudad], [estado]) VALUES (19, 1, N'PERAVIA', 1)
INSERT [dbo].[Ciudades] ([id], [idPais], [ciudad], [estado]) VALUES (20, 1, N'SAN CRISTOBAL', 1)
INSERT [dbo].[Ciudades] ([id], [idPais], [ciudad], [estado]) VALUES (21, 1, N'MONTE PLATA', 1)
INSERT [dbo].[Ciudades] ([id], [idPais], [ciudad], [estado]) VALUES (22, 1, N'MARIA TRINIDAD SANCHEZ', 1)
INSERT [dbo].[Ciudades] ([id], [idPais], [ciudad], [estado]) VALUES (23, 1, N'HERMANAS MIRABAL', 1)
INSERT [dbo].[Ciudades] ([id], [idPais], [ciudad], [estado]) VALUES (24, 1, N'DUARTE', 1)
INSERT [dbo].[Ciudades] ([id], [idPais], [ciudad], [estado]) VALUES (25, 1, N'ESPAILLAT', 1)
INSERT [dbo].[Ciudades] ([id], [idPais], [ciudad], [estado]) VALUES (26, 1, N'MONSEÑOR NOUEL', 1)
INSERT [dbo].[Ciudades] ([id], [idPais], [ciudad], [estado]) VALUES (27, 1, N'SAMANA', 1)
INSERT [dbo].[Ciudades] ([id], [idPais], [ciudad], [estado]) VALUES (28, 1, N'HATO MAYOR', 1)
INSERT [dbo].[Ciudades] ([id], [idPais], [ciudad], [estado]) VALUES (29, 1, N'SAN PEDRO DE MACORIS', 1)
INSERT [dbo].[Ciudades] ([id], [idPais], [ciudad], [estado]) VALUES (30, 1, N'EL SEIBO', 1)
INSERT [dbo].[Ciudades] ([id], [idPais], [ciudad], [estado]) VALUES (31, 1, N'LA ALTAGRACIA', 1)
INSERT [dbo].[Ciudades] ([id], [idPais], [ciudad], [estado]) VALUES (32, 1, N'LA SAONA', 1)
INSERT [dbo].[Ciudades] ([id], [idPais], [ciudad], [estado]) VALUES (33, 1, N'SAN JOSE DE LAS MATAS', 1)
SET IDENTITY_INSERT [dbo].[Ciudades] OFF
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([id], [cliente], [rnc_cedula], [direccion], [telefono], [estado], [id_pais], [id_ciudad]) VALUES (1, N'YSRAEL ANTONIO JIMENEZ SUERO', N'04701344477', N'Jacaranda, Casa 2, Centro de la cuidad, La Vega', N'8093994899 ', 1, NULL, NULL)
INSERT [dbo].[Clientes] ([id], [cliente], [rnc_cedula], [direccion], [telefono], [estado], [id_pais], [id_ciudad]) VALUES (2, N'CLIENTE 1', N'0423544643', N'SKLCHJKLSNC', N'15246+46', 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Clientes] OFF
SET IDENTITY_INSERT [dbo].[Colores] ON 

INSERT [dbo].[Colores] ([id], [color], [estado]) VALUES (1, N'GRIS', 1)
INSERT [dbo].[Colores] ([id], [color], [estado]) VALUES (2, N'NEGRO', 1)
INSERT [dbo].[Colores] ([id], [color], [estado]) VALUES (3, N'VERDE', 1)
INSERT [dbo].[Colores] ([id], [color], [estado]) VALUES (4, N'AZUL', 1)
INSERT [dbo].[Colores] ([id], [color], [estado]) VALUES (5, N'NARANJA', 1)
INSERT [dbo].[Colores] ([id], [color], [estado]) VALUES (6, N'BLANCO', 1)
INSERT [dbo].[Colores] ([id], [color], [estado]) VALUES (7, N'AMARILLO', 1)
INSERT [dbo].[Colores] ([id], [color], [estado]) VALUES (8, N'DORADO', 1)
INSERT [dbo].[Colores] ([id], [color], [estado]) VALUES (9, N'PLATEADO', 1)
INSERT [dbo].[Colores] ([id], [color], [estado]) VALUES (10, N'MAMEY', 1)
INSERT [dbo].[Colores] ([id], [color], [estado]) VALUES (11, N'NARANJA', 1)
INSERT [dbo].[Colores] ([id], [color], [estado]) VALUES (12, N'VERDE GRIS', 1)
INSERT [dbo].[Colores] ([id], [color], [estado]) VALUES (13, N'AZUL GRIS', 1)
INSERT [dbo].[Colores] ([id], [color], [estado]) VALUES (14, N'ROJO GRIS', 1)
INSERT [dbo].[Colores] ([id], [color], [estado]) VALUES (15, N'NEGRO GRIS', 1)
INSERT [dbo].[Colores] ([id], [color], [estado]) VALUES (16, N'GRIS PLOMO', 1)
INSERT [dbo].[Colores] ([id], [color], [estado]) VALUES (17, N'BLANCO/GRIS', 1)
INSERT [dbo].[Colores] ([id], [color], [estado]) VALUES (18, N'VERDE/GRIS', 1)
SET IDENTITY_INSERT [dbo].[Colores] OFF
SET IDENTITY_INSERT [dbo].[Componentes] ON 

INSERT [dbo].[Componentes] ([id], [fabricante_id], [modelo_id], [año], [componente], [precio_rd], [precio_usd], [estado]) VALUES (1, 11, 1323, N'2010', N'.', CAST(15000.00 AS Decimal(18, 2)), CAST(319.15 AS Decimal(18, 2)), 1)
SET IDENTITY_INSERT [dbo].[Componentes] OFF
SET IDENTITY_INSERT [dbo].[CuentasCobrar] ON 

INSERT [dbo].[CuentasCobrar] ([id], [id_vehiculo], [id_factura], [id_cliente], [id_transaccion], [monto_rd], [monto_usd], [balance_rd], [balance_usd], [fecha]) VALUES (1, 1, 1, 2, 3, CAST(5900.00 AS Decimal(18, 2)), CAST(125.53 AS Decimal(18, 2)), CAST(5900.00 AS Decimal(18, 2)), CAST(125.53 AS Decimal(18, 2)), CAST(N'2018-04-25' AS Date))
SET IDENTITY_INSERT [dbo].[CuentasCobrar] OFF
SET IDENTITY_INSERT [dbo].[CuentasPagar] ON 

INSERT [dbo].[CuentasPagar] ([id], [id_vehiculo], [id_factura], [id_vendedor], [id_transaccion], [id_gasto], [monto_rd], [monto_usd], [balance_rd], [balance_usd], [fecha]) VALUES (1, 1, 0, 2, 4, 0, CAST(3600.00 AS Decimal(18, 2)), CAST(76.60 AS Decimal(18, 2)), CAST(3600.00 AS Decimal(18, 2)), CAST(76.60 AS Decimal(18, 2)), CAST(N'2018-04-25' AS Date))
SET IDENTITY_INSERT [dbo].[CuentasPagar] OFF
INSERT [dbo].[DetallesEfectivoGeneral] ([idVehiculo], [tipoCuenta], [montoRD], [montoUSD], [fecha], [documento], [numeroDocumento], [id_transaccion]) VALUES (1, 2, CAST(560000.00 AS Decimal(18, 2)), CAST(11914.89 AS Decimal(18, 2)), CAST(N'2018-04-25' AS Date), N'Factura', 1, 1)
INSERT [dbo].[DetallesEfectivoGeneral] ([idVehiculo], [tipoCuenta], [montoRD], [montoUSD], [fecha], [documento], [numeroDocumento], [id_transaccion]) VALUES (1, 2, CAST(5600.00 AS Decimal(18, 2)), CAST(119.15 AS Decimal(18, 2)), CAST(N'2018-04-25' AS Date), N'Factura', 1, 3)
INSERT [dbo].[DetallesEfectivoGeneral] ([idVehiculo], [tipoCuenta], [montoRD], [montoUSD], [fecha], [documento], [numeroDocumento], [id_transaccion]) VALUES (1, 2, CAST(3600.00 AS Decimal(18, 2)), CAST(76.60 AS Decimal(18, 2)), CAST(N'2018-04-25' AS Date), N'Factura', 1, 4)
SET IDENTITY_INSERT [dbo].[Fabricantes] ON 

INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (1, N'ACURA', N'Acura', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (2, N'ALFA', N'Alfa Romeo', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (3, N'AMC', N'AMC', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (4, N'ASTON', N'Aston Martin', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (5, N'AUDI', N'Audi', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (6, N'AVANTI', N'Avanti', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (7, N'BENTL', N'Bentley', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (8, N'BMW', N'BMW', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (9, N'BUICK', N'Buick', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (10, N'CAD', N'Cadillac', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (11, N'CHEV', N'Chevrolet', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (12, N'CHRY', N'Chrysler', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (13, N'DAEW', N'Daewoo', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (14, N'DAIHAT', N'Daihatsu', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (15, N'DATSUN', N'Datsun', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (16, N'DELOREAN', N'DeLorean', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (17, N'DODGE', N'Dodge', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (18, N'EAGLE', N'Eagle', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (19, N'FER', N'Ferrari', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (20, N'FIAT', N'FIAT', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (21, N'FISK', N'Fisker', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (22, N'FORD', N'Ford', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (23, N'FREIGHT', N'Freightliner', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (24, N'GEO', N'Geo', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (25, N'GMC', N'GMC', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (26, N'HONDA', N'Honda', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (27, N'AMGEN', N'HUMMER', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (28, N'HYUND', N'Hyundai', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (29, N'INFIN', N'Infiniti', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (30, N'ISU', N'Isuzu', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (31, N'JAG', N'Jaguar', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (32, N'JEEP', N'Jeep', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (33, N'KIA', N'Kia', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (34, N'LAM', N'Lamborghini', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (35, N'LAN', N'Lancia', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (36, N'ROV', N'Land Rover', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (37, N'LEXUS', N'Lexus', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (38, N'LINC', N'Lincoln', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (39, N'LOTUS', N'Lotus', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (40, N'MAS', N'Maserati', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (41, N'MAYBACH', N'Maybach', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (42, N'MAZDA', N'Mazda', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (43, N'MCLAREN', N'McLaren', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (44, N'MB', N'Mercedes-Benz', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (45, N'MERC', N'Mercury', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (46, N'MERKUR', N'Merkur', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (47, N'MINI', N'MINI', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (48, N'MIT', N'Mitsubishi', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (49, N'NISSAN', N'Nissan', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (50, N'OLDS', N'Oldsmobile', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (51, N'PEUG', N'Peugeot', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (52, N'PLYM', N'Plymouth', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (53, N'PONT', N'Pontiac', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (54, N'POR', N'Porsche', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (55, N'RAM', N'RAM', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (56, N'REN', N'Renault', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (57, N'RR', N'Rolls-Royce', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (58, N'SAAB', N'Saab', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (59, N'SATURN', N'Saturn', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (60, N'SCION', N'Scion', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (61, N'SMART', N'smart', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (62, N'SRT', N'SRT', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (63, N'STERL', N'Sterling', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (64, N'SUB', N'Subaru', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (65, N'SUZUKI', N'Suzuki', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (66, N'TESLA', N'Tesla', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (67, N'TOYOTA', N'Toyota', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (68, N'TRI', N'Triumph', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (69, N'VOLKS', N'Volkswagen', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (70, N'VOLVO', N'Volvo', 1)
INSERT [dbo].[Fabricantes] ([id], [codigo], [fabricante], [estado]) VALUES (71, N'YUGO', N'Yugo', 1)
SET IDENTITY_INSERT [dbo].[Fabricantes] OFF
SET IDENTITY_INSERT [dbo].[facturas] ON 

INSERT [dbo].[facturas] ([id], [idVehiculo], [id_cliente], [fecha]) VALUES (1, 1, 2, CAST(N'2018-04-25' AS Date))
SET IDENTITY_INSERT [dbo].[facturas] OFF
SET IDENTITY_INSERT [dbo].[FormaCompraVehiculo] ON 

INSERT [dbo].[FormaCompraVehiculo] ([id], [id_vehiculo], [id_transaccion], [id_tipo_pago], [id_factura], [monto_rd], [monto_usd], [nota], [fecha]) VALUES (1, 1, 2, 2, 0, CAST(440000.00 AS Decimal(18, 2)), CAST(9361.70 AS Decimal(18, 2)), N'', CAST(N'2018-04-25' AS Date))
INSERT [dbo].[FormaCompraVehiculo] ([id], [id_vehiculo], [id_transaccion], [id_tipo_pago], [id_factura], [monto_rd], [monto_usd], [nota], [fecha]) VALUES (2, 1, 4, 3, 0, CAST(3600.00 AS Decimal(18, 2)), CAST(76.60 AS Decimal(18, 2)), N'CUENTA PAGAR SEGURO', CAST(N'2018-04-25' AS Date))
INSERT [dbo].[FormaCompraVehiculo] ([id], [id_vehiculo], [id_transaccion], [id_tipo_pago], [id_factura], [monto_rd], [monto_usd], [nota], [fecha]) VALUES (3, 2, 2, 2, 0, CAST(444000.00 AS Decimal(18, 2)), CAST(9446.81 AS Decimal(18, 2)), N'', CAST(N'2018-04-19' AS Date))
INSERT [dbo].[FormaCompraVehiculo] ([id], [id_vehiculo], [id_transaccion], [id_tipo_pago], [id_factura], [monto_rd], [monto_usd], [nota], [fecha]) VALUES (4, 3, 2, 1, 0, CAST(498200.00 AS Decimal(18, 2)), CAST(10600.00 AS Decimal(18, 2)), N'.', CAST(N'2018-03-10' AS Date))
INSERT [dbo].[FormaCompraVehiculo] ([id], [id_vehiculo], [id_transaccion], [id_tipo_pago], [id_factura], [monto_rd], [monto_usd], [nota], [fecha]) VALUES (5, 4, 2, 1, 0, CAST(318000.00 AS Decimal(18, 2)), CAST(6765.96 AS Decimal(18, 2)), N'', CAST(N'2016-09-29' AS Date))
INSERT [dbo].[FormaCompraVehiculo] ([id], [id_vehiculo], [id_transaccion], [id_tipo_pago], [id_factura], [monto_rd], [monto_usd], [nota], [fecha]) VALUES (6, 5, 2, 1, 0, CAST(325000.00 AS Decimal(18, 2)), CAST(6914.89 AS Decimal(18, 2)), N'', CAST(N'2016-12-16' AS Date))
INSERT [dbo].[FormaCompraVehiculo] ([id], [id_vehiculo], [id_transaccion], [id_tipo_pago], [id_factura], [monto_rd], [monto_usd], [nota], [fecha]) VALUES (7, 6, 2, 1, 0, CAST(325000.00 AS Decimal(18, 2)), CAST(6914.89 AS Decimal(18, 2)), N'.', CAST(N'2016-12-16' AS Date))
INSERT [dbo].[FormaCompraVehiculo] ([id], [id_vehiculo], [id_transaccion], [id_tipo_pago], [id_factura], [monto_rd], [monto_usd], [nota], [fecha]) VALUES (8, 7, 2, 1, 0, CAST(366000.00 AS Decimal(18, 2)), CAST(7787.23 AS Decimal(18, 2)), N'', CAST(N'2017-09-27' AS Date))
INSERT [dbo].[FormaCompraVehiculo] ([id], [id_vehiculo], [id_transaccion], [id_tipo_pago], [id_factura], [monto_rd], [monto_usd], [nota], [fecha]) VALUES (9, 8, 2, 1, 0, CAST(345000.00 AS Decimal(18, 2)), CAST(7340.43 AS Decimal(18, 2)), N'.', CAST(N'2018-01-04' AS Date))
INSERT [dbo].[FormaCompraVehiculo] ([id], [id_vehiculo], [id_transaccion], [id_tipo_pago], [id_factura], [monto_rd], [monto_usd], [nota], [fecha]) VALUES (10, 9, 2, 1, 0, CAST(500000.00 AS Decimal(18, 2)), CAST(10638.30 AS Decimal(18, 2)), N'', CAST(N'2017-05-18' AS Date))
INSERT [dbo].[FormaCompraVehiculo] ([id], [id_vehiculo], [id_transaccion], [id_tipo_pago], [id_factura], [monto_rd], [monto_usd], [nota], [fecha]) VALUES (11, 10, 2, 1, 0, CAST(356000.00 AS Decimal(18, 2)), CAST(7574.47 AS Decimal(18, 2)), N'', CAST(N'2018-02-08' AS Date))
INSERT [dbo].[FormaCompraVehiculo] ([id], [id_vehiculo], [id_transaccion], [id_tipo_pago], [id_factura], [monto_rd], [monto_usd], [nota], [fecha]) VALUES (12, 11, 2, 2, 0, CAST(385000.00 AS Decimal(18, 2)), CAST(8191.49 AS Decimal(18, 2)), N'.', CAST(N'2018-04-20' AS Date))
INSERT [dbo].[FormaCompraVehiculo] ([id], [id_vehiculo], [id_transaccion], [id_tipo_pago], [id_factura], [monto_rd], [monto_usd], [nota], [fecha]) VALUES (13, 12, 2, 1, 0, CAST(320000.00 AS Decimal(18, 2)), CAST(6808.51 AS Decimal(18, 2)), N'', CAST(N'2017-07-18' AS Date))
INSERT [dbo].[FormaCompraVehiculo] ([id], [id_vehiculo], [id_transaccion], [id_tipo_pago], [id_factura], [monto_rd], [monto_usd], [nota], [fecha]) VALUES (1003, 1002, 2, 1, 0, CAST(275000.00 AS Decimal(18, 2)), CAST(5851.06 AS Decimal(18, 2)), N'', CAST(N'2017-04-26' AS Date))
INSERT [dbo].[FormaCompraVehiculo] ([id], [id_vehiculo], [id_transaccion], [id_tipo_pago], [id_factura], [monto_rd], [monto_usd], [nota], [fecha]) VALUES (1004, 1003, 2, 1, 0, CAST(187000.00 AS Decimal(18, 2)), CAST(3978.72 AS Decimal(18, 2)), N'', CAST(N'2017-06-28' AS Date))
INSERT [dbo].[FormaCompraVehiculo] ([id], [id_vehiculo], [id_transaccion], [id_tipo_pago], [id_factura], [monto_rd], [monto_usd], [nota], [fecha]) VALUES (1005, 1004, 2, 1, 0, CAST(725000.00 AS Decimal(18, 2)), CAST(15425.53 AS Decimal(18, 2)), N'', CAST(N'2017-03-26' AS Date))
INSERT [dbo].[FormaCompraVehiculo] ([id], [id_vehiculo], [id_transaccion], [id_tipo_pago], [id_factura], [monto_rd], [monto_usd], [nota], [fecha]) VALUES (1006, 1005, 2, 1, 0, CAST(725000.00 AS Decimal(18, 2)), CAST(15425.53 AS Decimal(18, 2)), N'.', CAST(N'2017-03-26' AS Date))
INSERT [dbo].[FormaCompraVehiculo] ([id], [id_vehiculo], [id_transaccion], [id_tipo_pago], [id_factura], [monto_rd], [monto_usd], [nota], [fecha]) VALUES (1007, 1006, 2, 4, 0, CAST(939150.00 AS Decimal(18, 2)), CAST(19981.91 AS Decimal(18, 2)), N'', CAST(N'2018-04-02' AS Date))
INSERT [dbo].[FormaCompraVehiculo] ([id], [id_vehiculo], [id_transaccion], [id_tipo_pago], [id_factura], [monto_rd], [monto_usd], [nota], [fecha]) VALUES (1008, 1007, 2, 1, 0, CAST(210000.00 AS Decimal(18, 2)), CAST(4468.09 AS Decimal(18, 2)), N'', CAST(N'2017-07-04' AS Date))
INSERT [dbo].[FormaCompraVehiculo] ([id], [id_vehiculo], [id_transaccion], [id_tipo_pago], [id_factura], [monto_rd], [monto_usd], [nota], [fecha]) VALUES (1009, 1007, 7, 1, 0, CAST(35000.00 AS Decimal(18, 2)), CAST(7.13 AS Decimal(18, 2)), N'PINTURA COMPLETA', CAST(N'2018-04-26' AS Date))
INSERT [dbo].[FormaCompraVehiculo] ([id], [id_vehiculo], [id_transaccion], [id_tipo_pago], [id_factura], [monto_rd], [monto_usd], [nota], [fecha]) VALUES (1010, 1007, 6, 1, 0, CAST(15000.00 AS Decimal(18, 2)), CAST(3.06 AS Decimal(18, 2)), N'', CAST(N'2018-04-26' AS Date))
SET IDENTITY_INSERT [dbo].[FormaCompraVehiculo] OFF
SET IDENTITY_INSERT [dbo].[FormaVentaVehiculo] ON 

INSERT [dbo].[FormaVentaVehiculo] ([id], [id_vehiculo], [id_transaccion], [id_tipo_pago], [id_factura], [monto_rd], [monto_usd], [nota], [fecha]) VALUES (1, 1, 1, 1, 1, CAST(560000.00 AS Decimal(18, 2)), CAST(11914.89 AS Decimal(18, 2)), N'', CAST(N'2018-04-25' AS Date))
INSERT [dbo].[FormaVentaVehiculo] ([id], [id_vehiculo], [id_transaccion], [id_tipo_pago], [id_factura], [monto_rd], [monto_usd], [nota], [fecha]) VALUES (2, 1, 3, 3, 1, CAST(5900.00 AS Decimal(18, 2)), CAST(125.53 AS Decimal(18, 2)), N'A CONTRA ENTREGA DE MATRICULA', CAST(N'2018-04-25' AS Date))
INSERT [dbo].[FormaVentaVehiculo] ([id], [id_vehiculo], [id_transaccion], [id_tipo_pago], [id_factura], [monto_rd], [monto_usd], [nota], [fecha]) VALUES (3, 1, 3, 1, 1, CAST(5600.00 AS Decimal(18, 2)), CAST(119.15 AS Decimal(18, 2)), N'', CAST(N'2018-04-25' AS Date))
INSERT [dbo].[FormaVentaVehiculo] ([id], [id_vehiculo], [id_transaccion], [id_tipo_pago], [id_factura], [monto_rd], [monto_usd], [nota], [fecha]) VALUES (4, 1, 4, 1, 1, CAST(3600.00 AS Decimal(18, 2)), CAST(76.60 AS Decimal(18, 2)), N'SEGURO DE LEY (SIN SERVICIOS)', CAST(N'2018-04-25' AS Date))
SET IDENTITY_INSERT [dbo].[FormaVentaVehiculo] OFF
SET IDENTITY_INSERT [dbo].[Gastos] ON 

INSERT [dbo].[Gastos] ([id], [descripcion], [tipo], [estado]) VALUES (1, N'PINTURA', N'OTROS GASTOS', 1)
INSERT [dbo].[Gastos] ([id], [descripcion], [tipo], [estado]) VALUES (2, N'REPARACION 4X4', N'REPARACION', 1)
SET IDENTITY_INSERT [dbo].[Gastos] OFF
SET IDENTITY_INSERT [dbo].[GastoVehiculo] ON 

INSERT [dbo].[GastoVehiculo] ([id], [id_vehiculo], [id_gasto], [id_proveedor], [id_transaccion], [monto_rd], [monto_usd], [fecha]) VALUES (1, 1007, 1, 1, 7, CAST(35000.00 AS Decimal(18, 2)), CAST(7.13 AS Decimal(18, 2)), CAST(N'2018-04-26' AS Date))
INSERT [dbo].[GastoVehiculo] ([id], [id_vehiculo], [id_gasto], [id_proveedor], [id_transaccion], [monto_rd], [monto_usd], [fecha]) VALUES (2, 1007, 2, 3, 6, CAST(15000.00 AS Decimal(18, 2)), CAST(3.06 AS Decimal(18, 2)), CAST(N'2018-04-26' AS Date))
SET IDENTITY_INSERT [dbo].[GastoVehiculo] OFF
SET IDENTITY_INSERT [dbo].[HistorialUbicaciones] ON 

INSERT [dbo].[HistorialUbicaciones] ([id], [id_vehiculo], [id_ubicacion], [fecha]) VALUES (1, 1, 1, CAST(N'2018-04-25' AS Date))
INSERT [dbo].[HistorialUbicaciones] ([id], [id_vehiculo], [id_ubicacion], [fecha]) VALUES (2, 2, 3, CAST(N'2018-04-19' AS Date))
INSERT [dbo].[HistorialUbicaciones] ([id], [id_vehiculo], [id_ubicacion], [fecha]) VALUES (3, 3, 3, CAST(N'2018-03-10' AS Date))
INSERT [dbo].[HistorialUbicaciones] ([id], [id_vehiculo], [id_ubicacion], [fecha]) VALUES (4, 4, 1, CAST(N'2016-09-29' AS Date))
INSERT [dbo].[HistorialUbicaciones] ([id], [id_vehiculo], [id_ubicacion], [fecha]) VALUES (5, 5, 1, CAST(N'2016-12-16' AS Date))
INSERT [dbo].[HistorialUbicaciones] ([id], [id_vehiculo], [id_ubicacion], [fecha]) VALUES (6, 6, 1, CAST(N'2016-12-16' AS Date))
INSERT [dbo].[HistorialUbicaciones] ([id], [id_vehiculo], [id_ubicacion], [fecha]) VALUES (7, 6, 6, CAST(N'2018-04-26' AS Date))
INSERT [dbo].[HistorialUbicaciones] ([id], [id_vehiculo], [id_ubicacion], [fecha]) VALUES (8, 7, 1, CAST(N'2017-09-27' AS Date))
INSERT [dbo].[HistorialUbicaciones] ([id], [id_vehiculo], [id_ubicacion], [fecha]) VALUES (9, 8, 1, CAST(N'2018-01-04' AS Date))
INSERT [dbo].[HistorialUbicaciones] ([id], [id_vehiculo], [id_ubicacion], [fecha]) VALUES (10, 9, 1, CAST(N'2017-05-18' AS Date))
INSERT [dbo].[HistorialUbicaciones] ([id], [id_vehiculo], [id_ubicacion], [fecha]) VALUES (11, 10, 1, CAST(N'2018-02-08' AS Date))
INSERT [dbo].[HistorialUbicaciones] ([id], [id_vehiculo], [id_ubicacion], [fecha]) VALUES (12, 11, 3, CAST(N'2018-04-20' AS Date))
INSERT [dbo].[HistorialUbicaciones] ([id], [id_vehiculo], [id_ubicacion], [fecha]) VALUES (13, 12, 3, CAST(N'2017-07-18' AS Date))
INSERT [dbo].[HistorialUbicaciones] ([id], [id_vehiculo], [id_ubicacion], [fecha]) VALUES (1002, 1002, 1, CAST(N'2017-04-26' AS Date))
INSERT [dbo].[HistorialUbicaciones] ([id], [id_vehiculo], [id_ubicacion], [fecha]) VALUES (1003, 1002, 1006, CAST(N'2018-04-26' AS Date))
INSERT [dbo].[HistorialUbicaciones] ([id], [id_vehiculo], [id_ubicacion], [fecha]) VALUES (1004, 1003, 3, CAST(N'2017-06-28' AS Date))
INSERT [dbo].[HistorialUbicaciones] ([id], [id_vehiculo], [id_ubicacion], [fecha]) VALUES (1005, 1004, 1, CAST(N'2017-03-26' AS Date))
INSERT [dbo].[HistorialUbicaciones] ([id], [id_vehiculo], [id_ubicacion], [fecha]) VALUES (1006, 1005, 1, CAST(N'2017-03-26' AS Date))
INSERT [dbo].[HistorialUbicaciones] ([id], [id_vehiculo], [id_ubicacion], [fecha]) VALUES (1007, 1006, 3, CAST(N'2018-04-02' AS Date))
INSERT [dbo].[HistorialUbicaciones] ([id], [id_vehiculo], [id_ubicacion], [fecha]) VALUES (1008, 1007, 1, CAST(N'2017-07-04' AS Date))
SET IDENTITY_INSERT [dbo].[HistorialUbicaciones] OFF
SET IDENTITY_INSERT [dbo].[Modelos] ON 

INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1, 1, 1, N'CL_MODELS', N'CL Models (4)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (2, 2, 1, N'2.2CL', N' - 2.2CL', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (3, 3, 1, N'2.3CL', N' - 2.3CL', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (4, 4, 1, N'3.0CL', N' - 3.0CL', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (5, 5, 1, N'3.2CL', N' - 3.2CL', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (6, 6, 1, N'ILX', N'ILX', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (7, 7, 1, N'INTEG', N'Integra', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (8, 8, 1, N'LEGEND', N'Legend', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (9, 9, 1, N'MDX', N'MDX', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (10, 10, 1, N'NSX', N'NSX', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (11, 11, 1, N'RDX', N'RDX', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (12, 12, 1, N'RL_MODELS', N'RL Models (2)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (13, 13, 1, N'3.5RL', N' - 3.5 RL', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (14, 14, 1, N'RL', N' - RL', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (15, 15, 1, N'RSX', N'RSX', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (16, 16, 1, N'SLX', N'SLX', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (17, 17, 1, N'TL_MODELS', N'TL Models (3)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (18, 18, 1, N'2.5TL', N' - 2.5TL', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (19, 19, 1, N'3.2TL', N' - 3.2TL', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (20, 20, 1, N'TL', N' - TL', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (21, 21, 1, N'TSX', N'TSX', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (22, 22, 1, N'VIGOR', N'Vigor', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (23, 23, 1, N'ZDX', N'ZDX', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (24, 24, 1, N'ACUOTH', N'Other Acura Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (25, 25, 2, N'ALFA164', N'164', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (26, 26, 2, N'ALFA8C', N'8C Competizione', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (27, 27, 2, N'ALFAGT', N'GTV-6', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (28, 28, 2, N'MIL', N'Milano', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (29, 29, 2, N'SPID', N'Spider', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (30, 30, 2, N'ALFAOTH', N'Other Alfa Romeo Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (31, 31, 3, N'AMCALLIAN', N'Alliance', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (32, 32, 3, N'CON', N'Concord', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (33, 33, 3, N'EAGLE', N'Eagle', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (34, 34, 3, N'AMCENC', N'Encore', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (35, 35, 3, N'AMCSPIRIT', N'Spirit', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (36, 36, 3, N'AMCOTH', N'Other AMC Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (37, 37, 4, N'DB7', N'DB7', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (38, 38, 4, N'DB9', N'DB9', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (39, 39, 4, N'DBS', N'DBS', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (40, 40, 4, N'LAGONDA', N'Lagonda', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (41, 41, 4, N'RAPIDE', N'Rapide', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (42, 42, 4, N'V12VANT', N'V12 Vantage', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (43, 43, 4, N'VANTAGE', N'V8 Vantage', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (44, 44, 4, N'VANQUISH', N'Vanquish', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (45, 45, 4, N'VIRAGE', N'Virage', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (46, 46, 4, N'UNAVAILAST', N'Other Aston Martin Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (47, 47, 5, N'AUDI100', N'100', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (48, 48, 5, N'AUDI200', N'200', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (49, 49, 5, N'4000', N'4000', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (50, 50, 5, N'5000', N'5000', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (51, 51, 5, N'80', N'80', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (52, 52, 5, N'90', N'90', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (53, 53, 5, N'A3', N'A3', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (54, 54, 5, N'A4', N'A4', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (55, 55, 5, N'A5', N'A5', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (56, 56, 5, N'A6', N'A6', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (57, 57, 5, N'A7', N'A7', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (58, 58, 5, N'A8', N'A8', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (59, 59, 5, N'ALLRDQUA', N'allroad', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (60, 60, 5, N'AUDICABRI', N'Cabriolet', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (61, 61, 5, N'AUDICOUPE', N'Coupe', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (62, 62, 5, N'Q3', N'Q3', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (63, 63, 5, N'Q5', N'Q5', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (64, 64, 5, N'Q7', N'Q7', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (65, 65, 5, N'QUATTR', N'Quattro', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (66, 66, 5, N'R8', N'R8', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (67, 67, 5, N'RS4', N'RS 4', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (68, 68, 5, N'RS5', N'RS 5', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (69, 69, 5, N'RS6', N'RS 6', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (70, 70, 5, N'S4', N'S4', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (71, 71, 5, N'S5', N'S5', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (72, 72, 5, N'S6', N'S6', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (73, 73, 5, N'S7', N'S7', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (74, 74, 5, N'S8', N'S8', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (75, 75, 5, N'TT', N'TT', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (76, 76, 5, N'TTRS', N'TT RS', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (77, 77, 5, N'TTS', N'TTS', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (78, 78, 5, N'V8', N'V8 Quattro', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (79, 79, 5, N'AUDOTH', N'Other Audi Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (80, 80, 6, N'CONVERT', N'Convertible', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (81, 81, 6, N'COUPEAVANT', N'Coupe', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (82, 82, 6, N'SEDAN', N'Sedan', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (83, 83, 6, N'UNAVAILAVA', N'Other Avanti Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (84, 84, 7, N'ARNAGE', N'Arnage', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (85, 85, 7, N'AZURE', N'Azure', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (86, 86, 7, N'BROOKLANDS', N'Brooklands', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (87, 87, 7, N'BENCONT', N'Continental', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (88, 88, 7, N'CORNICHE', N'Corniche', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (89, 89, 7, N'BENEIGHT', N'Eight', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (90, 90, 7, N'BENMUL', N'Mulsanne', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (91, 91, 7, N'BENTURBO', N'Turbo R', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (92, 92, 7, N'UNAVAILBEN', N'Other Bentley Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (93, 93, 8, N'1_SERIES', N'1 Series (3)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (94, 94, 8, N'128I', N' - 128i', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (95, 95, 8, N'135I', N' - 135i', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (96, 96, 8, N'135IS', N' - 135is', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (97, 97, 8, N'3_SERIES', N'3 Series (29)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (98, 98, 8, N'318I', N' - 318i', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (99, 99, 8, N'318IC', N' - 318iC', 1)
GO
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (100, 100, 8, N'318IS', N' - 318iS', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (101, 101, 8, N'318TI', N' - 318ti', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (102, 102, 8, N'320I', N' - 320i', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (103, 103, 8, N'323CI', N' - 323ci', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (104, 104, 8, N'323I', N' - 323i', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (105, 105, 8, N'323IS', N' - 323is', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (106, 106, 8, N'323IT', N' - 323iT', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (107, 107, 8, N'325CI', N' - 325Ci', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (108, 108, 8, N'325E', N' - 325e', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (109, 109, 8, N'325ES', N' - 325es', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (110, 110, 8, N'325I', N' - 325i', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (111, 111, 8, N'325IS', N' - 325is', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (112, 112, 8, N'325IX', N' - 325iX', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (113, 113, 8, N'325XI', N' - 325xi', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (114, 114, 8, N'328CI', N' - 328Ci', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (115, 115, 8, N'328I', N' - 328i', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (116, 116, 8, N'328IS', N' - 328iS', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (117, 117, 8, N'328XI', N' - 328xi', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (118, 118, 8, N'330CI', N' - 330Ci', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (119, 119, 8, N'330I', N' - 330i', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (120, 120, 8, N'330XI', N' - 330xi', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (121, 121, 8, N'335D', N' - 335d', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (122, 122, 8, N'335I', N' - 335i', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (123, 123, 8, N'335IS', N' - 335is', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (124, 124, 8, N'335XI', N' - 335xi', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (125, 125, 8, N'ACTIVE3', N' - ActiveHybrid 3', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (126, 126, 8, N'BMW325', N' - 325', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (127, 127, 8, N'5_SERIES', N'5 Series (19)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (128, 128, 8, N'524TD', N' - 524td', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (129, 129, 8, N'525I', N' - 525i', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (130, 130, 8, N'525XI', N' - 525xi', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (131, 131, 8, N'528E', N' - 528e', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (132, 132, 8, N'528I', N' - 528i', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (133, 133, 8, N'528IT', N' - 528iT', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (134, 134, 8, N'528XI', N' - 528xi', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (135, 135, 8, N'530I', N' - 530i', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (136, 136, 8, N'530IT', N' - 530iT', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (137, 137, 8, N'530XI', N' - 530xi', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (138, 138, 8, N'533I', N' - 533i', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (139, 139, 8, N'535I', N' - 535i', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (140, 140, 8, N'535IGT', N' - 535i Gran Turismo', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (141, 141, 8, N'535XI', N' - 535xi', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (142, 142, 8, N'540I', N' - 540i', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (143, 143, 8, N'545I', N' - 545i', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (144, 144, 8, N'550I', N' - 550i', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (145, 145, 8, N'550IGT', N' - 550i Gran Turismo', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (146, 146, 8, N'ACTIVE5', N' - ActiveHybrid 5', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (147, 147, 8, N'6_SERIES', N'6 Series (8)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (148, 148, 8, N'633CSI', N' - 633CSi', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (149, 149, 8, N'635CSI', N' - 635CSi', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (150, 150, 8, N'640I', N' - 640i', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (151, 151, 8, N'640IGC', N' - 640i Gran Coupe', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (152, 152, 8, N'645CI', N' - 645Ci', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (153, 153, 8, N'650I', N' - 650i', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (154, 154, 8, N'650IGC', N' - 650i Gran Coupe', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (155, 155, 8, N'L6', N' - L6', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (156, 156, 8, N'7_SERIES', N'7 Series (15)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (157, 157, 8, N'733I', N' - 733i', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (158, 158, 8, N'735I', N' - 735i', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (159, 159, 8, N'735IL', N' - 735iL', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (160, 160, 8, N'740I', N' - 740i', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (161, 161, 8, N'740IL', N' - 740iL', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (162, 162, 8, N'740LI', N' - 740Li', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (163, 163, 8, N'745I', N' - 745i', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (164, 164, 8, N'745LI', N' - 745Li', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (165, 165, 8, N'750I', N' - 750i', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (166, 166, 8, N'750IL', N' - 750iL', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (167, 167, 8, N'750LI', N' - 750Li', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (168, 168, 8, N'760I', N' - 760i', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (169, 169, 8, N'760LI', N' - 760Li', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (170, 170, 8, N'ACTIVE7', N' - ActiveHybrid 7', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (171, 171, 8, N'ALPINAB7', N' - Alpina B7', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (172, 172, 8, N'8_SERIES', N'8 Series (4)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (173, 173, 8, N'840CI', N' - 840Ci', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (174, 174, 8, N'850CI', N' - 850Ci', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (175, 175, 8, N'850CSI', N' - 850CSi', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (176, 176, 8, N'850I', N' - 850i', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (177, 177, 8, N'L_SERIES', N'L Series (1)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (178, 178, 8, N'L7', N' - L7', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (179, 179, 8, N'M_SERIES', N'M Series (8)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (180, 180, 8, N'1SERIESM', N' - 1 Series M', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (181, 181, 8, N'BMWMCOUPE', N' - M Coupe', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (182, 182, 8, N'BMWROAD', N' - M Roadster', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (183, 183, 8, N'M3', N' - M3', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (184, 184, 8, N'M5', N' - M5', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (185, 185, 8, N'M6', N' - M6', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (186, 186, 8, N'X5M', N' - X5 M', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (187, 187, 8, N'X6M', N' - X6 M', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (188, 188, 8, N'X_SERIES', N'X Series (5)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (189, 189, 8, N'ACTIVEX6', N' - ActiveHybrid X6', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (190, 190, 8, N'X1', N' - X1', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (191, 191, 8, N'X3', N' - X3', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (192, 192, 8, N'X5', N' - X5', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (193, 193, 8, N'X6', N' - X6', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (194, 194, 8, N'Z_SERIES', N'Z Series (3)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (195, 195, 8, N'Z3', N' - Z3', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (196, 196, 8, N'Z4', N' - Z4', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (197, 197, 8, N'Z8', N' - Z8', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (198, 198, 8, N'BMWOTH', N'Other BMW Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (199, 199, 9, N'CENT', N'Century', 1)
GO
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (200, 200, 9, N'ELEC', N'Electra', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (201, 201, 9, N'ENCLAVE', N'Enclave', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (202, 202, 9, N'BUIENC', N'Encore', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (203, 203, 9, N'LACROSSE', N'LaCrosse', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (204, 204, 9, N'LESA', N'Le Sabre', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (205, 205, 9, N'LUCERNE', N'Lucerne', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (206, 206, 9, N'PARK', N'Park Avenue', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (207, 207, 9, N'RAINIER', N'Rainier', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (208, 208, 9, N'REATTA', N'Reatta', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (209, 209, 9, N'REG', N'Regal', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (210, 210, 9, N'RENDEZVOUS', N'Rendezvous', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (211, 211, 9, N'RIV', N'Riviera', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (212, 212, 9, N'BUICKROAD', N'Roadmaster', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (213, 213, 9, N'SKYH', N'Skyhawk', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (214, 214, 9, N'SKYL', N'Skylark', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (215, 215, 9, N'SOMER', N'Somerset', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (216, 216, 9, N'TERRAZA', N'Terraza', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (217, 217, 9, N'BUVERANO', N'Verano', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (218, 218, 9, N'BUOTH', N'Other Buick Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (219, 219, 10, N'ALLANT', N'Allante', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (220, 220, 10, N'ATS', N'ATS', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (221, 221, 10, N'BROUGH', N'Brougham', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (222, 222, 10, N'CATERA', N'Catera', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (223, 223, 10, N'CIMA', N'Cimarron', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (224, 224, 10, N'CTS', N'CTS', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (225, 225, 10, N'DEV', N'De Ville', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (226, 226, 10, N'DTS', N'DTS', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (227, 227, 10, N'ELDO', N'Eldorado', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (228, 228, 10, N'ESCALA', N'Escalade', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (229, 229, 10, N'ESCALAESV', N'Escalade ESV', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (230, 230, 10, N'EXT', N'Escalade EXT', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (231, 231, 10, N'FLEE', N'Fleetwood', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (232, 232, 10, N'SEV', N'Seville', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (233, 233, 10, N'SRX', N'SRX', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (234, 234, 10, N'STS', N'STS', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (235, 235, 10, N'XLR', N'XLR', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (236, 236, 10, N'XTS', N'XTS', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (237, 237, 10, N'CADOTH', N'Other Cadillac Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (238, 238, 11, N'ASTRO', N'Astro', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (239, 239, 11, N'AVALNCH', N'Avalanche', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (240, 240, 11, N'AVEO', N'Aveo', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (241, 241, 11, N'AVEO5', N'Aveo5', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (242, 242, 11, N'BERETT', N'Beretta', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (243, 243, 11, N'BLAZER', N'Blazer', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (244, 244, 11, N'CAM', N'Camaro', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (245, 245, 11, N'CAP', N'Caprice', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (246, 246, 11, N'CHECAPS', N'Captiva Sport', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (247, 247, 11, N'CAV', N'Cavalier', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (248, 248, 11, N'CELE', N'Celebrity', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (249, 249, 11, N'CHEVETTE', N'Chevette', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (250, 250, 11, N'CITATION', N'Citation', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (251, 251, 11, N'COBALT', N'Cobalt', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (252, 252, 11, N'COLORADO', N'Colorado', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (253, 253, 11, N'CORSI', N'Corsica', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (254, 254, 11, N'CORV', N'Corvette', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (255, 255, 11, N'CRUZE', N'Cruze', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (256, 256, 11, N'ELCAM', N'El Camino', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (257, 257, 11, N'EQUINOX', N'Equinox', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (258, 258, 11, N'G15EXP', N'Express Van', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (259, 259, 11, N'G10', N'G Van', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (260, 260, 11, N'HHR', N'HHR', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (261, 261, 11, N'CHEVIMP', N'Impala', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (262, 262, 11, N'KODC4500', N'Kodiak C4500', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (263, 263, 11, N'LUMINA', N'Lumina', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (264, 264, 11, N'LAPV', N'Lumina APV', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (265, 265, 11, N'LUV', N'LUV', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (266, 266, 11, N'MALI', N'Malibu', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (267, 267, 11, N'CHVMETR', N'Metro', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (268, 268, 11, N'CHEVMONT', N'Monte Carlo', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (269, 269, 11, N'NOVA', N'Nova', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (270, 270, 11, N'CHEVPRIZM', N'Prizm', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (271, 271, 11, N'CHVST', N'S10 Blazer', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (272, 272, 11, N'S10PICKUP', N'S10 Pickup', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (273, 273, 11, N'CHEV150', N'Silverado and other C/K1500', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (274, 274, 11, N'CHEVC25', N'Silverado and other C/K2500', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (275, 275, 11, N'CH3500PU', N'Silverado and other C/K3500', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (276, 276, 11, N'SONIC', N'Sonic', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (277, 277, 11, N'SPARK', N'Spark', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (278, 278, 11, N'CHEVSPEC', N'Spectrum', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (279, 279, 11, N'CHSPRINT', N'Sprint', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (280, 280, 11, N'SSR', N'SSR', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (281, 281, 11, N'CHEVSUB', N'Suburban', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (282, 282, 11, N'TAHOE', N'Tahoe', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (283, 283, 11, N'TRACKE', N'Tracker', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (284, 284, 11, N'TRAILBLZ', N'TrailBlazer', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (285, 285, 11, N'TRAILBZEXT', N'TrailBlazer EXT', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (286, 286, 11, N'TRAVERSE', N'Traverse', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (287, 287, 11, N'UPLANDER', N'Uplander', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (288, 288, 11, N'VENTUR', N'Venture', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (289, 289, 11, N'VOLT', N'Volt', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (290, 290, 11, N'CHEOTH', N'Other Chevrolet Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (291, 291, 12, N'CHRYS200', N'200', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (292, 292, 12, N'300', N'300', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (293, 293, 12, N'CHRY300', N'300M', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (294, 294, 12, N'ASPEN', N'Aspen', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (295, 295, 12, N'CARAVAN', N'Caravan', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (296, 296, 12, N'CIRRUS', N'Cirrus', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (297, 297, 12, N'CONC', N'Concorde', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (298, 298, 12, N'CHRYCONQ', N'Conquest', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (299, 299, 12, N'CORDOBA', N'Cordoba', 1)
GO
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (300, 300, 12, N'CROSSFIRE', N'Crossfire', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (301, 301, 12, N'ECLASS', N'E Class', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (302, 302, 12, N'FIFTH', N'Fifth Avenue', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (303, 303, 12, N'CHRYGRANDV', N'Grand Voyager', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (304, 304, 12, N'IMPE', N'Imperial', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (305, 305, 12, N'INTREPID', N'Intrepid', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (306, 306, 12, N'CHRYLAS', N'Laser', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (307, 307, 12, N'LEBA', N'LeBaron', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (308, 308, 12, N'LHS', N'LHS', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (309, 309, 12, N'CHRYNEON', N'Neon', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (310, 310, 12, N'NY', N'New Yorker', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (311, 311, 12, N'NEWPORT', N'Newport', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (312, 312, 12, N'PACIFICA', N'Pacifica', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (313, 313, 12, N'CHPROWLE', N'Prowler', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (314, 314, 12, N'PTCRUIS', N'PT Cruiser', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (315, 315, 12, N'CHRYSEB', N'Sebring', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (316, 316, 12, N'CHRYTC', N'TC by Maserati', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (317, 317, 12, N'TANDC', N'Town & Country', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (318, 318, 12, N'VOYAGER', N'Voyager', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (319, 319, 12, N'CHOTH', N'Other Chrysler Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (320, 320, 13, N'LANOS', N'Lanos', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (321, 321, 13, N'LEGANZA', N'Leganza', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (322, 322, 13, N'NUBIRA', N'Nubira', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (323, 323, 13, N'DAEOTH', N'Other Daewoo Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (324, 324, 14, N'CHAR', N'Charade', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (325, 325, 14, N'ROCKY', N'Rocky', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (326, 326, 14, N'DAIHOTH', N'Other Daihatsu Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (327, 327, 15, N'DAT200SX', N'200SX', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (328, 328, 15, N'DAT210', N'210', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (329, 329, 15, N'280Z', N'280ZX', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (330, 330, 15, N'300ZX', N'300ZX', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (331, 331, 15, N'310', N'310', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (332, 332, 15, N'510', N'510', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (333, 333, 15, N'720', N'720', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (334, 334, 15, N'810', N'810', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (335, 335, 15, N'DATMAX', N'Maxima', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (336, 336, 15, N'DATPU', N'Pickup', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (337, 337, 15, N'PUL', N'Pulsar', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (338, 338, 15, N'DATSENT', N'Sentra', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (339, 339, 15, N'STAN', N'Stanza', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (340, 340, 15, N'DATOTH', N'Other Datsun Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (341, 341, 16, N'DMC12', N'DMC-12', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (342, 342, 17, N'400', N'400', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (343, 343, 17, N'DOD600', N'600', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (344, 344, 17, N'ARI', N'Aries', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (345, 345, 17, N'AVENGR', N'Avenger', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (346, 346, 17, N'CALIBER', N'Caliber', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (347, 347, 17, N'DODCARA', N'Caravan', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (348, 348, 17, N'CHALLENGER', N'Challenger', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (349, 349, 17, N'DODCHAR', N'Charger', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (350, 350, 17, N'DODCOLT', N'Colt', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (351, 351, 17, N'DODCONQ', N'Conquest', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (352, 352, 17, N'DODDW', N'D/W Truck', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (353, 353, 17, N'DAKOTA', N'Dakota', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (354, 354, 17, N'DODDART', N'Dart', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (355, 355, 17, N'DAY', N'Daytona', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (356, 356, 17, N'DIPLOMA', N'Diplomat', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (357, 357, 17, N'DURANG', N'Durango', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (358, 358, 17, N'DODDYNA', N'Dynasty', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (359, 359, 17, N'GRANDCARAV', N'Grand Caravan', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (360, 360, 17, N'INTRE', N'Intrepid', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (361, 361, 17, N'JOURNEY', N'Journey', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (362, 362, 17, N'LANCERDODG', N'Lancer', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (363, 363, 17, N'MAGNUM', N'Magnum', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (364, 364, 17, N'MIRADA', N'Mirada', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (365, 365, 17, N'MONACO', N'Monaco', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (366, 366, 17, N'DODNEON', N'Neon', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (367, 367, 17, N'NITRO', N'Nitro', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (368, 368, 17, N'OMNI', N'Omni', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (369, 369, 17, N'RAIDER', N'Raider', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (370, 370, 17, N'RAM1504WD', N'Ram 1500 Truck', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (371, 371, 17, N'RAM25002WD', N'Ram 2500 Truck', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (372, 372, 17, N'RAM3502WD', N'Ram 3500 Truck', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (373, 373, 17, N'RAM4500', N'Ram 4500 Truck', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (374, 374, 17, N'DODD50', N'Ram 50 Truck', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (375, 375, 17, N'CV', N'RAM C/V', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (376, 376, 17, N'RAMSRT10', N'Ram SRT-10', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (377, 377, 17, N'RAMVANV8', N'Ram Van', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (378, 378, 17, N'RAMWAGON', N'Ram Wagon', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (379, 379, 17, N'RAMCGR', N'Ramcharger', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (380, 380, 17, N'RAMPAGE', N'Rampage', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (381, 381, 17, N'DODSHAD', N'Shadow', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (382, 382, 17, N'DODSPIR', N'Spirit', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (383, 383, 17, N'SPRINTER', N'Sprinter', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (384, 384, 17, N'SRT4', N'SRT-4', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (385, 385, 17, N'STREGIS', N'St. Regis', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (386, 386, 17, N'STEAL', N'Stealth', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (387, 387, 17, N'STRATU', N'Stratus', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (388, 388, 17, N'VIPER', N'Viper', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (389, 389, 17, N'DOOTH', N'Other Dodge Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (390, 390, 18, N'EAGLEMED', N'Medallion', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (391, 391, 18, N'EAGLEPREM', N'Premier', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (392, 392, 18, N'SUMMIT', N'Summit', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (393, 393, 18, N'TALON', N'Talon', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (394, 394, 18, N'VISION', N'Vision', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (395, 395, 18, N'EAGOTH', N'Other Eagle Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (396, 396, 19, N'308GTB', N'308 GTB Quattrovalvole', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (397, 397, 19, N'308TBI', N'308 GTBI', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (398, 398, 19, N'308GTS', N'308 GTS Quattrovalvole', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (399, 399, 19, N'308TSI', N'308 GTSI', 1)
GO
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (400, 400, 19, N'328GTB', N'328 GTB', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (401, 401, 19, N'328GTS', N'328 GTS', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (402, 402, 19, N'348GTB', N'348 GTB', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (403, 403, 19, N'348GTS', N'348 GTS', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (404, 404, 19, N'348SPI', N'348 Spider', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (405, 405, 19, N'348TB', N'348 TB', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (406, 406, 19, N'348TS', N'348 TS', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (407, 407, 19, N'360', N'360', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (408, 408, 19, N'456GT', N'456 GT', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (409, 409, 19, N'456MGT', N'456M GT', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (410, 410, 19, N'458ITALIA', N'458 Italia', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (411, 411, 19, N'512BBI', N'512 BBi', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (412, 412, 19, N'512M', N'512M', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (413, 413, 19, N'512TR', N'512TR', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (414, 414, 19, N'550M', N'550 Maranello', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (415, 415, 19, N'575M', N'575M Maranello', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (416, 416, 19, N'599GTB', N'599 GTB Fiorano', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (417, 417, 19, N'599GTO', N'599 GTO', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (418, 418, 19, N'612SCAGLIE', N'612 Scaglietti', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (419, 419, 19, N'FERCALIF', N'California', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (420, 420, 19, N'ENZO', N'Enzo', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (421, 421, 19, N'F355', N'F355', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (422, 422, 19, N'F40', N'F40', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (423, 423, 19, N'F430', N'F430', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (424, 424, 19, N'F50', N'F50', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (425, 425, 19, N'FERFF', N'FF', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (426, 426, 19, N'MOND', N'Mondial', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (427, 427, 19, N'TEST', N'Testarossa', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (428, 428, 19, N'UNAVAILFER', N'Other Ferrari Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (429, 429, 20, N'2000', N'2000 Spider', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (430, 430, 20, N'FIAT500', N'500', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (431, 431, 20, N'BERTON', N'Bertone X1/9', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (432, 432, 20, N'BRAVA', N'Brava', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (433, 433, 20, N'PININ', N'Pininfarina Spider', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (434, 434, 20, N'STRADA', N'Strada', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (435, 435, 20, N'FIATX19', N'X1/9', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (436, 436, 20, N'UNAVAILFIA', N'Other Fiat Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (437, 437, 21, N'KARMA', N'Karma', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (438, 438, 22, N'AERO', N'Aerostar', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (439, 439, 22, N'ASPIRE', N'Aspire', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (440, 440, 22, N'BRON', N'Bronco', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (441, 441, 22, N'B2', N'Bronco II', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (442, 442, 22, N'FOCMAX', N'C-MAX', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (443, 443, 22, N'FORDCLUB', N'Club Wagon', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (444, 444, 22, N'CONTOUR', N'Contour', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (445, 445, 22, N'COURIER', N'Courier', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (446, 446, 22, N'CROWNVIC', N'Crown Victoria', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (447, 447, 22, N'E150ECON', N'E-150 and Econoline 150', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (448, 448, 22, N'E250ECON', N'E-250 and Econoline 250', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (449, 449, 22, N'E350ECON', N'E-350 and Econoline 350', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (450, 450, 22, N'EDGE', N'Edge', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (451, 451, 22, N'ESCAPE', N'Escape', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (452, 452, 22, N'ESCO', N'Escort', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (453, 453, 22, N'EXCURSION', N'Excursion', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (454, 454, 22, N'EXP', N'EXP', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (455, 455, 22, N'EXPEDI', N'Expedition', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (456, 456, 22, N'EXPEDIEL', N'Expedition EL', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (457, 457, 22, N'EXPLOR', N'Explorer', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (458, 458, 22, N'SPORTTRAC', N'Explorer Sport Trac', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (459, 459, 22, N'F100', N'F100', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (460, 460, 22, N'F150PICKUP', N'F150', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (461, 461, 22, N'F250', N'F250', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (462, 462, 22, N'F350', N'F350', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (463, 463, 22, N'F450', N'F450', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (464, 464, 22, N'FAIRM', N'Fairmont', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (465, 465, 22, N'FESTIV', N'Festiva', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (466, 466, 22, N'FIESTA', N'Fiesta', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (467, 467, 22, N'FIVEHUNDRE', N'Five Hundred', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (468, 468, 22, N'FLEX', N'Flex', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (469, 469, 22, N'FOCUS', N'Focus', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (470, 470, 22, N'FREESTAR', N'Freestar', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (471, 471, 22, N'FREESTYLE', N'Freestyle', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (472, 472, 22, N'FUSION', N'Fusion', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (473, 473, 22, N'GRANADA', N'Granada', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (474, 474, 22, N'GT', N'GT', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (475, 475, 22, N'LTD', N'LTD', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (476, 476, 22, N'MUST', N'Mustang', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (477, 477, 22, N'PROBE', N'Probe', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (478, 478, 22, N'RANGER', N'Ranger', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (479, 479, 22, N'TAURUS', N'Taurus', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (480, 480, 22, N'TAURUSX', N'Taurus X', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (481, 481, 22, N'TEMPO', N'Tempo', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (482, 482, 22, N'TBIRD', N'Thunderbird', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (483, 483, 22, N'TRANSCONN', N'Transit Connect', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (484, 484, 22, N'WINDST', N'Windstar', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (485, 485, 22, N'FORDZX2', N'ZX2 Escort', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (486, 486, 22, N'FOOTH', N'Other Ford Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (487, 487, 23, N'FRESPRINT', N'Sprinter', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (488, 488, 24, N'GEOMETRO', N'Metro', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (489, 489, 24, N'GEOPRIZM', N'Prizm', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (490, 490, 24, N'SPECT', N'Spectrum', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (491, 491, 24, N'STORM', N'Storm', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (492, 492, 24, N'GEOTRACK', N'Tracker', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (493, 493, 24, N'GEOOTH', N'Other Geo Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (494, 494, 25, N'ACADIA', N'Acadia', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (495, 495, 25, N'CABALLERO', N'Caballero', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (496, 496, 25, N'CANYON', N'Canyon', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (497, 497, 25, N'ENVOY', N'Envoy', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (498, 498, 25, N'ENVOYXL', N'Envoy XL', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (499, 499, 25, N'ENVOYXUV', N'Envoy XUV', 1)
GO
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (500, 500, 25, N'JIM', N'Jimmy', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (501, 501, 25, N'RALLYWAG', N'Rally Wagon', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (502, 502, 25, N'GMCS15', N'S15 Jimmy', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (503, 503, 25, N'S15', N'S15 Pickup', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (504, 504, 25, N'SAFARIGMC', N'Safari', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (505, 505, 25, N'GMCSAVANA', N'Savana', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (506, 506, 25, N'15SIPU4WD', N'Sierra C/K1500', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (507, 507, 25, N'GMCC25PU', N'Sierra C/K2500', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (508, 508, 25, N'GMC3500PU', N'Sierra C/K3500', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (509, 509, 25, N'SONOMA', N'Sonoma', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (510, 510, 25, N'SUB', N'Suburban', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (511, 511, 25, N'GMCSYCLON', N'Syclone', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (512, 512, 25, N'TERRAIN', N'Terrain', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (513, 513, 25, N'TOPC4500', N'TopKick C4500', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (514, 514, 25, N'TYPH', N'Typhoon', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (515, 515, 25, N'GMCVANDUR', N'Vandura', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (516, 516, 25, N'YUKON', N'Yukon', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (517, 517, 25, N'YUKONXL', N'Yukon XL', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (518, 518, 25, N'GMCOTH', N'Other GMC Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (519, 519, 26, N'ACCORD', N'Accord', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (520, 520, 26, N'CIVIC', N'Civic', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (521, 521, 26, N'CRV', N'CR-V', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (522, 522, 26, N'CRZ', N'CR-Z', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (523, 523, 26, N'CRX', N'CRX', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (524, 524, 26, N'CROSSTOUR_MODELS', N'Crosstour and Accord Crosstour Models (2)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (525, 525, 26, N'CROSSTOUR', N' - Accord Crosstour', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (526, 526, 26, N'HONCROSS', N' - Crosstour', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (527, 527, 26, N'HONDELSOL', N'Del Sol', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (528, 528, 26, N'ELEMENT', N'Element', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (529, 529, 26, N'FIT', N'Fit', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (530, 530, 26, N'INSIGHT', N'Insight', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (531, 531, 26, N'ODYSSEY', N'Odyssey', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (532, 532, 26, N'PASSPO', N'Passport', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (533, 533, 26, N'PILOT', N'Pilot', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (534, 534, 26, N'PRE', N'Prelude', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (535, 535, 26, N'RIDGELINE', N'Ridgeline', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (536, 536, 26, N'S2000', N'S2000', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (537, 537, 26, N'HONOTH', N'Other Honda Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (538, 538, 27, N'HUMMER', N'H1', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (539, 539, 27, N'H2', N'H2', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (540, 540, 27, N'H3', N'H3', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (541, 541, 27, N'H3T', N'H3T', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (542, 542, 27, N'AMGOTH', N'Other Hummer Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (543, 543, 28, N'ACCENT', N'Accent', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (544, 544, 28, N'AZERA', N'Azera', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (545, 545, 28, N'ELANTR', N'Elantra', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (546, 546, 28, N'HYUELANCPE', N'Elantra Coupe', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (547, 547, 28, N'ELANTOUR', N'Elantra Touring', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (548, 548, 28, N'ENTOURAGE', N'Entourage', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (549, 549, 28, N'EQUUS', N'Equus', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (550, 550, 28, N'HYUEXCEL', N'Excel', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (551, 551, 28, N'GENESIS', N'Genesis', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (552, 552, 28, N'GENESISCPE', N'Genesis Coupe', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (553, 553, 28, N'SANTAFE', N'Santa Fe', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (554, 554, 28, N'SCOUPE', N'Scoupe', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (555, 555, 28, N'SONATAN20', N'SONATA N20', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (556, 556, 28, N'TIBURO', N'Tiburon', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (557, 557, 28, N'TUCSON', N'Tucson', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (558, 558, 28, N'VELOSTER', N'Veloster', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (559, 559, 28, N'VERACRUZ', N'Veracruz', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (560, 560, 28, N'XG300', N'XG300', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (561, 561, 28, N'XG350', N'XG350', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (562, 562, 28, N'HYUOTH', N'Other Hyundai Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (563, 563, 29, N'EX_MODELS', N'EX Models (2)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (564, 564, 29, N'EX35', N' - EX35', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (565, 565, 29, N'EX37', N' - EX37', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (566, 566, 29, N'FX_MODELS', N'FX Models (4)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (567, 567, 29, N'FX35', N' - FX35', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (568, 568, 29, N'FX37', N' - FX37', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (569, 569, 29, N'FX45', N' - FX45', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (570, 570, 29, N'FX50', N' - FX50', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (571, 571, 29, N'G_MODELS', N'G Models (4)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (572, 572, 29, N'G20', N' - G20', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (573, 573, 29, N'G25', N' - G25', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (574, 574, 29, N'G35', N' - G35', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (575, 575, 29, N'G37', N' - G37', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (576, 576, 29, N'I_MODELS', N'I Models (2)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (577, 577, 29, N'I30', N' - I30', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (578, 578, 29, N'I35', N' - I35', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (579, 579, 29, N'J_MODELS', N'J Models (1)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (580, 580, 29, N'J30', N' - J30', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (581, 581, 29, N'JX_MODELS', N'JX Models (1)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (582, 582, 29, N'JX35', N' - JX35', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (583, 583, 29, N'M_MODELS', N'M Models (6)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (584, 584, 29, N'M30', N' - M30', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (585, 585, 29, N'M35', N' - M35', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (586, 586, 29, N'M35HYBRID', N' - M35h', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (587, 587, 29, N'M37', N' - M37', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (588, 588, 29, N'M45', N' - M45', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (589, 589, 29, N'M56', N' - M56', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (590, 590, 29, N'Q_MODELS', N'Q Models (1)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (591, 591, 29, N'Q45', N' - Q45', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (592, 592, 29, N'QX_MODELS', N'QX Models (2)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (593, 593, 29, N'QX4', N' - QX4', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (594, 594, 29, N'QX56', N' - QX56', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (595, 595, 29, N'INFOTH', N'Other Infiniti Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (596, 596, 30, N'AMIGO', N'Amigo', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (597, 597, 30, N'ASCENDER', N'Ascender', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (598, 598, 30, N'AXIOM', N'Axiom', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (599, 599, 30, N'HOMBRE', N'Hombre', 1)
GO
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (600, 600, 30, N'I280', N'i-280', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (601, 601, 30, N'I290', N'i-290', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (602, 602, 30, N'I350', N'i-350', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (603, 603, 30, N'I370', N'i-370', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (604, 604, 30, N'ISUMARK', N'I-Mark', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (605, 605, 30, N'ISUIMP', N'Impulse', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (606, 606, 30, N'OASIS', N'Oasis', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (607, 607, 30, N'ISUPU', N'Pickup', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (608, 608, 30, N'RODEO', N'Rodeo', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (609, 609, 30, N'STYLUS', N'Stylus', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (610, 610, 30, N'TROOP', N'Trooper', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (611, 611, 30, N'TRP2', N'Trooper II', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (612, 612, 30, N'VEHICROSS', N'VehiCROSS', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (613, 613, 30, N'ISUOTH', N'Other Isuzu Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (614, 614, 31, N'STYPE', N'S-Type', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (615, 615, 31, N'XTYPE', N'X-Type', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (616, 616, 31, N'XF', N'XF', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (617, 617, 31, N'XJ_SERIES', N'XJ Series (10)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (618, 618, 31, N'JAGXJ12', N' - XJ12', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (619, 619, 31, N'JAGXJ6', N' - XJ6', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (620, 620, 31, N'JAGXJR', N' - XJR', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (621, 621, 31, N'JAGXJRS', N' - XJR-S', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (622, 622, 31, N'JAGXJS', N' - XJS', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (623, 623, 31, N'VANDEN', N' - XJ Vanden Plas', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (624, 624, 31, N'XJ', N' - XJ', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (625, 625, 31, N'XJ8', N' - XJ8', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (626, 626, 31, N'XJ8L', N' - XJ8 L', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (627, 627, 31, N'XJSPORT', N' - XJ Sport', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (628, 628, 31, N'XK_SERIES', N'XK Series (3)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (629, 629, 31, N'JAGXK8', N' - XK8', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (630, 630, 31, N'XK', N' - XK', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (631, 631, 31, N'XKR', N' - XKR', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (632, 632, 31, N'JAGOTH', N'Other Jaguar Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (633, 633, 32, N'CHER', N'Cherokee', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (634, 634, 32, N'JEEPCJ', N'CJ', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (635, 635, 32, N'COMANC', N'Comanche', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (636, 636, 32, N'COMMANDER', N'Commander', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (637, 637, 32, N'COMPASS', N'Compass', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (638, 638, 32, N'JEEPGRAND', N'Grand Cherokee', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (639, 639, 32, N'GRWAG', N'Grand Wagoneer', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (640, 640, 32, N'LIBERTY', N'Liberty', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (641, 641, 32, N'PATRIOT', N'Patriot', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (642, 642, 32, N'JEEPPU', N'Pickup', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (643, 643, 32, N'SCRAMBLE', N'Scrambler', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (644, 644, 32, N'WAGONE', N'Wagoneer', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (645, 645, 32, N'WRANGLER', N'Wrangler', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (646, 646, 32, N'JEOTH', N'Other Jeep Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (647, 647, 33, N'AMANTI', N'Amanti', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (648, 648, 33, N'BORREGO', N'Borrego', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (649, 649, 33, N'FORTE', N'Forte', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (650, 650, 33, N'FORTEKOUP', N'Forte Koup', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (651, 651, 33, N'OPTIMA', N'Optima', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (652, 652, 33, N'RIO', N'Rio', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (653, 653, 33, N'RIO5', N'Rio5', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (654, 654, 33, N'RONDO', N'Rondo', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (655, 655, 33, N'SEDONA', N'Sedona', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (656, 656, 33, N'SEPHIA', N'Sephia', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (657, 657, 33, N'SORENTO', N'Sorento', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (658, 658, 33, N'SOUL', N'Soul', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (659, 659, 33, N'SPECTRA', N'Spectra', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (660, 660, 33, N'SPECTRA5', N'Spectra5', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (661, 661, 33, N'SPORTA', N'Sportage', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (662, 662, 33, N'KIAOTH', N'Other Kia Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (663, 663, 34, N'AVENT', N'Aventador', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (664, 664, 34, N'COUNT', N'Countach', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (665, 665, 34, N'DIABLO', N'Diablo', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (666, 666, 34, N'GALLARDO', N'Gallardo', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (667, 667, 34, N'JALPA', N'Jalpa', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (668, 668, 34, N'LM002', N'LM002', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (669, 669, 34, N'MURCIELAGO', N'Murcielago', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (670, 670, 34, N'UNAVAILLAM', N'Other Lamborghini Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (671, 671, 35, N'BETA', N'Beta', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (672, 672, 35, N'ZAGATO', N'Zagato', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (673, 673, 35, N'UNAVAILLAN', N'Other Lancia Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (674, 674, 36, N'DEFEND', N'Defender', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (675, 675, 36, N'DISCOV', N'Discovery', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (676, 676, 36, N'FRELNDR', N'Freelander', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (677, 677, 36, N'LR2', N'LR2', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (678, 678, 36, N'LR3', N'LR3', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (679, 679, 36, N'LR4', N'LR4', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (680, 680, 36, N'RANGE', N'Range Rover', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (681, 681, 36, N'EVOQUE', N'Range Rover Evoque', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (682, 682, 36, N'RANGESPORT', N'Range Rover Sport', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (683, 683, 36, N'ROVOTH', N'Other Land Rover Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (684, 684, 37, N'CT_MODELS', N'CT Models (1)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (685, 685, 37, N'CT200H', N' - CT 200h', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (686, 686, 37, N'ES_MODELS', N'ES Models (5)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (687, 687, 37, N'ES250', N' - ES 250', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (688, 688, 37, N'ES300', N' - ES 300', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (689, 689, 37, N'ES300H', N' - ES 300h', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (690, 690, 37, N'ES330', N' - ES 330', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (691, 691, 37, N'ES350', N' - ES 350', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (692, 692, 37, N'GS_MODELS', N'GS Models (6)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (693, 693, 37, N'GS300', N' - GS 300', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (694, 694, 37, N'GS350', N' - GS 350', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (695, 695, 37, N'GS400', N' - GS 400', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (696, 696, 37, N'GS430', N' - GS 430', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (697, 697, 37, N'GS450H', N' - GS 450h', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (698, 698, 37, N'GS460', N' - GS 460', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (699, 699, 37, N'GX_MODELS', N'GX Models (2)', 1)
GO
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (700, 700, 37, N'GX460', N' - GX 460', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (701, 701, 37, N'GX470', N' - GX 470', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (702, 702, 37, N'HS_MODELS', N'HS Models (1)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (703, 703, 37, N'HS250H', N' - HS 250h', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (704, 704, 37, N'IS_MODELS', N'IS Models (6)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (705, 705, 37, N'IS250', N' - IS 250', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (706, 706, 37, N'IS250C', N' - IS 250C', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (707, 707, 37, N'IS300', N' - IS 300', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (708, 708, 37, N'IS350', N' - IS 350', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (709, 709, 37, N'IS350C', N' - IS 350C', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (710, 710, 37, N'ISF', N' - IS F', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (711, 711, 37, N'LEXLFA', N'LFA', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (712, 712, 37, N'LS_MODELS', N'LS Models (4)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (713, 713, 37, N'LS400', N' - LS 400', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (714, 714, 37, N'LS430', N' - LS 430', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (715, 715, 37, N'LS460', N' - LS 460', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (716, 716, 37, N'LS600H', N' - LS 600h', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (717, 717, 37, N'LX_MODELS', N'LX Models (3)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (718, 718, 37, N'LX450', N' - LX 450', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (719, 719, 37, N'LX470', N' - LX 470', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (720, 720, 37, N'LX570', N' - LX 570', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (721, 721, 37, N'RX_MODELS', N'RX Models (5)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (722, 722, 37, N'RX300', N' - RX 300', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (723, 723, 37, N'RX330', N' - RX 330', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (724, 724, 37, N'RX350', N' - RX 350', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (725, 725, 37, N'RX400H', N' - RX 400h', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (726, 726, 37, N'RX450H', N' - RX 450h', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (727, 727, 37, N'SC_MODELS', N'SC Models (3)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (728, 728, 37, N'SC300', N' - SC 300', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (729, 729, 37, N'SC400', N' - SC 400', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (730, 730, 37, N'SC430', N' - SC 430', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (731, 731, 37, N'LEXOTH', N'Other Lexus Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (732, 732, 38, N'AVIATOR', N'Aviator', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (733, 733, 38, N'BLKWOOD', N'Blackwood', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (734, 734, 38, N'CONT', N'Continental', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (735, 735, 38, N'LSLINCOLN', N'LS', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (736, 736, 38, N'MARKLT', N'Mark LT', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (737, 737, 38, N'MARK6', N'Mark VI', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (738, 738, 38, N'MARK7', N'Mark VII', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (739, 739, 38, N'MARK8', N'Mark VIII', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (740, 740, 38, N'MKS', N'MKS', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (741, 741, 38, N'MKT', N'MKT', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (742, 742, 38, N'MKX', N'MKX', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (743, 743, 38, N'MKZ', N'MKZ', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (744, 744, 38, N'NAVIGA', N'Navigator', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (745, 745, 38, N'NAVIGAL', N'Navigator L', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (746, 746, 38, N'LINCTC', N'Town Car', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (747, 747, 38, N'ZEPHYR', N'Zephyr', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (748, 748, 38, N'LINOTH', N'Other Lincoln Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (749, 749, 39, N'ELAN', N'Elan', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (750, 750, 39, N'LOTELISE', N'Elise', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (751, 751, 39, N'ESPRIT', N'Esprit', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (752, 752, 39, N'EVORA', N'Evora', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (753, 753, 39, N'EXIGE', N'Exige', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (754, 754, 39, N'UNAVAILLOT', N'Other Lotus Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (755, 755, 40, N'430', N'430', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (756, 756, 40, N'BITRBO', N'Biturbo', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (757, 757, 40, N'COUPEMAS', N'Coupe', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (758, 758, 40, N'GRANSPORT', N'GranSport', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (759, 759, 40, N'GRANTURISM', N'GranTurismo', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (760, 760, 40, N'QP', N'Quattroporte', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (761, 761, 40, N'SPYDER', N'Spyder', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (762, 762, 40, N'UNAVAILMAS', N'Other Maserati Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (763, 763, 41, N'57MAYBACH', N'57', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (764, 764, 41, N'62MAYBACH', N'62', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (765, 765, 41, N'UNAVAILMAY', N'Other Maybach Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (766, 766, 42, N'MAZDA323', N'323', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (767, 767, 42, N'MAZDA626', N'626', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (768, 768, 42, N'929', N'929', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (769, 769, 42, N'B-SERIES', N'B-Series Pickup', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (770, 770, 42, N'CX-5', N'CX-5', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (771, 771, 42, N'CX-7', N'CX-7', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (772, 772, 42, N'CX-9', N'CX-9', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (773, 773, 42, N'GLC', N'GLC', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (774, 774, 42, N'MAZDA2', N'MAZDA2', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (775, 775, 42, N'MAZDA3', N'MAZDA3', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (776, 776, 42, N'MAZDA5', N'MAZDA5', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (777, 777, 42, N'MAZDA6', N'MAZDA6', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (778, 778, 42, N'MAZDASPD3', N'MAZDASPEED3', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (779, 779, 42, N'MAZDASPD6', N'MAZDASPEED6', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (780, 780, 42, N'MIATA', N'Miata MX5', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (781, 781, 42, N'MILL', N'Millenia', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (782, 782, 42, N'MPV', N'MPV', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (783, 783, 42, N'MX3', N'MX3', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (784, 784, 42, N'MX6', N'MX6', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (785, 785, 42, N'NAVAJO', N'Navajo', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (786, 786, 42, N'PROTE', N'Protege', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (787, 787, 42, N'PROTE5', N'Protege5', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (788, 788, 42, N'RX7', N'RX-7', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (789, 789, 42, N'RX8', N'RX-8', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (790, 790, 42, N'TRIBUTE', N'Tribute', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (791, 791, 42, N'MAZOTH', N'Other Mazda Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (792, 792, 43, N'MP4', N'MP4-12C', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (793, 793, 44, N'190_CLASS', N'190 Class (2)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (794, 794, 44, N'190D', N' - 190D', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (795, 795, 44, N'190E', N' - 190E', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (796, 796, 44, N'240_CLASS', N'240 Class (1)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (797, 797, 44, N'240D', N' - 240D', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (798, 798, 44, N'300_CLASS_E_CLASS', N'300 Class / E Class (6)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (799, 799, 44, N'300CD', N' - 300CD', 1)
GO
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (800, 800, 44, N'300CE', N' - 300CE', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (801, 801, 44, N'300D', N' - 300D', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (802, 802, 44, N'300E', N' - 300E', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (803, 803, 44, N'300TD', N' - 300TD', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (804, 804, 44, N'300TE', N' - 300TE', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (805, 805, 44, N'C_CLASS', N'C Class (13)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (806, 806, 44, N'C220', N' - C220', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (807, 807, 44, N'C230', N' - C230', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (808, 808, 44, N'C240', N' - C240', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (809, 809, 44, N'C250', N' - C250', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (810, 810, 44, N'C280', N' - C280', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (811, 811, 44, N'C300', N' - C300', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (812, 812, 44, N'C320', N' - C320', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (813, 813, 44, N'C32AMG', N' - C32 AMG', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (814, 814, 44, N'C350', N' - C350', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (815, 815, 44, N'C36AMG', N' - C36 AMG', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (816, 816, 44, N'C43AMG', N' - C43 AMG', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (817, 817, 44, N'C55AMG', N' - C55 AMG', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (818, 818, 44, N'C63AMG', N' - C63 AMG', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (819, 819, 44, N'CL_CLASS', N'CL Class (6)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (820, 820, 44, N'CL500', N' - CL500', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (821, 821, 44, N'CL550', N' - CL550', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (822, 822, 44, N'CL55AMG', N' - CL55 AMG', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (823, 823, 44, N'CL600', N' - CL600', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (824, 824, 44, N'CL63AMG', N' - CL63 AMG', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (825, 825, 44, N'CL65AMG', N' - CL65 AMG', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (826, 826, 44, N'CLK_CLASS', N'CLK Class (7)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (827, 827, 44, N'CLK320', N' - CLK320', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (828, 828, 44, N'CLK350', N' - CLK350', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (829, 829, 44, N'CLK430', N' - CLK430', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (830, 830, 44, N'CLK500', N' - CLK500', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (831, 831, 44, N'CLK550', N' - CLK550', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (832, 832, 44, N'CLK55AMG', N' - CLK55 AMG', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (833, 833, 44, N'CLK63AMG', N' - CLK63 AMG', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (834, 834, 44, N'CLS_CLASS', N'CLS Class (4)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (835, 835, 44, N'CLS500', N' - CLS500', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (836, 836, 44, N'CLS550', N' - CLS550', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (837, 837, 44, N'CLS55AMG', N' - CLS55 AMG', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (838, 838, 44, N'CLS63AMG', N' - CLS63 AMG', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (839, 839, 44, N'E_CLASS', N'E Class (18)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (840, 840, 44, N'260E', N' - 260E', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (841, 841, 44, N'280CE', N' - 280CE', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (842, 842, 44, N'280E', N' - 280E', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (843, 843, 44, N'400E', N' - 400E', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (844, 844, 44, N'500E', N' - 500E', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (845, 845, 44, N'E300', N' - E300', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (846, 846, 44, N'E320', N' - E320', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (847, 847, 44, N'E320BLUE', N' - E320 Bluetec', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (848, 848, 44, N'E320CDI', N' - E320 CDI', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (849, 849, 44, N'E350', N' - E350', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (850, 850, 44, N'E350BLUE', N' - E350 Bluetec', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (851, 851, 44, N'E400', N' - E400 Hybrid', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (852, 852, 44, N'E420', N' - E420', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (853, 853, 44, N'E430', N' - E430', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (854, 854, 44, N'E500', N' - E500', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (855, 855, 44, N'E550', N' - E550', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (856, 856, 44, N'E55AMG', N' - E55 AMG', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (857, 857, 44, N'E63AMG', N' - E63 AMG', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (858, 858, 44, N'G_CLASS', N'G Class (4)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (859, 859, 44, N'G500', N' - G500', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (860, 860, 44, N'G550', N' - G550', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (861, 861, 44, N'G55AMG', N' - G55 AMG', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (862, 862, 44, N'G63AMG', N' - G63 AMG', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (863, 863, 44, N'GL_CLASS', N'GL Class (5)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (864, 864, 44, N'GL320BLUE', N' - GL320 Bluetec', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (865, 865, 44, N'GL320CDI', N' - GL320 CDI', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (866, 866, 44, N'GL350BLUE', N' - GL350 Bluetec', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (867, 867, 44, N'GL450', N' - GL450', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (868, 868, 44, N'GL550', N' - GL550', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (869, 869, 44, N'GLK_CLASS', N'GLK Class (1)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (870, 870, 44, N'GLK350', N' - GLK350', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (871, 871, 44, N'M_CLASS', N'M Class (11)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (872, 872, 44, N'ML320', N' - ML320', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (873, 873, 44, N'ML320BLUE', N' - ML320 Bluetec', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (874, 874, 44, N'ML320CDI', N' - ML320 CDI', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (875, 875, 44, N'ML350', N' - ML350', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (876, 876, 44, N'ML350BLUE', N' - ML350 Bluetec', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (877, 877, 44, N'ML430', N' - ML430', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (878, 878, 44, N'ML450HY', N' - ML450 Hybrid', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (879, 879, 44, N'ML500', N' - ML500', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (880, 880, 44, N'ML550', N' - ML550', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (881, 881, 44, N'ML55AMG', N' - ML55 AMG', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (882, 882, 44, N'ML63AMG', N' - ML63 AMG', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (883, 883, 44, N'R_CLASS', N'R Class (6)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (884, 884, 44, N'R320BLUE', N' - R320 Bluetec', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (885, 885, 44, N'R320CDI', N' - R320 CDI', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (886, 886, 44, N'R350', N' - R350', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (887, 887, 44, N'R350BLUE', N' - R350 Bluetec', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (888, 888, 44, N'R500', N' - R500', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (889, 889, 44, N'R63AMG', N' - R63 AMG', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (890, 890, 44, N'S_CLASS', N'S Class (30)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (891, 891, 44, N'300SD', N' - 300SD', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (892, 892, 44, N'300SDL', N' - 300SDL', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (893, 893, 44, N'300SE', N' - 300SE', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (894, 894, 44, N'300SEL', N' - 300SEL', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (895, 895, 44, N'350SD', N' - 350SD', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (896, 896, 44, N'350SDL', N' - 350SDL', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (897, 897, 44, N'380SE', N' - 380SE', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (898, 898, 44, N'380SEC', N' - 380SEC', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (899, 899, 44, N'380SEL', N' - 380SEL', 1)
GO
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (900, 900, 44, N'400SE', N' - 400SE', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (901, 901, 44, N'400SEL', N' - 400SEL', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (902, 902, 44, N'420SEL', N' - 420SEL', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (903, 903, 44, N'500SEC', N' - 500SEC', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (904, 904, 44, N'500SEL', N' - 500SEL', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (905, 905, 44, N'560SEC', N' - 560SEC', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (906, 906, 44, N'560SEL', N' - 560SEL', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (907, 907, 44, N'600SEC', N' - 600SEC', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (908, 908, 44, N'600SEL', N' - 600SEL', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (909, 909, 44, N'S320', N' - S320', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (910, 910, 44, N'S350', N' - S350', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (911, 911, 44, N'S350BLUE', N' - S350 Bluetec', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (912, 912, 44, N'S400HY', N' - S400 Hybrid', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (913, 913, 44, N'S420', N' - S420', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (914, 914, 44, N'S430', N' - S430', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (915, 915, 44, N'S500', N' - S500', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (916, 916, 44, N'S550', N' - S550', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (917, 917, 44, N'S55AMG', N' - S55 AMG', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (918, 918, 44, N'S600', N' - S600', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (919, 919, 44, N'S63AMG', N' - S63 AMG', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (920, 920, 44, N'S65AMG', N' - S65 AMG', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (921, 921, 44, N'SL_CLASS', N'SL Class (13)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (922, 922, 44, N'300SL', N' - 300SL', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (923, 923, 44, N'380SL', N' - 380SL', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (924, 924, 44, N'380SLC', N' - 380SLC', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (925, 925, 44, N'500SL', N' - 500SL', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (926, 926, 44, N'560SL', N' - 560SL', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (927, 927, 44, N'600SL', N' - 600SL', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (928, 928, 44, N'SL320', N' - SL320', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (929, 929, 44, N'SL500', N' - SL500', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (930, 930, 44, N'SL550', N' - SL550', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (931, 931, 44, N'SL55AMG', N' - SL55 AMG', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (932, 932, 44, N'SL600', N' - SL600', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (933, 933, 44, N'SL63AMG', N' - SL63 AMG', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (934, 934, 44, N'SL65AMG', N' - SL65 AMG', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (935, 935, 44, N'SLK_CLASS', N'SLK Class (8)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (936, 936, 44, N'SLK230', N' - SLK230', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (937, 937, 44, N'SLK250', N' - SLK250', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (938, 938, 44, N'SLK280', N' - SLK280', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (939, 939, 44, N'SLK300', N' - SLK300', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (940, 940, 44, N'SLK320', N' - SLK320', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (941, 941, 44, N'SLK32AMG', N' - SLK32 AMG', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (942, 942, 44, N'SLK350', N' - SLK350', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (943, 943, 44, N'SLK55AMG', N' - SLK55 AMG', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (944, 944, 44, N'SLR_CLASS', N'SLR Class (1)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (945, 945, 44, N'SLR', N' - SLR', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (946, 946, 44, N'SLS_CLASS', N'SLS Class (1)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (947, 947, 44, N'SLSAMG', N' - SLS AMG', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (948, 948, 44, N'SPRINTER_CLASS', N'Sprinter Class (1)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (949, 949, 44, N'MBSPRINTER', N' - Sprinter', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (950, 950, 44, N'MBOTH', N'Other Mercedes-Benz Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (951, 951, 45, N'CAPRI', N'Capri', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (952, 952, 45, N'COUGAR', N'Cougar', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (953, 953, 45, N'MERCGRAND', N'Grand Marquis', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (954, 954, 45, N'LYNX', N'Lynx', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (955, 955, 45, N'MARAUDER', N'Marauder', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (956, 956, 45, N'MARINER', N'Mariner', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (957, 957, 45, N'MARQ', N'Marquis', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (958, 958, 45, N'MILAN', N'Milan', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (959, 959, 45, N'MONTEGO', N'Montego', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (960, 960, 45, N'MONTEREY', N'Monterey', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (961, 961, 45, N'MOUNTA', N'Mountaineer', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (962, 962, 45, N'MYSTIQ', N'Mystique', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (963, 963, 45, N'SABLE', N'Sable', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (964, 964, 45, N'TOPAZ', N'Topaz', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (965, 965, 45, N'TRACER', N'Tracer', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (966, 966, 45, N'VILLA', N'Villager', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (967, 967, 45, N'MERCZEP', N'Zephyr', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (968, 968, 45, N'MEOTH', N'Other Mercury Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (969, 969, 46, N'SCORP', N'Scorpio', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (970, 970, 46, N'XR4TI', N'XR4Ti', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (971, 971, 46, N'MEROTH', N'Other Merkur Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (972, 972, 47, N'COOPRCLUB_MODELS', N'Cooper Clubman Models (2)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (973, 973, 47, N'COOPERCLUB', N' - Cooper Clubman', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (974, 974, 47, N'COOPRCLUBS', N' - Cooper S Clubman', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (975, 975, 47, N'COOPCOUNTRY_MODELS', N'Cooper Countryman Models (2)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (976, 976, 47, N'COUNTRYMAN', N' - Cooper Countryman', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (977, 977, 47, N'COUNTRYMNS', N' - Cooper S Countryman', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (978, 978, 47, N'COOPCOUP_MODELS', N'Cooper Coupe Models (2)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (979, 979, 47, N'MINICOUPE', N' - Cooper Coupe', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (980, 980, 47, N'MINISCOUPE', N' - Cooper S Coupe', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (981, 981, 47, N'COOPER_MODELS', N'Cooper Models (2)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (982, 982, 47, N'COOPER', N' - Cooper', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (983, 983, 47, N'COOPERS', N' - Cooper S', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (984, 984, 47, N'COOPRROAD_MODELS', N'Cooper Roadster Models (2)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (985, 985, 47, N'COOPERROAD', N' - Cooper Roadster', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (986, 986, 47, N'COOPERSRD', N' - Cooper S Roadster', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (987, 987, 48, N'3000GT', N'3000GT', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (988, 988, 48, N'CORD', N'Cordia', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (989, 989, 48, N'DIAMAN', N'Diamante', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (990, 990, 48, N'ECLIP', N'Eclipse', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (991, 991, 48, N'ENDEAVOR', N'Endeavor', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (992, 992, 48, N'MITEXP', N'Expo', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (993, 993, 48, N'GALANT', N'Galant', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (994, 994, 48, N'MITI', N'i', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (995, 995, 48, N'LANCERMITS', N'Lancer', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (996, 996, 48, N'LANCEREVO', N'Lancer Evolution', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (997, 997, 48, N'MITPU', N'Mighty Max', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (998, 998, 48, N'MIRAGE', N'Mirage', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (999, 999, 48, N'MONT', N'Montero', 1)
GO
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1000, 1000, 48, N'MONTSPORT', N'Montero Sport', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1001, 1001, 48, N'OUTLANDER', N'Outlander', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1002, 1002, 48, N'OUTLANDSPT', N'Outlander Sport', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1003, 1003, 48, N'PRECIS', N'Precis', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1004, 1004, 48, N'RAIDERMITS', N'Raider', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1005, 1005, 48, N'SIGMA', N'Sigma', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1006, 1006, 48, N'MITSTAR', N'Starion', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1007, 1007, 48, N'TRED', N'Tredia', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1008, 1008, 48, N'MITVAN', N'Van', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1009, 1009, 48, N'MITOTH', N'Other Mitsubishi Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1010, 1010, 49, N'NIS200SX', N'200SX', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1011, 1011, 49, N'240SX', N'240SX', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1012, 1012, 49, N'300ZXTURBO', N'300ZX', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1013, 1013, 49, N'350Z', N'350Z', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1014, 1014, 49, N'370Z', N'370Z', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1015, 1015, 49, N'ALTIMA', N'Altima', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1016, 1016, 49, N'PATHARMADA', N'Armada', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1017, 1017, 49, N'AXXESS', N'Axxess', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1018, 1018, 49, N'CUBE', N'Cube', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1019, 1019, 49, N'FRONTI', N'Frontier', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1020, 1020, 49, N'GT-R', N'GT-R', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1021, 1021, 49, N'JUKE', N'Juke', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1022, 1022, 49, N'LEAF', N'Leaf', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1023, 1023, 49, N'MAX', N'Maxima', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1024, 1024, 49, N'MURANO', N'Murano', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1025, 1025, 49, N'MURANOCROS', N'Murano CrossCabriolet', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1026, 1026, 49, N'NV', N'NV', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1027, 1027, 49, N'NX', N'NX', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1028, 1028, 49, N'PATH', N'Pathfinder', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1029, 1029, 49, N'NISPU', N'Pickup', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1030, 1030, 49, N'PULSAR', N'Pulsar', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1031, 1031, 49, N'QUEST', N'Quest', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1032, 1032, 49, N'ROGUE', N'Rogue', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1033, 1033, 49, N'SENTRA', N'Sentra', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1034, 1034, 49, N'STANZA', N'Stanza', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1035, 1035, 49, N'TITAN', N'Titan', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1036, 1036, 49, N'NISVAN', N'Van', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1037, 1037, 49, N'VERSA', N'Versa', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1038, 1038, 49, N'XTERRA', N'Xterra', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1039, 1039, 49, N'NISSOTH', N'Other Nissan Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1040, 1040, 50, N'88', N'88', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1041, 1041, 50, N'ACHIEV', N'Achieva', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1042, 1042, 50, N'ALERO', N'Alero', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1043, 1043, 50, N'AURORA', N'Aurora', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1044, 1044, 50, N'BRAV', N'Bravada', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1045, 1045, 50, N'CUCR', N'Custom Cruiser', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1046, 1046, 50, N'OLDCUS', N'Cutlass', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1047, 1047, 50, N'OLDCALAIS', N'Cutlass Calais', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1048, 1048, 50, N'CIERA', N'Cutlass Ciera', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1049, 1049, 50, N'CSUPR', N'Cutlass Supreme', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1050, 1050, 50, N'OLDSFIR', N'Firenza', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1051, 1051, 50, N'INTRIG', N'Intrigue', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1052, 1052, 50, N'98', N'Ninety-Eight', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1053, 1053, 50, N'OMEG', N'Omega', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1054, 1054, 50, N'REGEN', N'Regency', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1055, 1055, 50, N'SILHO', N'Silhouette', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1056, 1056, 50, N'TORO', N'Toronado', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1057, 1057, 50, N'OLDOTH', N'Other Oldsmobile Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1058, 1058, 51, N'405', N'405', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1059, 1059, 51, N'504', N'504', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1060, 1060, 51, N'505', N'505', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1061, 1061, 51, N'604', N'604', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1062, 1062, 51, N'UNAVAILPEU', N'Other Peugeot Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1063, 1063, 52, N'ACC', N'Acclaim', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1064, 1064, 52, N'ARROW', N'Arrow', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1065, 1065, 52, N'BREEZE', N'Breeze', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1066, 1066, 52, N'CARAVE', N'Caravelle', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1067, 1067, 52, N'CHAMP', N'Champ', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1068, 1068, 52, N'COLT', N'Colt', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1069, 1069, 52, N'PLYMCONQ', N'Conquest', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1070, 1070, 52, N'GRANFURY', N'Gran Fury', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1071, 1071, 52, N'PLYMGRANV', N'Grand Voyager', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1072, 1072, 52, N'HORI', N'Horizon', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1073, 1073, 52, N'LASER', N'Laser', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1074, 1074, 52, N'NEON', N'Neon', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1075, 1075, 52, N'PROWLE', N'Prowler', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1076, 1076, 52, N'RELI', N'Reliant', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1077, 1077, 52, N'SAPPOROPLY', N'Sapporo', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1078, 1078, 52, N'SCAMP', N'Scamp', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1079, 1079, 52, N'SUNDAN', N'Sundance', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1080, 1080, 52, N'TRAILDUST', N'Trailduster', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1081, 1081, 52, N'VOYA', N'Voyager', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1082, 1082, 52, N'PLYOTH', N'Other Plymouth Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1083, 1083, 53, N'T-1000', N'1000', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1084, 1084, 53, N'6000', N'6000', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1085, 1085, 53, N'AZTEK', N'Aztek', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1086, 1086, 53, N'BON', N'Bonneville', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1087, 1087, 53, N'CATALINA', N'Catalina', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1088, 1088, 53, N'FIERO', N'Fiero', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1089, 1089, 53, N'FBIRD', N'Firebird', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1090, 1090, 53, N'G3', N'G3', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1091, 1091, 53, N'G5', N'G5', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1092, 1092, 53, N'G6', N'G6', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1093, 1093, 53, N'G8', N'G8', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1094, 1094, 53, N'GRNDAM', N'Grand Am', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1095, 1095, 53, N'GP', N'Grand Prix', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1096, 1096, 53, N'GTO', N'GTO', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1097, 1097, 53, N'J2000', N'J2000', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1098, 1098, 53, N'LEMANS', N'Le Mans', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1099, 1099, 53, N'MONTANA', N'Montana', 1)
GO
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1100, 1100, 53, N'PARISI', N'Parisienne', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1101, 1101, 53, N'PHOENIX', N'Phoenix', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1102, 1102, 53, N'SAFARIPONT', N'Safari', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1103, 1103, 53, N'SOLSTICE', N'Solstice', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1104, 1104, 53, N'SUNBIR', N'Sunbird', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1105, 1105, 53, N'SUNFIR', N'Sunfire', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1106, 1106, 53, N'TORRENT', N'Torrent', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1107, 1107, 53, N'TS', N'Trans Sport', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1108, 1108, 53, N'VIBE', N'Vibe', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1109, 1109, 53, N'PONOTH', N'Other Pontiac Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1110, 1110, 54, N'911', N'911', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1111, 1111, 54, N'924', N'924', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1112, 1112, 54, N'928', N'928', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1113, 1113, 54, N'944', N'944', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1114, 1114, 54, N'968', N'968', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1115, 1115, 54, N'BOXSTE', N'Boxster', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1116, 1116, 54, N'CARRERAGT', N'Carrera GT', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1117, 1117, 54, N'CAYENNE', N'Cayenne', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1118, 1118, 54, N'CAYMAN', N'Cayman', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1119, 1119, 54, N'PANAMERA', N'Panamera', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1120, 1120, 54, N'POROTH', N'Other Porsche Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1121, 1121, 55, N'RAM1504WD', N'1500', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1122, 1122, 55, N'RAM25002WD', N'2500', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1123, 1123, 55, N'RAM3502WD', N'3500', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1124, 1124, 55, N'RAM4500', N'4500', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1125, 1125, 56, N'18I', N'18i', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1126, 1126, 56, N'FU', N'Fuego', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1127, 1127, 56, N'LECAR', N'Le Car', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1128, 1128, 56, N'R18', N'R18', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1129, 1129, 56, N'RENSPORT', N'Sportwagon', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1130, 1130, 56, N'UNAVAILREN', N'Other Renault Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1131, 1131, 57, N'CAMAR', N'Camargue', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1132, 1132, 57, N'CORN', N'Corniche', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1133, 1133, 57, N'GHOST', N'Ghost', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1134, 1134, 57, N'PARKWARD', N'Park Ward', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1135, 1135, 57, N'PHANT', N'Phantom', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1136, 1136, 57, N'DAWN', N'Silver Dawn', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1137, 1137, 57, N'SILSERAPH', N'Silver Seraph', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1138, 1138, 57, N'RRSPIR', N'Silver Spirit', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1139, 1139, 57, N'SPUR', N'Silver Spur', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1140, 1140, 57, N'UNAVAILRR', N'Other Rolls-Royce Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1141, 1141, 58, N'9-2X', N'9-2X', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1142, 1142, 58, N'9-3', N'9-3', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1143, 1143, 58, N'9-4X', N'9-4X', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1144, 1144, 58, N'9-5', N'9-5', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1145, 1145, 58, N'97X', N'9-7X', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1146, 1146, 58, N'900', N'900', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1147, 1147, 58, N'9000', N'9000', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1148, 1148, 58, N'SAOTH', N'Other Saab Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1149, 1149, 59, N'ASTRA', N'Astra', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1150, 1150, 59, N'AURA', N'Aura', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1151, 1151, 59, N'ION', N'ION', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1152, 1152, 59, N'L_SERIES', N'L Series (3)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1153, 1153, 59, N'L100', N' - L100', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1154, 1154, 59, N'L200', N' - L200', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1155, 1155, 59, N'L300', N' - L300', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1156, 1156, 59, N'LSSATURN', N'LS', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1157, 1157, 59, N'LW_SERIES', N'LW Series (4)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1158, 1158, 59, N'LW', N' - LW1', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1159, 1159, 59, N'LW2', N' - LW2', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1160, 1160, 59, N'LW200', N' - LW200', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1161, 1161, 59, N'LW300', N' - LW300', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1162, 1162, 59, N'OUTLOOK', N'Outlook', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1163, 1163, 59, N'RELAY', N'Relay', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1164, 1164, 59, N'SC_SERIES', N'SC Series (2)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1165, 1165, 59, N'SC1', N' - SC1', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1166, 1166, 59, N'SC2', N' - SC2', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1167, 1167, 59, N'SKY', N'Sky', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1168, 1168, 59, N'SL_SERIES', N'SL Series (3)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1169, 1169, 59, N'SL', N' - SL', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1170, 1170, 59, N'SL1', N' - SL1', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1171, 1171, 59, N'SL2', N' - SL2', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1172, 1172, 59, N'SW_SERIES', N'SW Series (2)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1173, 1173, 59, N'SW1', N' - SW1', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1174, 1174, 59, N'SW2', N' - SW2', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1175, 1175, 59, N'VUE', N'Vue', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1176, 1176, 59, N'SATOTH', N'Other Saturn Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1177, 1177, 60, N'SCIFRS', N'FR-S', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1178, 1178, 60, N'IQ', N'iQ', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1179, 1179, 60, N'TC', N'tC', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1180, 1180, 60, N'XA', N'xA', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1181, 1181, 60, N'XB', N'xB', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1182, 1182, 60, N'XD', N'xD', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1183, 1183, 61, N'FORTWO', N'fortwo', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1184, 1184, 61, N'SMOTH', N'Other smart Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1185, 1185, 62, N'SRTVIPER', N'Viper', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1186, 1186, 63, N'825', N'825', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1187, 1187, 63, N'827', N'827', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1188, 1188, 63, N'UNAVAILSTE', N'Other Sterling Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1189, 1189, 64, N'BAJA', N'Baja', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1190, 1190, 64, N'BRAT', N'Brat', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1191, 1191, 64, N'SUBBRZ', N'BRZ', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1192, 1192, 64, N'FOREST', N'Forester', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1193, 1193, 64, N'IMPREZ', N'Impreza', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1194, 1194, 64, N'IMPWRX', N'Impreza WRX', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1195, 1195, 64, N'JUSTY', N'Justy', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1196, 1196, 64, N'SUBL', N'L Series', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1197, 1197, 64, N'LEGACY', N'Legacy', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1198, 1198, 64, N'LOYALE', N'Loyale', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1199, 1199, 64, N'SUBOUTBK', N'Outback', 1)
GO
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1200, 1200, 64, N'SVX', N'SVX', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1201, 1201, 64, N'B9TRIBECA', N'Tribeca', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1202, 1202, 64, N'XT', N'XT', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1203, 1203, 64, N'XVCRSSTREK', N'XV Crosstrek', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1204, 1204, 64, N'SUBOTH', N'Other Subaru Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1205, 1205, 65, N'AERIO', N'Aerio', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1206, 1206, 65, N'EQUATOR', N'Equator', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1207, 1207, 65, N'ESTEEM', N'Esteem', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1208, 1208, 65, N'FORENZA', N'Forenza', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1209, 1209, 65, N'GRANDV', N'Grand Vitara', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1210, 1210, 65, N'KIZASHI', N'Kizashi', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1211, 1211, 65, N'RENO', N'Reno', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1212, 1212, 65, N'SAMUR', N'Samurai', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1213, 1213, 65, N'SIDE', N'Sidekick', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1214, 1214, 65, N'SWIFT', N'Swift', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1215, 1215, 65, N'SX4', N'SX4', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1216, 1216, 65, N'VERONA', N'Verona', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1217, 1217, 65, N'VITARA', N'Vitara', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1218, 1218, 65, N'X90', N'X-90', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1219, 1219, 65, N'XL7', N'XL7', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1220, 1220, 65, N'SUZOTH', N'Other Suzuki Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1221, 1221, 66, N'ROADSTER', N'Roadster', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1222, 1222, 67, N'4RUN', N'4Runner', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1223, 1223, 67, N'AVALON', N'Avalon', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1224, 1224, 67, N'CAMRY', N'Camry', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1225, 1225, 67, N'CELICA', N'Celica', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1226, 1226, 67, N'COROL', N'Corolla', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1227, 1227, 67, N'CORONA', N'Corona', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1228, 1228, 67, N'CRESS', N'Cressida', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1229, 1229, 67, N'ECHO', N'Echo', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1230, 1230, 67, N'FJCRUIS', N'FJ Cruiser', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1231, 1231, 67, N'HIGHLANDER', N'Highlander', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1232, 1232, 67, N'LC', N'Land Cruiser', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1233, 1233, 67, N'MATRIX', N'Matrix', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1234, 1234, 67, N'MR2', N'MR2', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1235, 1235, 67, N'MR2SPYDR', N'MR2 Spyder', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1236, 1236, 67, N'PASEO', N'Paseo', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1237, 1237, 67, N'PICKUP', N'Pickup', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1238, 1238, 67, N'PREVIA', N'Previa', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1239, 1239, 67, N'PRIUS', N'Prius', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1240, 1240, 67, N'PRIUSC', N'Prius C', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1241, 1241, 67, N'PRIUSV', N'Prius V', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1242, 1242, 67, N'RAV4', N'RAV4', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1243, 1243, 67, N'SEQUOIA', N'Sequoia', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1244, 1244, 67, N'SIENNA', N'Sienna', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1245, 1245, 67, N'SOLARA', N'Solara', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1246, 1246, 67, N'STARLET', N'Starlet', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1247, 1247, 67, N'SUPRA', N'Supra', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1248, 1248, 67, N'T100', N'T100', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1249, 1249, 67, N'TACOMA', N'Tacoma', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1250, 1250, 67, N'TERCEL', N'Tercel', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1251, 1251, 67, N'TUNDRA', N'Tundra', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1252, 1252, 67, N'TOYVAN', N'Van', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1253, 1253, 67, N'VENZA', N'Venza', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1254, 1254, 67, N'YARIS', N'Yaris', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1255, 1255, 67, N'TOYOTH', N'Other Toyota Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1256, 1256, 68, N'TR7', N'TR7', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1257, 1257, 68, N'TR8', N'TR8', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1258, 1258, 68, N'TRIOTH', N'Other Triumph Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1259, 1259, 69, N'BEETLE', N'Beetle', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1260, 1260, 69, N'VOLKSCAB', N'Cabrio', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1261, 1261, 69, N'CAB', N'Cabriolet', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1262, 1262, 69, N'CC', N'CC', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1263, 1263, 69, N'CORR', N'Corrado', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1264, 1264, 69, N'DASHER', N'Dasher', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1265, 1265, 69, N'EOS', N'Eos', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1266, 1266, 69, N'EUROVAN', N'Eurovan', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1267, 1267, 69, N'VOLKSFOX', N'Fox', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1268, 1268, 69, N'GLI', N'GLI', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1269, 1269, 69, N'GOLFR', N'Golf R', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1270, 1270, 69, N'GTI', N'GTI', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1271, 1271, 69, N'GOLFANDRABBITMODELS', N'Golf and Rabbit Models (2)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1272, 1272, 69, N'GOLF', N' - Golf', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1273, 1273, 69, N'RABBIT', N' - Rabbit', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1274, 1274, 69, N'JET', N'Jetta', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1275, 1275, 69, N'PASS', N'Passat', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1276, 1276, 69, N'PHAETON', N'Phaeton', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1277, 1277, 69, N'RABBITPU', N'Pickup', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1278, 1278, 69, N'QUAN', N'Quantum', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1279, 1279, 69, N'R32', N'R32', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1280, 1280, 69, N'ROUTAN', N'Routan', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1281, 1281, 69, N'SCIR', N'Scirocco', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1282, 1282, 69, N'TIGUAN', N'Tiguan', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1283, 1283, 69, N'TOUAREG', N'Touareg', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1284, 1284, 69, N'VANAG', N'Vanagon', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1285, 1285, 69, N'VWOTH', N'Other Volkswagen Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1286, 1286, 70, N'240', N'240', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1287, 1287, 70, N'260', N'260', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1288, 1288, 70, N'740', N'740', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1289, 1289, 70, N'760', N'760', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1290, 1290, 70, N'780', N'780', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1291, 1291, 70, N'850', N'850', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1292, 1292, 70, N'940', N'940', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1293, 1293, 70, N'960', N'960', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1294, 1294, 70, N'C30', N'C30', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1295, 1295, 70, N'C70', N'C70', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1296, 1296, 70, N'S40', N'S40', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1297, 1297, 70, N'S60', N'S60', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1298, 1298, 70, N'S70', N'S70', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1299, 1299, 70, N'S80', N'S80', 1)
GO
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1300, 1300, 70, N'S90', N'S90', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1301, 1301, 70, N'V40', N'V40', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1302, 1302, 70, N'V50', N'V50', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1303, 1303, 70, N'V70', N'V70', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1304, 1304, 70, N'V90', N'V90', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1305, 1305, 70, N'XC60', N'XC60', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1306, 1306, 70, N'XC', N'XC70', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1307, 1307, 70, N'XC90', N'XC90', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1308, 1308, 70, N'VOLOTH', N'Other Volvo Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1309, 1309, 71, N'GV', N'GV', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1310, 1310, 71, N'GVC', N'GVC', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1311, 1311, 71, N'GVL', N'GVL', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1312, 1312, 71, N'GVS', N'GVS', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1313, 1313, 71, N'GVX', N'GVX', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1314, 1314, 71, N'YUOTH', N'Other Yugo Models', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1315, NULL, 67, N'CE', N'Corolla CE', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1316, NULL, 67, N'LE', N'Corolla LE', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1317, NULL, 67, N'S', N'Corolla Tipo S', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1318, NULL, 67, N'Camry LE', N'Camry LE', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1319, NULL, 67, N'Camry XLE', N'Camry XLE', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1320, NULL, 67, N'Camry CE', N'Camry CE', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1321, NULL, 26, N'Accord XL', N'Accord XL', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1322, NULL, 26, N'Accord EX', N'Accord EX', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1323, NULL, 26, N'Accord EX-L', N'Accord EX-L', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1324, NULL, 26, N'Civic EX', N'Civic EX', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1325, NULL, 26, N'Civic EX-L', N'Civic EX-L', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1326, NULL, 26, N'Civic LX', N'Civic LX', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1327, NULL, 26, N'CR-V XL', N'CR-V XL', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1328, NULL, 42, N'BT504X4', N'BT-50 4X4', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1329, NULL, 28, N'SONATAY20', N'SONATA Y20', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1330, NULL, 28, N'SONATALF', N'SONATA LF', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1331, NULL, 67, N'.', N'HILUX', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1332, NULL, 67, N'F5', N'FORTUNE', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1333, NULL, 67, N'HILUX', N'KUN26L-PRPSYG (HILUX)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1334, NULL, 33, N'K5', N'K5', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1335, NULL, 48, N'V78', N'V78WLYXFQL', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1336, NULL, 48, N'K74', N'K74TCENDFL6', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (1337, NULL, 26, N'ELEX', N'ELEMENT EX', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (2328, NULL, 26, N'CRV4X4', N'CRV 4X4', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (2329, NULL, 26, N'CRVLX', N'CRV LX', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (2330, NULL, 20, N'FLORINO', N'FLORINO', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (2331, NULL, 30, N'DMAX', N'TFS8HDPLAXG-17A024 (DMAX)', 1)
INSERT [dbo].[Modelos] ([id], [noUso], [fabricante_id], [codigo], [modelo], [estado]) VALUES (2332, NULL, 30, N'KB', N'TFR54H-20 (KB)', 1)
SET IDENTITY_INSERT [dbo].[Modelos] OFF
SET IDENTITY_INSERT [dbo].[Paises] ON 

INSERT [dbo].[Paises] ([id], [pais], [estado]) VALUES (1, N'REP. DOM.', 1)
SET IDENTITY_INSERT [dbo].[Paises] OFF
SET IDENTITY_INSERT [dbo].[PreciosSeguroVehiculo] ON 

INSERT [dbo].[PreciosSeguroVehiculo] ([id], [id_vehiculo], [precioRD], [precioUSD]) VALUES (1, 1, CAST(3600.00 AS Decimal(18, 2)), CAST(76.60 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[PreciosSeguroVehiculo] OFF
SET IDENTITY_INSERT [dbo].[PreciosTraspasoVehiculo] ON 

INSERT [dbo].[PreciosTraspasoVehiculo] ([id], [id_vehiculo], [precioRD], [precioUSD]) VALUES (1, 1, CAST(11500.00 AS Decimal(18, 2)), CAST(244.68 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[PreciosTraspasoVehiculo] OFF
SET IDENTITY_INSERT [dbo].[Propietarios] ON 

INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (1, N'JULIO RENT CAR', N'8098627692', 1, N'Eugenio Perdomo, Casa 9, Reparto Peralta, Bella Vista, Santiago', N'03500136951')
INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (2, N'ANGELA MARIA DE LOS SANTOS POLANCO', N'000-000-0000', 1, N'Juan Isidro Perez Casa 79, Pueblo Nuevo, Santiago de los Caballeros', N'031-0034769-3')
INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (3, N'GIOVANNI MARTINEZ PORTILLO', N'809-986-7476', 1, N'winston churchil esquina jose amado soler plaza fernandez 2 ensch paraiso', N'00110150851')
INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (4, N'HENRY PEÑA', N'8299126339', 1, N'av rincon largo ', N'03101019796')
INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (5, N'JASMIN ALTAGRACIA MELENDEZ RECIO', N'0', 1, N'HATO MAYOR, CALLE 1RA. CASA #36', N'03105565838')
INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (6, N'USEBIO RAFAEL MARTINEZ PUNTIER', N'0', 1, N'PLAZA CERRO ALTO 9A, SANTIAGO', N'03100036056')
INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (7, N'CESAR ANTONIO MOQUETE CUEVAS', N'0', 1, N'EUGENIO MARIA DE HOSTOS, MONSEÑOR NOUEL', N'04800570105')
INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (8, N'MARIANA DE JEUS HERNANDEZ VALERIO', N'0', 1, N'LA OTRA BANDA, C4 #8, SANTIAGO', N'03103951947')
INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (9, N'JUNIOR SANTIAGO PIMENTEL TAPIA', N'0', 1, N'RESP. 1RA. 10 HERRERA, SANTO DOMINGO OESTE', N'00114070261')
INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (10, N'JUAN CARLOS POLANCO RODRIGUEZ', N'8092132220', 1, N'PEN ETRACIOIN 2, LOS REYES, DISTRITO NACIONAL', N'03100682701')
INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (11, N'MOISES RAFAEL ESPINAL', N'0', 1, N'ANTONIO GUZMAN FERNANDEZ #3, PEQUIN', N'03104999549')
INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (12, N'PASCUAL DE JESUS NUÑEZ PAYERO', N'0', 1, N'CARRETERA MATANZAS, EL GUANO, SANTIAGO', N'03102736067')
INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (13, N'DOLORES AMPARO TORRES', N'0', 1, N'C/1RA. #11, ARROYO HONDO, SANTIAGO', N'03103551432')
INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (14, N'DARINEL ANTONIO REYES GUTIERREZ', N'0', 1, N'AUTOPISTA JOAQUIN BALAGUER, ESTANCIA DEL YAQUE, VILLA BISONO, NAVARRETE', N'09600253232')
INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (15, N'MARISOL MERCEDES RODRIGUEZ SANTANA DE ESTEVEZ', N'0', 1, N'CUESTA ABAJO, SAN JOSE DE LAS MATAS', N'03600281723')
INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (16, N'RAMIREZ ZARZUELA RENT A CAR, SRL', N'8092470716 / 8133223875', 1, N'VAE. DON JOSE BOJOS #20, REPARTO PERALTA', N'130999971')
INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (17, N'JUAN LUIS PERALTA ALMONTE', N'0', 1, N'LOS JARDINES C/15 LOS JIRASOLES #16', N'03104941038')
INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (18, N'ORIENTAL WORD INTERNATIONAL, SRL', N'0', 1, N'JACOBO MAJLUTA AZAR, ALTOS DE ARROYO HONDO, DISTRITO NACIONAL.', N'131125425')
INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (19, N'JAIME VINICIO NUÑEZ MARTINEZ ', N'0', 1, N'.', N'03103517136')
INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (20, N'SANTANA AUTO IMPORT, SRL', N'0', 1, N'URB. LA TERRAZA, ESTRELLA SADHALA 69, SANTIAGO', N'102621993')
INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (21, N'AUTO FRANKLIN A. PEREZ, SRL', N'0', 1, N'KM. 3 1/2 GUIZA, SAN FRANCISCO DE MACORIZ.', N'104595785')
INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (22, N'JUAN DE DIOS ALMONTE COLLADO', N'8098419895', 1, N'EMILIO PRUDHOME 38 SANTIAGO ', N'03102244302')
INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (23, N'MARIBEL DEL CARMEN COLLADO PEREZ', N'0', 1, N'C/PRINCIPAL #72, MONCION, MAO', N'04200092528')
INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (24, N'LUIS AMILCA SANTANA', N'0', 1, N'C/ 3RA. #9, RESIDENCIAL MELISSA, DISTRITO NACIONAL.', N'02601031483')
INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (25, N'JOEL JOSE JORGE PICHARDO CRUZ', N'0', 1, N'AVE. HISPANOAMERICANA #49, RES. THOMEN, SANTIAGO', N'03102046434')
INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (26, N'MIGUEL GIOVANI MEDRANO QUELIZ', N'0', 1, N'EDIF. 30 APTO. 2D, LOS MOLINAS, SAN CRISTOBAL.', N'00200153583')
INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (27, N'MANUEL ELEDUVINO RODRIGUEZ DURAN', N'0', 1, N'C/18 #15, ENSANCHE MELLA II, DISTRITO NACIONAL.', N'04600277105')
INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (28, N'SANTO DOMINGO MOTORS COMPANY, S.A.', N'0', 1, N'AUT. DUARTE ESQ. ABRAHAM LINCOM, EDIFICION AMBAR 7MO. PISO, PARAISO, DISTRITO NACIONAL.', N'101008067')
INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (29, N'GRULLON REYES AUTO IMPORT', N'809-2780651', 1, N'AUTOPISTA SANTIAGO LA VEGA KM 12', N'130183457')
INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (30, N'MIGUEL ANGEL NUÑEZ', N'8292132741', 1, N'J. JIMENEZ, GURABO CASA 8 EDIF. ', N'03103585752')
INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (31, N'RAFAEL EUCLIDES ORTIZ ISAMBERG', N'..', 1, N'ENSANCHE OZAMA , ALMAROSA,#21, CAS.08', N'00105166599')
INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (32, N'MIGUEL ANGEL RODRIGUEZ PEÑA', N'.', 1, N'GURABO AL MEDIO,J.JIMENEZ,CAS.08 RESIDENCIAL MONTE D', N'031-0358575-2')
INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (33, N'JHONNY RAFAEL CASTRO CABRAL', N'809-916-4744', 1, N'SAN  JOSE LAS MATA, BOTONCILLO, C/PRINCIPAL', N'031-0289042-7')
INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (34, N'YUNIOR SANTIAGO PIMENTEL TAPIA', N'0000000000', 1, N'1ERA NO.18 HERRERA, SANTO DOMINGO', N'001140702601')
INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (35, N'EUSEBIO RAFAEL MARTINEZ PUNTIEL', N'0', 1, N'PLAZA CERRO ALTO, 9A SANTIAGO DE LOS CABALLEROS', N'031-0003605-6')
INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (36, N'JUAN CARLOS POLANCO RODRIGUEZ', N'0', 1, N'PENTRACION 2, LOS REYEZ', N'031-0068270-1')
INSERT [dbo].[Propietarios] ([id], [nombre], [telefono], [estado], [direccion], [rncCedula]) VALUES (1031, N'LUIS AMILCA SANTANA', N'0', 1, N'C/ 3 ERA, 9 RES. MELISA', N'026-0103148-3')
SET IDENTITY_INSERT [dbo].[Propietarios] OFF
SET IDENTITY_INSERT [dbo].[Seguros] ON 

INSERT [dbo].[Seguros] ([id], [nombre], [telefono], [estado]) VALUES (1, N'SEGUROS LA INTERNACIONAL', N'8095834304', 1)
SET IDENTITY_INSERT [dbo].[Seguros] OFF
SET IDENTITY_INSERT [dbo].[SeguroVehiculo] ON 

INSERT [dbo].[SeguroVehiculo] ([id], [id_vehiculo], [id_seguro], [duracion_dias]) VALUES (1, 1, 1, 365)
SET IDENTITY_INSERT [dbo].[SeguroVehiculo] OFF
SET IDENTITY_INSERT [dbo].[SerialKeyActivation] ON 

INSERT [dbo].[SerialKeyActivation] ([id], [fechaActivacion], [fechaVencimiento]) VALUES (1, CAST(N'2018-04-23' AS Date), CAST(N'2019-04-23' AS Date))
SET IDENTITY_INSERT [dbo].[SerialKeyActivation] OFF
SET IDENTITY_INSERT [dbo].[Suplidores] ON 

INSERT [dbo].[Suplidores] ([id], [suplidor], [rnc_cedula], [id_pais], [id_ciudad], [direccion], [telefono], [estado]) VALUES (1, N'WILTON PAULINO HERNANDEZ ', N'0310438148', 1, 1, N'AV. LUPERON, GURABO RD', N'8292132748', 1)
INSERT [dbo].[Suplidores] ([id], [suplidor], [rnc_cedula], [id_pais], [id_ciudad], [direccion], [telefono], [estado]) VALUES (2, N'JHONY PIMENTEL', N'031XXXXXXXXX', 1, 1, N'AV 27 FEBRERO', N'8099779606', 1)
INSERT [dbo].[Suplidores] ([id], [suplidor], [rnc_cedula], [id_pais], [id_ciudad], [direccion], [telefono], [estado]) VALUES (3, N'GIOVANY MARTINEZ ', N'00110150851', 1, 2, N'AV WINSTON CHURCHILL', N'8099867476', 1)
INSERT [dbo].[Suplidores] ([id], [suplidor], [rnc_cedula], [id_pais], [id_ciudad], [direccion], [telefono], [estado]) VALUES (4, N'CHINITO AUTO IMPORT', N'0XXXXXX', 1, 1, N'AUTOPISTA DUARTE PUÑAL ', N'8095707272', 1)
INSERT [dbo].[Suplidores] ([id], [suplidor], [rnc_cedula], [id_pais], [id_ciudad], [direccion], [telefono], [estado]) VALUES (5, N'NIVAR J IMPORT', N'XXXX', 1, 2, N'NA', N' 809-850-1001', 1)
INSERT [dbo].[Suplidores] ([id], [suplidor], [rnc_cedula], [id_pais], [id_ciudad], [direccion], [telefono], [estado]) VALUES (6, N'MIGUEL ANGEL NUÑEZ PEÑA', N'03103585752', 1, 1, N'C/ J. JIMENEZ, LLANOS DE GURABO #8', N'8292132741', 1)
INSERT [dbo].[Suplidores] ([id], [suplidor], [rnc_cedula], [id_pais], [id_ciudad], [direccion], [telefono], [estado]) VALUES (7, N'MIGUEL GIOVANI MEDRANO QUELIZ', N'00200153583', 1, 20, N'HACIENDA FUNDACION EDIF. 30 PISO 2 APTO. 2D', N'0', 1)
INSERT [dbo].[Suplidores] ([id], [suplidor], [rnc_cedula], [id_pais], [id_ciudad], [direccion], [telefono], [estado]) VALUES (8, N'SANTANA AUTO IMPORT', N'102621993', 1, 1, N'ESTRELLA SADHALA #69, LA TERRAZA, SANTIAGO', N'0', 1)
INSERT [dbo].[Suplidores] ([id], [suplidor], [rnc_cedula], [id_pais], [id_ciudad], [direccion], [telefono], [estado]) VALUES (9, N'KOSAMI AUTO IMPORT SRL', N'131470841', 1, 1, N'ESTRELLA SADHALA 55 CENTRO DE SANTIAGO', N'8092993363', 1)
INSERT [dbo].[Suplidores] ([id], [suplidor], [rnc_cedula], [id_pais], [id_ciudad], [direccion], [telefono], [estado]) VALUES (10, N'JOEL JOSE JORGE PICHARDO CRUZ', N'03102046434', 1, 1, N'AVE. HISPANOAMERICANA #49, RESIDENCIAL THOMEN, SANTIAGO.', N'8098732524', 1)
INSERT [dbo].[Suplidores] ([id], [suplidor], [rnc_cedula], [id_pais], [id_ciudad], [direccion], [telefono], [estado]) VALUES (11, N'JHONNY RAFAEL CASTRO CABRAL', N'03102890427', 1, 1, N'C/PRINCIPAL, BOTONCILLO, SAN JOSE DE LAS MATAS', N'8099164744', 1)
INSERT [dbo].[Suplidores] ([id], [suplidor], [rnc_cedula], [id_pais], [id_ciudad], [direccion], [telefono], [estado]) VALUES (12, N'RAMIREZ ZARZUELA', N'130999971', 1, 1, N'AVE. JOSE VOJOS #20, REPARTO PERALTA, SANTIAGO', N'8092470716', 1)
INSERT [dbo].[Suplidores] ([id], [suplidor], [rnc_cedula], [id_pais], [id_ciudad], [direccion], [telefono], [estado]) VALUES (1005, N'MARISOL MERCEDES RODRIGUEZ SANTANA DE ESTEVEZ', N'03600281723', 1, 1, N'CUESTA ABAJO, SAN JOSE DE LAS MATAS', N'0', 1)
INSERT [dbo].[Suplidores] ([id], [suplidor], [rnc_cedula], [id_pais], [id_ciudad], [direccion], [telefono], [estado]) VALUES (1006, N'DAVID CASTRO', N'.', 1, 1, N'.', N'.', 1)
INSERT [dbo].[Suplidores] ([id], [suplidor], [rnc_cedula], [id_pais], [id_ciudad], [direccion], [telefono], [estado]) VALUES (1007, N'UREÑA MOTORS', N'106012378', 1, 3, N'ESTANCIA NUEVA KM 1 1/2', N'809-576-4545', 1)
INSERT [dbo].[Suplidores] ([id], [suplidor], [rnc_cedula], [id_pais], [id_ciudad], [direccion], [telefono], [estado]) VALUES (1008, N'WELINTON DAVID CASTRO PEÑA', N'044-0016088-5', 1, 1, N'.', N'0', 1)
SET IDENTITY_INSERT [dbo].[Suplidores] OFF
SET IDENTITY_INSERT [dbo].[TalleresRepuestos] ON 

INSERT [dbo].[TalleresRepuestos] ([id], [taller], [direccion], [telefono1], [telefono2], [estado]) VALUES (1, N'AUTO PINTURA JERVI', N'.AV ANTONIO GUZMAN N4 BELLA VISTA STGO', N'809-427-2101', N'0', 1)
INSERT [dbo].[TalleresRepuestos] ([id], [taller], [direccion], [telefono1], [telefono2], [estado]) VALUES (2, N'FELIPE AUTO PINTURA ', N'LA FUENTE', N'829-714-1139', N'', 1)
INSERT [dbo].[TalleresRepuestos] ([id], [taller], [direccion], [telefono1], [telefono2], [estado]) VALUES (3, N'AUTOMECANICA PEDRO RIVAS', N'AVE.HISPANO AMERICANA , SANTIAGO.', N'809-341-0201', N'', 1)
INSERT [dbo].[TalleresRepuestos] ([id], [taller], [direccion], [telefono1], [telefono2], [estado]) VALUES (4, N'JORGE JOEL  PICHARDO', N'AVE.HISPANO AMERICANA , SANTIAGO', N'809-873-2524', N'', 1)
INSERT [dbo].[TalleresRepuestos] ([id], [taller], [direccion], [telefono1], [telefono2], [estado]) VALUES (5, N'CHINITO AUTO IMPORT', N'Autopista Duarte, #KM 9 1/2,Santiago. Ref.: CASI FRENTE AL HOTEL HODELPA', N'809-284-7550 / 809-284-755', N'809-570-7272', 1)
INSERT [dbo].[TalleresRepuestos] ([id], [taller], [direccion], [telefono1], [telefono2], [estado]) VALUES (6, N'JULIO GOMAS ', N'AV CIRCUNVALACION NIBAJE', N'809-8610968', N'', 1)
INSERT [dbo].[TalleresRepuestos] ([id], [taller], [direccion], [telefono1], [telefono2], [estado]) VALUES (7, N'GOMERIA WESTER ', N'AV ANTONIO GUZMA FDEZ SANTIAGO', N'8092477089', N'', 1)
INSERT [dbo].[TalleresRepuestos] ([id], [taller], [direccion], [telefono1], [telefono2], [estado]) VALUES (8, N'GOMERIA MAXIMO ALMONTE', N'AV ANTONIO GUZMA FDEZ SANTIAGO', N'8099180775', N'', 1)
INSERT [dbo].[TalleresRepuestos] ([id], [taller], [direccion], [telefono1], [telefono2], [estado]) VALUES (9, N'MORONTA AUTO PINTURA', N'CORONA PLAZA SANTIAGO', N'', N'', 1)
INSERT [dbo].[TalleresRepuestos] ([id], [taller], [direccion], [telefono1], [telefono2], [estado]) VALUES (10, N'PINTURAS  WILSON', N'AV ANTONIO GUZMAN FDEZ SANTIAG', N'', N'', 1)
INSERT [dbo].[TalleresRepuestos] ([id], [taller], [direccion], [telefono1], [telefono2], [estado]) VALUES (11, N'AUTO REPUESTOS JYP', N'J ARMANDO BERMUDEZ SANTIAGO', N'8097241774', N'', 1)
INSERT [dbo].[TalleresRepuestos] ([id], [taller], [direccion], [telefono1], [telefono2], [estado]) VALUES (12, N'GOCEN AUTO REPUESTOS', N'HATO MAYOR SANTIAGO', N'', N'', 1)
INSERT [dbo].[TalleresRepuestos] ([id], [taller], [direccion], [telefono1], [telefono2], [estado]) VALUES (13, N'REPUESTOS NIBAJE ', N'AV FRANCO BIDO SANTIAGO', N'(809) 583-9215', N'', 1)
INSERT [dbo].[TalleresRepuestos] ([id], [taller], [direccion], [telefono1], [telefono2], [estado]) VALUES (14, N'JHONY PIMENTEL ', N'AV 27 FEBRERO EL DORADO  SANTIAGO', N'8099779606', N'', 1)
INSERT [dbo].[TalleresRepuestos] ([id], [taller], [direccion], [telefono1], [telefono2], [estado]) VALUES (15, N'DANIEL AUTO ADORNOS', N'PUEBLO NUEVO SANTIAGO', N'809) 724-6570', N'', 1)
SET IDENTITY_INSERT [dbo].[TalleresRepuestos] OFF
SET IDENTITY_INSERT [dbo].[TasaDolar] ON 

INSERT [dbo].[TasaDolar] ([id], [tasaDolar], [fechaActualizado]) VALUES (1, 4906, CAST(N'2018-04-25' AS Date))
SET IDENTITY_INSERT [dbo].[TasaDolar] OFF
SET IDENTITY_INSERT [dbo].[TiposCuenta] ON 

INSERT [dbo].[TiposCuenta] ([id], [tipoCuenta]) VALUES (1, N'CUENTA POR PAGAR')
INSERT [dbo].[TiposCuenta] ([id], [tipoCuenta]) VALUES (2, N'CUENTA POR COBRAR')
SET IDENTITY_INSERT [dbo].[TiposCuenta] OFF
SET IDENTITY_INSERT [dbo].[TiposPago] ON 

INSERT [dbo].[TiposPago] ([id], [formaPago]) VALUES (1, N'EFECTIVO')
INSERT [dbo].[TiposPago] ([id], [formaPago]) VALUES (2, N'VEHICULO RECIBIDO')
INSERT [dbo].[TiposPago] ([id], [formaPago]) VALUES (3, N'CREDITO')
INSERT [dbo].[TiposPago] ([id], [formaPago]) VALUES (4, N'OTRO')
SET IDENTITY_INSERT [dbo].[TiposPago] OFF
SET IDENTITY_INSERT [dbo].[Ubicaciones] ON 

INSERT [dbo].[Ubicaciones] ([id], [id_pais], [id_ciudad], [ubicacion], [estado]) VALUES (1, 1, 1, N'BELLA VISTA ', 1)
INSERT [dbo].[Ubicaciones] ([id], [id_pais], [id_ciudad], [ubicacion], [estado]) VALUES (2, 1, 1, N'Taller Jorge', 1)
INSERT [dbo].[Ubicaciones] ([id], [id_pais], [id_ciudad], [ubicacion], [estado]) VALUES (3, 1, 1, N'Jervin Auto Pintura', 1)
INSERT [dbo].[Ubicaciones] ([id], [id_pais], [id_ciudad], [ubicacion], [estado]) VALUES (4, 1, 1, N'Taller Pedro', 1)
INSERT [dbo].[Ubicaciones] ([id], [id_pais], [id_ciudad], [ubicacion], [estado]) VALUES (5, 1, 1, N'Felipe Auto Pintura', 1)
INSERT [dbo].[Ubicaciones] ([id], [id_pais], [id_ciudad], [ubicacion], [estado]) VALUES (6, 1, 1, N'ROBERTO DURAN ', 1)
INSERT [dbo].[Ubicaciones] ([id], [id_pais], [id_ciudad], [ubicacion], [estado]) VALUES (1006, 1, 1, N'SERGIO PERUANO', 1)
SET IDENTITY_INSERT [dbo].[Ubicaciones] OFF
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([id], [usuario], [clave], [nombreApellido], [tasaDolar], [crearUsuarios], [fabricantesModelos], [piezasRepuestos], [crearTaller], [crearPropietarios], [crearClientes], [crearGastos], [importarVehiculo], [compras], [cambiarEstadosVehiculo], [agreagarGastos], [agregarPiezas], [facturacion], [reportes], [estadoUsuario], [modificarVehiculo], [cuentasCobrar], [cuentasPagar], [actualizarDiarioTasa], [agregar_paises], [agregar_ciudades], [agregar_colores], [agregar_ubicaciones], [agregar_suplidores], [agregar_seguros]) VALUES (1, N'admin', N'admin', N'Administrador Sistema', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
SET IDENTITY_INSERT [dbo].[Vehiculos] ON 

INSERT [dbo].[Vehiculos] ([id], [fabricante_id], [modelo_id], [año], [color], [precioUSD], [precioRD], [id_cliente], [id_propietario], [terminado], [vendido], [pagado], [fecha_importe], [fecha_terminado], [fecha_vendido], [vin], [nota], [estado], [total_invertido_rd], [total_invertido_usd], [matricula], [cedula_vendedor], [acto_venta], [precioVentaRD], [precioVentaUSD], [id_suplidor], [id_ubicacion], [precio_estimado_rd], [precio_estimado_usd], [placa], [numero_matricula], [millaje], [fuerza_motriz]) VALUES (1, 42, 777, 2014, N'GRIS', CAST(9361.70 AS Decimal(18, 2)), CAST(440000.00 AS Decimal(18, 2)), 2, 30, 1, 1, 0, CAST(N'2018-04-25' AS Date), CAST(N'2018-04-25' AS Date), CAST(N'2018-04-25' AS Date), N'JM7GJ4S75E1111387', N'N/A', 1, CAST(440000.00 AS Decimal(18, 2)), CAST(9361.70 AS Decimal(18, 2)), 1, 1, 0, CAST(560000.00 AS Decimal(18, 2)), CAST(11914.89 AS Decimal(18, 2)), 1, 1, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'A639014', N'7818408', N'00000', N'2000')
INSERT [dbo].[Vehiculos] ([id], [fabricante_id], [modelo_id], [año], [color], [precioUSD], [precioRD], [id_cliente], [id_propietario], [terminado], [vendido], [pagado], [fecha_importe], [fecha_terminado], [fecha_vendido], [vin], [nota], [estado], [total_invertido_rd], [total_invertido_usd], [matricula], [cedula_vendedor], [acto_venta], [precioVentaRD], [precioVentaUSD], [id_suplidor], [id_ubicacion], [precio_estimado_rd], [precio_estimado_usd], [placa], [numero_matricula], [millaje], [fuerza_motriz]) VALUES (2, 42, 777, 2014, N'GRIS', CAST(90.50 AS Decimal(18, 2)), CAST(444000.00 AS Decimal(18, 2)), NULL, 30, 0, 0, 0, CAST(N'2018-04-19' AS Date), NULL, NULL, N'JM7GJ4F75E1111387', N'.', 1, CAST(444000.00 AS Decimal(18, 2)), CAST(90.50 AS Decimal(18, 2)), 1, 1, 0, NULL, NULL, 1, 3, CAST(500000.00 AS Decimal(18, 2)), CAST(101.92 AS Decimal(18, 2)), N'A639014', N'7818408', N'47515', N'2000')
INSERT [dbo].[Vehiculos] ([id], [fabricante_id], [modelo_id], [año], [color], [precioUSD], [precioRD], [id_cliente], [id_propietario], [terminado], [vendido], [pagado], [fecha_importe], [fecha_terminado], [fecha_vendido], [vin], [nota], [estado], [total_invertido_rd], [total_invertido_usd], [matricula], [cedula_vendedor], [acto_venta], [precioVentaRD], [precioVentaUSD], [id_suplidor], [id_ubicacion], [precio_estimado_rd], [precio_estimado_usd], [placa], [numero_matricula], [millaje], [fuerza_motriz]) VALUES (3, 42, 1328, 2007, N'AZUL', CAST(101.55 AS Decimal(18, 2)), CAST(498200.00 AS Decimal(18, 2)), NULL, 26, 0, 0, 0, CAST(N'2018-03-10' AS Date), NULL, NULL, N'MM7UNY0W370626096', N'.', 1, CAST(498200.00 AS Decimal(18, 2)), CAST(101.55 AS Decimal(18, 2)), 1, 1, 0, NULL, NULL, 5, 3, CAST(695000.00 AS Decimal(18, 2)), CAST(141.66 AS Decimal(18, 2)), N'L287897', N'3620423', N'0', N'2500')
INSERT [dbo].[Vehiculos] ([id], [fabricante_id], [modelo_id], [año], [color], [precioUSD], [precioRD], [id_cliente], [id_propietario], [terminado], [vendido], [pagado], [fecha_importe], [fecha_terminado], [fecha_vendido], [vin], [nota], [estado], [total_invertido_rd], [total_invertido_usd], [matricula], [cedula_vendedor], [acto_venta], [precioVentaRD], [precioVentaUSD], [id_suplidor], [id_ubicacion], [precio_estimado_rd], [precio_estimado_usd], [placa], [numero_matricula], [millaje], [fuerza_motriz]) VALUES (4, 28, 555, 2010, N'GRIS', CAST(64.82 AS Decimal(18, 2)), CAST(318000.00 AS Decimal(18, 2)), NULL, 20, 0, 0, 0, CAST(N'2016-09-29' AS Date), NULL, NULL, N'KMHEU41MBAA781185', N'.', 1, CAST(318000.00 AS Decimal(18, 2)), CAST(64.82 AS Decimal(18, 2)), 0, 0, 0, NULL, NULL, 8, 1, CAST(335000.00 AS Decimal(18, 2)), CAST(68.28 AS Decimal(18, 2)), N'A702976', N'7605551', N'0', N'2000')
INSERT [dbo].[Vehiculos] ([id], [fabricante_id], [modelo_id], [año], [color], [precioUSD], [precioRD], [id_cliente], [id_propietario], [terminado], [vendido], [pagado], [fecha_importe], [fecha_terminado], [fecha_vendido], [vin], [nota], [estado], [total_invertido_rd], [total_invertido_usd], [matricula], [cedula_vendedor], [acto_venta], [precioVentaRD], [precioVentaUSD], [id_suplidor], [id_ubicacion], [precio_estimado_rd], [precio_estimado_usd], [placa], [numero_matricula], [millaje], [fuerza_motriz]) VALUES (5, 28, 1329, 2011, N'GRIS', CAST(66.25 AS Decimal(18, 2)), CAST(325000.00 AS Decimal(18, 2)), NULL, 21, 0, 0, 0, CAST(N'2016-12-16' AS Date), NULL, NULL, N'KMHEU41MBBA805207', N'.', 1, CAST(325000.00 AS Decimal(18, 2)), CAST(66.25 AS Decimal(18, 2)), 0, 0, 0, NULL, NULL, 9, 1, CAST(350000.00 AS Decimal(18, 2)), CAST(71.34 AS Decimal(18, 2)), N'A716823', N'7823426', N'0', N'2000')
INSERT [dbo].[Vehiculos] ([id], [fabricante_id], [modelo_id], [año], [color], [precioUSD], [precioRD], [id_cliente], [id_propietario], [terminado], [vendido], [pagado], [fecha_importe], [fecha_terminado], [fecha_vendido], [vin], [nota], [estado], [total_invertido_rd], [total_invertido_usd], [matricula], [cedula_vendedor], [acto_venta], [precioVentaRD], [precioVentaUSD], [id_suplidor], [id_ubicacion], [precio_estimado_rd], [precio_estimado_usd], [placa], [numero_matricula], [millaje], [fuerza_motriz]) VALUES (6, 28, 555, 2011, N'GRIS', CAST(66.25 AS Decimal(18, 2)), CAST(325000.00 AS Decimal(18, 2)), NULL, 21, 0, 0, 0, CAST(N'2016-12-16' AS Date), NULL, NULL, N'KMHEU41MBBA809169', N'.', 1, CAST(325000.00 AS Decimal(18, 2)), CAST(66.25 AS Decimal(18, 2)), 0, 0, 0, NULL, NULL, 9, 6, CAST(350000.00 AS Decimal(18, 2)), CAST(71.34 AS Decimal(18, 2)), N'A716824', N'7823427', N'0', N'2000')
INSERT [dbo].[Vehiculos] ([id], [fabricante_id], [modelo_id], [año], [color], [precioUSD], [precioRD], [id_cliente], [id_propietario], [terminado], [vendido], [pagado], [fecha_importe], [fecha_terminado], [fecha_vendido], [vin], [nota], [estado], [total_invertido_rd], [total_invertido_usd], [matricula], [cedula_vendedor], [acto_venta], [precioVentaRD], [precioVentaUSD], [id_suplidor], [id_ubicacion], [precio_estimado_rd], [precio_estimado_usd], [placa], [numero_matricula], [millaje], [fuerza_motriz]) VALUES (7, 28, 1329, 2012, N'NARANJA', CAST(74.60 AS Decimal(18, 2)), CAST(366000.00 AS Decimal(18, 2)), NULL, 18, 0, 0, 0, CAST(N'2017-09-27' AS Date), NULL, NULL, N'KMHEC41LBCA386986', N'.', 1, CAST(366000.00 AS Decimal(18, 2)), CAST(74.60 AS Decimal(18, 2)), 0, 0, 0, NULL, NULL, 9, 1, CAST(385000.00 AS Decimal(18, 2)), CAST(78.48 AS Decimal(18, 2)), N'A748303', N'8294006', N'0', N'2000')
INSERT [dbo].[Vehiculos] ([id], [fabricante_id], [modelo_id], [año], [color], [precioUSD], [precioRD], [id_cliente], [id_propietario], [terminado], [vendido], [pagado], [fecha_importe], [fecha_terminado], [fecha_vendido], [vin], [nota], [estado], [total_invertido_rd], [total_invertido_usd], [matricula], [cedula_vendedor], [acto_venta], [precioVentaRD], [precioVentaUSD], [id_suplidor], [id_ubicacion], [precio_estimado_rd], [precio_estimado_usd], [placa], [numero_matricula], [millaje], [fuerza_motriz]) VALUES (8, 28, 1329, 2014, N'MAMEY', CAST(70.32 AS Decimal(18, 2)), CAST(345000.00 AS Decimal(18, 2)), NULL, 18, 0, 0, 0, CAST(N'2018-01-04' AS Date), NULL, NULL, N'KMHEC41LBEA611425', N'.', 1, CAST(345000.00 AS Decimal(18, 2)), CAST(70.32 AS Decimal(18, 2)), 0, 0, 0, NULL, NULL, 9, 1, CAST(460000.00 AS Decimal(18, 2)), CAST(93.76 AS Decimal(18, 2)), N'A760665', N'8599075', N'0', N'2000')
INSERT [dbo].[Vehiculos] ([id], [fabricante_id], [modelo_id], [año], [color], [precioUSD], [precioRD], [id_cliente], [id_propietario], [terminado], [vendido], [pagado], [fecha_importe], [fecha_terminado], [fecha_vendido], [vin], [nota], [estado], [total_invertido_rd], [total_invertido_usd], [matricula], [cedula_vendedor], [acto_venta], [precioVentaRD], [precioVentaUSD], [id_suplidor], [id_ubicacion], [precio_estimado_rd], [precio_estimado_usd], [placa], [numero_matricula], [millaje], [fuerza_motriz]) VALUES (9, 33, 1334, 2013, N'AZUL', CAST(101.92 AS Decimal(18, 2)), CAST(500000.00 AS Decimal(18, 2)), NULL, 18, 0, 0, 0, CAST(N'2017-05-18' AS Date), NULL, NULL, N'KNAGN418BDA316434', N'.', 1, CAST(500000.00 AS Decimal(18, 2)), CAST(101.92 AS Decimal(18, 2)), 0, 0, 0, NULL, NULL, 9, 1, CAST(550000.00 AS Decimal(18, 2)), CAST(112.11 AS Decimal(18, 2)), N'A732455', N'8089998', N'0', N'2000')
INSERT [dbo].[Vehiculos] ([id], [fabricante_id], [modelo_id], [año], [color], [precioUSD], [precioRD], [id_cliente], [id_propietario], [terminado], [vendido], [pagado], [fecha_importe], [fecha_terminado], [fecha_vendido], [vin], [nota], [estado], [total_invertido_rd], [total_invertido_usd], [matricula], [cedula_vendedor], [acto_venta], [precioVentaRD], [precioVentaUSD], [id_suplidor], [id_ubicacion], [precio_estimado_rd], [precio_estimado_usd], [placa], [numero_matricula], [millaje], [fuerza_motriz]) VALUES (10, 48, 1335, 2005, N'BLANCO', CAST(72.56 AS Decimal(18, 2)), CAST(356000.00 AS Decimal(18, 2)), NULL, 25, 0, 0, 0, CAST(N'2018-02-08' AS Date), NULL, NULL, N'JMYLYV78W5J000469', N'SUPLIDOR: JORGE PICHARDO (VELOZ MOVIL)', 1, CAST(356000.00 AS Decimal(18, 2)), CAST(72.56 AS Decimal(18, 2)), 0, 0, 0, NULL, NULL, 10, 1, CAST(440000.00 AS Decimal(18, 2)), CAST(89.69 AS Decimal(18, 2)), N'G113044', N'8496377', N'0', N'3200')
INSERT [dbo].[Vehiculos] ([id], [fabricante_id], [modelo_id], [año], [color], [precioUSD], [precioRD], [id_cliente], [id_propietario], [terminado], [vendido], [pagado], [fecha_importe], [fecha_terminado], [fecha_vendido], [vin], [nota], [estado], [total_invertido_rd], [total_invertido_usd], [matricula], [cedula_vendedor], [acto_venta], [precioVentaRD], [precioVentaUSD], [id_suplidor], [id_ubicacion], [precio_estimado_rd], [precio_estimado_usd], [placa], [numero_matricula], [millaje], [fuerza_motriz]) VALUES (11, 48, 1336, 2006, N'VERDE/GRIS', CAST(78.48 AS Decimal(18, 2)), CAST(385000.00 AS Decimal(18, 2)), NULL, 33, 0, 0, 0, CAST(N'2018-04-20' AS Date), NULL, NULL, N'MMBJRK7406D000890', N'.', 1, CAST(385000.00 AS Decimal(18, 2)), CAST(78.48 AS Decimal(18, 2)), 0, 0, 0, NULL, NULL, 11, 3, CAST(435000.00 AS Decimal(18, 2)), CAST(88.67 AS Decimal(18, 2)), N'L205331', N'4259243', N'0', N'2477')
INSERT [dbo].[Vehiculos] ([id], [fabricante_id], [modelo_id], [año], [color], [precioUSD], [precioRD], [id_cliente], [id_propietario], [terminado], [vendido], [pagado], [fecha_importe], [fecha_terminado], [fecha_vendido], [vin], [nota], [estado], [total_invertido_rd], [total_invertido_usd], [matricula], [cedula_vendedor], [acto_venta], [precioVentaRD], [precioVentaUSD], [id_suplidor], [id_ubicacion], [precio_estimado_rd], [precio_estimado_usd], [placa], [numero_matricula], [millaje], [fuerza_motriz]) VALUES (12, 26, 1337, 2007, N'NEGRO', CAST(65.23 AS Decimal(18, 2)), CAST(320000.00 AS Decimal(18, 2)), NULL, 16, 0, 0, 0, CAST(N'2017-07-18' AS Date), NULL, NULL, N'5J6YH189X7L008257', N'.', 1, CAST(320000.00 AS Decimal(18, 2)), CAST(65.23 AS Decimal(18, 2)), 0, 0, 0, NULL, NULL, 12, 3, CAST(360000.00 AS Decimal(18, 2)), CAST(73.38 AS Decimal(18, 2)), N'G274407', N'05157999', N'0', N'2200')
INSERT [dbo].[Vehiculos] ([id], [fabricante_id], [modelo_id], [año], [color], [precioUSD], [precioRD], [id_cliente], [id_propietario], [terminado], [vendido], [pagado], [fecha_importe], [fecha_terminado], [fecha_vendido], [vin], [nota], [estado], [total_invertido_rd], [total_invertido_usd], [matricula], [cedula_vendedor], [acto_venta], [precioVentaRD], [precioVentaUSD], [id_suplidor], [id_ubicacion], [precio_estimado_rd], [precio_estimado_usd], [placa], [numero_matricula], [millaje], [fuerza_motriz]) VALUES (1002, 26, 2328, 2000, N'VERDE', CAST(56.05 AS Decimal(18, 2)), CAST(275000.00 AS Decimal(18, 2)), NULL, 15, 0, 0, 0, CAST(N'2017-04-26' AS Date), NULL, NULL, N'RD11048389', N'.', 1, CAST(275000.00 AS Decimal(18, 2)), CAST(56.05 AS Decimal(18, 2)), 0, 0, 0, NULL, NULL, 1005, 1006, CAST(295000.00 AS Decimal(18, 2)), CAST(60.13 AS Decimal(18, 2)), N'G035159', N'2028515', N'0', N'2000')
INSERT [dbo].[Vehiculos] ([id], [fabricante_id], [modelo_id], [año], [color], [precioUSD], [precioRD], [id_cliente], [id_propietario], [terminado], [vendido], [pagado], [fecha_importe], [fecha_terminado], [fecha_vendido], [vin], [nota], [estado], [total_invertido_rd], [total_invertido_usd], [matricula], [cedula_vendedor], [acto_venta], [precioVentaRD], [precioVentaUSD], [id_suplidor], [id_ubicacion], [precio_estimado_rd], [precio_estimado_usd], [placa], [numero_matricula], [millaje], [fuerza_motriz]) VALUES (1003, 20, 2330, 2005, N'BLANCO', CAST(38.12 AS Decimal(18, 2)), CAST(187000.00 AS Decimal(18, 2)), NULL, 22, 0, 0, 0, CAST(N'2017-06-28' AS Date), NULL, NULL, N'9BD25521658744436', N'.', 1, CAST(187000.00 AS Decimal(18, 2)), CAST(38.12 AS Decimal(18, 2)), 1, 1, 0, NULL, NULL, 1006, 3, CAST(220000.00 AS Decimal(18, 2)), CAST(44.84 AS Decimal(18, 2)), N'L176231', N'8074471', N'0', N'1000')
INSERT [dbo].[Vehiculos] ([id], [fabricante_id], [modelo_id], [año], [color], [precioUSD], [precioRD], [id_cliente], [id_propietario], [terminado], [vendido], [pagado], [fecha_importe], [fecha_terminado], [fecha_vendido], [vin], [nota], [estado], [total_invertido_rd], [total_invertido_usd], [matricula], [cedula_vendedor], [acto_venta], [precioVentaRD], [precioVentaUSD], [id_suplidor], [id_ubicacion], [precio_estimado_rd], [precio_estimado_usd], [placa], [numero_matricula], [millaje], [fuerza_motriz]) VALUES (1004, 30, 2331, 2008, N'GRIS', CAST(147.78 AS Decimal(18, 2)), CAST(725000.00 AS Decimal(18, 2)), NULL, 24, 0, 0, 0, CAST(N'2017-03-26' AS Date), NULL, NULL, N'MPATFS85H8H505050', N'.', 1, CAST(725000.00 AS Decimal(18, 2)), CAST(147.78 AS Decimal(18, 2)), 1, 1, 1, NULL, NULL, 3, 1, CAST(850000.00 AS Decimal(18, 2)), CAST(173.26 AS Decimal(18, 2)), N'L247412', N'4485490', N'0', N'3000')
INSERT [dbo].[Vehiculos] ([id], [fabricante_id], [modelo_id], [año], [color], [precioUSD], [precioRD], [id_cliente], [id_propietario], [terminado], [vendido], [pagado], [fecha_importe], [fecha_terminado], [fecha_vendido], [vin], [nota], [estado], [total_invertido_rd], [total_invertido_usd], [matricula], [cedula_vendedor], [acto_venta], [precioVentaRD], [precioVentaUSD], [id_suplidor], [id_ubicacion], [precio_estimado_rd], [precio_estimado_usd], [placa], [numero_matricula], [millaje], [fuerza_motriz]) VALUES (1005, 30, 2331, 2008, N'GRIS', CAST(147.78 AS Decimal(18, 2)), CAST(725000.00 AS Decimal(18, 2)), NULL, 24, 0, 0, 0, CAST(N'2017-03-26' AS Date), NULL, NULL, N'MPATFS85H8D505050', N'.', 1, CAST(725000.00 AS Decimal(18, 2)), CAST(147.78 AS Decimal(18, 2)), 1, 1, 1, NULL, NULL, 3, 1, CAST(850000.00 AS Decimal(18, 2)), CAST(173.26 AS Decimal(18, 2)), N'L247412', N'4485490', N'0', N'3000')
INSERT [dbo].[Vehiculos] ([id], [fabricante_id], [modelo_id], [año], [color], [precioUSD], [precioRD], [id_cliente], [id_propietario], [terminado], [vendido], [pagado], [fecha_importe], [fecha_terminado], [fecha_vendido], [vin], [nota], [estado], [total_invertido_rd], [total_invertido_usd], [matricula], [cedula_vendedor], [acto_venta], [precioVentaRD], [precioVentaUSD], [id_suplidor], [id_ubicacion], [precio_estimado_rd], [precio_estimado_usd], [placa], [numero_matricula], [millaje], [fuerza_motriz]) VALUES (1006, 67, 1333, 2008, N'DORADO', CAST(191.43 AS Decimal(18, 2)), CAST(939150.00 AS Decimal(18, 2)), NULL, 35, 0, 0, 0, CAST(N'2018-04-02' AS Date), NULL, NULL, N'8AJFZ29G406048589', N'.', 1, CAST(939150.00 AS Decimal(18, 2)), CAST(191.43 AS Decimal(18, 2)), 0, 0, 0, NULL, NULL, 1007, 3, CAST(1080000.00 AS Decimal(18, 2)), CAST(220.14 AS Decimal(18, 2)), N'L247775', N'5953381', N'0', N'3000')
INSERT [dbo].[Vehiculos] ([id], [fabricante_id], [modelo_id], [año], [color], [precioUSD], [precioRD], [id_cliente], [id_propietario], [terminado], [vendido], [pagado], [fecha_importe], [fecha_terminado], [fecha_vendido], [vin], [nota], [estado], [total_invertido_rd], [total_invertido_usd], [matricula], [cedula_vendedor], [acto_venta], [precioVentaRD], [precioVentaUSD], [id_suplidor], [id_ubicacion], [precio_estimado_rd], [precio_estimado_usd], [placa], [numero_matricula], [millaje], [fuerza_motriz]) VALUES (1007, 30, 2332, 1999, N'BLANCO', CAST(42.80 AS Decimal(18, 2)), CAST(210000.00 AS Decimal(18, 2)), NULL, 22, 0, 0, 0, CAST(N'2017-07-04' AS Date), NULL, NULL, N'JAATFS54HX7101581', N'.', 1, CAST(260000.00 AS Decimal(18, 2)), CAST(52.99 AS Decimal(18, 2)), 1, 1, 0, NULL, NULL, 1, 1, CAST(380000.00 AS Decimal(18, 2)), CAST(77.46 AS Decimal(18, 2)), N'L247412', N'4485490', N'0', N'3000')
SET IDENTITY_INSERT [dbo].[Vehiculos] OFF
ALTER TABLE [dbo].[Settings] ADD  CONSTRAINT [DF_Settings_activado]  DEFAULT ((0)) FOR [activado]
GO
ALTER TABLE [dbo].[Settings] ADD  CONSTRAINT [DF_Settings_primeraCorrida]  DEFAULT ((0)) FOR [primeraCorrida]
GO
/****** Object:  StoredProcedure [dbo].[activar_software]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[activar_software]
@mensaje int output
as
set @mensaje = 0;
declare @fechaActivacion date = (select getdate())
declare @fechaVencimiento date = (select DATEADD(DAY, 365, getdate()))
begin
  update SerialKeyActivation set fechaActivacion = @fechaActivacion, fechaVencimiento = @fechaVencimiento
  where id = 1
  set @mensaje = 1;
	
end


GO
/****** Object:  StoredProcedure [dbo].[actualizar_ciudad]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	create procedure [dbo].[actualizar_ciudad]
	@idCiudad int, @idPais int, @ciudad varchar(100), @estado bit, @mensaje int output
	as
	set @mensaje = 0
	begin
		Update Ciudades set ciudad = @ciudad, estado = @estado, idPais = @idPais where id = @idCiudad
		set @mensaje = 1
	end


GO
/****** Object:  StoredProcedure [dbo].[actualizar_cliente]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[actualizar_cliente]
@idCliente int,@cliente varchar(200), @cedulaRNC varchar(50), @tel varchar(50), @estado bit, @mensaje int output,
@direccion varchar(200), @idPais int, @idCiudad int
as
set @mensaje = 0

begin

	
	update Clientes set cliente = @cliente, rnc_cedula = @cedulaRNC, telefono = @tel, estado = @estado, 
	direccion = @direccion, id_pais = @idPais, id_ciudad = @idCiudad
	where id = @idCliente
	set @mensaje = 1

end



GO
/****** Object:  StoredProcedure [dbo].[actualizar_color]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	

	create procedure [dbo].[actualizar_color]
	@idColor int, @color varchar(100), @estadoColor bit, @mensaje int output
	as
	set @mensaje = 0
	begin
		Update Colores set color = @color, estado = @estadoColor where id = @idColor
		set @mensaje = 1
	end


GO
/****** Object:  StoredProcedure [dbo].[actualizar_componentes]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[actualizar_componentes]
@id int, @componente varchar(200), @precioUsd decimal, 
@precioRd decimal, @estado bit, @mensaje int output
as
set @mensaje = 0

begin

	
		update Componentes set componente = @componente, precio_rd = @precioRd, precio_usd = @precioUsd, estado = @estado
		where id = @id
		set @mensaje = 1

		
end





GO
/****** Object:  StoredProcedure [dbo].[actualizar_fabricante]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[actualizar_fabricante]
@idFabricante int ,@fabricante varchar(50), @codigo varchar(50), @estado bit, @mensaje int output
as
set @mensaje = 0
begin
	update Fabricantes
	set fabricante = @fabricante, codigo = @codigo, estado = @estado
	where id = @idFabricante
	set @mensaje = 1
end





GO
/****** Object:  StoredProcedure [dbo].[actualizar_gasto]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[actualizar_gasto]
@idGasto int,@descripcion varchar(250),@tipo varchar(50), @estado bit, @mensaje int output
as
set @mensaje = 0

begin

	
			update Gastos set descripcion = @descripcion, tipo = @tipo, estado = @estado
			where id = @idGasto
			set @mensaje = 1

	
end





GO
/****** Object:  StoredProcedure [dbo].[actualizar_imagenes_clientes]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[actualizar_imagenes_clientes]
@img varbinary(max), @mensaje int output, @idCliente int
as
set @mensaje = 0;

begin
	insert into ImagenesClientes(idCliente,img)
	Values (@idCliente, @img)
	set @mensaje = 1;
	
end


GO
/****** Object:  StoredProcedure [dbo].[actualizar_modelo]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[actualizar_modelo]
@idModelo int ,@modelo varchar(50), @codigo varchar(50), @estado bit,@mensaje int output
as
set @mensaje = 0
begin
	update Modelos 
	set modelo = @modelo, codigo = @codigo, estado = @estado
	where id = @idModelo
	set @mensaje = 1
end





GO
/****** Object:  StoredProcedure [dbo].[actualizar_pais]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	create procedure [dbo].[actualizar_pais]
	@idPais int, @pais varchar(100), @estadoPais bit, @mensaje int output
	as
	set @mensaje = 0
	begin
		Update Paises set pais = @pais, estado = @estadoPais where id = @idPais
		set @mensaje = 1
	end


GO
/****** Object:  StoredProcedure [dbo].[actualizar_propietario]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[actualizar_propietario]
@idPropietario int, @propietario varchar(50), @tel varchar(50), @estado bit, @mensaje int output, @direccion varchar(200),
@rncCedula varchar(50)
as
set @mensaje = 0

begin

	
	update Propietarios set nombre = @propietario, telefono = @tel, estado = @estado, direccion = @direccion, rncCedula = @rncCedula
	where id = @idPropietario
	set @mensaje = 1

end





GO
/****** Object:  StoredProcedure [dbo].[actualizar_seguro]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	create procedure [dbo].[actualizar_seguro]
	@idSeguro int, @nombre varchar(100),@telefono varchar(50) ,@estado bit, @mensaje int output
	as
	set @mensaje = 0
	begin
		Update Seguros set nombre = @nombre,telefono = @telefono ,estado = @estado where id = @idSeguro
		set @mensaje = 1
	end


GO
/****** Object:  StoredProcedure [dbo].[actualizar_suplidor]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	create procedure [dbo].[actualizar_suplidor]
	@idSuplidor int, @suplidor varchar(100), @rnc_cedula varchar(100), @idPais int, @idCiudad int , @direccion varchar(100),
	@telefono varchar(100) ,@estado bit, @mensaje int output
	as
	set @mensaje = 0;
	begin
		Update Suplidores set suplidor = @suplidor, rnc_cedula = @rnc_cedula, id_pais = @idPais, 
		id_ciudad = @idCiudad, direccion = @direccion, telefono = @telefono, estado = @estado
		where id = @idSuplidor
		set @mensaje = 1;
	
	end



GO
/****** Object:  StoredProcedure [dbo].[actualizar_talleres]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[actualizar_talleres]
@idTaller int, @taller varchar(100), @direccion varchar(200),@tel1 varchar(50), @tel2 varchar(50),@estado bit, @mensaje int output
as
set @mensaje = 0

begin

	
	update TalleresRepuestos set taller = @taller, direccion = @direccion, telefono1 = @tel1, telefono2 = @tel2, estado = @estado
	where id = @idTaller
	
	set @mensaje = 1
	
end





GO
/****** Object:  StoredProcedure [dbo].[actualizar_tasa_dolar]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[actualizar_tasa_dolar]
@tasaDolar float, @mensaje bit output
as
set @mensaje = 0;
begin

	update TasaDolar set tasaDolar = @tasaDolar, fechaActualizado = GETDATE() where id = 1
	set @mensaje = 1

end


GO
/****** Object:  StoredProcedure [dbo].[actualizar_ubicacion]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	

	create procedure [dbo].[actualizar_ubicacion]
	@idUbicacion int, @ubicacion varchar(100), @estadoUbicacion bit, @mensaje int output, @idPais int,
	@idCiudad int
	as
	set @mensaje = 0
	begin
		Update Ubicaciones set ubicacion = @ubicacion, estado = @estadoUbicacion,
		id_pais = @idPais, id_ciudad = @idCiudad 
		where id = @idUbicacion
		set @mensaje = 1
	end


GO
/****** Object:  StoredProcedure [dbo].[actualizar_usuarios]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[actualizar_usuarios]
@usuario varchar(50), @nombre varchar(50), @clave varchar(50), @tasaDolar bit, @crearUsuarios bit,
@fabricantesModelos bit, @piezasRepuestos bit, @crearTaller bit, @crearPropietarios bit, @crearClientes bit, 
@crearGastos bit, @importarVehiculos bit, @compras bit, @cambiarEstadosVehiculos bit, @agregarGastos bit,
@agregarPiezas bit, @facturacion bit, @reportes bit, @estado bit, @mensaje int output, @idUsuario int,
@modificarVehiculo bit, @cuentasPagar bit, @cuentasCobrar bit, @actualizarTasaDiario bit, @crearPais bit, @crearCiudad bit, @crearSuplidor bit,
@crearColor bit, @crearUbicacion bit, @crearSeguros bit
as
set @mensaje = 0

begin

	if not exists(select * from Usuarios where usuario = @usuario and id != @idUsuario)
		begin
			update Usuarios set usuario = @usuario, clave = @clave, nombreApellido = @nombre, tasaDolar = @tasaDolar, 
			crearUsuarios = @crearUsuarios, fabricantesModelos = @fabricantesModelos, piezasRepuestos = @piezasRepuestos, 
			crearTaller = @crearTaller, crearPropietarios = @crearPropietarios, crearClientes = @crearClientes, 
			crearGastos = @crearGastos, importarVehiculo = @importarVehiculos, compras = @compras, 
			cambiarEstadosVehiculo = @cambiarEstadosVehiculos, agreagarGastos = @agregarGastos, agregarPiezas = @agregarPiezas, 
			facturacion = @facturacion, reportes = @reportes, estadoUsuario = @estado, modificarVehiculo = @modificarVehiculo,
			cuentasCobrar = @cuentasCobrar, cuentasPagar = @cuentasPagar, actualizarDiarioTasa = @actualizarTasaDiario,
			agregar_paises = @crearPais, agregar_ciudades = @crearCiudad, agregar_suplidores = @crearSuplidor,
			agregar_colores = @crearColor, agregar_ubicaciones = @crearUbicacion, agregar_seguros = @crearSeguros
			
			where id = @idUsuario
			set @mensaje = 1

		end

	else
		begin 
			set @mensaje = 2
		end
end



GO
/****** Object:  StoredProcedure [dbo].[actualizar_vehiculo]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[actualizar_vehiculo]
@idVehiculo int,@vin varchar(50), @idPropietario int,
@nota varchar(250), @mensaje int output, @color varchar(50),
@idUbicacion varchar(50),
@matriculaOriginal bit, @cedulaVendedor bit, @actoVenta bit,
@rdPrecioVentaEstimado float,
@usdPrecioVentaEstimado float, @placa varchar(30), @numeroMatricula varchar(100), @millaje varchar(100),
@fuerzaMotriz varchar(30), @idSuplidor int, @año int, @fecha date
as
set @mensaje = 0

begin

    update Vehiculos set 
	id_propietario = @idPropietario, vin = @vin, nota = @nota,
	color = @color,id_ubicacion = @idUbicacion, 
    matricula =	@matriculaOriginal, acto_venta = @actoVenta, cedula_vendedor =  @cedulaVendedor,
	precio_estimado_rd = @rdPrecioVentaEstimado, precio_estimado_usd = @usdPrecioVentaEstimado, 
	placa = @placa, numero_matricula = @numeroMatricula,
	millaje = @millaje, fuerza_motriz = @fuerzaMotriz, id_suplidor = @idSuplidor, año = @año
	where id = @idVehiculo
	
	declare @ultimaUbicacion int= (SELECT TOP 1 id_ubicacion FROM HistorialUbicaciones where id_vehiculo = @idVehiculo ORDER BY ID DESC)
	if @ultimaUbicacion != @idUbicacion
		begin
			insert into HistorialUbicaciones(id_vehiculo,id_ubicacion, fecha) 
			Values (@idVehiculo, @idUbicacion, @fecha)
		end
	set @mensaje = 1
end



GO
/****** Object:  StoredProcedure [dbo].[asignar_componente_vehiculo]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[asignar_componente_vehiculo]
@idVehiculo int, @idComponente int,@precioRD float, @precioUSD float ,@mensaje int output
as
set @mensaje = 0
begin
	if not exists(select * from DetalleComponentes where idVehiculo = @idVehiculo and idComponente = @idComponente)
		begin
			insert into DetalleComponentes(idVehiculo, idComponente, precioRD, precioUSD)
			VALUES (@idVehiculo, @idComponente, @precioRD, @precioUSD)
			
			update Vehiculos set total_invertido_rd = total_invertido_rd + @precioRD, total_invertido_usd = total_invertido_usd + @precioUSD
			where id = @idVehiculo
			set @mensaje = 1
		end

	else
		begin
			set @mensaje = 2
		end
end





GO
/****** Object:  StoredProcedure [dbo].[asignar_gasto_aduanal_vehiculo]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[asignar_gasto_aduanal_vehiculo]
@idVehiculo int, @idGasto int,@precioRD decimal, @precioUSD decimal , @mensaje int output
as
set @mensaje = 0
begin
	if not exists(select * from DetalleGastosAduanales where idVehiculo = @idVehiculo and idGastoAduanal = @idGasto)
		begin
			insert into DetalleGastosAduanales(idVehiculo, idGastoAduanal, precioRD, precioUSD)
			VALUES (@idVehiculo, @idGasto, @precioRD, @precioUSD)

			update Vehiculos set total_invertido_rd = total_invertido_rd + @precioRD, total_invertido_usd = total_invertido_usd + @precioUSD
			where id = @idVehiculo
			set @mensaje = 1
		end

	else
		begin
			set @mensaje = 2
		end
end





GO
/****** Object:  StoredProcedure [dbo].[asignar_gasto_reparacion_vehiculo]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[asignar_gasto_reparacion_vehiculo]
@idVehiculo int, @idGasto int,@precioRD decimal, @precioUSD decimal ,@idTaller int, @mensaje int output
as
set @mensaje = 0
begin
	if not exists(select * from DetallesGastosReparaciones where idVehiculo = @idVehiculo and idMantenimiento = @idGasto)
		begin
			insert into DetallesGastosReparaciones(idVehiculo, idMantenimiento, precioRD, precioUSD, idTaller)
			VALUES (@idVehiculo, @idGasto, @precioRD, @precioUSD, @idTaller)

			update Vehiculos set total_invertido_rd = total_invertido_rd + @precioRD, total_invertido_usd = total_invertido_usd + @precioUSD
			where id = @idVehiculo
			set @mensaje = 1
		end

	else
		begin
			set @mensaje = 2
		end
end





GO
/****** Object:  StoredProcedure [dbo].[borrar_compra_y_detalles_pagos]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[borrar_compra_y_detalles_pagos]
as

begin

	declare @idVehiculo int = (Select MAX(id) from Vehiculos)
	Delete from Vehiculos where id = @idVehiculo
	Delete from CuentasPagar where id_vehiculo = @idVehiculo
	Delete from FormaCompraVehiculo where id_vehiculo = @idVehiculo
	
end



GO
/****** Object:  StoredProcedure [dbo].[borrar_imagen_cliente]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[borrar_imagen_cliente]
@id int, @mensaje int output
as
set @mensaje = 0;
begin
	delete from ImagenesClientes where id = @id
	set @mensaje = 1;
end



GO
/****** Object:  StoredProcedure [dbo].[borrar_venta_y_detalles_pagos]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[borrar_venta_y_detalles_pagos]
@idVehiculo int
as
--declare @idVehiculo int = 1;
begin

	update Vehiculos set vendido = 0, fecha_vendido = null, id_cliente = null,
			precioVentaRD = null, precioVentaUSD = null
			where id = @idVehiculo
	Delete from CuentasPagar where id_vehiculo = @idVehiculo
	Delete from CuentasCobrar where id_vehiculo = @idVehiculo
	delete from facturas where idVehiculo = @idVehiculo
	Delete from FormaVentaVehiculo where id_vehiculo = @idVehiculo
	Delete from DetallesEfectivoGeneral where idVehiculo = @idVehiculo
	Delete from SeguroVehiculo where id_vehiculo = @idVehiculo
	Delete from PreciosTraspasoVehiculo where id_vehiculo = @idVehiculo
	Delete from PreciosSeguroVehiculo where id_vehiculo = @idVehiculo
	Delete from CuentasPagar where id_vehiculo = @idVehiculo and id_transaccion = 4
	 

end


GO
/****** Object:  StoredProcedure [dbo].[cambiar_estados_vehiculo]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[cambiar_estados_vehiculo]
@idVehiculo int, @tipoEstado varchar(50), @mensaje int output
as

set @mensaje = 0
begin
	
	    if @tipoEstado = 'terminar'
		begin
			update Vehiculos set terminado = 1, fecha_terminado = GETDATE()  where id = @idVehiculo
			set @mensaje = 1
		end
	else --poner en proceso 
		begin 
			update Vehiculos set terminado = 0, vendido = 0 where id = @idVehiculo
			set @mensaje = 1
		end
end





GO
/****** Object:  StoredProcedure [dbo].[deshabilitar_vehiculo]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[deshabilitar_vehiculo]
@idVehiculo int, @mensaje int output
as
set @mensaje = 0

begin

	
	update Vehiculos set estado = 0 where id = @idVehiculo
	set @mensaje = 1

end





GO
/****** Object:  StoredProcedure [dbo].[eliminar_componente_vehiculo]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[eliminar_componente_vehiculo]
@idVehiculo int, @idComponente int, @mensaje int output
as
set @mensaje = 0

begin

	declare @precioRD float
	set @precioRD = (select monto_rd from GastoVehiculo where id  = @idComponente and id_vehiculo =  @idVehiculo)
	declare @precioUSD float 
	set @precioUSD = (select monto_usd from GastoVehiculo where id  = @idComponente and id_vehiculo =  @idVehiculo)
	

	update Vehiculos set total_invertido_rd = total_invertido_rd - @precioRD, total_invertido_usd = total_invertido_usd - @precioUSD
	where id = @idVehiculo

	declare @idCP int= (select id from CuentasPagar where id_gasto = @idComponente)
	
	delete from PagosCuentasPagar where id = @idCP
	delete from FormaCompraVehiculo where id_vehiculo = @idVehiculo and id_transaccion = 5
	delete from CuentasPagar where id = @idCP

	delete from GastoVehiculo where id = @idComponente and id_vehiculo =  @idVehiculo
	
	set @mensaje = 1
		
end



GO
/****** Object:  StoredProcedure [dbo].[eliminar_gasto_aduanal_vehiculo]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[eliminar_gasto_aduanal_vehiculo]
@idVehiculo int, @idGasto int,@mensaje int output
as
set @mensaje = 0
begin
	
	declare @precioRD float
	set @precioRD = (select monto_rd from GastoVehiculo where id  = @idGasto and id_vehiculo =  @idVehiculo)
	declare @precioUSD float 
	set @precioUSD = (select monto_usd from GastoVehiculo where id  = @idGasto and id_vehiculo =  @idVehiculo)
	

	update Vehiculos set total_invertido_rd = total_invertido_rd - @precioRD, total_invertido_usd = total_invertido_usd - @precioUSD
	where id = @idVehiculo

	declare @idCP int= (select id from CuentasPagar where id_gasto = @idGasto)
	
	delete from PagosCuentasPagar where id = @idCP
	delete from FormaCompraVehiculo where id_vehiculo = @idVehiculo and id_transaccion = 7
	delete from CuentasPagar where id = @idCP

	delete from GastoVehiculo where id = @idGasto and id_vehiculo =  @idVehiculo
	set @mensaje = 1
		
end



GO
/****** Object:  StoredProcedure [dbo].[eliminar_gasto_reparacion_vehiculo]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[eliminar_gasto_reparacion_vehiculo]
@idVehiculo int, @idGasto int,@mensaje int output
as
set @mensaje = 0
begin
	
	declare @precioRD float
	set @precioRD = (select monto_rd from GastoVehiculo where id  = @idGasto and id_vehiculo =  @idVehiculo)
	declare @precioUSD float 
	set @precioUSD = (select monto_usd from GastoVehiculo where id  = @idGasto and id_vehiculo =  @idVehiculo)
	

	update Vehiculos set total_invertido_rd = total_invertido_rd - @precioRD, total_invertido_usd = total_invertido_usd - @precioUSD
	where id = @idVehiculo
	
	declare @idCP int= (select id from CuentasPagar where id_gasto = @idGasto)
	
	delete from PagosCuentasPagar where id = @idCP
	delete from FormaCompraVehiculo where id_vehiculo = @idVehiculo and id_transaccion = 6
	delete from CuentasPagar where id = @idCP
	delete from GastoVehiculo where id = @idGasto and id_vehiculo =  @idVehiculo
	set @mensaje = 1
		
end



GO
/****** Object:  StoredProcedure [dbo].[habilitar_vehiculo]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[habilitar_vehiculo]
@idVehiculo int, @mensaje int output
as
set @mensaje = 0

begin
	update Vehiculos set estado = 1 where id = @idVehiculo
	set @mensaje = 1
end





GO
/****** Object:  StoredProcedure [dbo].[inicio_sesion]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[inicio_sesion]
@usuario varchar(50), @clave varchar(50), @mensaje int output
as

set @mensaje = 0
begin
	if exists (select id from Usuarios where estadoUsuario = 1 and usuario = @usuario and clave = @clave )
		begin
			set @mensaje = (select id from Usuarios where usuario = @usuario and clave = @clave)
		end	
end





GO
/****** Object:  StoredProcedure [dbo].[insertar_detalle_pago_compras_vehiculo]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[insertar_detalle_pago_compras_vehiculo]
@pagoRD float, @pagoUSD float, @mensaje int output, @idTipoPago int, 
@detalles varchar(200)

as
set @mensaje = 0
declare @idVehiculo int = (SELECT MAX(id) from Vehiculos)
declare @fecha date = (select fecha_importe from Vehiculos where id = @idVehiculo)

begin
		
				
		insert into TipoFormaPagoCompraVehiculo (idVehiculo, idTipoPago, montoRD, montoUSD, detalles, balanceRD, balanceUSD)
		VALUES (@idVehiculo, @idTipoPago , @pagoRD, @pagoUSD, @detalles, @pagoRD, @pagoUSD)
		

		if @idTipoPago = 1
			begin
				 insert into DetallesEfectivoGeneral(idVehiculo, tipoCuenta, montoRD, montoUSD, fecha, documento, numeroDocumento)
				 values (@idVehiculo, 1, @pagoRD, @pagoUSD, @fecha, 'COMPRA VEHICULO', @idVehiculo)
			end
		set @mensaje = 1
			
		
				
end





GO
/****** Object:  StoredProcedure [dbo].[insertar_factura]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[insertar_factura]
@idVehiculo int, @mensaje int output, @idCliente int,
@fecha date
as
set @mensaje = 0
begin
	insert into facturas(idVehiculo, id_cliente, fecha) VALUES (@idVehiculo, @idCliente, @fecha)
	set @mensaje = 1
end



GO
/****** Object:  StoredProcedure [dbo].[insertar_gasto_vehiculo]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	create procedure  [dbo].[insertar_gasto_vehiculo]
	@idGasto int, @idProveedor int, @idVehiculo int, @montoRD float, @montoUSD float, @fecha date,
	@mensaje int output, @idTransaccion int
	as
	set @mensaje = 0;
	begin
		insert into GastoVehiculo(id_gasto, id_proveedor, id_vehiculo, monto_rd, monto_usd, fecha, id_transaccion)
		VALUES (@idGasto, @idProveedor, @idVehiculo, @montoRD, @montoUSD, @fecha, @idTransaccion)
		
		update Vehiculos set total_invertido_rd = total_invertido_rd + @montoRD, total_invertido_usd = total_invertido_usd + @montoUSD
		where id = @idVehiculo

		set @mensaje = 1;
	end



GO
/****** Object:  StoredProcedure [dbo].[insertar_imagenes_clientes]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertar_imagenes_clientes]
@img varbinary(max), @mensaje int output
as
set @mensaje = 0;
declare @idCliente int = (select MAX(id) from Clientes)
begin
	insert into ImagenesClientes(idCliente,img)
	Values (@idCliente, @img)
	set @mensaje = 1;
	
end


GO
/****** Object:  StoredProcedure [dbo].[insertar_imagenes_traspaso]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertar_imagenes_traspaso]
@img varbinary(max), @mensaje int output
as
set @mensaje = 0;
declare @idfactura int = (select MAX(id) from facturas)
declare @idVehiculo int = (select idVehiculo from facturas where id = @idfactura)
begin
	insert into ImagenesTraspasos(id_vehiculo,id_factura,img)
	Values (@idVehiculo,@idfactura, @img)
	set @mensaje = 1;
	
end


GO
/****** Object:  StoredProcedure [dbo].[insertarFormaGastos]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create procedure [dbo].[insertarFormaGastos]
	@idVehiculo int, @idTransaccion int, @idTipoPago int, @montoRD float, @montoUSD float,
	@nota varchar(100), @fecha date, @mensaje int output, @idSuplidor int
	as
	declare @idFactura int = 0
	set @mensaje = 0;
	begin
		insert into FormaCompraVehiculo (id_vehiculo, id_transaccion, id_tipo_pago, id_factura, monto_rd, monto_usd, nota, fecha)
		VALUES (@idVehiculo, @idTransaccion, @idTipoPago, @idFactura, @montoRD, @montoUSD, @nota, @fecha)
		
		
		
		
		if @idTipoPago = 3 
			begin
				 insert into CuentasPagar (id_factura, id_vendedor, id_transaccion, monto_rd, monto_usd,
				  balance_rd, balance_usd, fecha, id_vehiculo)
				  VALUES(@idFactura, @idSuplidor, @idTransaccion, @montoRD, @montoUSD, @montoRD, @montoUSD,
				  @fecha, @idVehiculo)

				  if @idTransaccion = 5 or @idTransaccion = 6 or @idTransaccion = 7
					begin
						update CuentasPagar set id_gasto = ((select IsNull(MAX(id), 0) from GastoVehiculo) + 1)
						where id = (select Max(id) from CuentasPagar)
					end
			end

		
		set @mensaje = 1;
		 
	end


GO
/****** Object:  StoredProcedure [dbo].[insertarFormaTransaccionesCompras]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create procedure [dbo].[insertarFormaTransaccionesCompras]
	@idVehiculo int, @idTransaccion int, @idTipoPago int, @montoRD float, @montoUSD float,
	@nota varchar(100), @fecha date, @mensaje int output
	as
	declare @idFactura int = 0
	set @mensaje = 0;
	set @idVehiculo = (select MAX(id) from Vehiculos)
	begin
		insert into FormaCompraVehiculo (id_vehiculo, id_transaccion, id_tipo_pago, id_factura, monto_rd, monto_usd, nota, fecha)
		VALUES (@idVehiculo, @idTransaccion, @idTipoPago, @idFactura, @montoRD, @montoUSD, @nota, @fecha)
		
		
		declare @idSuplidor int = (select id_suplidor from Vehiculos where id = (select MAX(id) from Vehiculos))
		
		if @idTipoPago = 3 
			begin
				 insert into CuentasPagar (id_factura, id_vendedor, id_transaccion, monto_rd, monto_usd,
				  balance_rd, balance_usd, fecha, id_vehiculo)
				  VALUES(@idFactura, @idSuplidor, @idTransaccion, @montoRD, @montoUSD, @montoRD, @montoUSD,
				  @fecha, @idVehiculo)
			end

		--if @idTipoPago = 1
		--	begin
		--		 insert into DetallesEfectivoGeneral(idVehiculo, tipoCuenta, montoRD, montoUSD, fecha, documento, numeroDocumento,id_transaccion)
		--		 values (@idVehiculo, 2, @montoRD, @montoRD, @fecha, 'Factura', @idFactura, @idTransaccion)
		--	end
		
		set @mensaje = 1;
		 
	end


GO
/****** Object:  StoredProcedure [dbo].[insertarFormaTransaccionesFacturacion]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create procedure [dbo].[insertarFormaTransaccionesFacturacion]
	@idVehiculo int, @idTransaccion int, @idTipoPago int, @montoRD float, @montoUSD float,
	@nota varchar(100), @fecha date, @mensaje int output
	as
	declare @idFactura int = (select MAX(id) from facturas)
	set @mensaje = 0;
	begin
		insert into FormaVentaVehiculo (id_vehiculo, id_transaccion, id_tipo_pago, id_factura, monto_rd, monto_usd, nota, fecha)
		VALUES (@idVehiculo, @idTransaccion, @idTipoPago, @idFactura, @montoRD, @montoUSD, @nota, @fecha)
		
		
		declare @idCliente int= (Select id_cliente from facturas where id = @idFactura)
		
		if @idTipoPago = 3
			begin
				 insert into CuentasCobrar (id_factura, id_cliente, id_transaccion, monto_rd, monto_usd,
				  balance_rd, balance_usd, fecha, id_vehiculo)
				  VALUES(@idFactura, @idCliente, @idTransaccion, @montoRD, @montoUSD, @montoRD, @montoUSD,
				  @fecha, @idVehiculo)
			end

		if @idTipoPago = 1
			begin
				 insert into DetallesEfectivoGeneral(idVehiculo, tipoCuenta, montoRD, montoUSD, fecha, documento, numeroDocumento,id_transaccion)
				 values (@idVehiculo, 2, @montoRD, @montoUSD, @fecha, 'Factura', @idFactura, @idTransaccion)
			end
		
		set @mensaje = 1;
		 
	end


GO
/****** Object:  StoredProcedure [dbo].[llenar_tablas]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[llenar_tablas]
as

begin
	if not exists(select * from Fabricantes where id = 1)
		begin
			INSERT INTO Fabricantes (codigo, fabricante) VALUES
			('ACURA', 'Acura'),
			('ALFA', 'Alfa Romeo'),
			('AMC', 'AMC'),
			('ASTON', 'Aston Martin'),
			('AUDI', 'Audi'),
			('AVANTI', 'Avanti'),
			('BENTL', 'Bentley'),
			('BMW', 'BMW'),
			('BUICK', 'Buick'),
			('CAD', 'Cadillac'),
			('CHEV', 'Chevrolet'),
			('CHRY', 'Chrysler'),
			('DAEW', 'Daewoo'),
			('DAIHAT', 'Daihatsu'),
			('DATSUN', 'Datsun'),
			('DELOREAN', 'DeLorean'),
			('DODGE', 'Dodge'),
			('EAGLE', 'Eagle'),
			('FER', 'Ferrari'),
			('FIAT', 'FIAT'),
			('FISK', 'Fisker'),
			('FORD', 'Ford'),
			('FREIGHT', 'Freightliner'),
			('GEO', 'Geo'),
			('GMC', 'GMC'),
			('HONDA', 'Honda'),
			('AMGEN', 'HUMMER'),
			('HYUND', 'Hyundai'),
			('INFIN', 'Infiniti'),
			('ISU', 'Isuzu'),
			('JAG', 'Jaguar'),
			('JEEP', 'Jeep'),
			('KIA', 'Kia'),
			('LAM', 'Lamborghini'),
			('LAN', 'Lancia'),
			('ROV', 'Land Rover'),
			('LEXUS', 'Lexus'),
			('LINC', 'Lincoln'),
			('LOTUS', 'Lotus'),
			('MAS', 'Maserati'),
			('MAYBACH', 'Maybach'),
			('MAZDA', 'Mazda'),
			('MCLAREN', 'McLaren'),
			('MB', 'Mercedes-Benz'),
			('MERC', 'Mercury'),
			('MERKUR', 'Merkur'),
			('MINI', 'MINI'),
			('MIT', 'Mitsubishi'),
			('NISSAN', 'Nissan'),
			('OLDS', 'Oldsmobile'),
			('PEUG', 'Peugeot'),
			('PLYM', 'Plymouth'),
			('PONT', 'Pontiac'),
			('POR', 'Porsche'),
			('RAM', 'RAM'),
			('REN', 'Renault'),
			('RR', 'Rolls-Royce'),
			('SAAB', 'Saab'),
			('SATURN', 'Saturn'),
			('SCION', 'Scion'),
			('SMART', 'smart'),
			('SRT', 'SRT'),
			('STERL', 'Sterling'),
			('SUB', 'Subaru'),
			('SUZUKI', 'Suzuki'),
			('TESLA', 'Tesla'),
			('TOYOTA', 'Toyota'),
			('TRI', 'Triumph'),
			('VOLKS', 'Volkswagen'),
			('VOLVO', 'Volvo'),
			('YUGO', 'Yugo');
		end

		if not exists(select * from Modelos where id = 1)
		begin
			Insert into Modelos (noUso, fabricante_id, codigo, modelo) VALUES
			
			(1, 1, 'CL_MODELS', 'CL Models (4)'),
			(2, 1, '2.2CL', ' - 2.2CL'),
			(3, 1, '2.3CL', ' - 2.3CL'),
			(4, 1, '3.0CL', ' - 3.0CL'),
			(5, 1, '3.2CL', ' - 3.2CL'),
			(6, 1, 'ILX', 'ILX'),
			(7, 1, 'INTEG', 'Integra'),
			(8, 1, 'LEGEND', 'Legend'),
			(9, 1, 'MDX', 'MDX'),
			(10, 1, 'NSX', 'NSX'),
			(11, 1, 'RDX', 'RDX'),
			(12, 1, 'RL_MODELS', 'RL Models (2)'),
			(13, 1, '3.5RL', ' - 3.5 RL'),
			(14, 1, 'RL', ' - RL'),
			(15, 1, 'RSX', 'RSX'),
			(16, 1, 'SLX', 'SLX'),
			(17, 1, 'TL_MODELS', 'TL Models (3)'),
			(18, 1, '2.5TL', ' - 2.5TL'),
			(19, 1, '3.2TL', ' - 3.2TL'),
			(20, 1, 'TL', ' - TL'),
			(21, 1, 'TSX', 'TSX'),
			(22, 1, 'VIGOR', 'Vigor'),
			(23, 1, 'ZDX', 'ZDX'),
			(24, 1, 'ACUOTH', 'Other Acura Models'),
			(25, 2, 'ALFA164', '164'),
			(26, 2, 'ALFA8C', '8C Competizione'),
			(27, 2, 'ALFAGT', 'GTV-6'),
			(28, 2, 'MIL', 'Milano'),
			(29, 2, 'SPID', 'Spider'),
			(30, 2, 'ALFAOTH', 'Other Alfa Romeo Models'),
			(31, 3, 'AMCALLIAN', 'Alliance'),
			(32, 3, 'CON', 'Concord'),
			(33, 3, 'EAGLE', 'Eagle'),
			(34, 3, 'AMCENC', 'Encore'),
			(35, 3, 'AMCSPIRIT', 'Spirit'),
			(36, 3, 'AMCOTH', 'Other AMC Models'),
			(37, 4, 'DB7', 'DB7'),
			(38, 4, 'DB9', 'DB9'),
			(39, 4, 'DBS', 'DBS'),
			(40, 4, 'LAGONDA', 'Lagonda'),
			(41, 4, 'RAPIDE', 'Rapide'),
			(42, 4, 'V12VANT', 'V12 Vantage'),
			(43, 4, 'VANTAGE', 'V8 Vantage'),
			(44, 4, 'VANQUISH', 'Vanquish'),
			(45, 4, 'VIRAGE', 'Virage'),
			(46, 4, 'UNAVAILAST', 'Other Aston Martin Models'),
			(47, 5, 'AUDI100', '100'),
			(48, 5, 'AUDI200', '200'),
			(49, 5, '4000', '4000'),
			(50, 5, '5000', '5000'),
			(51, 5, '80', '80'),
			(52, 5, '90', '90'),
			(53, 5, 'A3', 'A3'),
			(54, 5, 'A4', 'A4'),
			(55, 5, 'A5', 'A5'),
			(56, 5, 'A6', 'A6'),
			(57, 5, 'A7', 'A7'),
			(58, 5, 'A8', 'A8'),
			(59, 5, 'ALLRDQUA', 'allroad'),
			(60, 5, 'AUDICABRI', 'Cabriolet'),
			(61, 5, 'AUDICOUPE', 'Coupe'),
			(62, 5, 'Q3', 'Q3'),
			(63, 5, 'Q5', 'Q5'),
			(64, 5, 'Q7', 'Q7'),
			(65, 5, 'QUATTR', 'Quattro'),
			(66, 5, 'R8', 'R8'),
			(67, 5, 'RS4', 'RS 4'),
			(68, 5, 'RS5', 'RS 5'),
			(69, 5, 'RS6', 'RS 6'),
			(70, 5, 'S4', 'S4'),
			(71, 5, 'S5', 'S5'),
			(72, 5, 'S6', 'S6'),
			(73, 5, 'S7', 'S7'),
			(74, 5, 'S8', 'S8'),
			(75, 5, 'TT', 'TT'),
			(76, 5, 'TTRS', 'TT RS'),
			(77, 5, 'TTS', 'TTS'),
			(78, 5, 'V8', 'V8 Quattro'),
			(79, 5, 'AUDOTH', 'Other Audi Models'),
			(80, 6, 'CONVERT', 'Convertible'),
			(81, 6, 'COUPEAVANT', 'Coupe'),
			(82, 6, 'SEDAN', 'Sedan'),
			(83, 6, 'UNAVAILAVA', 'Other Avanti Models'),
			(84, 7, 'ARNAGE', 'Arnage'),
			(85, 7, 'AZURE', 'Azure'),
			(86, 7, 'BROOKLANDS', 'Brooklands'),
			(87, 7, 'BENCONT', 'Continental'),
			(88, 7, 'CORNICHE', 'Corniche'),
			(89, 7, 'BENEIGHT', 'Eight'),
			(90, 7, 'BENMUL', 'Mulsanne'),
			(91, 7, 'BENTURBO', 'Turbo R'),
			(92, 7, 'UNAVAILBEN', 'Other Bentley Models'),
			(93, 8, '1_SERIES', '1 Series (3)'),
			(94, 8, '128I', ' - 128i'),
			(95, 8, '135I', ' - 135i'),
			(96, 8, '135IS', ' - 135is'),
			(97, 8, '3_SERIES', '3 Series (29)'),
			(98, 8, '318I', ' - 318i'),
			(99, 8, '318IC', ' - 318iC'),
			(100, 8, '318IS', ' - 318iS'),
			(101, 8, '318TI', ' - 318ti'),
			(102, 8, '320I', ' - 320i'),
			(103, 8, '323CI', ' - 323ci'),
			(104, 8, '323I', ' - 323i'),
			(105, 8, '323IS', ' - 323is'),
			(106, 8, '323IT', ' - 323iT'),
			(107, 8, '325CI', ' - 325Ci'),
			(108, 8, '325E', ' - 325e'),
			(109, 8, '325ES', ' - 325es'),
			(110, 8, '325I', ' - 325i'),
			(111, 8, '325IS', ' - 325is'),
			(112, 8, '325IX', ' - 325iX'),
			(113, 8, '325XI', ' - 325xi'),
			(114, 8, '328CI', ' - 328Ci'),
			(115, 8, '328I', ' - 328i'),
			(116, 8, '328IS', ' - 328iS'),
			(117, 8, '328XI', ' - 328xi'),
			(118, 8, '330CI', ' - 330Ci'),
			(119, 8, '330I', ' - 330i'),
			(120, 8, '330XI', ' - 330xi'),
			(121, 8, '335D', ' - 335d'),
			(122, 8, '335I', ' - 335i'),
			(123, 8, '335IS', ' - 335is'),
			(124, 8, '335XI', ' - 335xi'),
			(125, 8, 'ACTIVE3', ' - ActiveHybrid 3'),
			(126, 8, 'BMW325', ' - 325'),
			(127, 8, '5_SERIES', '5 Series (19)'),
			(128, 8, '524TD', ' - 524td'),
			(129, 8, '525I', ' - 525i'),
			(130, 8, '525XI', ' - 525xi'),
			(131, 8, '528E', ' - 528e'),
			(132, 8, '528I', ' - 528i'),
			(133, 8, '528IT', ' - 528iT'),
			(134, 8, '528XI', ' - 528xi'),
			(135, 8, '530I', ' - 530i'),
			(136, 8, '530IT', ' - 530iT'),
			(137, 8, '530XI', ' - 530xi'),
			(138, 8, '533I', ' - 533i'),
			(139, 8, '535I', ' - 535i'),
			(140, 8, '535IGT', ' - 535i Gran Turismo'),
			(141, 8, '535XI', ' - 535xi'),
			(142, 8, '540I', ' - 540i'),
			(143, 8, '545I', ' - 545i'),
			(144, 8, '550I', ' - 550i'),
			(145, 8, '550IGT', ' - 550i Gran Turismo'),
			(146, 8, 'ACTIVE5', ' - ActiveHybrid 5'),
			(147, 8, '6_SERIES', '6 Series (8)'),
			(148, 8, '633CSI', ' - 633CSi'),
			(149, 8, '635CSI', ' - 635CSi'),
			(150, 8, '640I', ' - 640i'),
			(151, 8, '640IGC', ' - 640i Gran Coupe'),
			(152, 8, '645CI', ' - 645Ci'),
			(153, 8, '650I', ' - 650i'),
			(154, 8, '650IGC', ' - 650i Gran Coupe'),
			(155, 8, 'L6', ' - L6'),
			(156, 8, '7_SERIES', '7 Series (15)'),
			(157, 8, '733I', ' - 733i'),
			(158, 8, '735I', ' - 735i'),
			(159, 8, '735IL', ' - 735iL'),
			(160, 8, '740I', ' - 740i'),
			(161, 8, '740IL', ' - 740iL'),
			(162, 8, '740LI', ' - 740Li'),
			(163, 8, '745I', ' - 745i'),
			(164, 8, '745LI', ' - 745Li'),
			(165, 8, '750I', ' - 750i'),
			(166, 8, '750IL', ' - 750iL'),
			(167, 8, '750LI', ' - 750Li'),
			(168, 8, '760I', ' - 760i'),
			(169, 8, '760LI', ' - 760Li'),
			(170, 8, 'ACTIVE7', ' - ActiveHybrid 7'),
			(171, 8, 'ALPINAB7', ' - Alpina B7'),
			(172, 8, '8_SERIES', '8 Series (4)'),
			(173, 8, '840CI', ' - 840Ci'),
			(174, 8, '850CI', ' - 850Ci'),
			(175, 8, '850CSI', ' - 850CSi'),
			(176, 8, '850I', ' - 850i'),
			(177, 8, 'L_SERIES', 'L Series (1)'),
			(178, 8, 'L7', ' - L7'),
			(179, 8, 'M_SERIES', 'M Series (8)'),
			(180, 8, '1SERIESM', ' - 1 Series M'),
			(181, 8, 'BMWMCOUPE', ' - M Coupe'),
			(182, 8, 'BMWROAD', ' - M Roadster'),
			(183, 8, 'M3', ' - M3'),
			(184, 8, 'M5', ' - M5'),
			(185, 8, 'M6', ' - M6'),
			(186, 8, 'X5M', ' - X5 M'),
			(187, 8, 'X6M', ' - X6 M'),
			(188, 8, 'X_SERIES', 'X Series (5)'),
			(189, 8, 'ACTIVEX6', ' - ActiveHybrid X6'),
			(190, 8, 'X1', ' - X1'),
			(191, 8, 'X3', ' - X3'),
			(192, 8, 'X5', ' - X5'),
			(193, 8, 'X6', ' - X6'),
			(194, 8, 'Z_SERIES', 'Z Series (3)'),
			(195, 8, 'Z3', ' - Z3'),
			(196, 8, 'Z4', ' - Z4'),
			(197, 8, 'Z8', ' - Z8'),
			(198, 8, 'BMWOTH', 'Other BMW Models'),
			(199, 9, 'CENT', 'Century'),
			(200, 9, 'ELEC', 'Electra'),
			(201, 9, 'ENCLAVE', 'Enclave'),
			(202, 9, 'BUIENC', 'Encore'),
			(203, 9, 'LACROSSE', 'LaCrosse'),
			(204, 9, 'LESA', 'Le Sabre'),
			(205, 9, 'LUCERNE', 'Lucerne'),
			(206, 9, 'PARK', 'Park Avenue'),
			(207, 9, 'RAINIER', 'Rainier'),
			(208, 9, 'REATTA', 'Reatta'),
			(209, 9, 'REG', 'Regal'),
			(210, 9, 'RENDEZVOUS', 'Rendezvous'),
			(211, 9, 'RIV', 'Riviera'),
			(212, 9, 'BUICKROAD', 'Roadmaster'),
			(213, 9, 'SKYH', 'Skyhawk'),
			(214, 9, 'SKYL', 'Skylark'),
			(215, 9, 'SOMER', 'Somerset'),
			(216, 9, 'TERRAZA', 'Terraza'),
			(217, 9, 'BUVERANO', 'Verano'),
			(218, 9, 'BUOTH', 'Other Buick Models'),
			(219, 10, 'ALLANT', 'Allante'),
			(220, 10, 'ATS', 'ATS'),
			(221, 10, 'BROUGH', 'Brougham'),
			(222, 10, 'CATERA', 'Catera'),
			(223, 10, 'CIMA', 'Cimarron'),
			(224, 10, 'CTS', 'CTS'),
			(225, 10, 'DEV', 'De Ville'),
			(226, 10, 'DTS', 'DTS'),
			(227, 10, 'ELDO', 'Eldorado'),
			(228, 10, 'ESCALA', 'Escalade'),
			(229, 10, 'ESCALAESV', 'Escalade ESV'),
			(230, 10, 'EXT', 'Escalade EXT'),
			(231, 10, 'FLEE', 'Fleetwood'),
			(232, 10, 'SEV', 'Seville'),
			(233, 10, 'SRX', 'SRX'),
			(234, 10, 'STS', 'STS'),
			(235, 10, 'XLR', 'XLR'),
			(236, 10, 'XTS', 'XTS'),
			(237, 10, 'CADOTH', 'Other Cadillac Models'),
			(238, 11, 'ASTRO', 'Astro'),
			(239, 11, 'AVALNCH', 'Avalanche'),
			(240, 11, 'AVEO', 'Aveo'),
			(241, 11, 'AVEO5', 'Aveo5'),
			(242, 11, 'BERETT', 'Beretta'),
			(243, 11, 'BLAZER', 'Blazer'),
			(244, 11, 'CAM', 'Camaro'),
			(245, 11, 'CAP', 'Caprice'),
			(246, 11, 'CHECAPS', 'Captiva Sport'),
			(247, 11, 'CAV', 'Cavalier'),
			(248, 11, 'CELE', 'Celebrity'),
			(249, 11, 'CHEVETTE', 'Chevette'),
			(250, 11, 'CITATION', 'Citation'),
			(251, 11, 'COBALT', 'Cobalt'),
			(252, 11, 'COLORADO', 'Colorado'),
			(253, 11, 'CORSI', 'Corsica'),
			(254, 11, 'CORV', 'Corvette'),
			(255, 11, 'CRUZE', 'Cruze'),
			(256, 11, 'ELCAM', 'El Camino'),
			(257, 11, 'EQUINOX', 'Equinox'),
			(258, 11, 'G15EXP', 'Express Van'),
			(259, 11, 'G10', 'G Van'),
			(260, 11, 'HHR', 'HHR'),
			(261, 11, 'CHEVIMP', 'Impala'),
			(262, 11, 'KODC4500', 'Kodiak C4500'),
			(263, 11, 'LUMINA', 'Lumina'),
			(264, 11, 'LAPV', 'Lumina APV'),
			(265, 11, 'LUV', 'LUV'),
			(266, 11, 'MALI', 'Malibu'),
			(267, 11, 'CHVMETR', 'Metro'),
			(268, 11, 'CHEVMONT', 'Monte Carlo'),
			(269, 11, 'NOVA', 'Nova'),
			(270, 11, 'CHEVPRIZM', 'Prizm'),
			(271, 11, 'CHVST', 'S10 Blazer'),
			(272, 11, 'S10PICKUP', 'S10 Pickup'),
			(273, 11, 'CHEV150', 'Silverado and other C/K1500'),
			(274, 11, 'CHEVC25', 'Silverado and other C/K2500'),
			(275, 11, 'CH3500PU', 'Silverado and other C/K3500'),
			(276, 11, 'SONIC', 'Sonic'),
			(277, 11, 'SPARK', 'Spark'),
			(278, 11, 'CHEVSPEC', 'Spectrum'),
			(279, 11, 'CHSPRINT', 'Sprint'),
			(280, 11, 'SSR', 'SSR'),
			(281, 11, 'CHEVSUB', 'Suburban'),
			(282, 11, 'TAHOE', 'Tahoe'),
			(283, 11, 'TRACKE', 'Tracker'),
			(284, 11, 'TRAILBLZ', 'TrailBlazer'),
			(285, 11, 'TRAILBZEXT', 'TrailBlazer EXT'),
			(286, 11, 'TRAVERSE', 'Traverse'),
			(287, 11, 'UPLANDER', 'Uplander'),
			(288, 11, 'VENTUR', 'Venture'),
			(289, 11, 'VOLT', 'Volt'),
			(290, 11, 'CHEOTH', 'Other Chevrolet Models'),
			(291, 12, 'CHRYS200', '200'),
			(292, 12, '300', '300'),
			(293, 12, 'CHRY300', '300M'),
			(294, 12, 'ASPEN', 'Aspen'),
			(295, 12, 'CARAVAN', 'Caravan'),
			(296, 12, 'CIRRUS', 'Cirrus'),
			(297, 12, 'CONC', 'Concorde'),
			(298, 12, 'CHRYCONQ', 'Conquest'),
			(299, 12, 'CORDOBA', 'Cordoba'),
			(300, 12, 'CROSSFIRE', 'Crossfire'),
			(301, 12, 'ECLASS', 'E Class'),
			(302, 12, 'FIFTH', 'Fifth Avenue'),
			(303, 12, 'CHRYGRANDV', 'Grand Voyager'),
			(304, 12, 'IMPE', 'Imperial'),
			(305, 12, 'INTREPID', 'Intrepid'),
			(306, 12, 'CHRYLAS', 'Laser'),
			(307, 12, 'LEBA', 'LeBaron'),
			(308, 12, 'LHS', 'LHS'),
			(309, 12, 'CHRYNEON', 'Neon'),
			(310, 12, 'NY', 'New Yorker'),
			(311, 12, 'NEWPORT', 'Newport'),
			(312, 12, 'PACIFICA', 'Pacifica'),
			(313, 12, 'CHPROWLE', 'Prowler'),
			(314, 12, 'PTCRUIS', 'PT Cruiser'),
			(315, 12, 'CHRYSEB', 'Sebring'),
			(316, 12, 'CHRYTC', 'TC by Maserati'),
			(317, 12, 'TANDC', 'Town & Country'),
			(318, 12, 'VOYAGER', 'Voyager'),
			(319, 12, 'CHOTH', 'Other Chrysler Models'),
			(320, 13, 'LANOS', 'Lanos'),
			(321, 13, 'LEGANZA', 'Leganza'),
			(322, 13, 'NUBIRA', 'Nubira'),
			(323, 13, 'DAEOTH', 'Other Daewoo Models'),
			(324, 14, 'CHAR', 'Charade'),
			(325, 14, 'ROCKY', 'Rocky'),
			(326, 14, 'DAIHOTH', 'Other Daihatsu Models'),
			(327, 15, 'DAT200SX', '200SX'),
			(328, 15, 'DAT210', '210'),
			(329, 15, '280Z', '280ZX'),
			(330, 15, '300ZX', '300ZX'),
			(331, 15, '310', '310'),
			(332, 15, '510', '510'),
			(333, 15, '720', '720'),
			(334, 15, '810', '810'),
			(335, 15, 'DATMAX', 'Maxima'),
			(336, 15, 'DATPU', 'Pickup'),
			(337, 15, 'PUL', 'Pulsar'),
			(338, 15, 'DATSENT', 'Sentra'),
			(339, 15, 'STAN', 'Stanza'),
			(340, 15, 'DATOTH', 'Other Datsun Models'),
			(341, 16, 'DMC12', 'DMC-12'),
			(342, 17, '400', '400'),
			(343, 17, 'DOD600', '600'),
			(344, 17, 'ARI', 'Aries'),
			(345, 17, 'AVENGR', 'Avenger'),
			(346, 17, 'CALIBER', 'Caliber'),
			(347, 17, 'DODCARA', 'Caravan'),
			(348, 17, 'CHALLENGER', 'Challenger'),
			(349, 17, 'DODCHAR', 'Charger'),
			(350, 17, 'DODCOLT', 'Colt'),
			(351, 17, 'DODCONQ', 'Conquest'),
			(352, 17, 'DODDW', 'D/W Truck'),
			(353, 17, 'DAKOTA', 'Dakota'),
			(354, 17, 'DODDART', 'Dart'),
			(355, 17, 'DAY', 'Daytona'),
			(356, 17, 'DIPLOMA', 'Diplomat'),
			(357, 17, 'DURANG', 'Durango'),
			(358, 17, 'DODDYNA', 'Dynasty'),
			(359, 17, 'GRANDCARAV', 'Grand Caravan'),
			(360, 17, 'INTRE', 'Intrepid'),
			(361, 17, 'JOURNEY', 'Journey'),
			(362, 17, 'LANCERDODG', 'Lancer'),
			(363, 17, 'MAGNUM', 'Magnum'),
			(364, 17, 'MIRADA', 'Mirada'),
			(365, 17, 'MONACO', 'Monaco'),
			(366, 17, 'DODNEON', 'Neon'),
			(367, 17, 'NITRO', 'Nitro'),
			(368, 17, 'OMNI', 'Omni'),
			(369, 17, 'RAIDER', 'Raider'),
			(370, 17, 'RAM1504WD', 'Ram 1500 Truck'),
			(371, 17, 'RAM25002WD', 'Ram 2500 Truck'),
			(372, 17, 'RAM3502WD', 'Ram 3500 Truck'),
			(373, 17, 'RAM4500', 'Ram 4500 Truck'),
			(374, 17, 'DODD50', 'Ram 50 Truck'),
			(375, 17, 'CV', 'RAM C/V'),
			(376, 17, 'RAMSRT10', 'Ram SRT-10'),
			(377, 17, 'RAMVANV8', 'Ram Van'),
			(378, 17, 'RAMWAGON', 'Ram Wagon'),
			(379, 17, 'RAMCGR', 'Ramcharger'),
			(380, 17, 'RAMPAGE', 'Rampage'),
			(381, 17, 'DODSHAD', 'Shadow'),
			(382, 17, 'DODSPIR', 'Spirit'),
			(383, 17, 'SPRINTER', 'Sprinter'),
			(384, 17, 'SRT4', 'SRT-4'),
			(385, 17, 'STREGIS', 'St. Regis'),
			(386, 17, 'STEAL', 'Stealth'),
			(387, 17, 'STRATU', 'Stratus'),
			(388, 17, 'VIPER', 'Viper'),
			(389, 17, 'DOOTH', 'Other Dodge Models'),
			(390, 18, 'EAGLEMED', 'Medallion'),
			(391, 18, 'EAGLEPREM', 'Premier'),
			(392, 18, 'SUMMIT', 'Summit'),
			(393, 18, 'TALON', 'Talon'),
			(394, 18, 'VISION', 'Vision'),
			(395, 18, 'EAGOTH', 'Other Eagle Models'),
			(396, 19, '308GTB', '308 GTB Quattrovalvole'),
			(397, 19, '308TBI', '308 GTBI'),
			(398, 19, '308GTS', '308 GTS Quattrovalvole'),
			(399, 19, '308TSI', '308 GTSI'),
			(400, 19, '328GTB', '328 GTB'),
			(401, 19, '328GTS', '328 GTS'),
			(402, 19, '348GTB', '348 GTB'),
			(403, 19, '348GTS', '348 GTS'),
			(404, 19, '348SPI', '348 Spider'),
			(405, 19, '348TB', '348 TB'),
			(406, 19, '348TS', '348 TS'),
			(407, 19, '360', '360'),
			(408, 19, '456GT', '456 GT'),
			(409, 19, '456MGT', '456M GT'),
			(410, 19, '458ITALIA', '458 Italia'),
			(411, 19, '512BBI', '512 BBi'),
			(412, 19, '512M', '512M'),
			(413, 19, '512TR', '512TR'),
			(414, 19, '550M', '550 Maranello'),
			(415, 19, '575M', '575M Maranello'),
			(416, 19, '599GTB', '599 GTB Fiorano'),
			(417, 19, '599GTO', '599 GTO'),
			(418, 19, '612SCAGLIE', '612 Scaglietti'),
			(419, 19, 'FERCALIF', 'California'),
			(420, 19, 'ENZO', 'Enzo'),
			(421, 19, 'F355', 'F355'),
			(422, 19, 'F40', 'F40'),
			(423, 19, 'F430', 'F430'),
			(424, 19, 'F50', 'F50'),
			(425, 19, 'FERFF', 'FF'),
			(426, 19, 'MOND', 'Mondial'),
			(427, 19, 'TEST', 'Testarossa'),
			(428, 19, 'UNAVAILFER', 'Other Ferrari Models'),
			(429, 20, '2000', '2000 Spider'),
			(430, 20, 'FIAT500', '500'),
			(431, 20, 'BERTON', 'Bertone X1/9'),
			(432, 20, 'BRAVA', 'Brava'),
			(433, 20, 'PININ', 'Pininfarina Spider'),
			(434, 20, 'STRADA', 'Strada'),
			(435, 20, 'FIATX19', 'X1/9'),
			(436, 20, 'UNAVAILFIA', 'Other Fiat Models'),
			(437, 21, 'KARMA', 'Karma'),
			(438, 22, 'AERO', 'Aerostar'),
			(439, 22, 'ASPIRE', 'Aspire'),
			(440, 22, 'BRON', 'Bronco'),
			(441, 22, 'B2', 'Bronco II'),
			(442, 22, 'FOCMAX', 'C-MAX'),
			(443, 22, 'FORDCLUB', 'Club Wagon'),
			(444, 22, 'CONTOUR', 'Contour'),
			(445, 22, 'COURIER', 'Courier'),
			(446, 22, 'CROWNVIC', 'Crown Victoria'),
			(447, 22, 'E150ECON', 'E-150 and Econoline 150'),
			(448, 22, 'E250ECON', 'E-250 and Econoline 250'),
			(449, 22, 'E350ECON', 'E-350 and Econoline 350'),
			(450, 22, 'EDGE', 'Edge'),
			(451, 22, 'ESCAPE', 'Escape'),
			(452, 22, 'ESCO', 'Escort'),
			(453, 22, 'EXCURSION', 'Excursion'),
			(454, 22, 'EXP', 'EXP'),
			(455, 22, 'EXPEDI', 'Expedition'),
			(456, 22, 'EXPEDIEL', 'Expedition EL'),
			(457, 22, 'EXPLOR', 'Explorer'),
			(458, 22, 'SPORTTRAC', 'Explorer Sport Trac'),
			(459, 22, 'F100', 'F100'),
			(460, 22, 'F150PICKUP', 'F150'),
			(461, 22, 'F250', 'F250'),
			(462, 22, 'F350', 'F350'),
			(463, 22, 'F450', 'F450'),
			(464, 22, 'FAIRM', 'Fairmont'),
			(465, 22, 'FESTIV', 'Festiva'),
			(466, 22, 'FIESTA', 'Fiesta'),
			(467, 22, 'FIVEHUNDRE', 'Five Hundred'),
			(468, 22, 'FLEX', 'Flex'),
			(469, 22, 'FOCUS', 'Focus'),
			(470, 22, 'FREESTAR', 'Freestar'),
			(471, 22, 'FREESTYLE', 'Freestyle'),
			(472, 22, 'FUSION', 'Fusion'),
			(473, 22, 'GRANADA', 'Granada'),
			(474, 22, 'GT', 'GT'),
			(475, 22, 'LTD', 'LTD'),
			(476, 22, 'MUST', 'Mustang'),
			(477, 22, 'PROBE', 'Probe'),
			(478, 22, 'RANGER', 'Ranger'),
			(479, 22, 'TAURUS', 'Taurus'),
			(480, 22, 'TAURUSX', 'Taurus X'),
			(481, 22, 'TEMPO', 'Tempo'),
			(482, 22, 'TBIRD', 'Thunderbird'),
			(483, 22, 'TRANSCONN', 'Transit Connect'),
			(484, 22, 'WINDST', 'Windstar'),
			(485, 22, 'FORDZX2', 'ZX2 Escort'),
			(486, 22, 'FOOTH', 'Other Ford Models'),
			(487, 23, 'FRESPRINT', 'Sprinter'),
			(488, 24, 'GEOMETRO', 'Metro'),
			(489, 24, 'GEOPRIZM', 'Prizm'),
			(490, 24, 'SPECT', 'Spectrum'),
			(491, 24, 'STORM', 'Storm'),
			(492, 24, 'GEOTRACK', 'Tracker'),
			(493, 24, 'GEOOTH', 'Other Geo Models'),
			(494, 25, 'ACADIA', 'Acadia'),
			(495, 25, 'CABALLERO', 'Caballero'),
			(496, 25, 'CANYON', 'Canyon'),
			(497, 25, 'ENVOY', 'Envoy'),
			(498, 25, 'ENVOYXL', 'Envoy XL'),
			(499, 25, 'ENVOYXUV', 'Envoy XUV'),
			(500, 25, 'JIM', 'Jimmy'),
			(501, 25, 'RALLYWAG', 'Rally Wagon'),
			(502, 25, 'GMCS15', 'S15 Jimmy'),
			(503, 25, 'S15', 'S15 Pickup'),
			(504, 25, 'SAFARIGMC', 'Safari'),
			(505, 25, 'GMCSAVANA', 'Savana'),
			(506, 25, '15SIPU4WD', 'Sierra C/K1500'),
			(507, 25, 'GMCC25PU', 'Sierra C/K2500'),
			(508, 25, 'GMC3500PU', 'Sierra C/K3500'),
			(509, 25, 'SONOMA', 'Sonoma'),
			(510, 25, 'SUB', 'Suburban'),
			(511, 25, 'GMCSYCLON', 'Syclone'),
			(512, 25, 'TERRAIN', 'Terrain'),
			(513, 25, 'TOPC4500', 'TopKick C4500'),
			(514, 25, 'TYPH', 'Typhoon'),
			(515, 25, 'GMCVANDUR', 'Vandura'),
			(516, 25, 'YUKON', 'Yukon'),
			(517, 25, 'YUKONXL', 'Yukon XL'),
			(518, 25, 'GMCOTH', 'Other GMC Models'),
			(519, 26, 'ACCORD', 'Accord'),
			(520, 26, 'CIVIC', 'Civic'),
			(521, 26, 'CRV', 'CR-V'),
			(522, 26, 'CRZ', 'CR-Z'),
			(523, 26, 'CRX', 'CRX'),
			(524, 26, 'CROSSTOUR_MODELS', 'Crosstour and Accord Crosstour Models (2)'),
			(525, 26, 'CROSSTOUR', ' - Accord Crosstour'),
			(526, 26, 'HONCROSS', ' - Crosstour'),
			(527, 26, 'HONDELSOL', 'Del Sol'),
			(528, 26, 'ELEMENT', 'Element'),
			(529, 26, 'FIT', 'Fit'),
			(530, 26, 'INSIGHT', 'Insight'),
			(531, 26, 'ODYSSEY', 'Odyssey'),
			(532, 26, 'PASSPO', 'Passport'),
			(533, 26, 'PILOT', 'Pilot'),
			(534, 26, 'PRE', 'Prelude'),
			(535, 26, 'RIDGELINE', 'Ridgeline'),
			(536, 26, 'S2000', 'S2000'),
			(537, 26, 'HONOTH', 'Other Honda Models'),
			(538, 27, 'HUMMER', 'H1'),
			(539, 27, 'H2', 'H2'),
			(540, 27, 'H3', 'H3'),
			(541, 27, 'H3T', 'H3T'),
			(542, 27, 'AMGOTH', 'Other Hummer Models'),
			(543, 28, 'ACCENT', 'Accent'),
			(544, 28, 'AZERA', 'Azera'),
			(545, 28, 'ELANTR', 'Elantra'),
			(546, 28, 'HYUELANCPE', 'Elantra Coupe'),
			(547, 28, 'ELANTOUR', 'Elantra Touring'),
			(548, 28, 'ENTOURAGE', 'Entourage'),
			(549, 28, 'EQUUS', 'Equus'),
			(550, 28, 'HYUEXCEL', 'Excel'),
			(551, 28, 'GENESIS', 'Genesis'),
			(552, 28, 'GENESISCPE', 'Genesis Coupe'),
			(553, 28, 'SANTAFE', 'Santa Fe'),
			(554, 28, 'SCOUPE', 'Scoupe'),
			(555, 28, 'SONATA', 'Sonata'),
			(556, 28, 'TIBURO', 'Tiburon'),
			(557, 28, 'TUCSON', 'Tucson'),
			(558, 28, 'VELOSTER', 'Veloster'),
			(559, 28, 'VERACRUZ', 'Veracruz'),
			(560, 28, 'XG300', 'XG300'),
			(561, 28, 'XG350', 'XG350'),
			(562, 28, 'HYUOTH', 'Other Hyundai Models'),
			(563, 29, 'EX_MODELS', 'EX Models (2)'),
			(564, 29, 'EX35', ' - EX35'),
			(565, 29, 'EX37', ' - EX37'),
			(566, 29, 'FX_MODELS', 'FX Models (4)'),
			(567, 29, 'FX35', ' - FX35'),
			(568, 29, 'FX37', ' - FX37'),
			(569, 29, 'FX45', ' - FX45'),
			(570, 29, 'FX50', ' - FX50'),
			(571, 29, 'G_MODELS', 'G Models (4)'),
			(572, 29, 'G20', ' - G20'),
			(573, 29, 'G25', ' - G25'),
			(574, 29, 'G35', ' - G35'),
			(575, 29, 'G37', ' - G37'),
			(576, 29, 'I_MODELS', 'I Models (2)'),
			(577, 29, 'I30', ' - I30'),
			(578, 29, 'I35', ' - I35'),
			(579, 29, 'J_MODELS', 'J Models (1)'),
			(580, 29, 'J30', ' - J30'),
			(581, 29, 'JX_MODELS', 'JX Models (1)'),
			(582, 29, 'JX35', ' - JX35'),
			(583, 29, 'M_MODELS', 'M Models (6)'),
			(584, 29, 'M30', ' - M30'),
			(585, 29, 'M35', ' - M35'),
			(586, 29, 'M35HYBRID', ' - M35h'),
			(587, 29, 'M37', ' - M37'),
			(588, 29, 'M45', ' - M45'),
			(589, 29, 'M56', ' - M56'),
			(590, 29, 'Q_MODELS', 'Q Models (1)'),
			(591, 29, 'Q45', ' - Q45'),
			(592, 29, 'QX_MODELS', 'QX Models (2)'),
			(593, 29, 'QX4', ' - QX4'),
			(594, 29, 'QX56', ' - QX56'),
			(595, 29, 'INFOTH', 'Other Infiniti Models'),
			(596, 30, 'AMIGO', 'Amigo'),
			(597, 30, 'ASCENDER', 'Ascender'),
			(598, 30, 'AXIOM', 'Axiom'),
			(599, 30, 'HOMBRE', 'Hombre'),
			(600, 30, 'I280', 'i-280'),
			(601, 30, 'I290', 'i-290'),
			(602, 30, 'I350', 'i-350'),
			(603, 30, 'I370', 'i-370'),
			(604, 30, 'ISUMARK', 'I-Mark'),
			(605, 30, 'ISUIMP', 'Impulse'),
			(606, 30, 'OASIS', 'Oasis'),
			(607, 30, 'ISUPU', 'Pickup'),
			(608, 30, 'RODEO', 'Rodeo'),
			(609, 30, 'STYLUS', 'Stylus'),
			(610, 30, 'TROOP', 'Trooper'),
			(611, 30, 'TRP2', 'Trooper II'),
			(612, 30, 'VEHICROSS', 'VehiCROSS'),
			(613, 30, 'ISUOTH', 'Other Isuzu Models'),
			(614, 31, 'STYPE', 'S-Type'),
			(615, 31, 'XTYPE', 'X-Type'),
			(616, 31, 'XF', 'XF'),
			(617, 31, 'XJ_SERIES', 'XJ Series (10)'),
			(618, 31, 'JAGXJ12', ' - XJ12'),
			(619, 31, 'JAGXJ6', ' - XJ6'),
			(620, 31, 'JAGXJR', ' - XJR'),
			(621, 31, 'JAGXJRS', ' - XJR-S'),
			(622, 31, 'JAGXJS', ' - XJS'),
			(623, 31, 'VANDEN', ' - XJ Vanden Plas'),
			(624, 31, 'XJ', ' - XJ'),
			(625, 31, 'XJ8', ' - XJ8'),
			(626, 31, 'XJ8L', ' - XJ8 L'),
			(627, 31, 'XJSPORT', ' - XJ Sport'),
			(628, 31, 'XK_SERIES', 'XK Series (3)'),
			(629, 31, 'JAGXK8', ' - XK8'),
			(630, 31, 'XK', ' - XK'),
			(631, 31, 'XKR', ' - XKR'),
			(632, 31, 'JAGOTH', 'Other Jaguar Models'),
			(633, 32, 'CHER', 'Cherokee'),
			(634, 32, 'JEEPCJ', 'CJ'),
			(635, 32, 'COMANC', 'Comanche'),
			(636, 32, 'COMMANDER', 'Commander'),
			(637, 32, 'COMPASS', 'Compass'),
			(638, 32, 'JEEPGRAND', 'Grand Cherokee'),
			(639, 32, 'GRWAG', 'Grand Wagoneer'),
			(640, 32, 'LIBERTY', 'Liberty'),
			(641, 32, 'PATRIOT', 'Patriot'),
			(642, 32, 'JEEPPU', 'Pickup'),
			(643, 32, 'SCRAMBLE', 'Scrambler'),
			(644, 32, 'WAGONE', 'Wagoneer'),
			(645, 32, 'WRANGLER', 'Wrangler'),
			(646, 32, 'JEOTH', 'Other Jeep Models'),
			(647, 33, 'AMANTI', 'Amanti'),
			(648, 33, 'BORREGO', 'Borrego'),
			(649, 33, 'FORTE', 'Forte'),
			(650, 33, 'FORTEKOUP', 'Forte Koup'),
			(651, 33, 'OPTIMA', 'Optima'),
			(652, 33, 'RIO', 'Rio'),
			(653, 33, 'RIO5', 'Rio5'),
			(654, 33, 'RONDO', 'Rondo'),
			(655, 33, 'SEDONA', 'Sedona'),
			(656, 33, 'SEPHIA', 'Sephia'),
			(657, 33, 'SORENTO', 'Sorento'),
			(658, 33, 'SOUL', 'Soul'),
			(659, 33, 'SPECTRA', 'Spectra'),
			(660, 33, 'SPECTRA5', 'Spectra5'),
			(661, 33, 'SPORTA', 'Sportage'),
			(662, 33, 'KIAOTH', 'Other Kia Models'),
			(663, 34, 'AVENT', 'Aventador'),
			(664, 34, 'COUNT', 'Countach'),
			(665, 34, 'DIABLO', 'Diablo'),
			(666, 34, 'GALLARDO', 'Gallardo'),
			(667, 34, 'JALPA', 'Jalpa'),
			(668, 34, 'LM002', 'LM002'),
			(669, 34, 'MURCIELAGO', 'Murcielago'),
			(670, 34, 'UNAVAILLAM', 'Other Lamborghini Models'),
			(671, 35, 'BETA', 'Beta'),
			(672, 35, 'ZAGATO', 'Zagato'),
			(673, 35, 'UNAVAILLAN', 'Other Lancia Models'),
			(674, 36, 'DEFEND', 'Defender'),
			(675, 36, 'DISCOV', 'Discovery'),
			(676, 36, 'FRELNDR', 'Freelander'),
			(677, 36, 'LR2', 'LR2'),
			(678, 36, 'LR3', 'LR3'),
			(679, 36, 'LR4', 'LR4'),
			(680, 36, 'RANGE', 'Range Rover'),
			(681, 36, 'EVOQUE', 'Range Rover Evoque'),
			(682, 36, 'RANGESPORT', 'Range Rover Sport'),
			(683, 36, 'ROVOTH', 'Other Land Rover Models'),
			(684, 37, 'CT_MODELS', 'CT Models (1)'),
			(685, 37, 'CT200H', ' - CT 200h'),
			(686, 37, 'ES_MODELS', 'ES Models (5)'),
			(687, 37, 'ES250', ' - ES 250'),
			(688, 37, 'ES300', ' - ES 300'),
			(689, 37, 'ES300H', ' - ES 300h'),
			(690, 37, 'ES330', ' - ES 330'),
			(691, 37, 'ES350', ' - ES 350'),
			(692, 37, 'GS_MODELS', 'GS Models (6)'),
			(693, 37, 'GS300', ' - GS 300'),
			(694, 37, 'GS350', ' - GS 350'),
			(695, 37, 'GS400', ' - GS 400'),
			(696, 37, 'GS430', ' - GS 430'),
			(697, 37, 'GS450H', ' - GS 450h'),
			(698, 37, 'GS460', ' - GS 460'),
			(699, 37, 'GX_MODELS', 'GX Models (2)'),
			(700, 37, 'GX460', ' - GX 460'),
			(701, 37, 'GX470', ' - GX 470'),
			(702, 37, 'HS_MODELS', 'HS Models (1)'),
			(703, 37, 'HS250H', ' - HS 250h'),
			(704, 37, 'IS_MODELS', 'IS Models (6)'),
			(705, 37, 'IS250', ' - IS 250'),
			(706, 37, 'IS250C', ' - IS 250C'),
			(707, 37, 'IS300', ' - IS 300'),
			(708, 37, 'IS350', ' - IS 350'),
			(709, 37, 'IS350C', ' - IS 350C'),
			(710, 37, 'ISF', ' - IS F'),
			(711, 37, 'LEXLFA', 'LFA'),
			(712, 37, 'LS_MODELS', 'LS Models (4)'),
			(713, 37, 'LS400', ' - LS 400'),
			(714, 37, 'LS430', ' - LS 430'),
			(715, 37, 'LS460', ' - LS 460'),
			(716, 37, 'LS600H', ' - LS 600h'),
			(717, 37, 'LX_MODELS', 'LX Models (3)'),
			(718, 37, 'LX450', ' - LX 450'),
			(719, 37, 'LX470', ' - LX 470'),
			(720, 37, 'LX570', ' - LX 570'),
			(721, 37, 'RX_MODELS', 'RX Models (5)'),
			(722, 37, 'RX300', ' - RX 300'),
			(723, 37, 'RX330', ' - RX 330'),
			(724, 37, 'RX350', ' - RX 350'),
			(725, 37, 'RX400H', ' - RX 400h'),
			(726, 37, 'RX450H', ' - RX 450h'),
			(727, 37, 'SC_MODELS', 'SC Models (3)'),
			(728, 37, 'SC300', ' - SC 300'),
			(729, 37, 'SC400', ' - SC 400'),
			(730, 37, 'SC430', ' - SC 430'),
			(731, 37, 'LEXOTH', 'Other Lexus Models'),
			(732, 38, 'AVIATOR', 'Aviator'),
			(733, 38, 'BLKWOOD', 'Blackwood'),
			(734, 38, 'CONT', 'Continental'),
			(735, 38, 'LSLINCOLN', 'LS'),
			(736, 38, 'MARKLT', 'Mark LT'),
			(737, 38, 'MARK6', 'Mark VI'),
			(738, 38, 'MARK7', 'Mark VII'),
			(739, 38, 'MARK8', 'Mark VIII'),
			(740, 38, 'MKS', 'MKS'),
			(741, 38, 'MKT', 'MKT'),
			(742, 38, 'MKX', 'MKX'),
			(743, 38, 'MKZ', 'MKZ'),
			(744, 38, 'NAVIGA', 'Navigator'),
			(745, 38, 'NAVIGAL', 'Navigator L'),
			(746, 38, 'LINCTC', 'Town Car'),
			(747, 38, 'ZEPHYR', 'Zephyr'),
			(748, 38, 'LINOTH', 'Other Lincoln Models'),
			(749, 39, 'ELAN', 'Elan'),
			(750, 39, 'LOTELISE', 'Elise'),
			(751, 39, 'ESPRIT', 'Esprit'),
			(752, 39, 'EVORA', 'Evora'),
			(753, 39, 'EXIGE', 'Exige'),
			(754, 39, 'UNAVAILLOT', 'Other Lotus Models'),
			(755, 40, '430', '430'),
			(756, 40, 'BITRBO', 'Biturbo'),
			(757, 40, 'COUPEMAS', 'Coupe'),
			(758, 40, 'GRANSPORT', 'GranSport'),
			(759, 40, 'GRANTURISM', 'GranTurismo'),
			(760, 40, 'QP', 'Quattroporte'),
			(761, 40, 'SPYDER', 'Spyder'),
			(762, 40, 'UNAVAILMAS', 'Other Maserati Models'),
			(763, 41, '57MAYBACH', '57'),
			(764, 41, '62MAYBACH', '62'),
			(765, 41, 'UNAVAILMAY', 'Other Maybach Models'),
			(766, 42, 'MAZDA323', '323'),
			(767, 42, 'MAZDA626', '626'),
			(768, 42, '929', '929'),
			(769, 42, 'B-SERIES', 'B-Series Pickup'),
			(770, 42, 'CX-5', 'CX-5'),
			(771, 42, 'CX-7', 'CX-7'),
			(772, 42, 'CX-9', 'CX-9'),
			(773, 42, 'GLC', 'GLC'),
			(774, 42, 'MAZDA2', 'MAZDA2'),
			(775, 42, 'MAZDA3', 'MAZDA3'),
			(776, 42, 'MAZDA5', 'MAZDA5'),
			(777, 42, 'MAZDA6', 'MAZDA6'),
			(778, 42, 'MAZDASPD3', 'MAZDASPEED3'),
			(779, 42, 'MAZDASPD6', 'MAZDASPEED6'),
			(780, 42, 'MIATA', 'Miata MX5'),
			(781, 42, 'MILL', 'Millenia'),
			(782, 42, 'MPV', 'MPV'),
			(783, 42, 'MX3', 'MX3'),
			(784, 42, 'MX6', 'MX6'),
			(785, 42, 'NAVAJO', 'Navajo'),
			(786, 42, 'PROTE', 'Protege'),
			(787, 42, 'PROTE5', 'Protege5'),
			(788, 42, 'RX7', 'RX-7'),
			(789, 42, 'RX8', 'RX-8'),
			(790, 42, 'TRIBUTE', 'Tribute'),
			(791, 42, 'MAZOTH', 'Other Mazda Models'),
			(792, 43, 'MP4', 'MP4-12C'),
			(793, 44, '190_CLASS', '190 Class (2)'),
			(794, 44, '190D', ' - 190D'),
			(795, 44, '190E', ' - 190E'),
			(796, 44, '240_CLASS', '240 Class (1)'),
			(797, 44, '240D', ' - 240D'),
			(798, 44, '300_CLASS_E_CLASS', '300 Class / E Class (6)'),
			(799, 44, '300CD', ' - 300CD'),
			(800, 44, '300CE', ' - 300CE'),
			(801, 44, '300D', ' - 300D'),
			(802, 44, '300E', ' - 300E'),
			(803, 44, '300TD', ' - 300TD'),
			(804, 44, '300TE', ' - 300TE'),
			(805, 44, 'C_CLASS', 'C Class (13)'),
			(806, 44, 'C220', ' - C220'),
			(807, 44, 'C230', ' - C230'),
			(808, 44, 'C240', ' - C240'),
			(809, 44, 'C250', ' - C250'),
			(810, 44, 'C280', ' - C280'),
			(811, 44, 'C300', ' - C300'),
			(812, 44, 'C320', ' - C320'),
			(813, 44, 'C32AMG', ' - C32 AMG'),
			(814, 44, 'C350', ' - C350'),
			(815, 44, 'C36AMG', ' - C36 AMG'),
			(816, 44, 'C43AMG', ' - C43 AMG'),
			(817, 44, 'C55AMG', ' - C55 AMG'),
			(818, 44, 'C63AMG', ' - C63 AMG'),
			(819, 44, 'CL_CLASS', 'CL Class (6)'),
			(820, 44, 'CL500', ' - CL500'),
			(821, 44, 'CL550', ' - CL550'),
			(822, 44, 'CL55AMG', ' - CL55 AMG'),
			(823, 44, 'CL600', ' - CL600'),
			(824, 44, 'CL63AMG', ' - CL63 AMG'),
			(825, 44, 'CL65AMG', ' - CL65 AMG'),
			(826, 44, 'CLK_CLASS', 'CLK Class (7)'),
			(827, 44, 'CLK320', ' - CLK320'),
			(828, 44, 'CLK350', ' - CLK350'),
			(829, 44, 'CLK430', ' - CLK430'),
			(830, 44, 'CLK500', ' - CLK500'),
			(831, 44, 'CLK550', ' - CLK550'),
			(832, 44, 'CLK55AMG', ' - CLK55 AMG'),
			(833, 44, 'CLK63AMG', ' - CLK63 AMG'),
			(834, 44, 'CLS_CLASS', 'CLS Class (4)'),
			(835, 44, 'CLS500', ' - CLS500'),
			(836, 44, 'CLS550', ' - CLS550'),
			(837, 44, 'CLS55AMG', ' - CLS55 AMG'),
			(838, 44, 'CLS63AMG', ' - CLS63 AMG'),
			(839, 44, 'E_CLASS', 'E Class (18)'),
			(840, 44, '260E', ' - 260E'),
			(841, 44, '280CE', ' - 280CE'),
			(842, 44, '280E', ' - 280E'),
			(843, 44, '400E', ' - 400E'),
			(844, 44, '500E', ' - 500E'),
			(845, 44, 'E300', ' - E300'),
			(846, 44, 'E320', ' - E320'),
			(847, 44, 'E320BLUE', ' - E320 Bluetec'),
			(848, 44, 'E320CDI', ' - E320 CDI'),
			(849, 44, 'E350', ' - E350'),
			(850, 44, 'E350BLUE', ' - E350 Bluetec'),
			(851, 44, 'E400', ' - E400 Hybrid'),
			(852, 44, 'E420', ' - E420'),
			(853, 44, 'E430', ' - E430'),
			(854, 44, 'E500', ' - E500'),
			(855, 44, 'E550', ' - E550'),
			(856, 44, 'E55AMG', ' - E55 AMG'),
			(857, 44, 'E63AMG', ' - E63 AMG'),
			(858, 44, 'G_CLASS', 'G Class (4)'),
			(859, 44, 'G500', ' - G500'),
			(860, 44, 'G550', ' - G550'),
			(861, 44, 'G55AMG', ' - G55 AMG'),
			(862, 44, 'G63AMG', ' - G63 AMG'),
			(863, 44, 'GL_CLASS', 'GL Class (5)'),
			(864, 44, 'GL320BLUE', ' - GL320 Bluetec'),
			(865, 44, 'GL320CDI', ' - GL320 CDI'),
			(866, 44, 'GL350BLUE', ' - GL350 Bluetec'),
			(867, 44, 'GL450', ' - GL450'),
			(868, 44, 'GL550', ' - GL550'),
			(869, 44, 'GLK_CLASS', 'GLK Class (1)'),
			(870, 44, 'GLK350', ' - GLK350'),
			(871, 44, 'M_CLASS', 'M Class (11)'),
			(872, 44, 'ML320', ' - ML320'),
			(873, 44, 'ML320BLUE', ' - ML320 Bluetec'),
			(874, 44, 'ML320CDI', ' - ML320 CDI'),
			(875, 44, 'ML350', ' - ML350'),
			(876, 44, 'ML350BLUE', ' - ML350 Bluetec'),
			(877, 44, 'ML430', ' - ML430'),
			(878, 44, 'ML450HY', ' - ML450 Hybrid'),
			(879, 44, 'ML500', ' - ML500'),
			(880, 44, 'ML550', ' - ML550'),
			(881, 44, 'ML55AMG', ' - ML55 AMG'),
			(882, 44, 'ML63AMG', ' - ML63 AMG'),
			(883, 44, 'R_CLASS', 'R Class (6)'),
			(884, 44, 'R320BLUE', ' - R320 Bluetec'),
			(885, 44, 'R320CDI', ' - R320 CDI'),
			(886, 44, 'R350', ' - R350'),
			(887, 44, 'R350BLUE', ' - R350 Bluetec'),
			(888, 44, 'R500', ' - R500'),
			(889, 44, 'R63AMG', ' - R63 AMG'),
			(890, 44, 'S_CLASS', 'S Class (30)'),
			(891, 44, '300SD', ' - 300SD'),
			(892, 44, '300SDL', ' - 300SDL'),
			(893, 44, '300SE', ' - 300SE'),
			(894, 44, '300SEL', ' - 300SEL'),
			(895, 44, '350SD', ' - 350SD'),
			(896, 44, '350SDL', ' - 350SDL'),
			(897, 44, '380SE', ' - 380SE'),
			(898, 44, '380SEC', ' - 380SEC'),
			(899, 44, '380SEL', ' - 380SEL'),
			(900, 44, '400SE', ' - 400SE'),
			(901, 44, '400SEL', ' - 400SEL'),
			(902, 44, '420SEL', ' - 420SEL'),
			(903, 44, '500SEC', ' - 500SEC'),
			(904, 44, '500SEL', ' - 500SEL'),
			(905, 44, '560SEC', ' - 560SEC'),
			(906, 44, '560SEL', ' - 560SEL'),
			(907, 44, '600SEC', ' - 600SEC'),
			(908, 44, '600SEL', ' - 600SEL'),
			(909, 44, 'S320', ' - S320'),
			(910, 44, 'S350', ' - S350'),
			(911, 44, 'S350BLUE', ' - S350 Bluetec'),
			(912, 44, 'S400HY', ' - S400 Hybrid'),
			(913, 44, 'S420', ' - S420'),
			(914, 44, 'S430', ' - S430'),
			(915, 44, 'S500', ' - S500'),
			(916, 44, 'S550', ' - S550'),
			(917, 44, 'S55AMG', ' - S55 AMG'),
			(918, 44, 'S600', ' - S600'),
			(919, 44, 'S63AMG', ' - S63 AMG'),
			(920, 44, 'S65AMG', ' - S65 AMG'),
			(921, 44, 'SL_CLASS', 'SL Class (13)'),
			(922, 44, '300SL', ' - 300SL'),
			(923, 44, '380SL', ' - 380SL'),
			(924, 44, '380SLC', ' - 380SLC'),
			(925, 44, '500SL', ' - 500SL'),
			(926, 44, '560SL', ' - 560SL'),
			(927, 44, '600SL', ' - 600SL'),
			(928, 44, 'SL320', ' - SL320'),
			(929, 44, 'SL500', ' - SL500'),
			(930, 44, 'SL550', ' - SL550'),
			(931, 44, 'SL55AMG', ' - SL55 AMG'),
			(932, 44, 'SL600', ' - SL600'),
			(933, 44, 'SL63AMG', ' - SL63 AMG'),
			(934, 44, 'SL65AMG', ' - SL65 AMG'),
			(935, 44, 'SLK_CLASS', 'SLK Class (8)'),
			(936, 44, 'SLK230', ' - SLK230'),
			(937, 44, 'SLK250', ' - SLK250'),
			(938, 44, 'SLK280', ' - SLK280'),
			(939, 44, 'SLK300', ' - SLK300'),
			(940, 44, 'SLK320', ' - SLK320'),
			(941, 44, 'SLK32AMG', ' - SLK32 AMG'),
			(942, 44, 'SLK350', ' - SLK350'),
			(943, 44, 'SLK55AMG', ' - SLK55 AMG'),
			(944, 44, 'SLR_CLASS', 'SLR Class (1)'),
			(945, 44, 'SLR', ' - SLR'),
			(946, 44, 'SLS_CLASS', 'SLS Class (1)'),
			(947, 44, 'SLSAMG', ' - SLS AMG'),
			(948, 44, 'SPRINTER_CLASS', 'Sprinter Class (1)'),
			(949, 44, 'MBSPRINTER', ' - Sprinter'),
			(950, 44, 'MBOTH', 'Other Mercedes-Benz Models'),
			(951, 45, 'CAPRI', 'Capri'),
			(952, 45, 'COUGAR', 'Cougar'),
			(953, 45, 'MERCGRAND', 'Grand Marquis'),
			(954, 45, 'LYNX', 'Lynx'),
			(955, 45, 'MARAUDER', 'Marauder'),
			(956, 45, 'MARINER', 'Mariner'),
			(957, 45, 'MARQ', 'Marquis'),
			(958, 45, 'MILAN', 'Milan'),
			(959, 45, 'MONTEGO', 'Montego'),
			(960, 45, 'MONTEREY', 'Monterey'),
			(961, 45, 'MOUNTA', 'Mountaineer'),
			(962, 45, 'MYSTIQ', 'Mystique'),
			(963, 45, 'SABLE', 'Sable'),
			(964, 45, 'TOPAZ', 'Topaz'),
			(965, 45, 'TRACER', 'Tracer'),
			(966, 45, 'VILLA', 'Villager'),
			(967, 45, 'MERCZEP', 'Zephyr'),
			(968, 45, 'MEOTH', 'Other Mercury Models'),
			(969, 46, 'SCORP', 'Scorpio'),
			(970, 46, 'XR4TI', 'XR4Ti'),
			(971, 46, 'MEROTH', 'Other Merkur Models'),
			(972, 47, 'COOPRCLUB_MODELS', 'Cooper Clubman Models (2)'),
			(973, 47, 'COOPERCLUB', ' - Cooper Clubman'),
			(974, 47, 'COOPRCLUBS', ' - Cooper S Clubman'),
			(975, 47, 'COOPCOUNTRY_MODELS', 'Cooper Countryman Models (2)'),
			(976, 47, 'COUNTRYMAN', ' - Cooper Countryman'),
			(977, 47, 'COUNTRYMNS', ' - Cooper S Countryman'),
			(978, 47, 'COOPCOUP_MODELS', 'Cooper Coupe Models (2)'),
			(979, 47, 'MINICOUPE', ' - Cooper Coupe'),
			(980, 47, 'MINISCOUPE', ' - Cooper S Coupe'),
			(981, 47, 'COOPER_MODELS', 'Cooper Models (2)'),
			(982, 47, 'COOPER', ' - Cooper'),
			(983, 47, 'COOPERS', ' - Cooper S'),
			(984, 47, 'COOPRROAD_MODELS', 'Cooper Roadster Models (2)'),
			(985, 47, 'COOPERROAD', ' - Cooper Roadster'),
			(986, 47, 'COOPERSRD', ' - Cooper S Roadster'),
			(987, 48, '3000GT', '3000GT'),
			(988, 48, 'CORD', 'Cordia'),
			(989, 48, 'DIAMAN', 'Diamante'),
			(990, 48, 'ECLIP', 'Eclipse'),
			(991, 48, 'ENDEAVOR', 'Endeavor'),
			(992, 48, 'MITEXP', 'Expo'),
			(993, 48, 'GALANT', 'Galant'),
			(994, 48, 'MITI', 'i'),
			(995, 48, 'LANCERMITS', 'Lancer'),
			(996, 48, 'LANCEREVO', 'Lancer Evolution'),
			(997, 48, 'MITPU', 'Mighty Max'),
			(998, 48, 'MIRAGE', 'Mirage'),
			(999, 48, 'MONT', 'Montero')

			 Insert into Modelos (noUso, fabricante_id, codigo, modelo) VALUES
			(1000, 48, 'MONTSPORT', 'Montero Sport'),
			(1001, 48, 'OUTLANDER', 'Outlander'),
			(1002, 48, 'OUTLANDSPT', 'Outlander Sport'),
			(1003, 48, 'PRECIS', 'Precis'),
			(1004, 48, 'RAIDERMITS', 'Raider'),
			(1005, 48, 'SIGMA', 'Sigma'),
			(1006, 48, 'MITSTAR', 'Starion'),
			(1007, 48, 'TRED', 'Tredia'),
			(1008, 48, 'MITVAN', 'Van'),
			(1009, 48, 'MITOTH', 'Other Mitsubishi Models'),
			(1010, 49, 'NIS200SX', '200SX'),
			(1011, 49, '240SX', '240SX'),
			(1012, 49, '300ZXTURBO', '300ZX'),
			(1013, 49, '350Z', '350Z'),
			(1014, 49, '370Z', '370Z'),
			(1015, 49, 'ALTIMA', 'Altima'),
			(1016, 49, 'PATHARMADA', 'Armada'),
			(1017, 49, 'AXXESS', 'Axxess'),
			(1018, 49, 'CUBE', 'Cube'),
			(1019, 49, 'FRONTI', 'Frontier'),
			(1020, 49, 'GT-R', 'GT-R'),
			(1021, 49, 'JUKE', 'Juke'),
			(1022, 49, 'LEAF', 'Leaf'),
			(1023, 49, 'MAX', 'Maxima'),
			(1024, 49, 'MURANO', 'Murano'),
			(1025, 49, 'MURANOCROS', 'Murano CrossCabriolet'),
			(1026, 49, 'NV', 'NV'),
			(1027, 49, 'NX', 'NX'),
			(1028, 49, 'PATH', 'Pathfinder'),
			(1029, 49, 'NISPU', 'Pickup'),
			(1030, 49, 'PULSAR', 'Pulsar'),
			(1031, 49, 'QUEST', 'Quest'),
			(1032, 49, 'ROGUE', 'Rogue'),
			(1033, 49, 'SENTRA', 'Sentra'),
			(1034, 49, 'STANZA', 'Stanza'),
			(1035, 49, 'TITAN', 'Titan'),
			(1036, 49, 'NISVAN', 'Van'),
			(1037, 49, 'VERSA', 'Versa'),
			(1038, 49, 'XTERRA', 'Xterra'),
			(1039, 49, 'NISSOTH', 'Other Nissan Models'),
			(1040, 50, '88', '88'),
			(1041, 50, 'ACHIEV', 'Achieva'),
			(1042, 50, 'ALERO', 'Alero'),
			(1043, 50, 'AURORA', 'Aurora'),
			(1044, 50, 'BRAV', 'Bravada'),
			(1045, 50, 'CUCR', 'Custom Cruiser'),
			(1046, 50, 'OLDCUS', 'Cutlass'),
			(1047, 50, 'OLDCALAIS', 'Cutlass Calais'),
			(1048, 50, 'CIERA', 'Cutlass Ciera'),
			(1049, 50, 'CSUPR', 'Cutlass Supreme'),
			(1050, 50, 'OLDSFIR', 'Firenza'),
			(1051, 50, 'INTRIG', 'Intrigue'),
			(1052, 50, '98', 'Ninety-Eight'),
			(1053, 50, 'OMEG', 'Omega'),
			(1054, 50, 'REGEN', 'Regency'),
			(1055, 50, 'SILHO', 'Silhouette'),
			(1056, 50, 'TORO', 'Toronado'),
			(1057, 50, 'OLDOTH', 'Other Oldsmobile Models'),
			(1058, 51, '405', '405'),
			(1059, 51, '504', '504'),
			(1060, 51, '505', '505'),
			(1061, 51, '604', '604'),
			(1062, 51, 'UNAVAILPEU', 'Other Peugeot Models'),
			(1063, 52, 'ACC', 'Acclaim'),
			(1064, 52, 'ARROW', 'Arrow'),
			(1065, 52, 'BREEZE', 'Breeze'),
			(1066, 52, 'CARAVE', 'Caravelle'),
			(1067, 52, 'CHAMP', 'Champ'),
			(1068, 52, 'COLT', 'Colt'),
			(1069, 52, 'PLYMCONQ', 'Conquest'),
			(1070, 52, 'GRANFURY', 'Gran Fury'),
			(1071, 52, 'PLYMGRANV', 'Grand Voyager'),
			(1072, 52, 'HORI', 'Horizon'),
			(1073, 52, 'LASER', 'Laser'),
			(1074, 52, 'NEON', 'Neon'),
			(1075, 52, 'PROWLE', 'Prowler'),
			(1076, 52, 'RELI', 'Reliant'),
			(1077, 52, 'SAPPOROPLY', 'Sapporo'),
			(1078, 52, 'SCAMP', 'Scamp'),
			(1079, 52, 'SUNDAN', 'Sundance'),
			(1080, 52, 'TRAILDUST', 'Trailduster'),
			(1081, 52, 'VOYA', 'Voyager'),
			(1082, 52, 'PLYOTH', 'Other Plymouth Models'),
			(1083, 53, 'T-1000', '1000'),
			(1084, 53, '6000', '6000'),
			(1085, 53, 'AZTEK', 'Aztek'),
			(1086, 53, 'BON', 'Bonneville'),
			(1087, 53, 'CATALINA', 'Catalina'),
			(1088, 53, 'FIERO', 'Fiero'),
			(1089, 53, 'FBIRD', 'Firebird'),
			(1090, 53, 'G3', 'G3'),
			(1091, 53, 'G5', 'G5'),
			(1092, 53, 'G6', 'G6'),
			(1093, 53, 'G8', 'G8'),
			(1094, 53, 'GRNDAM', 'Grand Am'),
			(1095, 53, 'GP', 'Grand Prix'),
			(1096, 53, 'GTO', 'GTO'),
			(1097, 53, 'J2000', 'J2000'),
			(1098, 53, 'LEMANS', 'Le Mans'),
			(1099, 53, 'MONTANA', 'Montana'),
			(1100, 53, 'PARISI', 'Parisienne'),
			(1101, 53, 'PHOENIX', 'Phoenix'),
			(1102, 53, 'SAFARIPONT', 'Safari'),
			(1103, 53, 'SOLSTICE', 'Solstice'),
			(1104, 53, 'SUNBIR', 'Sunbird'),
			(1105, 53, 'SUNFIR', 'Sunfire'),
			(1106, 53, 'TORRENT', 'Torrent'),
			(1107, 53, 'TS', 'Trans Sport'),
			(1108, 53, 'VIBE', 'Vibe'),
			(1109, 53, 'PONOTH', 'Other Pontiac Models'),
			(1110, 54, '911', '911'),
			(1111, 54, '924', '924'),
			(1112, 54, '928', '928'),
			(1113, 54, '944', '944'),
			(1114, 54, '968', '968'),
			(1115, 54, 'BOXSTE', 'Boxster'),
			(1116, 54, 'CARRERAGT', 'Carrera GT'),
			(1117, 54, 'CAYENNE', 'Cayenne'),
			(1118, 54, 'CAYMAN', 'Cayman'),
			(1119, 54, 'PANAMERA', 'Panamera'),
			(1120, 54, 'POROTH', 'Other Porsche Models'),
			(1121, 55, 'RAM1504WD', '1500'),
			(1122, 55, 'RAM25002WD', '2500'),
			(1123, 55, 'RAM3502WD', '3500'),
			(1124, 55, 'RAM4500', '4500'),
			(1125, 56, '18I', '18i'),
			(1126, 56, 'FU', 'Fuego'),
			(1127, 56, 'LECAR', 'Le Car'),
			(1128, 56, 'R18', 'R18'),
			(1129, 56, 'RENSPORT', 'Sportwagon'),
			(1130, 56, 'UNAVAILREN', 'Other Renault Models'),
			(1131, 57, 'CAMAR', 'Camargue'),
			(1132, 57, 'CORN', 'Corniche'),
			(1133, 57, 'GHOST', 'Ghost'),
			(1134, 57, 'PARKWARD', 'Park Ward'),
			(1135, 57, 'PHANT', 'Phantom'),
			(1136, 57, 'DAWN', 'Silver Dawn'),
			(1137, 57, 'SILSERAPH', 'Silver Seraph'),
			(1138, 57, 'RRSPIR', 'Silver Spirit'),
			(1139, 57, 'SPUR', 'Silver Spur'),
			(1140, 57, 'UNAVAILRR', 'Other Rolls-Royce Models'),
			(1141, 58, '9-2X', '9-2X'),
			(1142, 58, '9-3', '9-3'),
			(1143, 58, '9-4X', '9-4X'),
			(1144, 58, '9-5', '9-5'),
			(1145, 58, '97X', '9-7X'),
			(1146, 58, '900', '900'),
			(1147, 58, '9000', '9000'),
			(1148, 58, 'SAOTH', 'Other Saab Models'),
			(1149, 59, 'ASTRA', 'Astra'),
			(1150, 59, 'AURA', 'Aura'),
			(1151, 59, 'ION', 'ION'),
			(1152, 59, 'L_SERIES', 'L Series (3)'),
			(1153, 59, 'L100', ' - L100'),
			(1154, 59, 'L200', ' - L200'),
			(1155, 59, 'L300', ' - L300'),
			(1156, 59, 'LSSATURN', 'LS'),
			(1157, 59, 'LW_SERIES', 'LW Series (4)'),
			(1158, 59, 'LW', ' - LW1'),
			(1159, 59, 'LW2', ' - LW2'),
			(1160, 59, 'LW200', ' - LW200'),
			(1161, 59, 'LW300', ' - LW300'),
			(1162, 59, 'OUTLOOK', 'Outlook'),
			(1163, 59, 'RELAY', 'Relay'),
			(1164, 59, 'SC_SERIES', 'SC Series (2)'),
			(1165, 59, 'SC1', ' - SC1'),
			(1166, 59, 'SC2', ' - SC2'),
			(1167, 59, 'SKY', 'Sky'),
			(1168, 59, 'SL_SERIES', 'SL Series (3)'),
			(1169, 59, 'SL', ' - SL'),
			(1170, 59, 'SL1', ' - SL1'),
			(1171, 59, 'SL2', ' - SL2'),
			(1172, 59, 'SW_SERIES', 'SW Series (2)'),
			(1173, 59, 'SW1', ' - SW1'),
			(1174, 59, 'SW2', ' - SW2'),
			(1175, 59, 'VUE', 'Vue'),
			(1176, 59, 'SATOTH', 'Other Saturn Models'),
			(1177, 60, 'SCIFRS', 'FR-S'),
			(1178, 60, 'IQ', 'iQ'),
			(1179, 60, 'TC', 'tC'),
			(1180, 60, 'XA', 'xA'),
			(1181, 60, 'XB', 'xB'),
			(1182, 60, 'XD', 'xD'),
			(1183, 61, 'FORTWO', 'fortwo'),
			(1184, 61, 'SMOTH', 'Other smart Models'),
			(1185, 62, 'SRTVIPER', 'Viper'),
			(1186, 63, '825', '825'),
			(1187, 63, '827', '827'),
			(1188, 63, 'UNAVAILSTE', 'Other Sterling Models'),
			(1189, 64, 'BAJA', 'Baja'),
			(1190, 64, 'BRAT', 'Brat'),
			(1191, 64, 'SUBBRZ', 'BRZ'),
			(1192, 64, 'FOREST', 'Forester'),
			(1193, 64, 'IMPREZ', 'Impreza'),
			(1194, 64, 'IMPWRX', 'Impreza WRX'),
			(1195, 64, 'JUSTY', 'Justy'),
			(1196, 64, 'SUBL', 'L Series'),
			(1197, 64, 'LEGACY', 'Legacy'),
			(1198, 64, 'LOYALE', 'Loyale'),
			(1199, 64, 'SUBOUTBK', 'Outback'),
			(1200, 64, 'SVX', 'SVX'),
			(1201, 64, 'B9TRIBECA', 'Tribeca'),
			(1202, 64, 'XT', 'XT'),
			(1203, 64, 'XVCRSSTREK', 'XV Crosstrek'),
			(1204, 64, 'SUBOTH', 'Other Subaru Models'),
			(1205, 65, 'AERIO', 'Aerio'),
			(1206, 65, 'EQUATOR', 'Equator'),
			(1207, 65, 'ESTEEM', 'Esteem'),
			(1208, 65, 'FORENZA', 'Forenza'),
			(1209, 65, 'GRANDV', 'Grand Vitara'),
			(1210, 65, 'KIZASHI', 'Kizashi'),
			(1211, 65, 'RENO', 'Reno'),
			(1212, 65, 'SAMUR', 'Samurai'),
			(1213, 65, 'SIDE', 'Sidekick'),
			(1214, 65, 'SWIFT', 'Swift'),
			(1215, 65, 'SX4', 'SX4'),
			(1216, 65, 'VERONA', 'Verona'),
			(1217, 65, 'VITARA', 'Vitara'),
			(1218, 65, 'X90', 'X-90'),
			(1219, 65, 'XL7', 'XL7'),
			(1220, 65, 'SUZOTH', 'Other Suzuki Models'),
			(1221, 66, 'ROADSTER', 'Roadster'),
			(1222, 67, '4RUN', '4Runner'),
			(1223, 67, 'AVALON', 'Avalon'),
			(1224, 67, 'CAMRY', 'Camry'),
			(1225, 67, 'CELICA', 'Celica'),
			(1226, 67, 'COROL', 'Corolla'),
			(1227, 67, 'CORONA', 'Corona'),
			(1228, 67, 'CRESS', 'Cressida'),
			(1229, 67, 'ECHO', 'Echo'),
			(1230, 67, 'FJCRUIS', 'FJ Cruiser'),
			(1231, 67, 'HIGHLANDER', 'Highlander'),
			(1232, 67, 'LC', 'Land Cruiser'),
			(1233, 67, 'MATRIX', 'Matrix'),
			(1234, 67, 'MR2', 'MR2'),
			(1235, 67, 'MR2SPYDR', 'MR2 Spyder'),
			(1236, 67, 'PASEO', 'Paseo'),
			(1237, 67, 'PICKUP', 'Pickup'),
			(1238, 67, 'PREVIA', 'Previa'),
			(1239, 67, 'PRIUS', 'Prius'),
			(1240, 67, 'PRIUSC', 'Prius C'),
			(1241, 67, 'PRIUSV', 'Prius V'),
			(1242, 67, 'RAV4', 'RAV4'),
			(1243, 67, 'SEQUOIA', 'Sequoia'),
			(1244, 67, 'SIENNA', 'Sienna'),
			(1245, 67, 'SOLARA', 'Solara'),
			(1246, 67, 'STARLET', 'Starlet'),
			(1247, 67, 'SUPRA', 'Supra'),
			(1248, 67, 'T100', 'T100'),
			(1249, 67, 'TACOMA', 'Tacoma'),
			(1250, 67, 'TERCEL', 'Tercel'),
			(1251, 67, 'TUNDRA', 'Tundra'),
			(1252, 67, 'TOYVAN', 'Van'),
			(1253, 67, 'VENZA', 'Venza'),
			(1254, 67, 'YARIS', 'Yaris'),
			(1255, 67, 'TOYOTH', 'Other Toyota Models'),
			(1256, 68, 'TR7', 'TR7'),
			(1257, 68, 'TR8', 'TR8'),
			(1258, 68, 'TRIOTH', 'Other Triumph Models'),
			(1259, 69, 'BEETLE', 'Beetle'),
			(1260, 69, 'VOLKSCAB', 'Cabrio'),
			(1261, 69, 'CAB', 'Cabriolet'),
			(1262, 69, 'CC', 'CC'),
			(1263, 69, 'CORR', 'Corrado'),
			(1264, 69, 'DASHER', 'Dasher'),
			(1265, 69, 'EOS', 'Eos'),
			(1266, 69, 'EUROVAN', 'Eurovan'),
			(1267, 69, 'VOLKSFOX', 'Fox'),
			(1268, 69, 'GLI', 'GLI'),
			(1269, 69, 'GOLFR', 'Golf R'),
			(1270, 69, 'GTI', 'GTI'),
			(1271, 69, 'GOLFANDRABBITMODELS', 'Golf and Rabbit Models (2)'),
			(1272, 69, 'GOLF', ' - Golf'),
			(1273, 69, 'RABBIT', ' - Rabbit'),
			(1274, 69, 'JET', 'Jetta'),
			(1275, 69, 'PASS', 'Passat'),
			(1276, 69, 'PHAETON', 'Phaeton'),
			(1277, 69, 'RABBITPU', 'Pickup'),
			(1278, 69, 'QUAN', 'Quantum'),
			(1279, 69, 'R32', 'R32'),
			(1280, 69, 'ROUTAN', 'Routan'),
			(1281, 69, 'SCIR', 'Scirocco'),
			(1282, 69, 'TIGUAN', 'Tiguan'),
			(1283, 69, 'TOUAREG', 'Touareg'),
			(1284, 69, 'VANAG', 'Vanagon'),
			(1285, 69, 'VWOTH', 'Other Volkswagen Models'),
			(1286, 70, '240', '240'),
			(1287, 70, '260', '260'),
			(1288, 70, '740', '740'),
			(1289, 70, '760', '760'),
			(1290, 70, '780', '780'),
			(1291, 70, '850', '850'),
			(1292, 70, '940', '940'),
			(1293, 70, '960', '960'),
			(1294, 70, 'C30', 'C30'),
			(1295, 70, 'C70', 'C70'),
			(1296, 70, 'S40', 'S40'),
			(1297, 70, 'S60', 'S60'),
			(1298, 70, 'S70', 'S70'),
			(1299, 70, 'S80', 'S80'),
			(1300, 70, 'S90', 'S90'),
			(1301, 70, 'V40', 'V40'),
			(1302, 70, 'V50', 'V50'),
			(1303, 70, 'V70', 'V70'),
			(1304, 70, 'V90', 'V90'),
			(1305, 70, 'XC60', 'XC60'),
			(1306, 70, 'XC', 'XC70'),
			(1307, 70, 'XC90', 'XC90'),
			(1308, 70, 'VOLOTH', 'Other Volvo Models'),
			(1309, 71, 'GV', 'GV'),
			(1310, 71, 'GVC', 'GVC'),
			(1311, 71, 'GVL', 'GVL'),
			(1312, 71, 'GVS', 'GVS'),
			(1313, 71, 'GVX', 'GVX'),
			(1314, 71, 'YUOTH', 'Other Yugo Models');
		end
		
		if not exists(select * from Usuarios where id = 1)
			begin
				insert into Usuarios(usuario, clave, nombreApellido, tasaDolar, crearUsuarios, fabricantesModelos, piezasRepuestos,
				crearTaller, crearPropietarios, crearClientes, crearGastos, importarVehiculo, compras, cambiarEstadosVehiculo,
				agreagarGastos, agregarPiezas, facturacion, reportes, modificarVehiculo, cuentasCobrar, cuentasPagar, actualizarDiarioTasa) 
				VALUES ('admin','admin', 'Administrador Sistema',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0)
			
			end

		if not exists(select * from TiposPago where id = 1)
			begin
				insert into TiposPago (formaPago)
				VALUES('EFECTIVO'),('VEHICULO RECIBIDO'), ('CREDITO'),('OTRO');

			end
		if not exists(select * from TiposCuenta where id = 1)
			begin
				insert into TiposCuenta (tipoCuenta)
				VALUES('CUENTA POR PAGAR'),('CUENTA POR COBRAR');

			end
		if not exists(select * from SerialKeyActivation where id = 1)
			begin
				insert into SerialKeyActivation(fechaActivacion, fechaVencimiento)
				VALUES(GETDATE(),GETDATE())

			end
		if not exists(select * from TasaDolar where id = 1)
			begin
				insert into TasaDolar(tasaDolar, fechaActualizado)
				VALUES(47 ,DATEADD(day,-1,GETDATE()))

			end
end





GO
/****** Object:  StoredProcedure [dbo].[obtener_ciudades_activos]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	create procedure [dbo].[obtener_ciudades_activos]
	@idPais int
	as
	
	begin
		select id as ID, ciudad as CIUDAD, estado as ESTADO from Ciudades  where estado = 1 and idPais = @idPais
	end



GO
/****** Object:  StoredProcedure [dbo].[obtener_clientes_activos]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[obtener_clientes_activos]

as


begin

	select id as ID, cliente as CLIENTE, rnc_cedula as 'RNC/CEDULA', telefono as 'TEL.', estado as HABILITADO
	from Clientes
	where estado = 1
	
end





GO
/****** Object:  StoredProcedure [dbo].[obtener_cobros_credito_vehiculo]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[obtener_cobros_credito_vehiculo]
@idCC int
as

begin
	
			select format (PCC.fecha, 'dd/MM/yyyy') as 'FECHA PAGO', TP.formaPago as 'TIPO PAGO',PCC.monto_rd as 'PAGADO ($RD)', PCC.monto_usd as 'PAGADO ($USD)',
			PCC.nota as 'NOTA'
			from
			PagosCuentasCobrar PCC join TiposPago TP on TP.id = PCC.id_tipoPago
			where
			PCC.id_cuentaCobrar= @idCC
		
end


GO
/****** Object:  StoredProcedure [dbo].[obtener_cobros_vehiculo]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[obtener_cobros_vehiculo]
@idVehiculo int, @idTransaccion int
as


begin
	select Format(V.fecha_importe,'dd/MM/yyyy') as 'FECHA DE PAGO', TP.formaPago as 'TIPO PAGO' ,
	FV.monto_rd as 'PAGO($RD)', FV.monto_usd as 'PAGO($USD)', FV.nota as 'DETALLE'
	from FormaVentaVehiculo FV join Vehiculos V on V.id = FV.id_vehiculo join TiposPago TP on TP.id = FV.id_tipo_pago
	where FV.id_vehiculo = @idVehiculo and FV.id_transaccion = @idTransaccion 
	
end





GO
/****** Object:  StoredProcedure [dbo].[obtener_colores_activos]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	create procedure [dbo].[obtener_colores_activos]
	as
	
	begin
		select id as ID, color as COLOR, estado as ESTADO from Colores  where estado = 1
	end



GO
/****** Object:  StoredProcedure [dbo].[obtener_componentes_vehiculo_FabricanteModeloAño]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[obtener_componentes_vehiculo_FabricanteModeloAño]
@idVehiculo int
as
	declare @idFabricante int 
	declare @idModelo int
	declare @año int

	set @idFabricante = (select fabricante_id from Vehiculos Where id = @idVehiculo)
	set @idModelo = (select modelo_id from Vehiculos Where id = @idVehiculo)
	set @año = (select año from Vehiculos Where id = @idVehiculo)
begin
	
	select componente as COMPONENTES, id as ID, precio_rd as 'PRECIO ($RD)', precio_usd as 'PRECIO ($USD)'
	from Componentes 
	where fabricante_id = @idFabricante and modelo_id = @idModelo and año = @año and estado = 1	
end





GO
/****** Object:  StoredProcedure [dbo].[obtener_costo_chasis_vehiculo]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[obtener_costo_chasis_vehiculo]
@idVehiculo int
as

begin
	
	select V.vin as VIN, 
	(V.total_invertido_rd) as COSTORD,
	(V.total_invertido_usd) as COSTOUSD,
	V.precio_estimado_rd as 'PRECIO VENTA ESTIMADO RD',
	V.precio_estimado_usd as 'PRECIO VENTA ESTIMADO USD'
	from  Vehiculos V where V.id = @idVehiculo
	
end


GO
/****** Object:  StoredProcedure [dbo].[obtener_cuentas_por_cobrar]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[obtener_cuentas_por_cobrar]
@cliente varchar(100), @desde date, @hasta date
as

begin
	if @cliente = ''
		begin

			select  V.id as IDVEHICULO, V.fecha_vendido as  'FECHA VENTA', TP.transaccion as 'TRANSACCION',C.cliente as CLIENTE,
			CONVERT(varchar(200),(F.fabricante + ' ' + M.modelo + ' ' + CONVERT(varchar(10), V.año) + ' ' + V.color)) as VEHICULO,
			V.vin as CHASIS, 
			CC.balance_rd as 'PENDIENTE ($RD)', CC.balance_usd as 'PENDIENTE ($USD)',
			ISNULL(DATEDIFF(DAY, format (v.fecha_vendido, 'yyyy-MM-dd'), format (GETDATE(), 'yyyy-MM-dd')), 0) as 'DIAS VIGENTE',
			CC.id as IDCUENTACOBRAR
			From 
			CuentasCobrar CC join TipoTransaccion TP on TP.id = CC.id_transaccion join Clientes C on CC.id_cliente = C.id
			join Vehiculos V on CC.id_vehiculo = V.id join Fabricantes F on V.fabricante_id = F.id join Modelos M on M.id = V.modelo_id
			where V.vendido = 1 and (CC.balance_rd > 0 and CC.balance_usd > 0)
			and format(V.fecha_vendido,'yyyy-MM-dd') between
			format (@desde, 'yyyy-MM-dd') and format (@hasta, 'yyyy-MM-dd')
			order by DATEDIFF(DAY, format (v.fecha_vendido, 'yyyy-MM-dd'), format (GETDATE(), 'yyyy-MM-dd')) DESC
			 
		end
	else
		begin
			select  V.id as IDVEHICULO, V.fecha_vendido as  'FECHA VENTA', TP.transaccion as 'TRANSACCION',C.cliente as CLIENTE,
			CONVERT(varchar(200),(F.fabricante + ' ' + M.modelo + ' ' + CONVERT(varchar(10), V.año) + ' ' + V.color)) as VEHICULO,
			V.vin as CHASIS, 
			CC.balance_rd as 'PENDIENTE ($RD)', CC.balance_usd as 'PENDIENTE ($USD)',
			ISNULL(DATEDIFF(DAY, format (v.fecha_vendido, 'yyyy-MM-dd'), format (GETDATE(), 'yyyy-MM-dd')), 0) as 'DIAS VIGENTE',
			CC.id as IDCUENTACOBRAR
			From 
			CuentasCobrar CC join TipoTransaccion TP on TP.id = CC.id_transaccion join Clientes C on CC.id_cliente = C.id
			join Vehiculos V on CC.id_vehiculo = V.id join Fabricantes F on V.fabricante_id = F.id join Modelos M on M.id = V.modelo_id
			where V.vendido = 1 and (CC.balance_rd > 0 and CC.balance_usd > 0)
			and format(V.fecha_vendido,'yyyy-MM-dd') between
			format (@desde, 'yyyy-MM-dd') and format (@hasta, 'yyyy-MM-dd')
			and C.cliente LIKE '%' + @cliente + '%'
			order by DATEDIFF(DAY, format (v.fecha_vendido, 'yyyy-MM-dd'), format (GETDATE(), 'yyyy-MM-dd')) DESC
			
		end
end



GO
/****** Object:  StoredProcedure [dbo].[obtener_cuentas_por_pagar]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[obtener_cuentas_por_pagar]
@propietario varchar(100), @desde date, @hasta date, @idTransaccion int
as



begin
	if @propietario = ''
		begin
			
			if @idTransaccion = 2
				begin 
					select  V.id as IDVEHICULO, CP.fecha as  'FECHA' ,TP.transaccion as TRANSACCION ,S.suplidor as 'PAGAR A',
					CONVERT(varchar(200),
					(F.fabricante + ' ' + M.modelo + ' ' + CONVERT(varchar(10), V.año) + ' ' + V.color)) as VEHICULO,
					V.vin as CHASIS,
					ISNULL(CP.balance_rd, 0) as 'PENDIENTE ($RD)', ISNULL(CP.balance_usd, 0) as 'PENDIENTE ($USD)',
					ISNULL(DATEDIFF(DAY, format (CP.fecha, 'yyyy-MM-dd'),
					 format (GETDATE(), 'yyyy-MM-dd')), 0) as 'DIAS VIGENTE', CP.id as IDCUENTAPAGAR
					from Vehiculos V  join CuentasPagar CP on CP.id_vehiculo = V.id
					join Suplidores S on S.id = V.id_suplidor join Fabricantes F on F.id = V.fabricante_id 
					join Modelos M on M.id = V.modelo_id  join TipoTransaccion TP on TP.id = CP.id_transaccion
			
					where (ISNULL(CP.balance_usd,0) > 0 or ISNULL(CP.balance_rd,0)>0)
					and format(CP.fecha,'yyyy-MM-dd') between
					format (@desde, 'yyyy-MM-dd') and format (@hasta, 'yyyy-MM-dd') and CP.id_transaccion = @idTransaccion
					order by DATEDIFF(DAY, format (CP.fecha, 'yyyy-MM-dd'), format (GETDATE(), 'yyyy-MM-dd')) DESC
				end

			else if @idTransaccion = 4
				begin 
					select  V.id as IDVEHICULO, CP.fecha as  'FECHA' ,TP.transaccion as TRANSACCION ,S.nombre as 'PAGAR A',
					CONVERT(varchar(200),
					(F.fabricante + ' ' + M.modelo + ' ' + CONVERT(varchar(10), V.año) + ' ' + V.color)) as VEHICULO,
					V.vin as CHASIS,
					ISNULL(CP.balance_rd, 0) as 'PENDIENTE ($RD)', ISNULL(CP.balance_usd, 0) as 'PENDIENTE ($USD)',
					ISNULL(DATEDIFF(DAY, format (CP.fecha, 'yyyy-MM-dd'),
					 format (GETDATE(), 'yyyy-MM-dd')), 0) as 'DIAS VIGENTE', CP.id as IDCUENTAPAGAR
					from Vehiculos V  join CuentasPagar CP on CP.id_vehiculo = V.id
					join Seguros S on S.id = V.id_suplidor join Fabricantes F on F.id = V.fabricante_id 
					join Modelos M on M.id = V.modelo_id  join TipoTransaccion TP on TP.id = CP.id_transaccion
			
					where (ISNULL(CP.balance_usd,0) > 0 or ISNULL(CP.balance_rd,0)>0)
					and format(CP.fecha,'yyyy-MM-dd') between
					format (@desde, 'yyyy-MM-dd') and format (@hasta, 'yyyy-MM-dd') and CP.id_transaccion = @idTransaccion
					
					order by DATEDIFF(DAY, format (CP.fecha, 'yyyy-MM-dd'), format (GETDATE(), 'yyyy-MM-dd')) DESC
				end

			else if @idTransaccion = 5
				begin 
					select  V.id as IDVEHICULO, CP.fecha as  'FECHA' ,TP.transaccion as TRANSACCION ,S.taller as 'PAGAR A',
					CONVERT(varchar(200),
					(F.fabricante + ' ' + M.modelo + ' ' + CONVERT(varchar(10), V.año) + ' ' + V.color)) as VEHICULO,
					V.vin as CHASIS,
					ISNULL(CP.balance_rd, 0) as 'PENDIENTE ($RD)', ISNULL(CP.balance_usd, 0) as 'PENDIENTE ($USD)',
					ISNULL(DATEDIFF(DAY, format (CP.fecha, 'yyyy-MM-dd'),
					 format (GETDATE(), 'yyyy-MM-dd')), 0) as 'DIAS VIGENTE', CP.id as IDCUENTAPAGAR
					from Vehiculos V  join CuentasPagar CP on CP.id_vehiculo = V.id
					join TalleresRepuestos S on S.id = CP.id_vendedor join Fabricantes F on F.id = V.fabricante_id 
					join Modelos M on M.id = V.modelo_id  join TipoTransaccion TP on TP.id = CP.id_transaccion
					
			
					where (ISNULL(CP.balance_usd,0) > 0 or ISNULL(CP.balance_rd,0)>0) and CP.id_transaccion = 5
					and format(CP.fecha,'yyyy-MM-dd') between
					format (@desde, 'yyyy-MM-dd') and format (@hasta, 'yyyy-MM-dd') 
					
					order by DATEDIFF(DAY, format (CP.fecha, 'yyyy-MM-dd'), format (GETDATE(), 'yyyy-MM-dd')) DESC
				end
			else if @idTransaccion = 6 
				begin 
					select  V.id as IDVEHICULO, CP.fecha as  'FECHA' ,TP.transaccion as TRANSACCION ,S.taller as 'PAGAR A',
					CONVERT(varchar(200),
					(F.fabricante + ' ' + M.modelo + ' ' + CONVERT(varchar(10), V.año) + ' ' + V.color)) as VEHICULO,
					V.vin as CHASIS,
					ISNULL(CP.balance_rd, 0) as 'PENDIENTE ($RD)', ISNULL(CP.balance_usd, 0) as 'PENDIENTE ($USD)',
					ISNULL(DATEDIFF(DAY, format (CP.fecha, 'yyyy-MM-dd'),
					 format (GETDATE(), 'yyyy-MM-dd')), 0) as 'DIAS VIGENTE', CP.id as IDCUENTAPAGAR
					from Vehiculos V  join CuentasPagar CP on CP.id_vehiculo = V.id
					join TalleresRepuestos S on S.id = CP.id_vendedor join Fabricantes F on F.id = V.fabricante_id 
					join Modelos M on M.id = V.modelo_id  join TipoTransaccion TP on TP.id = CP.id_transaccion
					

					where (ISNULL(CP.balance_usd,0) > 0 or ISNULL(CP.balance_rd,0)>0) and CP.id_transaccion = 6
					and format(CP.fecha,'yyyy-MM-dd') between
					format (@desde, 'yyyy-MM-dd') and format (@hasta, 'yyyy-MM-dd') 
					
					order by DATEDIFF(DAY, format (CP.fecha, 'yyyy-MM-dd'), format (GETDATE(), 'yyyy-MM-dd')) DESC
				end
				
			else if @idTransaccion = 7
				begin 
					select  V.id as IDVEHICULO, CP.fecha as  'FECHA' ,TP.transaccion as TRANSACCION ,S.taller as 'PAGAR A',
					CONVERT(varchar(200),
					(F.fabricante + ' ' + M.modelo + ' ' + CONVERT(varchar(10), V.año) + ' ' + V.color)) as VEHICULO,
					V.vin as CHASIS,
					ISNULL(CP.balance_rd, 0) as 'PENDIENTE ($RD)', ISNULL(CP.balance_usd, 0) as 'PENDIENTE ($USD)',
					ISNULL(DATEDIFF(DAY, format (CP.fecha, 'yyyy-MM-dd'),
					 format (GETDATE(), 'yyyy-MM-dd')), 0) as 'DIAS VIGENTE', CP.id as IDCUENTAPAGAR
					from Vehiculos V  join CuentasPagar CP on CP.id_vehiculo = V.id
					join TalleresRepuestos S on S.id = CP.id_vendedor join Fabricantes F on F.id = V.fabricante_id 
					join Modelos M on M.id = V.modelo_id  join TipoTransaccion TP on TP.id = CP.id_transaccion
			
					where (ISNULL(CP.balance_usd,0) > 0 or ISNULL(CP.balance_rd,0)>0) and CP.id_transaccion = 7
					and format(CP.fecha,'yyyy-MM-dd') between
					format (@desde, 'yyyy-MM-dd') and format (@hasta, 'yyyy-MM-dd') 
					
					order by DATEDIFF(DAY, format (CP.fecha, 'yyyy-MM-dd'), format (GETDATE(), 'yyyy-MM-dd')) DESC
				end
			
			
		end
	else
		begin
			if @idTransaccion = 2
				begin 
					select  V.id as IDVEHICULO, CP.fecha as  'FECHA' ,TP.transaccion as TRANSACCION ,S.suplidor as 'PAGAR A',
					CONVERT(varchar(200),
					(F.fabricante + ' ' + M.modelo + ' ' + CONVERT(varchar(10), V.año) + ' ' + V.color)) as VEHICULO,
					V.vin as CHASIS,
					ISNULL(CP.balance_rd, 0) as 'PENDIENTE ($RD)', ISNULL(CP.balance_usd, 0) as 'PENDIENTE ($USD)',
					ISNULL(DATEDIFF(DAY, format (CP.fecha, 'yyyy-MM-dd'),
					 format (GETDATE(), 'yyyy-MM-dd')), 0) as 'DIAS VIGENTE', CP.id as IDCUENTAPAGAR
					from Vehiculos V  join CuentasPagar CP on CP.id_vehiculo = V.id
					join Suplidores S on S.id = V.id_suplidor join Fabricantes F on F.id = V.fabricante_id 
					join Modelos M on M.id = V.modelo_id  join TipoTransaccion TP on TP.id = CP.id_transaccion
					
					where (ISNULL(CP.balance_usd,0) > 0 or ISNULL(CP.balance_rd,0)>0)
					and format(CP.fecha,'yyyy-MM-dd') between
					format (@desde, 'yyyy-MM-dd') and format (@hasta, 'yyyy-MM-dd') and CP.id_transaccion = @idTransaccion
					and S.suplidor LIKE '%' + @propietario + '%'
					order by DATEDIFF(DAY, format (CP.fecha, 'yyyy-MM-dd'), format (GETDATE(), 'yyyy-MM-dd')) DESC
				end

			else if @idTransaccion = 4
				begin 
					select  V.id as IDVEHICULO, CP.fecha as  'FECHA' ,TP.transaccion as TRANSACCION ,S.nombre as 'PAGAR A',
					CONVERT(varchar(200),
					(F.fabricante + ' ' + M.modelo + ' ' + CONVERT(varchar(10), V.año) + ' ' + V.color)) as VEHICULO,
					V.vin as CHASIS,
					ISNULL(CP.balance_rd, 0) as 'PENDIENTE ($RD)', ISNULL(CP.balance_usd, 0) as 'PENDIENTE ($USD)',
					ISNULL(DATEDIFF(DAY, format (CP.fecha, 'yyyy-MM-dd'),
					 format (GETDATE(), 'yyyy-MM-dd')), 0) as 'DIAS VIGENTE', CP.id as IDCUENTAPAGAR
					from Vehiculos V  join CuentasPagar CP on CP.id_vehiculo = V.id
					join Seguros S on S.id = V.id_suplidor join Fabricantes F on F.id = V.fabricante_id 
					join Modelos M on M.id = V.modelo_id  join TipoTransaccion TP on TP.id = CP.id_transaccion
			
					where (ISNULL(CP.balance_usd,0) > 0 or ISNULL(CP.balance_rd,0)>0)
					and format(CP.fecha,'yyyy-MM-dd') between
					format (@desde, 'yyyy-MM-dd') and format (@hasta, 'yyyy-MM-dd') and CP.id_transaccion = @idTransaccion
					and S.nombre LIKE '%' + @propietario + '%'
					
					order by DATEDIFF(DAY, format (CP.fecha, 'yyyy-MM-dd'), format (GETDATE(), 'yyyy-MM-dd')) DESC
				end

			else if @idTransaccion = 5
				begin 
					select  V.id as IDVEHICULO, CP.fecha as  'FECHA' ,TP.transaccion as TRANSACCION ,S.taller as 'PAGAR A',
					CONVERT(varchar(200),
					(F.fabricante + ' ' + M.modelo + ' ' + CONVERT(varchar(10), V.año) + ' ' + V.color)) as VEHICULO,
					V.vin as CHASIS,
					ISNULL(CP.balance_rd, 0) as 'PENDIENTE ($RD)', ISNULL(CP.balance_usd, 0) as 'PENDIENTE ($USD)',
					ISNULL(DATEDIFF(DAY, format (CP.fecha, 'yyyy-MM-dd'),
					 format (GETDATE(), 'yyyy-MM-dd')), 0) as 'DIAS VIGENTE', CP.id as IDCUENTAPAGAR
					from Vehiculos V  join CuentasPagar CP on CP.id_vehiculo = V.id
					join TalleresRepuestos S on S.id = CP.id_vendedor join Fabricantes F on F.id = V.fabricante_id 
					join Modelos M on M.id = V.modelo_id  join TipoTransaccion TP on TP.id = CP.id_transaccion
					
			
					where (ISNULL(CP.balance_usd,0) > 0 or ISNULL(CP.balance_rd,0)>0) and CP.id_transaccion = 5
					and format(CP.fecha,'yyyy-MM-dd') between
					format (@desde, 'yyyy-MM-dd') and format (@hasta, 'yyyy-MM-dd') 
					and S.taller LIKE '%' + @propietario + '%'
					order by DATEDIFF(DAY, format (CP.fecha, 'yyyy-MM-dd'), format (GETDATE(), 'yyyy-MM-dd')) DESC
				end
			else if @idTransaccion = 6 
				begin 
					select  V.id as IDVEHICULO, CP.fecha as  'FECHA' ,TP.transaccion as TRANSACCION ,S.taller as 'PAGAR A',
					CONVERT(varchar(200),
					(F.fabricante + ' ' + M.modelo + ' ' + CONVERT(varchar(10), V.año) + ' ' + V.color)) as VEHICULO,
					V.vin as CHASIS,
					ISNULL(CP.balance_rd, 0) as 'PENDIENTE ($RD)', ISNULL(CP.balance_usd, 0) as 'PENDIENTE ($USD)',
					ISNULL(DATEDIFF(DAY, format (CP.fecha, 'yyyy-MM-dd'),
					 format (GETDATE(), 'yyyy-MM-dd')), 0) as 'DIAS VIGENTE', CP.id as IDCUENTAPAGAR
					from Vehiculos V  join CuentasPagar CP on CP.id_vehiculo = V.id
					join TalleresRepuestos S on S.id = CP.id_vendedor join Fabricantes F on F.id = V.fabricante_id 
					join Modelos M on M.id = V.modelo_id  join TipoTransaccion TP on TP.id = CP.id_transaccion
					

					where (ISNULL(CP.balance_usd,0) > 0 or ISNULL(CP.balance_rd,0)>0) and CP.id_transaccion = 6
					and format(CP.fecha,'yyyy-MM-dd') between
					format (@desde, 'yyyy-MM-dd') and format (@hasta, 'yyyy-MM-dd') 
					and S.taller LIKE '%' + @propietario + '%'
					order by DATEDIFF(DAY, format (CP.fecha, 'yyyy-MM-dd'), format (GETDATE(), 'yyyy-MM-dd')) DESC
				end
				
			else if @idTransaccion = 7
				begin 
					select  V.id as IDVEHICULO, CP.fecha as  'FECHA' ,TP.transaccion as TRANSACCION ,S.taller as 'PAGAR A',
					CONVERT(varchar(200),
					(F.fabricante + ' ' + M.modelo + ' ' + CONVERT(varchar(10), V.año) + ' ' + V.color)) as VEHICULO,
					V.vin as CHASIS,
					ISNULL(CP.balance_rd, 0) as 'PENDIENTE ($RD)', ISNULL(CP.balance_usd, 0) as 'PENDIENTE ($USD)',
					ISNULL(DATEDIFF(DAY, format (CP.fecha, 'yyyy-MM-dd'),
					 format (GETDATE(), 'yyyy-MM-dd')), 0) as 'DIAS VIGENTE', CP.id as IDCUENTAPAGAR
					from Vehiculos V  join CuentasPagar CP on CP.id_vehiculo = V.id
					join TalleresRepuestos S on S.id = CP.id_vendedor join Fabricantes F on F.id = V.fabricante_id 
					join Modelos M on M.id = V.modelo_id  join TipoTransaccion TP on TP.id = CP.id_transaccion
			
					where (ISNULL(CP.balance_usd,0) > 0 or ISNULL(CP.balance_rd,0)>0) and CP.id_transaccion = 7
					and format(CP.fecha,'yyyy-MM-dd') between
					format (@desde, 'yyyy-MM-dd') and format (@hasta, 'yyyy-MM-dd') 
					and S.taller LIKE '%' + @propietario + '%'
					order by DATEDIFF(DAY, format (CP.fecha, 'yyyy-MM-dd'), format (GETDATE(), 'yyyy-MM-dd')) DESC
				end
		end
end




GO
/****** Object:  StoredProcedure [dbo].[obtener_detalle_cuenta_por_cobrar]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[obtener_detalle_cuenta_por_cobrar]
@idVehiculo int
as

begin
	
	select V.id as ID,
	CONVERT(varchar(200),(F.fabricante + ' ' + M.modelo + ' ' + CONVERT(varchar(10), V.año) + ' ' + V.color)) 
	as VEHICULO, V.vin as CHASIS, ISNULL(DATEDIFF(DAY, format (v.fecha_vendido, 'yyyy-MM-dd'), format (GETDATE(), 'yyyy-MM-dd')), 0) as 'DIAS VIGENTE',	
	C.cliente as CLIENTE, C.direccion as DIRECCION, C.rnc_cedula as CEDULA, C.telefono as TEL , C.id as IDCLIENTE,
	format(V.fecha_vendido, 'dd/MM/yyyy' )as 'FECHA VENTA', 
	V.precioVentaRD as 'PRECIO ($RD)', V.precioVentaUSD as 'PRECIO ($USD)', PS.precioRD as 'PRECIO SEGURO RD',
	PS.precioUSD as 'PRECIO SEGURO USD', PT.precioRD as 'PRECIO TRASPASO RD',
	PT.precioUSD as 'PRECIO TRASPASO USD'
	from Vehiculos V join Fabricantes F on V.fabricante_id = F.id join Modelos M on V.modelo_id = M.id
	join Clientes C on V.id_cliente = C.id join PreciosSeguroVehiculo PS on PS.id_vehiculo = V.id
	join PreciosTraspasoVehiculo PT on PT.id_vehiculo = V.id
	where V.id = @idVehiculo and V.vendido = 1
		
end


GO
/****** Object:  StoredProcedure [dbo].[obtener_detalle_cuenta_por_pagar]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[obtener_detalle_cuenta_por_pagar]
@idVehiculo int, @idTransaccion int
as

begin
	
	if @idTransaccion = 2 -- Compra
		begin 
			select V.id as ID,
			CONVERT(varchar(200),(F.fabricante + ' ' + M.modelo + ' ' + CONVERT(varchar(10), V.año) + ' ' + V.color)) 
			as VEHICULO, V.vin as CHASIS, ISNULL(DATEDIFF(DAY, format (v.fecha_importe, 'yyyy-MM-dd'), format (GETDATE(), 'yyyy-MM-dd')), 0) as 'DIAS VIGENTE',	
			Sup.suplidor as PROPIETARIO,Sup.direccion as DIRECCION, Sup.rnc_cedula as CEDULA, Sup.telefono as TEL ,
			format(CP.fecha, 'dd/MM/yyyy' )as 'FECHA COMPRADO', 
			CP.monto_rd as 'PRECIO ($RD)', CP.monto_usd as 'PRECIO ($USD)',
			P.pais as PAIS, C.ciudad as CIUDAD
	
			from CuentasPagar CP join Vehiculos V on V.id = CP.id_vehiculo join Fabricantes F on V.fabricante_id = F.id join Modelos M on V.modelo_id = M.id 
			join Suplidores Sup on V.id_suplidor = Sup.id
			join Paises P on P.id = Sup.id_pais join Ciudades C on C.id = Sup.id_ciudad
	
			where CP.id_vehiculo = @idVehiculo and CP.id_transaccion = 2
		end
	else if @idTransaccion = 4 --Seguro
		begin 
			select V.id as ID,
			CONVERT(varchar(200),(F.fabricante + ' ' + M.modelo + ' ' + CONVERT(varchar(10), V.año) + ' ' + V.color)) 
			as VEHICULO, V.vin as CHASIS, ISNULL(DATEDIFF(DAY, format (v.fecha_importe, 'yyyy-MM-dd'), format (GETDATE(), 'yyyy-MM-dd')), 0) as 'DIAS VIGENTE',	
			seg.nombre as PROPIETARIO, Seg.telefono as TEL ,
			format(CP.fecha, 'dd/MM/yyyy' )as 'FECHA COMPRADO', 
			CP.monto_rd as 'PRECIO ($RD)', CP.monto_usd as 'PRECIO ($USD)'
			
			from CuentasPagar CP join Vehiculos V on V.id = CP.id_vehiculo join Fabricantes F on V.fabricante_id = F.id join Modelos M on V.modelo_id = M.id 
			join Seguros Seg on V.id_suplidor = Seg.id 

			where CP.id_vehiculo = @idVehiculo and CP.id_transaccion = 4
		end

	 else if @idTransaccion = 5 -- Pieza
		begin 
			select V.id as ID,
			CONVERT(varchar(200),(F.fabricante + ' ' + M.modelo + ' ' + CONVERT(varchar(10), V.año) + ' ' + V.color)) 
			as VEHICULO, V.vin as CHASIS, ISNULL(DATEDIFF(DAY, format (v.fecha_importe, 'yyyy-MM-dd'), format (GETDATE(), 'yyyy-MM-dd')), 0) as 'DIAS VIGENTE',	
			TR.taller as PROPIETARIO, TR.telefono1 as TEL, TR.direccion as DIRECCION ,
			format(CP.fecha, 'dd/MM/yyyy' )as 'FECHA COMPRADO', 
			CP.monto_rd as 'PRECIO ($RD)', CP.monto_usd as 'PRECIO ($USD)',
			(select  C.componente from Componentes C join GastoVehiculo GV on GV.id_gasto = C.id join CuentasPagar CP on CP.id_gasto = GV.id where CP.id_transaccion = @idTransaccion) as PIEZA
			
			from CuentasPagar CP join Vehiculos V on V.id = CP.id_vehiculo join Fabricantes F on V.fabricante_id = F.id join Modelos M on V.modelo_id = M.id 
			join TalleresRepuestos TR on TR.id = CP.id_vendedor 
			

			where CP.id_vehiculo = @idVehiculo and CP.id_transaccion = 5
		end
	else if @idTransaccion = 6 -- MECANICA
		begin 
			select V.id as ID,
			CONVERT(varchar(200),(F.fabricante + ' ' + M.modelo + ' ' + CONVERT(varchar(10), V.año) + ' ' + V.color)) 
			as VEHICULO, V.vin as CHASIS, ISNULL(DATEDIFF(DAY, format (v.fecha_importe, 'yyyy-MM-dd'), format (GETDATE(), 'yyyy-MM-dd')), 0) as 'DIAS VIGENTE',	
			TR.taller as PROPIETARIO, TR.telefono1 as TEL, TR.direccion as DIRECCION ,
			format(CP.fecha, 'dd/MM/yyyy' )as 'FECHA COMPRADO', 
			CP.monto_rd as 'PRECIO ($RD)', CP.monto_usd as 'PRECIO ($USD)', 
			(select  G.descripcion from Gastos G join GastoVehiculo GV on GV.id_gasto = G.id join CuentasPagar CP on CP.id_gasto = GV.id where CP.id_transaccion = 6) as GASTO
			
			
			from CuentasPagar CP join Vehiculos V on V.id = CP.id_vehiculo join Fabricantes F on V.fabricante_id = F.id join Modelos M on V.modelo_id = M.id 
			join TalleresRepuestos TR on TR.id = CP.id_vendedor 

			where CP.id_vehiculo = @idVehiculo and CP.id_transaccion = 6
		end

	else if @idTransaccion = 7 -- OTROS
		begin 
			select V.id as ID,
			CONVERT(varchar(200),(F.fabricante + ' ' + M.modelo + ' ' + CONVERT(varchar(10), V.año) + ' ' + V.color)) 
			as VEHICULO, V.vin as CHASIS, ISNULL(DATEDIFF(DAY, format (v.fecha_importe, 'yyyy-MM-dd'), format (GETDATE(), 'yyyy-MM-dd')), 0) as 'DIAS VIGENTE',	
			TR.taller as PROPIETARIO, TR.telefono1 as TEL, TR.direccion as DIRECCION ,
			format(CP.fecha, 'dd/MM/yyyy' )as 'FECHA COMPRADO', 
			CP.monto_rd as 'PRECIO ($RD)', CP.monto_usd as 'PRECIO ($USD)', 
			(select  G.descripcion from Gastos G join GastoVehiculo GV on GV.id_gasto = G.id join CuentasPagar CP on CP.id_gasto = GV.id where CP.id_transaccion = 7) as GASTO
			
			
			from CuentasPagar CP join Vehiculos V on V.id = CP.id_vehiculo join Fabricantes F on V.fabricante_id = F.id join Modelos M on V.modelo_id = M.id 
			join TalleresRepuestos TR on TR.id = CP.id_vendedor 

			where CP.id_vehiculo = @idVehiculo and CP.id_transaccion = 7
		end
	
	
		
end




GO
/****** Object:  StoredProcedure [dbo].[obtener_detalle_vehiculo_especifico]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[obtener_detalle_vehiculo_especifico]
@idVehiculo int
as

begin
	
	select V.id as ID,F.fabricante as FABRICANTE, M.modelo as MODELO, V.año as AÑO, P.nombre as PROPIETARIO, 
	 V.vin as VIN, V.nota as NOTA, format(V.fecha_importe, 'dd/MM/yyyy' )as 'FECHA COMPRADO', V.terminado as TERMINADO,
	 V.fecha_vendido as 'FECHA VENDIDO', V.precioRD as 'PRECIO ($RD)',
	 V.precioUSD as 'PRECIO ($USD)', V.vendido as VENDIDO, V.pagado as PAGADO, V.color as COLOR, V.nota as DETALLES,
	 V.acto_venta as 'ACTO VENTA', V.matricula as 'MATRICULA ORIGINAL', v.cedula_vendedor as 'CEDULA VENDEDOR',
	 U.ubicacion as UBICACION, format(V.fecha_terminado, 'dd/MM/yyyy' )as 'FECHA TERMINADO', S.suplidor as SUPLIDOR,
	 V.placa as PLACA, V.numero_matricula as 'NUMERO MATRICULA', V.millaje as MILLAJE, V.precio_estimado_rd as 'PRECIO ESTIMADO RD',
	 V.precio_estimado_usd as 'PRECIO ESTIMADO USD', V.fuerza_motriz as 'FUERZA MOTRIZ'
	from Vehiculos V join Fabricantes F on V.fabricante_id = F.id join Modelos M on V.modelo_id = M.id
	join Propietarios P on V.id_propietario = P.id join Ubicaciones U on U.id = V.id_ubicacion
	join Suplidores S on S.id = V.id_suplidor
	where V.id = @idVehiculo
		
end





GO
/****** Object:  StoredProcedure [dbo].[obtener_fabricantes_activos]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[obtener_fabricantes_activos]
as


begin

	select id as ID, fabricante as FABRICANTE, codigo as CODIGO, estado as HABILITADO 
	from Fabricantes
	where estado = 1
	ORDER BY FABRICANTE
end





GO
/****** Object:  StoredProcedure [dbo].[obtener_facturas]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[obtener_facturas]
@desde date, @hasta date
as

begin
	--select V.id, Fac.id as '# Factura', format(V.fecha_vendido,'dd/MM/yyyy') as FECHAVENDIDO, 
	--CONVERT(varchar(200),(F.fabricante + ' ' + M.modelo + ' ' + CONVERT(varchar(10), V.año) + ' ' + V.color)) as VEHICULO,
	--(V.precioVentaRD + PS.precioRD + PT.precioRD) as PRECIORD, sum(pa.monto_rd) as PAGADORD,
	--(V.precioVentaUSD + PS.precioUSD + PT.precioUSD) as PRECIOUSD, sum(pa.monto_usd) as PAGADOUSD, C.cliente as CLIENTE
	--from facturas Fac join Vehiculos V on Fac.idVehiculo = V.id join Fabricantes F on V.fabricante_id = F.id join Modelos M on V.modelo_id = M.id
	--join Propietarios P on V.id_propietario = P.id join FormaVentaVehiculo Pa on V.id=pa.id_vehiculo join Clientes C on V.id_cliente = C.id
	--join PreciosSeguroVehiculo PS on PS.id = Fac.idVehiculo join PreciosTraspasoVehiculo PT on PT.id_vehiculo = Fac.idVehiculo
	--where V.vendido = 1 
	----and format(V.fecha_importe,'yyyy-MM-dd') between
	----format (@desde, 'yyyy-MM-dd') and format (@hasta, 'yyyy-MM-dd')
	--GROUP BY Fac.id ,V.id,V.precioVentaRD, PT.precioRD, PT.precioUSD, PS.precioRD, PS.precioUSD, V.precioVentaUSD ,F.fabricante, M.modelo, V.año, V.total_invertido_usd,V.total_invertido_rd ,V.fecha_vendido, C.cliente, V.color
	
	select F.id as '# Factura', format(V.fecha_vendido,'dd/MM/yyyy') as FECHAVENDIDO,
	CONVERT(varchar(200),(Fab.fabricante + ' ' + M.modelo + ' ' + CONVERT(varchar(10), V.año) + ' ' + V.color)) as VEHICULO,
	(V.precioVentaRD + PS.precioRD + PT.precioRD) as PRECIORD, (V.precioVentaUSD + PS.precioUSD + PT.precioUSD) as PRECIOUSD,
	C.cliente as CLIENTE
	from facturas F join Vehiculos V on V.id = F.idVehiculo join Fabricantes Fab on Fab.id = V.fabricante_id 
	join Modelos M on M.id = V.modelo_id join PreciosSeguroVehiculo PS on PS.id_vehiculo = F.idVehiculo 
	join PreciosTraspasoVehiculo PT on PT.id_vehiculo = F.idVehiculo join Clientes C on F.id_cliente = C.id
	where V.vendido = 1 and format(V.fecha_importe,'yyyy-MM-dd') between
	format (@desde, 'yyyy-MM-dd') and format (@hasta, 'yyyy-MM-dd')

end




GO
/****** Object:  StoredProcedure [dbo].[obtener_gastos_aduanales_activos]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[obtener_gastos_aduanales_activos]
as

begin 

	select id as ID, descripcion as DESCRIPCION, tipo as 'TIPO GASTO', estado as HABILITADO
	from Gastos
	where estado = 1 and tipo = 'OTROS GASTOS'
end





GO
/****** Object:  StoredProcedure [dbo].[obtener_gastos_reparacion_activos]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[obtener_gastos_reparacion_activos]
as

begin 

	select id as ID, descripcion as DESCRIPCION, tipo as 'TIPO GASTO', estado as HABILITADO
	from Gastos
	where estado = 1 and tipo = 'REPARACION'
end





GO
/****** Object:  StoredProcedure [dbo].[obtener_historial_ubicaciones]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create procedure [dbo].[obtener_historial_ubicaciones]
	@idVehiculo int
	as
	
	begin
		select format(HU.fecha, 'dd/MM/yyyy' ) as  FECHA ,U.ubicacion as UBICACION
		from HistorialUbicaciones HU join Ubicaciones U on U.id = HU.id_ubicacion
		where HU.id_vehiculo = @idVehiculo
		 
	end


GO
/****** Object:  StoredProcedure [dbo].[obtener_imagenes_clientes]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[obtener_imagenes_clientes] 
@idCliente  int
as
begin
	select id,img from ImagenesClientes where idCliente = @idCliente
	
end



GO
/****** Object:  StoredProcedure [dbo].[obtener_imagenes_traspasos]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[obtener_imagenes_traspasos] 
@idVehiculo  int
as
begin
	select id,img from ImagenesTraspasos where id_vehiculo = @idVehiculo
	
end



GO
/****** Object:  StoredProcedure [dbo].[obtener_modelos_activos]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[obtener_modelos_activos]
@idFabricante int
as


begin

	select m.id as ID, m.modelo as MODELO, m.codigo as CODIGO, m.estado as HABILITADO 
	from Modelos m join Fabricantes f on m.fabricante_id = f.id 
	where m.fabricante_id = @idFabricante and m.estado = 1
	order by MODELO
end





GO
/****** Object:  StoredProcedure [dbo].[obtener_pagos_credito_vehiculo]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[obtener_pagos_credito_vehiculo]
@idCP int
as

begin
	
		    select format (PCP.fecha, 'dd/MM/yyyy') as 'FECHA PAGO', TP.formaPago as 'TIPO PAGO',PCP.monto_rd as 'PAGADO ($RD)', PCP.monto_usd as 'PAGADO ($USD)',
			PCP.nota as 'NOTA'
			from PagosCuentasPagar PCP join TiposPago TP on TP.id = PCP.id_tipoPago
			where
			PCP.id_cuentaPagar = @idCP
			


		
end



GO
/****** Object:  StoredProcedure [dbo].[obtener_pagos_vehiculo]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[obtener_pagos_vehiculo]
@idVehiculo int, @idTransaccion int
as


begin
	select Format(V.fecha_importe,'dd/MM/yyyy') as 'FECHA DE PAGO', TP.formaPago as 'TIPO PAGO' ,
	FC.monto_rd as 'PAGO($RD)', FC.monto_usd as 'PAGO($USD)', FC.nota as 'DETALLE'
	from FormaCompraVehiculo FC join Vehiculos V on V.id = FC.id_vehiculo join TiposPago TP on TP.id = FC.id_tipo_pago
	where FC.id_vehiculo = @idVehiculo and FC.id_transaccion = @idTransaccion 
	
end




GO
/****** Object:  StoredProcedure [dbo].[obtener_paises_activos]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	create procedure [dbo].[obtener_paises_activos]
	as
	
	begin
		select id as ID, pais as PAIS, estado as ESTADO from Paises  where estado = 1
	end


GO
/****** Object:  StoredProcedure [dbo].[obtener_permiso_usuario]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[obtener_permiso_usuario]
@idUsuario int
as


begin

	select tasaDolar as 'TASA CAMBIO', 
	crearUsuarios as 'CREAR USUARIOS', fabricantesModelos as 'CREAR FABRICANTES/MODELOS',
	piezasRepuestos as 'CREAR PIEZAS/REPUESTOS', crearTaller as 'CREAR TALLER', crearPropietarios as 'CREAR PROPIETARIOS', 
	crearClientes as 'CREAR CLIENTES',crearGastos as 'CREAR GASTOS', importarVehiculo 'IMPORTAR VEHICULOS', 
	compras as 'COMPRAS', cambiarEstadosVehiculo as 'CAMBIAR ESTADO VEHICULOS',
	agreagarGastos as 'AGREGAR GASTO A VEHICULO', agregarPiezas as 'AGREGAR PIEZAS A VEHICULO', 
	facturacion as 'FACTURACION', reportes as REPORTES, estadoUsuario as 'ESTADO USUARIO', modificarVehiculo as 'MODIFICAR VEHICULO',
	cuentasCobrar as 'CUENTAS COBRAR', cuentasPagar as 'CUENTAS PAGAR', actualizarDiarioTasa 'ACTUALIZAR TASA DIARIO',
	agregar_paises as 'AGREGAR PAISES', agregar_ciudades as 'AGREGAR CIUDADES', agregar_colores as 'AGREGAR COLORES',
	agregar_ubicaciones as 'AGREGAR UBICACIONES', agregar_suplidores as 'AGREGAR SUPLIDORES', agregar_seguros as 'AGREGAR SEGUROS'
	from Usuarios where id = @idUsuario
	
end



GO
/****** Object:  StoredProcedure [dbo].[obtener_precio_componente_seleccionado]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[obtener_precio_componente_seleccionado]
@idComponente int
as


begin

	select precio_rd as 'PRECIO ($RD)', precio_usd as 'PRECIO ($USD)'
	from Componentes where id = @idComponente
	
end





GO
/****** Object:  StoredProcedure [dbo].[obtener_propietarios_activos]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[obtener_propietarios_activos]

as


begin

	select id as ID, nombre as PROPIETARIO, telefono as 'TEL.', estado as HABILITADO
	from Propietarios
	where estado = 1
	
end





GO
/****** Object:  StoredProcedure [dbo].[obtener_recibos_cobros]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[obtener_recibos_cobros]
@desde date, @hasta date, @cliente varchar(50)
as

begin
	if @cliente = ''
		begin
			select V.id as 'ID VEHICULO',PCC.id as '# RECIBO', C.cliente as CLIENTE, PCC.monto_rd as 'MONTO ($RD)',
			PCC.monto_usd as 'MONTO $(USD)', CC.id as '# CUENTA COBRAR'
			from 
			PagosCuentasCobrar PCC join CuentasCobrar CC on PCC.id_cuentaCobrar = CC.id join
			Vehiculos V on V.id = CC.id_vehiculo
			join Clientes C on C.id = V.id_cliente
			where format(PCC.fecha,'yyyy-MM-dd') between
			format (@desde, 'yyyy-MM-dd') and format (@hasta, 'yyyy-MM-dd')
		end
	else
		begin
			select V.id as 'ID VEHICULO',PCC.id as '# RECIBO', C.cliente as CLIENTE, PCC.monto_rd as 'MONTO ($RD)',
			PCC.monto_usd as 'MONTO $(USD)',CC.id as '# CUENTA COBRAR'
			from 
			PagosCuentasCobrar PCC join CuentasCobrar CC on PCC.id_cuentaCobrar = CC.id join
			Vehiculos V on V.id = CC.id_vehiculo
			join Clientes C on C.id = V.id_cliente
			where format(PCC.fecha,'yyyy-MM-dd') between
			format (@desde, 'yyyy-MM-dd') and format (@hasta, 'yyyy-MM-dd')
			and C.cliente LIKE '%' + @cliente + '%'
		end

end



GO
/****** Object:  StoredProcedure [dbo].[obtener_seguros_activos]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	create procedure [dbo].[obtener_seguros_activos]
	as
	
	begin
		select id as ID, nombre as SEGURO, estado as ESTADO from Seguros  where estado = 1
	end


GO
/****** Object:  StoredProcedure [dbo].[obtener_suplidores_activos]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	create procedure [dbo].[obtener_suplidores_activos]
	as
	
	begin
		select id as ID, suplidor as SUPLIDOR, estado as ESTADO from Suplidores  where estado = 1
	end



GO
/****** Object:  StoredProcedure [dbo].[obtener_talleresRepuestos_activos]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[obtener_talleresRepuestos_activos]

as


begin

	select id as ID ,taller as 'TALLER', direccion as DIRECCION, telefono1 as 'TEL. 1', telefono2 as 'TEL. 2', estado as HABILITADO
	from TalleresRepuestos where estado = 1
	

end





GO
/****** Object:  StoredProcedure [dbo].[obtener_tasa_dolar]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[obtener_tasa_dolar]

as

begin

	select tasaDolar as TASA, format(fechaActualizado,'dd/MM/yyyy') as FACTUALIZADO from TasaDolar where id = 1
	

end


GO
/****** Object:  StoredProcedure [dbo].[obtener_tipos_pagos_sin_credito]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[obtener_tipos_pagos_sin_credito]

as


begin

	select id as ID, formaPago as TIPOPAGO from TiposPago
	where id != 3
	
end





GO
/****** Object:  StoredProcedure [dbo].[obtener_tipos_pagos_sin_vehiculo]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create procedure [dbo].[obtener_tipos_pagos_sin_vehiculo]
	
	as
	
	begin
		select id as ID, formaPago as TIPOPAGO from TiposPago
		where id != 2
		 
	end


GO
/****** Object:  StoredProcedure [dbo].[obtener_tipos_transacciones_cp]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create procedure [dbo].[obtener_tipos_transacciones_cp]
	
	as
	
	begin
		select id as ID, transaccion as TRANSACCION from TipoTransaccion
		where id != 1 and id != 3
		 
	end


GO
/****** Object:  StoredProcedure [dbo].[obtener_todos_ciudades]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	create procedure [dbo].[obtener_todos_ciudades]
	@idPais int
	as
	
	begin
		select id as ID, ciudad as CIUDAD, estado as ESTADO from Ciudades
		where idPais = @idPais
	end


GO
/****** Object:  StoredProcedure [dbo].[obtener_todos_clientes]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[obtener_todos_clientes]
as
begin

	select C.id as ID, C.cliente as CLIENTE, C.rnc_cedula as 'RNC/CEDULA', C.direccion as DIRECCION ,
	telefono as 'TEL.',P.pais as PAIS, Ci.ciudad as CIUDAD ,C.estado as HABILITADO
	
	from Clientes C left join Paises P on P.id = C.id_pais left join Ciudades Ci on Ci.id = C.id_ciudad
	
end


--***********************************************NEW*********************************************************************
--*************************************************************************************************************************
--*************************************************************************************************************************


GO
/****** Object:  StoredProcedure [dbo].[obtener_todos_colores]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create procedure [dbo].[obtener_todos_colores]
	as
	
	begin
		select id as ID, color as COLOR, estado as ESTADO from Colores 
	end


GO
/****** Object:  StoredProcedure [dbo].[obtener_todos_componentes]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[obtener_todos_componentes]
@idFabricante int, @idModelo int, @año int
as


begin

	select componente as REPUESTO, precio_rd as 'PRECIO ($RD)', precio_usd as 'PRECIO ($USD)', estado as HABILITADO, id as ID
	from Componentes
	where fabricante_id = @idFabricante AND modelo_id = @idModelo AND año = @año

end





GO
/****** Object:  StoredProcedure [dbo].[obtener_todos_fabricantes]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[obtener_todos_fabricantes]
as


begin

	select id as ID, fabricante as FABRICANTE, codigo as CODIGO, estado as HABILITADO from Fabricantes
	ORDER BY FABRICANTE
end





GO
/****** Object:  StoredProcedure [dbo].[obtener_todos_gastos]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[obtener_todos_gastos]
as

begin 

	select id as ID, descripcion as DESCRIPCION, tipo as 'TIPO GASTO', estado as HABILITADO
	from Gastos
end





GO
/****** Object:  StoredProcedure [dbo].[obtener_todos_modelos]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[obtener_todos_modelos]
@idFabricante int
as


begin

	select m.id as ID, m.modelo as MODELO, m.codigo as CODIGO, m.estado as HABILITADO 
	from Modelos m join Fabricantes f on m.fabricante_id = f.id 
	where m.fabricante_id = @idFabricante
	order by MODELO
end





GO
/****** Object:  StoredProcedure [dbo].[obtener_todos_paises]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create procedure [dbo].[obtener_todos_paises]
	as
	
	begin
		select id as ID, pais as PAIS, estado as ESTADO from Paises 
	end


GO
/****** Object:  StoredProcedure [dbo].[obtener_todos_propietarios]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[obtener_todos_propietarios]

as


begin

	select id as ID, nombre as PROPIETARIO,rncCedula as 'RNC/CEDULA', direccion as DIRECCION ,telefono as 'TEL.', estado as HABILITADO
	from Propietarios
	
end





GO
/****** Object:  StoredProcedure [dbo].[obtener_todos_seguros]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create procedure [dbo].[obtener_todos_seguros]
	as
	
	begin
		select id as ID, nombre as NOMBRE,telefono as TELEFONO ,estado as ESTADO from Seguros 
	end


GO
/****** Object:  StoredProcedure [dbo].[obtener_todos_suplidores]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create procedure [dbo].[obtener_todos_suplidores]
	as
	
	begin
		select S.id as ID,S.suplidor as SUPLIDOR,S.rnc_cedula as 'RNC/CEDULA' ,P.pais as PAIS, C.ciudad as CIUDAD,
		 S.direccion as DIRECCION,S.telefono ,S.estado as ESTADO
		from Suplidores S join Paises P on P.id = S.id_pais
		join Ciudades C on C.id = S.id_ciudad
	end


GO
/****** Object:  StoredProcedure [dbo].[obtener_todos_talleresRepuestos]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[obtener_todos_talleresRepuestos]

as


begin

	select id as ID ,taller as 'TALLER O TIENDA', direccion as DIRECCION, telefono1 as 'TEL. 1', telefono2 as 'TEL. 2', estado as HABILITADO
	from TalleresRepuestos
	

end





GO
/****** Object:  StoredProcedure [dbo].[obtener_todos_tipos_pagos]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[obtener_todos_tipos_pagos]

as


begin

	select id as ID, formaPago as TIPOPAGO from TiposPago
	
end





GO
/****** Object:  StoredProcedure [dbo].[obtener_todos_ubicaciones]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create procedure [dbo].[obtener_todos_ubicaciones]
	as
	
	begin
		select U.id as ID, P.pais as PAIS, C.ciudad as CIUDAD, U.ubicacion as LUGAR, U.estado as ESTADO
		from Ubicaciones U join Paises P on P.id = U.id_pais
		join Ciudades C on C.id = U.id_ciudad
	end


GO
/****** Object:  StoredProcedure [dbo].[obtener_todos_usuarios]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[obtener_todos_usuarios]
as
begin

	select id as ID, usuario as USUARIO, nombreApellido as NOMBRE, tasaDolar as 'TASA CAMBIO', 
	crearUsuarios as 'CREAR USUARIOS', fabricantesModelos as 'CREAR FABRICANTES/MODELOS',
	piezasRepuestos as 'CREAR PIEZAS/REPUESTOS', crearTaller as 'CREAR TALLER', crearPropietarios as 'CREAR PROPIETARIOS', 
	crearClientes as 'CREAR CLIENTES',crearGastos as 'CREAR GASTOS', importarVehiculo 'VEHICULOS INVENTARIO', 
	compras as 'COMPRAS', cambiarEstadosVehiculo as 'CAMBIAR ESTADO VEHICULOS',
	agreagarGastos as 'AGREGAR GASTO A VEHICULO', agregarPiezas as 'AGREGAR PIEZAS A VEHICULO', 
	facturacion as 'FACTURACION',modificarVehiculo as 'MODIFICAR VEHICULO', cuentasPagar as 'CUENTAS PAGAR' ,cuentasCobrar as 'CUENTAS COBRAR',
	reportes as REPORTES, actualizarDiarioTasa as 'ACTUALIZAR TASA DIARIO' ,estadoUsuario as 'ESTADO USUARIO', clave as CLAVE,
	agregar_paises as 'AGREGAR PAISES', agregar_ciudades as 'AGREGAR CIUDADES', agregar_colores as 'AGREGAR COLORES',
	agregar_ubicaciones as 'AGREGAR UBICACIONES', agregar_suplidores as 'AGREGAR SUPLIDORES', agregar_seguros as 'AGREGAR SEGUROS'
	from Usuarios where id != 1
	
end



GO
/****** Object:  StoredProcedure [dbo].[obtener_total_a_cobrar_credito_vehiculo]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[obtener_total_a_cobrar_credito_vehiculo]
@idCC int
as

begin
	select monto_rd as 'CREDITO RD' , monto_usd as 'CREDITO USD' 
	from CuentasCobrar where id = @idCC
		
			
end



GO
/****** Object:  StoredProcedure [dbo].[obtener_total_a_pagar_credito_vehiculo]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[obtener_total_a_pagar_credito_vehiculo]
@idCP int
as

begin
	select monto_rd as 'CREDITO RD' , monto_usd as 'CREDITO USD' 
	from CuentasPagar where id = @idCP
		
			
end


GO
/****** Object:  StoredProcedure [dbo].[obtener_ubicaciones_activos]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	create procedure [dbo].[obtener_ubicaciones_activos]
	as
	
	begin
		select id as ID, ubicacion as LUGAR, estado as ESTADO from Ubicaciones  where estado = 1
	end



GO
/****** Object:  StoredProcedure [dbo].[obtener_vehiculo_componentes]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[obtener_vehiculo_componentes]
@idVehiculo int
as

begin
	
	select C.componente as DESCRIPCION, GV.monto_rd as'PRECIO ($RD)',GV.monto_usd 'PRECIO ($USD)' , GV.id as ID,
	GV.fecha as FECHA
	from GastoVehiculo GV join Componentes C on C.id = GV.id_gasto
	where GV.id_vehiculo = @idVehiculo and GV.id_transaccion = 5
	
end




GO
/****** Object:  StoredProcedure [dbo].[obtener_vehiculo_gastos_aduanales]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[obtener_vehiculo_gastos_aduanales]
@idVehiculo int
as


begin

	select G.descripcion as DESCRIPCION, TR.taller as TALLER ,GV.monto_rd as'PRECIO ($RD)', Gv.monto_usd as 'PRECIO ($USD)' , GV.id as ID,
	GV.fecha as FECHA
	from GastoVehiculo GV join Gastos G on GV.id_gasto = G.id join TalleresRepuestos TR on GV.id_proveedor = TR.id
	where GV.id_vehiculo = @idVehiculo and GV.id_transaccion = 7
	
end




GO
/****** Object:  StoredProcedure [dbo].[obtener_vehiculo_gastos_reparacion]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[obtener_vehiculo_gastos_reparacion]
@idVehiculo int
as


begin

	select G.descripcion as DESCRIPCION, TR.taller as TALLER ,GV.monto_rd as'PRECIO ($RD)', Gv.monto_usd as 'PRECIO ($USD)' , GV.id as ID,
	GV.fecha as FECHA
	from GastoVehiculo GV join Gastos G on GV.id_gasto = G.id join TalleresRepuestos TR on GV.id_proveedor = TR.id
	where GV.id_vehiculo = @idVehiculo and GV.id_transaccion = 6
	
end


GO
/****** Object:  StoredProcedure [dbo].[obtener_vehiculos]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[obtener_vehiculos]
@tipo varchar(50), @desde date, @hasta date
as
/*
format(@desde,'dd/MM/yyyy') and format(@hasta,'dd/MM/yyyy')
*/

begin
	if @tipo = 'proceso'
		begin
			select V.id as ID,F.fabricante as MARCA, M.modelo as MODELO, V.año as AÑO, V.color as COLOR ,total_invertido_rd as 'COSTO ($RD)',
			total_invertido_usd as 'COSTO($USD)' , P.nombre as PROPIETARIO, 
			V.vin as VIN, V.nota as DETALLES, format(V.fecha_importe, 'dd/MM/yyyy' )as 'FECHA COMPRA', V.acto_venta as 'ACTO DE VENTA',
			v.matricula as 'MATRICULA ORIGINAL', V.cedula_vendedor as 'CEDULA VENDEDOR', U.ubicacion as 'UBICACION',  S.suplidor as SUPLIDOR, 
			V.numero_matricula as '#Matrícula', V.placa as PLACA, V.millaje as MILLAJE, 
			v.fuerza_motriz as 'FUERZA MOTRIZ'
			from Vehiculos V join Fabricantes F on V.fabricante_id = F.id join Modelos M on V.modelo_id = M.id
			join Propietarios P on V.id_propietario = P.id join Ubicaciones U on U.id = V.id_ubicacion 
			join Suplidores S on S.id = V.id_suplidor
			where format(V.fecha_importe,'yyyy-MM-dd')  between  format(@desde,'yyyy-MM-dd') and format(@hasta,'yyyy-MM-dd')
			and V.terminado = 0 and V.vendido = 0 and V.estado = 1
			ORDER By ID DESC
		end
	else if @tipo = 'terminado'
		begin
			select V.id as ID,F.fabricante as MARCA, M.modelo as MODELO, V.año as AÑO, V.color as COLOR ,total_invertido_rd as 'COSTO($RD)',
			total_invertido_usd as 'COSTO($USD)' , P.nombre as PROPIETARIO, 
			V.vin as VIN, V.nota as DETALLES, format(V.fecha_importe, 'dd/MM/yyyy' )as 'FECHA COMPRADO', 
			format(V.fecha_terminado, 'dd/MM/yyyy' )as 'FECHA INVENTARIO' , V.acto_venta as 'ACTO DE VENTA',
			v.matricula as 'MATRICULA ORIGINAL', V.cedula_vendedor as 'CEDULA VENDEDOR', U.ubicacion as 'UBICACION',  S.suplidor as SUPLIDOR, 
			V.numero_matricula as '#Matrícula', V.placa as PLACA, V.millaje as MILLAJE, 
			v.fuerza_motriz as 'FUERZA MOTRIZ'  
			from Vehiculos V join Fabricantes F on V.fabricante_id = F.id join Modelos M on V.modelo_id = M.id
			join Propietarios P on V.id_propietario = P.id join Ubicaciones U on U.id = V.id_ubicacion
			join Suplidores S on S.id = V.id_suplidor
			where format(V.fecha_importe,'yyyy-MM-dd')  between  format(@desde,'yyyy-MM-dd') and format(@hasta,'yyyy-MM-dd')
			and V.terminado = 1 and vendido = 0 and V.estado = 1
			ORDER By ID DESC
		end
	end




GO
/****** Object:  StoredProcedure [dbo].[obtener_vehiculos_para_facturar]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[obtener_vehiculos_para_facturar]

as

begin


	select  
	CONVERT(varchar(200),(F.fabricante + ' ' + M.modelo + ' ' + CONVERT(varchar(10), V.año) + ' ' + V.color)) as VEHICULO, 
	V.id as ID
	from Vehiculos V 
	join Fabricantes F on V.fabricante_id = F.id join Modelos M on V.modelo_id = M.id
	
	and V.terminado = 1 and v.vendido = 0


end




GO
/****** Object:  StoredProcedure [dbo].[registrar_ciudad]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	create procedure [dbo].[registrar_ciudad]
	@idPais int,@ciudad varchar(100), @estado bit, @mensaje int output
	as
	set @mensaje = 0;
	begin
		insert into Ciudades(idPais,ciudad,estado)
		Values (@idPais,@ciudad ,@estado)
		set @mensaje = 1;
	
	end


GO
/****** Object:  StoredProcedure [dbo].[registrar_cliente]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[registrar_cliente]
@cliente varchar(200), @cedulaRNC varchar(50), @tel varchar(50), @estado bit, @mensaje int output, @direccion varchar(200),
@idPais int, @idCiudad int
as
set @mensaje = 0

begin

	if not exists(select * from Clientes where cliente = @cliente or rnc_cedula = @cedulaRNC)
		begin
			insert into Clientes(cliente, rnc_cedula, telefono, estado, direccion, id_pais, id_ciudad)
			VALUES (@cliente, @cedulaRNC, @tel, @estado, @direccion, @idPais, @idCiudad)
			set @mensaje = 1

		end

	else
		begin 
			set @mensaje = 2
		end
end



GO
/****** Object:  StoredProcedure [dbo].[registrar_color]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	create procedure [dbo].[registrar_color]
	@color varchar(100), @estado bit, @mensaje int output
	as
	set @mensaje = 0;
	begin
		insert into Colores (color,estado)
		Values (@color, @estado)
		set @mensaje = 1;
	
	end



GO
/****** Object:  StoredProcedure [dbo].[registrar_componentes]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[registrar_componentes]
@idFabricante int, @idModelo int, @año int, @componente varchar(200), @precioUsd float, 
@precioRd float, @estado bit, @mensaje int output
as
set @mensaje = 0

begin

	if not exists(select * from Componentes where fabricante_id = @idFabricante AND modelo_id = @idModelo AND año = @año AND componente = @componente)
		begin
			insert into Componentes (fabricante_id, modelo_id,año, componente, precio_rd, precio_usd, estado)
			VALUES (@idFabricante, @idModelo, @año, @componente, @precioRd, @precioUsd, @estado)
			set @mensaje = 1

		end

	else
		begin 
			set @mensaje = 2
		end
end





GO
/****** Object:  StoredProcedure [dbo].[registrar_fabricante]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[registrar_fabricante]
@fabricante varchar(50), @codigo varchar(50), @estado bit, @mensaje int output
as
set @mensaje = 0
begin
	if exists(select * from Fabricantes where fabricante = @fabricante OR codigo = @codigo)
		begin
			set @mensaje = 2
		end
	else
		begin
			insert into Fabricantes(codigo, fabricante, estado)
			Values (@codigo, @fabricante, @estado)
			set @mensaje = 1
		end
end





GO
/****** Object:  StoredProcedure [dbo].[registrar_gasto]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[registrar_gasto]
@descripcion varchar(250),@tipo varchar(50), @estado bit, @mensaje int output
as
set @mensaje = 0

begin

	if not exists(select * from Gastos where descripcion = @descripcion)
		begin
			insert into Gastos(descripcion, tipo, estado)
			VALUES (@descripcion, @tipo, @estado)
			set @mensaje = 1

		end

	else
		begin 
			set @mensaje = 2
		end
end





GO
/****** Object:  StoredProcedure [dbo].[registrar_modelo]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[registrar_modelo]
@modelo varchar(50), @codigo varchar(50), @estado bit, @id_fabricante int,@mensaje int output
as
set @mensaje = 0
begin
	if exists(select * from Modelos where modelo = @modelo OR codigo = @codigo and fabricante_id = @id_fabricante)
		begin
			set @mensaje = 2
		end
	else
		begin
			insert into Modelos(fabricante_id ,codigo, modelo, estado)
			Values (@id_fabricante,@codigo, @modelo, @estado)
			set @mensaje = 1
		end
end





GO
/****** Object:  StoredProcedure [dbo].[registrar_pago_cuenta_cobrar]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[registrar_pago_cuenta_cobrar]
@idVehiculo int, @montoRD float, @montoUSD float, @detalles varchar(200), @mensaje bit output, @fecha date,
@idTipoPago int, @idCC int
as
set @mensaje = 0;
begin
	
	
	update CuentasCobrar set balance_rd = balance_rd - @montoRD, balance_usd = balance_usd - @montoUSD where
	id_vehiculo = @idVehiculo and id = @idCC
	
	declare @balanceRD float= (Select balance_rd from CuentasCobrar where id = @idCC)
	declare @balanceUSD float= (Select balance_usd from CuentasCobrar where id = @idCC)

	insert into PagosCuentasCobrar(id_cuentaCobrar, monto_rd, monto_usd, nota, fecha, id_tipoPago, balance_rd, balance_usd)
	VALUES (@idCC, @montoRD, @montoUSD, @detalles, @fecha, @idTipoPago, @balanceRD, @balanceUSD)
	
	if @idTipoPago = 1
			begin
				 insert into DetallesEfectivoGeneral(idVehiculo, tipoCuenta, montoRD, montoUSD, fecha, documento, numeroDocumento)
				 values (@idVehiculo, 2, @montoRD, @montoUSD, @fecha, 'CxC RECIBO PAGO', (select MAX(id) from CuentasCobrar))
			end
	set @mensaje = 1;
end



GO
/****** Object:  StoredProcedure [dbo].[registrar_pago_cuenta_pagar]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[registrar_pago_cuenta_pagar]
@idVehiculo int, @montoRD float, @montoUSD float, @detalles varchar(200), @mensaje bit output, @fecha date,
@idTipoPago int, @idCP int
as
set @mensaje = 0;
begin

	update CuentasPagar set balance_rd = balance_rd - @montoRD, balance_usd = balance_usd - @montoUSD where
	id_vehiculo = @idVehiculo and id = @idCP
	declare @balanceRD float= (Select balance_rd from CuentasPagar where id = @idCP)
	declare @balanceUSD float= (Select balance_usd from CuentasPagar where id = @idCP)

	insert into PagosCuentasPagar(id_cuentaPagar, monto_rd, monto_usd, nota, fecha, id_tipoPago, balance_rd, balance_usd)
	VALUES (@idCP, @montoRD, @montoUSD, @detalles, @fecha, @idTipoPago, @balanceRD, @balanceUSD)
	
	

	
	
	if @idTipoPago = 1
		begin
			insert into DetallesEfectivoGeneral(idVehiculo, tipoCuenta, montoRD, montoUSD, fecha, documento, numeroDocumento)
			values (@idVehiculo, 1, @montoRD, @montoUSD, @fecha, 'CxP RECIBO PAGO', (select MAX(id) from CuentasPagar))
		end

	set @mensaje = 1;
end



GO
/****** Object:  StoredProcedure [dbo].[registrar_pais]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	create procedure [dbo].[registrar_pais]
	@pais varchar(100), @estado bit, @mensaje int output
	as
	set @mensaje = 0;
	begin
		insert into Paises (pais,estado)
		Values (@pais, @estado)
		set @mensaje = 1;
	
	end


GO
/****** Object:  StoredProcedure [dbo].[registrar_propietario]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[registrar_propietario]
@propietario varchar(50), @tel varchar(50), @estado bit, @mensaje int output, @direccion varchar(200),
@rncCedula varchar(50)
as
set @mensaje = 0

begin

	if not exists(select * from Propietarios where rncCedula = @rncCedula)
		begin
			insert into Propietarios(nombre, telefono, estado, direccion, rncCedula)
			VALUES (@propietario, @tel, @estado, @direccion, @rncCedula)
			set @mensaje = 1

		end

	else
		begin 
			set @mensaje = 2
		end
end





GO
/****** Object:  StoredProcedure [dbo].[registrar_seguro]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	create procedure [dbo].[registrar_seguro]
	@nombre varchar(100),@telefono varchar(50) ,@estado bit, @mensaje int output
	as
	set @mensaje = 0;
	begin
		insert into Seguros (nombre, telefono, estado)
		Values (@nombre,@telefono ,@estado)
		set @mensaje = 1;
	
	end


GO
/****** Object:  StoredProcedure [dbo].[registrar_suplidor]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	create procedure [dbo].[registrar_suplidor]
	@suplidor varchar(100), @rnc_cedula varchar(100), @idPais int, @idCiudad int , @direccion varchar(100),
	@telefono varchar(100) ,@estado bit, @mensaje int output
	as
	set @mensaje = 0;
	begin
		insert into Suplidores(suplidor, rnc_cedula,id_pais, id_ciudad, direccion, telefono, estado)
		Values (@suplidor,@rnc_cedula,@idPais, @idCiudad, @direccion ,@telefono ,@estado)
		set @mensaje = 1;
	
	end



GO
/****** Object:  StoredProcedure [dbo].[registrar_talleres]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[registrar_talleres]
@taller varchar(100), @direccion varchar(200),@tel1 varchar(50), @tel2 varchar(50),@estado bit, @mensaje int output
as
set @mensaje = 0

begin

	if not exists(select * from TalleresRepuestos where taller =@taller)
		begin
			insert into TalleresRepuestos (taller, direccion, telefono1, telefono2, estado)
			VALUES (@taller, @direccion, @tel1, @tel2, @estado)
			set @mensaje = 1

		end

	else
		begin 
			set @mensaje = 2
		end
end





GO
/****** Object:  StoredProcedure [dbo].[registrar_ubicacion]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	create procedure [dbo].[registrar_ubicacion]
	@ubicacion varchar(100),@idPais int, @idCiudad int ,@estado bit, @mensaje int output
	as
	set @mensaje = 0;
	begin
		insert into Ubicaciones(id_pais, id_ciudad, ubicacion, estado)
		Values (@idPais, @idCiudad, @ubicacion ,@estado)
		set @mensaje = 1;
	
	end



GO
/****** Object:  StoredProcedure [dbo].[registrar_usuarios]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[registrar_usuarios]
@usuario varchar(50), @nombre varchar(50), @clave varchar(50), @tasaDolar bit, @crearUsuarios bit,
@fabricantesModelos bit, @piezasRepuestos bit, @crearTaller bit, @crearPropietarios bit, @crearClientes bit, 
@crearGastos bit, @importarVehiculos bit, @compras bit, @cambiarEstadosVehiculos bit, @agregarGastos bit,
@agregarPiezas bit, @facturacion bit, @reportes bit, @estado bit, @mensaje int output, @modificarVehiculo bit, 
@cuentasPagar bit, @cuentasCobrar bit, @actualizarTasaDiario bit, @crearPais bit, @crearCiudad bit, @crearSuplidor bit,
@crearColor bit, @crearUbicacion bit, @crearSeguros bit
as
set @mensaje = 0

begin

	if not exists(select * from Usuarios where usuario = @usuario)
		begin
			insert into Usuarios(usuario, clave, nombreApellido, tasaDolar, crearUsuarios, fabricantesModelos,
			 piezasRepuestos, crearTaller, crearPropietarios, crearClientes, crearGastos, importarVehiculo, 
			 compras, cambiarEstadosVehiculo, agreagarGastos, agregarPiezas, facturacion, reportes, estadoUsuario,
			 modificarVehiculo, cuentasCobrar, cuentasPagar, actualizarDiarioTasa, agregar_paises, agregar_ciudades,
			 agregar_suplidores, agregar_colores, agregar_ubicaciones, agregar_seguros) 
			VALUES(@usuario, @clave, @nombre, @tasaDolar, @crearUsuarios, @fabricantesModelos, @piezasRepuestos,
			@crearTaller, @crearPropietarios, @crearClientes, @crearGastos, @importarVehiculos, @compras,
			@cambiarEstadosVehiculos, @agregarGastos, @agregarPiezas, @facturacion, @reportes, @estado, @modificarVehiculo,
			@cuentasCobrar, @cuentasPagar, @actualizarTasaDiario, @crearPais, @crearCiudad, @crearSuplidor, @crearColor,
			@crearUbicacion, @crearSeguros) 
			set @mensaje = 1

		end

	else
		begin 
			set @mensaje = 2
		end
end



GO
/****** Object:  StoredProcedure [dbo].[registrar_vehiculo]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[registrar_vehiculo]
@idFabricante int, @idModelo int, @año int, @precioUsd float,@vin varchar(50), @idPropietario int, @fecha date,
@nota varchar(250),@precioRd float, @mensaje int output, @color varchar(50),
@matriculaOriginal bit, @cedulaVendedor bit, @actoVenta bit, @idUbicacion int, @rdPrecioVentaEstimado float,
@usdPrecioVentaEstimado float, @placa varchar(30), @numeroMatricula varchar(100), @millaje varchar(100),
@fuerzaMotriz varchar(30), @idSuplidor int

as
set @mensaje = 0

begin

	insert into Vehiculos(fabricante_id, modelo_id, año, precioUSD, precioRD, id_propietario, terminado, 
	vendido, pagado, fecha_importe, vin, nota, estado,total_invertido_rd, total_invertido_usd, color, matricula, acto_venta, cedula_vendedor, id_ubicacion,
	precio_estimado_rd, precio_estimado_usd, placa, numero_matricula, millaje, fuerza_motriz, id_suplidor)
	VALUES(@idFabricante, @idModelo, @año, @precioUsd, @precioRd, @idPropietario, 0,0,0,@fecha, @vin, @nota, 1, @precioRd,
	@precioUsd, @color, @matriculaOriginal, @actoVenta, @cedulaVendedor, @idUbicacion, @rdPrecioVentaEstimado, @usdPrecioVentaEstimado,
	@placa, @numeroMatricula, @millaje, @fuerzaMotriz, @idSuplidor)
	
	insert into HistorialUbicaciones(id_vehiculo, id_ubicacion, fecha)
	values ((SELECT MAX(id) from Vehiculos), @idUbicacion, @fecha)
	set @mensaje = 1
end


GO
/****** Object:  StoredProcedure [dbo].[reporte_cuentas_cobrar]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[reporte_cuentas_cobrar]
--@desde date, @hasta date
as

begin
	select  V.id as IDVEHICULO,V.fecha_vendido as  FECHAVENTA ,C.cliente as CLIENTE,
			CONVERT(varchar(200),(F.fabricante + ' ' + M.modelo + ' ' + CONVERT(varchar(10), V.año) + ' ' + V.color)) as VEHICULO, V.vin as CHASIS,
			CC.monto_rd as TOTALPAGARRD, CC.monto_usd as TOTALPAGARUSD, (CC.monto_rd - CC.balance_rd ) as PAGADORD,(CC.monto_usd - CC.balance_usd )as PAGADOUSD,
			cc.balance_rd as PENDIENTERD, cc.balance_usd as PENDIENTEUSD,
			ISNULL(DATEDIFF(DAY, format (v.fecha_vendido, 'yyyy-MM-dd'), format (GETDATE(), 'yyyy-MM-dd')), 0) as DIASVIGENTE, CC.id as IDCUENTACOBRAR,
			TP.transaccion as TRANSACCION, CC.id_factura as 'FACTURA'
			from Vehiculos V 
			join Clientes C on C.id = V.id_cliente join Fabricantes F on F.id = V.fabricante_id 
			join Modelos M on M.id = V.modelo_id  
			join CuentasCobrar CC on CC.id_vehiculo = V.id
			join TipoTransaccion TP on TP.id = CC.id_transaccion
			where V.vendido = 1 and (CC.balance_rd != 0 and CC.balance_usd !=0  )
			
			--and format(CC.fecha,'yyyy-MM-dd') between
			--format (@desde, 'yyyy-MM-dd') and format (@hasta, 'yyyy-MM-dd')
			
			GROUP BY C.cliente, CC.monto_rd, CC.monto_usd, CC.balance_rd, CC.balance_usd,
			F.fabricante, M.modelo, V.año, V.color, V.id, V.vin,V.fecha_vendido, CC.id, TP.transaccion,CC.id_factura
			order by DATEDIFF(DAY, format (v.fecha_vendido, 'yyyy-MM-dd'), format (GETDATE(), 'yyyy-MM-dd')) DESC
end



GO
/****** Object:  StoredProcedure [dbo].[reporte_cuentas_pagar]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[reporte_cuentas_pagar]
@desde date, @hasta date, @idTransaccion int
as

begin

	
	if @idTransaccion = 2
		begin
			select CP.id as CUENTAPAGAR,TP.transaccion as TRANSACCION , V.fecha_importe as  FECHACOMPRA ,S.suplidor as PROPIETARIO,
			CONVERT(varchar(200),(F.fabricante + ' ' + M.modelo + ' ' + CONVERT(varchar(10), V.año) + ' ' + V.color)) as VEHICULO,
			CP.monto_rd as TOTALPAGARRD, CP.monto_usd as TOTALPAGARUSD,
			(CP.monto_rd - CP.balance_rd) as PAGADORD, (CP.monto_usd - CP.balance_usd) as PAGADOUSD,
			CP.balance_rd as PENDIENTERD, CP.balance_usd as PENDIENTEUSD,
			ISNULL(DATEDIFF(DAY, format (v.fecha_importe, 'yyyy-MM-dd'),
			format (GETDATE(), 'yyyy-MM-dd')), 0) as DIASVIGENTE
			from CuentasPagar CP join Vehiculos V on V.id = CP.id_vehiculo join Suplidores S on S.id = V.id_suplidor
			join Fabricantes F on F.id = V.fabricante_id join Modelos M on M.id = V.modelo_id
			join TipoTransaccion TP on TP.id = CP.id_transaccion
			where CP.balance_rd > 0 and CP.balance_usd > 0 and CP.id_transaccion = @idTransaccion
			and format(CP.fecha,'yyyy-MM-dd') between
			format (@desde, 'yyyy-MM-dd') and format (@hasta, 'yyyy-MM-dd')
		end
	 else if @idTransaccion = 4
		begin
			select CP.id as CUENTAPAGAR,TP.transaccion as TRANSACCION ,V.fecha_importe as  FECHACOMPRA ,S.nombre as PROPIETARIO,
			CONVERT(varchar(200),(F.fabricante + ' ' + M.modelo + ' ' + CONVERT(varchar(10), V.año) + ' ' + V.color)) as VEHICULO,
			CP.monto_rd as TOTALPAGARRD, CP.monto_usd as TOTALPAGARUSD,
			(CP.monto_rd - CP.balance_rd) as PAGADORD, (CP.monto_usd - CP.balance_usd) as PAGADOUSD,
			CP.balance_rd as PENDIENTERD, CP.balance_usd as PENDIENTEUSD,
			ISNULL(DATEDIFF(DAY, format (v.fecha_importe, 'yyyy-MM-dd'),
			format (GETDATE(), 'yyyy-MM-dd')), 0) as DIASVIGENTE
			from CuentasPagar CP join Vehiculos V on V.id = CP.id_vehiculo join Seguros S on S.id = V.id_suplidor
			join Fabricantes F on F.id = V.fabricante_id join Modelos M on M.id = V.modelo_id
			join TipoTransaccion TP on TP.id = CP.id_transaccion
			where CP.balance_rd > 0 and CP.balance_usd > 0 and CP.id_transaccion = 4
			and format(CP.fecha,'yyyy-MM-dd') between
			format (@desde, 'yyyy-MM-dd') and format (@hasta, 'yyyy-MM-dd')
		end
	
	else if @idTransaccion = 5
		begin
			select CP.id as CUENTAPAGAR,TP.transaccion as TRANSACCION ,V.fecha_importe as  FECHACOMPRA ,S.taller as PROPIETARIO,
			CONVERT(varchar(200),(F.fabricante + ' ' + M.modelo + ' ' + CONVERT(varchar(10), V.año) + ' ' + V.color)) as VEHICULO,
			CP.monto_rd as TOTALPAGARRD, CP.monto_usd as TOTALPAGARUSD,
			(CP.monto_rd - CP.balance_rd) as PAGADORD, (CP.monto_usd - CP.balance_usd) as PAGADOUSD,
			CP.balance_rd as PENDIENTERD, CP.balance_usd as PENDIENTEUSD,
			ISNULL(DATEDIFF(DAY, format (v.fecha_importe, 'yyyy-MM-dd'),
			format (GETDATE(), 'yyyy-MM-dd')), 0) as DIASVIGENTE
			from CuentasPagar CP join Vehiculos V on V.id = CP.id_vehiculo join TalleresRepuestos S on S.id = CP.id_vendedor
			join Fabricantes F on F.id = V.fabricante_id join Modelos M on M.id = V.modelo_id
			join TipoTransaccion TP on TP.id = CP.id_transaccion
			where CP.balance_rd > 0 and CP.balance_usd > 0 
			and format(CP.fecha,'yyyy-MM-dd') between
			format (@desde, 'yyyy-MM-dd') and format (@hasta, 'yyyy-MM-dd') and CP.id_transaccion = 5
		end

	 else if @idTransaccion = 6
		begin
			select CP.id as CUENTAPAGAR,TP.transaccion as TRANSACCION ,V.fecha_importe as  FECHACOMPRA ,S.taller as PROPIETARIO,
			CONVERT(varchar(200),(F.fabricante + ' ' + M.modelo + ' ' + CONVERT(varchar(10), V.año) + ' ' + V.color)) as VEHICULO,
			CP.monto_rd as TOTALPAGARRD, CP.monto_usd as TOTALPAGARUSD,
			(CP.monto_rd - CP.balance_rd) as PAGADORD, (CP.monto_usd - CP.balance_usd) as PAGADOUSD,
			CP.balance_rd as PENDIENTERD, CP.balance_usd as PENDIENTEUSD,
			ISNULL(DATEDIFF(DAY, format (v.fecha_importe, 'yyyy-MM-dd'),
			format (GETDATE(), 'yyyy-MM-dd')), 0) as DIASVIGENTE
			from CuentasPagar CP join Vehiculos V on V.id = CP.id_vehiculo join TalleresRepuestos S on S.id = CP.id_vendedor
			join Fabricantes F on F.id = V.fabricante_id join Modelos M on M.id = V.modelo_id
			join TipoTransaccion TP on TP.id = CP.id_transaccion
			where CP.balance_rd > 0 and CP.balance_usd > 0 
			and format(CP.fecha,'yyyy-MM-dd') between
			format (@desde, 'yyyy-MM-dd') and format (@hasta, 'yyyy-MM-dd') and CP.id_transaccion = 6
		end

	else 
		begin
			select CP.id as CUENTAPAGAR,TP.transaccion as TRANSACCION ,V.fecha_importe as  FECHACOMPRA ,S.taller as PROPIETARIO,
			CONVERT(varchar(200),(F.fabricante + ' ' + M.modelo + ' ' + CONVERT(varchar(10), V.año) + ' ' + V.color)) as VEHICULO,
			CP.monto_rd as TOTALPAGARRD, CP.monto_usd as TOTALPAGARUSD,
			(CP.monto_rd - CP.balance_rd) as PAGADORD, (CP.monto_usd - CP.balance_usd) as PAGADOUSD,
			CP.balance_rd as PENDIENTERD, CP.balance_usd as PENDIENTEUSD,
			ISNULL(DATEDIFF(DAY, format (v.fecha_importe, 'yyyy-MM-dd'),
			format (GETDATE(), 'yyyy-MM-dd')), 0) as DIASVIGENTE
			from CuentasPagar CP join Vehiculos V on V.id = CP.id_vehiculo join TalleresRepuestos S on S.id = CP.id_vendedor
			join Fabricantes F on F.id = V.fabricante_id join Modelos M on M.id = V.modelo_id
			join TipoTransaccion TP on TP.id = CP.id_transaccion
			where CP.balance_rd > 0 and CP.balance_usd > 0 
			and format(CP.fecha,'yyyy-MM-dd') between
			format (@desde, 'yyyy-MM-dd') and format (@hasta, 'yyyy-MM-dd') and CP.id_transaccion = 7
		end

end

GO
/****** Object:  StoredProcedure [dbo].[reporte_detalle_seguro]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[reporte_detalle_seguro]
@idVehiculo int
as
-- PAGOS VENTA
begin
	
	begin
		
		select P.monto_usd as PAGO, format(P.fecha,'dd/MM/yyyy') as FECHAPAGO, P.monto_rd as PAGORD,
		P.nota as DETALLEPAGO, TP.formaPago as TIPOPAGO
		from Vehiculos V join FormaVentaVehiculo P on V.id = P.id_vehiculo left join TiposPago TP on TP.id = P.id_tipo_pago
		where V.id = @idVehiculo and P.id_transaccion = 4	
	end
	
end



GO
/****** Object:  StoredProcedure [dbo].[reporte_detalle_seguro_vehiculo]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[reporte_detalle_seguro_vehiculo]
@idVehiculo int
as
-- PAGOS VENTA
begin
	
	begin
		
		select P.monto_usd as PAGO, format(P.fecha,'dd/MM/yyyy') as FECHAPAGO, P.monto_rd as PAGORD,
		P.nota as DETALLEPAGO, TP.formaPago as TIPOPAGO
		from  FormaVentaVehiculo P join Vehiculos V on V.id = P.id_vehiculo join TiposPago TP on TP.id = P.id_tipo_pago
		where P.id_vehiculo = @idVehiculo and P.id_transaccion = 4
	end
	
end


GO
/****** Object:  StoredProcedure [dbo].[reporte_detalle_traspaso]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[reporte_detalle_traspaso]
@idVehiculo int
as
-- PAGOS VENTA
begin
	
	begin
		
		select P.monto_usd as PAGO, format(P.fecha,'dd/MM/yyyy') as FECHAPAGO, P.monto_rd as PAGORD,
		P.nota as DETALLEPAGO, TP.formaPago as TIPOPAGO
		from Vehiculos V join FormaVentaVehiculo P on V.id = P.id_vehiculo left join TiposPago TP on TP.id = P.id_tipo_pago
		where V.id = @idVehiculo and P.id_transaccion = 3	
	end
	
end



GO
/****** Object:  StoredProcedure [dbo].[reporte_detalle_traspaso_vehiculo]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[reporte_detalle_traspaso_vehiculo]
@idVehiculo int
as
-- PAGOS VENTA
begin
	
	begin
		
		select P.monto_usd as PAGO, format(P.fecha,'dd/MM/yyyy') as FECHAPAGO, P.monto_rd as PAGORD,
		P.nota as DETALLEPAGO, TP.formaPago as TIPOPAGO
		from Vehiculos V join FormaVentaVehiculo P on V.id = P.id_vehiculo left join TiposPago TP on TP.id = P.id_tipo_pago
		where V.id = @idVehiculo and P.id_transaccion = 3
	end
	
end


GO
/****** Object:  StoredProcedure [dbo].[reporte_efectivo_cobrado]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[reporte_efectivo_cobrado]
@desde date, @hasta date

as 

begin 
	select DEG.fecha as FECHACOBRO, V.vin as CHASIS, DEG.montoRD as MONTORD,
	DEG.montoUSD as MONTOUSD, C.cliente as CLIENTE, 
	(DEG.documento + ' #' +  Convert (varchar(50),FORMAT(DEG.numeroDocumento, '000000'))) as DOCUMENTO
	from DetallesEfectivoGeneral DEG join Vehiculos V on V.id = DEG.idVehiculo
	join Clientes C on C.id = V.id_cliente
	where DEG.tipoCuenta = 2 and format(DEG.fecha,'yyyy-MM-dd') between
	format (@desde, 'yyyy-MM-dd') and format (@hasta, 'yyyy-MM-dd')
end



GO
/****** Object:  StoredProcedure [dbo].[reporte_factura_obtener_monto_pendiente]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[reporte_factura_obtener_monto_pendiente]
@idVehiculo int
as

begin
	
	begin
		
		select ISNULL(sum(monto_rd), 0) as PENDIENTERD, ISNULL(sum(monto_usd), 0) as PENDIENTEUSD 
		from FormaVentaVehiculo
		where id_vehiculo = @idVehiculo and id_tipo_pago = 3
				
					
	
	end
	
end


GO
/****** Object:  StoredProcedure [dbo].[reporte_factura_seguro_precio]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[reporte_factura_seguro_precio]
@idVehiculo int
as

begin
	
	begin
		
		select S.nombre as SEGURO, PS.precioRD as PRECIORD, PS.precioUSD as PRECIOUSD, duracion_dias as DURACION
		from PreciosSeguroVehiculo PS join SeguroVehiculo SV on SV.id_vehiculo = PS.id_vehiculo
		join Seguros S on S.id = SV.id_seguro 
		where PS.id_vehiculo = @idVehiculo
		Group by S.nombre, PS.precioRD , PS.precioUSD, Sv.duracion_dias
		
	end
	
end


GO
/****** Object:  StoredProcedure [dbo].[reporte_factura_traspaso_precio]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[reporte_factura_traspaso_precio]
@idVehiculo int
as

begin
	
	begin
		
		select precioRD as PRECIORD, precioUSD as PRECIOUSD
		from PreciosTraspasoVehiculo 
		where id_vehiculo = @idVehiculo
		
	end
	
end


GO
/****** Object:  StoredProcedure [dbo].[reporte_factura_vehiculo]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[reporte_factura_vehiculo]
@idVehiculo int
as

begin
	
	begin
		
		select V.id as ID, F.fabricante as FABRICANTE, M.modelo as MODELO, V.año as AÑO, V.total_invertido_usd as INVERTIDO,
		V.precioVentaRD as PRECIORD, V.precioVentaUSD as PRECIO,V.vin as VIN, 
		format(V.fecha_importe,'dd/MM/yyyy') as IMPORTADO, V.nota as COMENTARIO, C.cliente as CLIENTE, C.rnc_cedula as CEDULA,
		format(V.fecha_vendido,'dd/MM/yyyy') as FVENDIDO, V.pagado as PAGADO, P.nombre as PROPIETARIO, V.vendido as VENDIDO,
		V.terminado as TERMINADO, V.nota as DETALLES, V.color as COLOR, fac.id as FACTURA
		from Vehiculos V join Fabricantes F on V.fabricante_id = F.id join Modelos M on V.modelo_id = M.id 
		join facturas fac on V.id = fac.idVehiculo join Propietarios P on V.id_propietario = P.id 
		left join Clientes C on V.id_cliente = C.id
		where V.id = @idVehiculo
				
					
	
	end
	
end









GO
/****** Object:  StoredProcedure [dbo].[reporte_individual_vehiculo_gastos_aduanales]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[reporte_individual_vehiculo_gastos_aduanales]
@idVehiculo int
as

begin
	
	begin
		
		select G.descripcion as MANTENIMIENTO, DA.precioUSD as PRECIO
		from Vehiculos V join DetalleGastosAduanales DA on V.id = DA.idVehiculo 
		join Gastos G on DA.idGastoAduanal = G.id

		where V.id = @idVehiculo
				
					
	
	end
	
end





GO
/****** Object:  StoredProcedure [dbo].[reporte_individual_vehiculo_gastos_componentes]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[reporte_individual_vehiculo_gastos_componentes]
@idVehiculo int
as

begin
	
	begin
		
		select C.componente as PIEZA, DC.precioUSD as PRECIO
		from Vehiculos V join DetalleComponentes DC on V.id = Dc.idVehiculo join Componentes C on DC.idComponente = C.id
		where V.id = @idVehiculo
				
					
	
	end
	
end





GO
/****** Object:  StoredProcedure [dbo].[reporte_individual_vehiculo_gastos_reparación]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[reporte_individual_vehiculo_gastos_reparación]
@idVehiculo int
as

begin
	
	begin
		
		select G.descripcion as MANTENIMIENTO, T.taller as TALLER, DG.precioUSD as PRECIO
		from Vehiculos V join DetallesGastosReparaciones DG on V.id = DG.idVehiculo 
		join TalleresRepuestos T on DG.idTaller = T.id join Gastos G on DG.idMantenimiento = G.id

		where V.id = @idVehiculo
				
					
	
	end
	
end





GO
/****** Object:  StoredProcedure [dbo].[reporte_individual_vehiculo_pagos]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[reporte_individual_vehiculo_pagos]
@idVehiculo int
as
-- PAGOS VENTA
begin
	
	begin
		
		select P.monto_usd as PAGO, format(P.fecha,'dd/MM/yyyy') as FECHAPAGO, P.monto_rd as PAGORD,
		P.nota as DETALLEPAGO, TP.formaPago as TIPOPAGO
		from Vehiculos V join FormaVentaVehiculo P on V.id = P.id_vehiculo left join TiposPago TP on TP.id = P.id_tipo_pago
		where V.id = @idVehiculo and P.id_transaccion = 1	
	end
	
end



GO
/****** Object:  StoredProcedure [dbo].[reporte_obtener_detalle_cobros]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[reporte_obtener_detalle_cobros]
@idCC int, @tipoReporte varchar(50), @numeroRecibo int
as

begin 
	if @tipoReporte = 'Recibo'
		begin
			select PCC.id as NUMERORECIBO, PCC.monto_rd as MONTORD, PCC.monto_usd as MONTOUSD, PCC.fecha as FECHACOBRO,
			TP.formaPago as FORMAPAGO, PCC.balance_rd as PENDIENTERD, PCC.balance_usd as PENDIENTEUSD
			from PagosCuentasCobrar PCC join TiposPago TP on Tp.id = PCC.id_tipoPago
			join CuentasCobrar CC on CC.id = PCC.id_cuentaCobrar
			where PCC.id_cuentaCobrar = @idCC
		end
	else
		begin
			
			select PCC.id as NUMERORECIBO, PCC.monto_rd as MONTORD, PCC.monto_usd as MONTOUSD, PCC.fecha as FECHACOBRO,
			TP.formaPago as FORMAPAGO, PCC.balance_rd  as PENDIENTERD, PCC.balance_usd as PENDIENTEUSD
			from PagosCuentasCobrar PCC join TiposPago TP on Tp.id = PCC.id_tipoPago
			join CuentasCobrar CC on CC.id = PCC.id_cuentaCobrar
			where PCC.id_cuentaCobrar = @idCC
			and  PCC.id <= @numeroRecibo
		end
	
	
end



GO
/****** Object:  StoredProcedure [dbo].[reporte_obtener_detalle_cobros_seguro]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[reporte_obtener_detalle_cobros_seguro]
@idCC int, @tipoReporte varchar(50), @numeroRecibo int
as

begin 
	if @tipoReporte = 'Recibo'
		begin
			select PCC.id as NUMERORECIBO, PCC.monto_rd as MONTORD, PCC.monto_usd as MONTOUSD, PCC.fecha as FECHACOBRO,
			TP.formaPago as FORMAPAGO, PCC.balance_rd as PENDIENTERD, PCC.balance_usd as PENDIENTEUSD
			from PagosCuentasCobrar PCC join TiposPago TP on Tp.id = PCC.id_tipoPago
			join CuentasCobrar CC on CC.id = PCC.id_cuentaCobrar
			where PCC.id_cuentaCobrar = @idCC
		end
	else
		begin
			
			select PCC.id as NUMERORECIBO, PCC.monto_rd as MONTORD, PCC.monto_usd as MONTOUSD, PCC.fecha as FECHACOBRO,
			TP.formaPago as FORMAPAGO, PCC.balance_rd as PENDIENTERD, PCC.balance_usd as PENDIENTEUSD
			from PagosCuentasCobrar PCC join TiposPago TP on Tp.id = PCC.id_tipoPago
			join CuentasCobrar CC on CC.id = PCC.id_cuentaCobrar
			where PCC.id_cuentaCobrar = @idCC
			and  PCC.id <= @numeroRecibo
		end
	
	
end


GO
/****** Object:  StoredProcedure [dbo].[reporte_obtener_detalle_cobros_traspaso]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[reporte_obtener_detalle_cobros_traspaso]
@idCC int, @tipoReporte varchar(50), @numeroRecibo int
as

begin 
	if @tipoReporte = 'Recibo'
		begin
			select PCC.id as NUMERORECIBO, PCC.monto_rd as MONTORD, PCC.monto_usd as MONTOUSD, PCC.fecha as FECHACOBRO,
			TP.formaPago as FORMAPAGO, PCC.balance_rd as PENDIENTERD, PCC.balance_usd as PENDIENTEUSD
			from PagosCuentasCobrar PCC join TiposPago TP on Tp.id = PCC.id_tipoPago
			join CuentasCobrar CC on CC.id = PCC.id_cuentaCobrar
			where PCC.id_cuentaCobrar = @idCC
		end
	else
		begin
			
			select PCC.id as NUMERORECIBO, PCC.monto_rd as MONTORD, PCC.monto_usd as MONTOUSD, PCC.fecha as FECHACOBRO,
			TP.formaPago as FORMAPAGO, PCC.balance_rd as PENDIENTERD, PCC.balance_usd as PENDIENTEUSD
			from PagosCuentasCobrar PCC join TiposPago TP on Tp.id = PCC.id_tipoPago
			join CuentasCobrar CC on CC.id = PCC.id_cuentaCobrar
			where PCC.id_cuentaCobrar = @idCC
			and  PCC.id <= @numeroRecibo
		end
	
	
end


GO
/****** Object:  StoredProcedure [dbo].[reporte_precio_total_seguro]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[reporte_precio_total_seguro]
@idVehiculo int
as
-- PAGOS VENTA
begin
	
	begin
		
		select Distinct S.nombre, PS.precioRD as PRECIOSEGURORD, PS.precioUSD as PRECIOSEGUROUSD, SV.duracion_dias as DURACION from 
		PreciosSeguroVehiculo PS join SeguroVehiculo SV on SV.id_vehiculo = PS.id_vehiculo join Seguros S on S.id = SV.id_seguro
		where PS.id_vehiculo = @idVehiculo
	end
	
end
GO
/****** Object:  StoredProcedure [dbo].[reporte_precio_total_traspaso]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[reporte_precio_total_traspaso]
@idVehiculo int
as
-- PAGOS VENTA
begin
	
	begin
		
		select precioRD as PRECIOSEGURORD, precioUSD as PRECIOSEGUROUSD from PreciosTraspasoVehiculo
		where id_vehiculo = @idVehiculo
	end
	
end



GO
/****** Object:  StoredProcedure [dbo].[reporte_recibo_de_cobro]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[reporte_recibo_de_cobro]
@idCC int, @tipoRecibo varchar(50), @numeroRecibo int
as

begin 
    if @tipoRecibo = 'Recibo'
		begin
			select PCC.id as NUMERORECIBO, PCC.monto_rd as MONTORD, pcc.monto_usd as MONTOUSD, PCC.fecha as FECHACOBRO,
			TP.formaPago as FORMAPAGO, CC.balance_rd  as PENDIENTERD, CC.balance_usd as PENDIENTEUSD
			from 
			PagosCuentasCobrar PCC join TiposPago TP on Tp.id = PCC.id_tipoPago
			join CuentasCobrar CC on CC.id = PCC.id_cuentaCobrar
	
			where PCC.id = (SELECT MAX(id) From PagosCuentasCobrar) and CC.id = @idCC
			

		end
	else
		begin
			select PCC.id as NUMERORECIBO, PCC.monto_rd as MONTORD, pcc.monto_usd as MONTOUSD, PCC.fecha as FECHACOBRO,
			TP.formaPago as FORMAPAGO, PCC.balance_rd  as PENDIENTERD, PCC.balance_usd as PENDIENTEUSD
			from 
			PagosCuentasCobrar PCC join TiposPago TP on Tp.id = PCC.id_tipoPago
			join CuentasCobrar CC on CC.id = PCC.id_cuentaCobrar
	
			where PCC.id = @numeroRecibo and CC.id = @idCC
			
			--group by DPV.id, DPV.montoRD, DPV.montoUSD,  DPV.fechaPago, TP.formaPago, TFC.balanceRD,
			--TFC.balanceUSD 

		end
	
	
end

GO
/****** Object:  StoredProcedure [dbo].[reporte_recibo_de_cobro_seguro]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[reporte_recibo_de_cobro_seguro]
@idCC int, @tipoRecibo varchar(50), @numeroRecibo int
as

begin 
    if @tipoRecibo = 'Recibo'
		begin
			select PCC.id as NUMERORECIBO, PCC.monto_rd as MONTORD, pcc.monto_usd as MONTOUSD, PCC.fecha as FECHACOBRO,
			TP.formaPago as FORMAPAGO, PCC.balance_rd  as PENDIENTERD, PCC.balance_usd as PENDIENTEUSD
			from 
			PagosCuentasCobrar PCC join TiposPago TP on Tp.id = PCC.id_tipoPago
			join CuentasCobrar CC on CC.id = PCC.id_cuentaCobrar
	
			where PCC.id = (SELECT MAX(id) From PagosCuentasCobrar) and CC.id = @idCC
			

		end
	else
		begin
			select PCC.id as NUMERORECIBO, PCC.monto_rd as MONTORD, pcc.monto_usd as MONTOUSD, PCC.fecha as FECHACOBRO,
			TP.formaPago as FORMAPAGO, CC.balance_rd  as PENDIENTERD, CC.balance_usd as PENDIENTEUSD
			from 
			PagosCuentasCobrar PCC join TiposPago TP on Tp.id = PCC.id_tipoPago
			join CuentasCobrar CC on CC.id = PCC.id_cuentaCobrar
	
			where PCC.id = @numeroRecibo and CC.id = @idCC
		end
	
	
end

GO
/****** Object:  StoredProcedure [dbo].[reporte_recibo_de_cobro_traspaso]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[reporte_recibo_de_cobro_traspaso]
@idCC int, @tipoRecibo varchar(50), @numeroRecibo int
as

begin 
    if @tipoRecibo = 'Recibo'
		begin
			select PCC.id as NUMERORECIBO, PCC.monto_rd as MONTORD, pcc.monto_usd as MONTOUSD, PCC.fecha as FECHACOBRO,
			TP.formaPago as FORMAPAGO, CC.balance_rd  as PENDIENTERD, CC.balance_usd as PENDIENTEUSD
			from 
			PagosCuentasCobrar PCC join TiposPago TP on Tp.id = PCC.id_tipoPago
			join CuentasCobrar CC on CC.id = PCC.id_cuentaCobrar
	
			where PCC.id = (SELECT MAX(id) From PagosCuentasCobrar) and CC.id = @idCC
			

		end
	else
		begin
			select PCC.id as NUMERORECIBO, PCC.monto_rd as MONTORD, pcc.monto_usd as MONTOUSD, PCC.fecha as FECHACOBRO,
			TP.formaPago as FORMAPAGO, PCC.balance_rd  as PENDIENTERD, PCC.balance_usd as PENDIENTEUSD
			from 
			PagosCuentasCobrar PCC join TiposPago TP on Tp.id = PCC.id_tipoPago
			join CuentasCobrar CC on CC.id = PCC.id_cuentaCobrar
	
			where PCC.id = @numeroRecibo and CC.id = @idCC
		end
	
	
end

GO
/****** Object:  StoredProcedure [dbo].[reporte_resultados_rd]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[reporte_resultados_rd]
@desde date, @hasta date
as

begin

	select format(V.fecha_vendido,'dd/MM/yyyy') as FECHAVENDIDO, 
	CONVERT(varchar(200),(F.fabricante + ' ' + M.modelo + ' ' + CONVERT(varchar(10), V.año) + ' ' + V.color)) as VEHICULO,
	V.precioVentaRD as PRECIORD,  V.total_invertido_rd as COSTORD,
	(V.precioVentaRD - V.total_invertido_rd) as RESULTADORD,
	C.cliente as CLIENTE,
	ISNULL((select monto_rd from FormaVentaVehiculo where id_transaccion = 1 and id_tipo_pago = 1),0) as EFECTIVO, 
	ISNULL((select monto_rd from FormaVentaVehiculo where id_transaccion = 1 and id_tipo_pago = 2),0) as VRECIBIDO,
	ISNULL((select monto_rd from FormaVentaVehiculo where id_transaccion = 1 and id_tipo_pago = 3),0) as CREDITO, 
	ISNULL((select monto_rd from FormaVentaVehiculo where id_transaccion = 1 and id_tipo_pago = 4),0) as OTROS
	from Vehiculos V join Fabricantes F on V.fabricante_id = F.id join Modelos M on V.modelo_id = M.id
	join Propietarios P on V.id_propietario = P.id 
	join Clientes C on V.id_cliente = C.id 
	and format(V.fecha_vendido,'yyyy-MM-dd') between
	format (@desde, 'yyyy-MM-dd') and format (@hasta, 'yyyy-MM-dd')
	where V.vendido = 1

end




GO
/****** Object:  StoredProcedure [dbo].[reporte_resultados_usd]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[reporte_resultados_usd]
@desde date, @hasta date
as

begin
	
	select format(V.fecha_vendido,'dd/MM/yyyy') as FECHAVENDIDO, 
	CONVERT(varchar(200),(F.fabricante + ' ' + M.modelo + ' ' + CONVERT(varchar(10), V.año) + ' ' + V.color)) as VEHICULO,
	V.precioVentaUSD as PRECIOUSD,  V.total_invertido_usd as COSTOUSD,
	(V.precioVentaUSD - V.total_invertido_usd) as RESULTADOUSD,
	C.cliente as CLIENTE,
	ISNULL((select monto_usd from FormaVentaVehiculo where id_transaccion = 1 and id_tipo_pago = 1),0) as EFECTIVO, 
	ISNULL((select monto_usd from FormaVentaVehiculo where id_transaccion = 1 and id_tipo_pago = 2),0) as VRECIBIDO,
	ISNULL((select monto_usd from FormaVentaVehiculo where id_transaccion = 1 and id_tipo_pago = 3),0) as CREDITO, 
	ISNULL((select monto_usd from FormaVentaVehiculo where id_transaccion = 1 and id_tipo_pago = 4),0) as OTROS
	from Vehiculos V join Fabricantes F on V.fabricante_id = F.id join Modelos M on V.modelo_id = M.id
	join Propietarios P on V.id_propietario = P.id 
	join Clientes C on V.id_cliente = C.id 
	and format(V.fecha_vendido,'yyyy-MM-dd') between
	format (@desde, 'yyyy-MM-dd') and format (@hasta, 'yyyy-MM-dd')
	where V.vendido = 1
	

end



GO
/****** Object:  StoredProcedure [dbo].[reporte_vehiculos_comprado]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[reporte_vehiculos_comprado]
@desde date, @hasta date
as

begin


	select  format(V.fecha_importe,'dd/MM/yyyy') as FECHAIMPORTE, 
	CONVERT(varchar(200),(F.fabricante + ' ' + M.modelo + ' ' + CONVERT(varchar(10), V.año) + ' ' + V.color)) as VEHICULO, V.vin as VIN,
	V.precioRD as PRECIOCOMPRARD, V.precioUSD as PRECIOCOMPRAUSD, P.nombre as PROPIETARIO
	from Vehiculos V 
	join Fabricantes F on V.fabricante_id = F.id join Modelos M on V.modelo_id = M.id
	join Propietarios P on P.id = V.id_propietario
	where format(V.fecha_importe,'yyyy-MM-dd') between
	format (@desde, 'yyyy-MM-dd') and format (@hasta, 'yyyy-MM-dd') 
	and V.estado = 1


end




GO
/****** Object:  StoredProcedure [dbo].[reporte_vehiculos_inventario]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[reporte_vehiculos_inventario]
@desde date, @hasta date
as

begin


	select  format(V.fecha_importe,'dd/MM/yyyy') as FECHAIMPORTE, format(V.fecha_terminado,'dd/MM/yyyy') as FECHAINVENTARIO, 
	CONVERT(varchar(200),(F.fabricante + ' ' + M.modelo + ' ' + CONVERT(varchar(10), V.año) + ' ' + V.color)) as VEHICULO, V.vin as VIN,
	V.precioRD as PRECIOCOMPRARD, V.precioUSD as PRECIOCOMPRAUSD,V.total_invertido_rd as INVERTIDO_RD,V.total_invertido_usd as INVERTIDO_USD ,P.nombre as PROPIETARIO
	from Vehiculos V 
	join Fabricantes F on V.fabricante_id = F.id join Modelos M on V.modelo_id = M.id
	join Propietarios P on P.id = V.id_propietario
	where format(V.fecha_importe,'yyyy-MM-dd') between
	format (@desde, 'yyyy-MM-dd') and format (@hasta, 'yyyy-MM-dd') 
	and V.estado = 1 and v.terminado = 1 and v.vendido = 0


end




GO
/****** Object:  StoredProcedure [dbo].[reporte_vehiculos_vendidos]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[reporte_vehiculos_vendidos]
@desde date, @hasta date
as

begin
    -- FECHAVENDIDO
	
	Select format(V.fecha_vendido,'dd/MM/yyyy') as FECHAVENDIDO, 
	CONVERT(varchar(200),(F.fabricante + ' ' + M.modelo + ' ' + CONVERT(varchar(10), V.año) + ' ' + V.color)) as VEHICULO,
	V.precioVentaRD as PRECIORD,
	((select ISNULL(SUM(PCC.monto_rd),0) from PagosCuentasCobrar PCC join CuentasCobrar CC on CC.id = PCC.id_cuentaCobrar) + (select sum(monto_rd) from FormaVentaVehiculo FV where FV.id_transaccion = 1 and Fv.id_tipo_pago !=3) ) as PAGADORD ,
	V.precioVentaUSD as PRECIOUSD,
	((select ISNULL(SUM(PCC.monto_usd),0) from PagosCuentasCobrar PCC join CuentasCobrar CC on CC.id = PCC.id_cuentaCobrar) + (select sum(monto_usd) from FormaVentaVehiculo FV where FV.id_transaccion = 1 and Fv.id_tipo_pago !=3) ) as PAGADOUSD ,
	C.cliente as CLIENTE
	from 

	Vehiculos V join CuentasCobrar CC on CC.id_vehiculo = V.id
	
	join Modelos M on M.id = V.modelo_id join Fabricantes F on F.id = V.fabricante_id join Clientes C on C.id = V.id_cliente
	where V.vendido = 1
	and format(V.fecha_vendido,'yyyy-MM-dd') between
	format (@desde, 'yyyy-MM-dd') and format (@hasta, 'yyyy-MM-dd')
	Group by V.fecha_vendido, F.fabricante, M.modelo, V.año, V.color, V.precioVentaRD, V.precioVentaUSD, C.cliente, V.id

end

GO
/****** Object:  StoredProcedure [dbo].[validar_software_activado]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[validar_software_activado]
@mensaje int output
as
set @mensaje = 0;
declare @fechaActivacion date = (select fechaActivacion from SerialKeyActivation where id = 1)
declare @fechaVencimiento date = (select fechaVencimiento from SerialKeyActivation where id = 1)
begin
  if (format (getdate(), 'yyyy-MM-dd') < format (@fechaVencimiento, 'yyyy-MM-dd'))
	begin
		set @mensaje = 1
	end
	
end


GO
/****** Object:  StoredProcedure [dbo].[vender_vehiculo]    Script Date: 26/04/2018 06:59:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[vender_vehiculo]
@idVehiculo int, @fecha date ,@mensaje int output, 
@idCliente int, @precioVentaRd float, @precioVentaUsd float,
@precioTraspasoRd float, @precioTraspasoUsd float, @precioSeguroRd float, @precioSeguroUsd float,
@idSeguro int, @duracion int
as
set @mensaje = 0



begin
		if (select vendido from Vehiculos where id = @idVehiculo) = 0
		 begin
			update Vehiculos set vendido = 1, fecha_vendido = @fecha, id_cliente = @idCliente,
			precioVentaRD = @precioVentaRd, precioVentaUSD = @precioVentaUsd
			where id = @idVehiculo

			insert into SeguroVehiculo (id_vehiculo, id_seguro, duracion_dias)
			Values (@idVehiculo, @idSeguro, @duracion)

			insert into PreciosTraspasoVehiculo(id_vehiculo,precioRD, precioUSD )
			Values (@idVehiculo, @precioTraspasoRd, @precioTraspasoUsd)

			insert into PreciosSeguroVehiculo(id_vehiculo,precioRD, precioUSD )
			Values (@idVehiculo, @precioSeguroRd, @precioSeguroUsd)
			
			insert into CuentasPagar(id_factura, id_vendedor, id_transaccion, monto_rd, monto_usd,
			balance_rd, balance_usd, fecha, id_vehiculo)
			VALUES(0, @idCliente, 4, @precioSeguroRd, @precioSeguroUsd, @precioSeguroRd, @precioSeguroUsd,
			@fecha, @idVehiculo)

			insert into FormaCompraVehiculo (id_vehiculo, id_transaccion, id_tipo_pago, id_factura, monto_rd, monto_usd, nota, fecha)
			VALUES (@idVehiculo, 4, 3, 0, @precioSeguroRd, @precioSeguroUsd, 'CUENTA PAGAR SEGURO', @fecha)
		set @mensaje = 1	

		 end
				
		--if @idTipoPago = 1
		--	begin
		--		 insert into DetallesEfectivoGeneral(idVehiculo, tipoCuenta, montoRD, montoUSD, fecha, documento, numeroDocumento)
		--		 values (@idVehiculo, 2, @pagoRD, @pagoUSD, @fecha, 'Factura', (select id from facturas where id = (select max(id) from facturas)))
		--	end
				
end


GO
USE [master]
GO
ALTER DATABASE [CarsImport] SET  READ_WRITE 
GO
