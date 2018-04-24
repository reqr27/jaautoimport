
GO
ALTER procedure [dbo].[reporte_factura_seguro_precio]
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

ALTER procedure [dbo].[reporte_precio_total_seguro]
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
