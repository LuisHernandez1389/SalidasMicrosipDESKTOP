Attribute VB_Name = "ApiMspVentasExt"
'Microsip Api Modulo de Ventas

' Constantes del Handle de los objetos creador por default por el API (1 objeto de cada tipo)
'Public Const DBHandleDefault = 0          'Base de datos
'Public Const TrnHandleDefault = 0         'Transaccion
'Public Const DtstHandleDefault = 0        'DataSet
'Public Const SqlHandleDefault = 0         'SQL
'Public Const SpHandleDefault = 0          'Stored Procedure
' Constnates de los tipos de Transacciones
'Public Const trnsSnapShot = 0
'Public Const trnsReadComitedRec = 1
'Public Const trnsReadComitedWait = 2
'Public Const trnsReadComitedNoWait = 3

' Las variables de Handle de Transacciones, DataSet, SQL y StoredProc se DEBEN declarar de tipo Long
' Ej. Global DtstHandleAux1 As Long

' Funciones relacionadas  al manejo de Errores de la Api del modulo de Ventas
Public Declare Function veGetLastErrorCode Lib "ApiMicrosip.dll" () As Integer
Public Declare Function veGetLastErrorMessage Lib "ApiMicrosip.dll" _
(ByVal ErrorMessage As String) As Integer
Public Declare Sub veSetErrorHandling Lib "ApiMicrosip.dll" _
(ByVal ExceptionOnError As Integer, ByVal MessageOnException As Integer)
Public Declare Function CheckABError Lib "ApiMicrosip.dll" _
(ByVal FunctionName As String) As Boolean
 
Public Declare Function SetDBVentas Lib "ApiMicrosip.dll" _
(ByVal DBHandle As Integer) As Integer
Public Declare Sub AbortaDoctoVentas Lib "ApiMicrosip.dll" ()
Public Declare Function GetDoctoVeId Lib "ApiMicrosip.dll" _
(ByRef DoctoId As Integer) As Integer

Public Declare Function GetVersionApiVentasAsInteger Lib "ApiMicrosip.dll" () As Integer
Public Declare Sub GetVersionApiVentasAsString Lib "ApiMicrosip.dll" _
(ByVal lVersion As String)
Public Declare Function ChecaCompatibilidadVentas Lib "ApiMicrosip.dll" _
  (ByVal HdbMetadatos As Integer) As Integer


Public Declare Sub SetReglasPedidos Lib "ApiMicrosip.dll" _
  (ByVal AComprometerUnidades As Integer, ByVal APedidosParciales  As Integer, ByVal APartidasParciales As Integer)
Public Declare Function NuevoPedido Lib "ApiMicrosip.dll" _
(ByVal Fecha As String, ByVal Folio As String, _
 ByVal ClienteId As Integer, ByVal DirConsigId As Integer, ByVal AlmacenId As Integer, _
 ByVal FechaEntrega As String, ByVal TipoDscto As String, ByVal Descuento As Double, _
 ByVal OrdenCompra As String, ByVal Descripcion As String, ByVal VendedorId As Integer, _
 ByVal ImptoSustituidoId As Integer, ByVal ImptoSustitutoId As Integer, _
 ByVal MonedaId As Integer) As Integer
Public Declare Function RenglonPedido Lib "ApiMicrosip.dll" _
(ByVal ArticuloId As Integer, ByVal Unidades As Double, ByVal PrecioUnitario As Double, _
 ByVal PctjeDscto As Double, ByVal Notas As String) As Integer
Public Declare Function RenglonPedidoDesctos Lib "ApiMicrosip.dll" _
(ByVal ArticuloId As Integer, ByVal Unidades As Double, ByVal PrecioUnitario As Double, _
 ByVal PctjeDsctoCli As Double, ByVal PctjeDsctoVol As Double, ByVal PctjeDsctoPromo As Double, ByVal Notas As String) As Integer
Public Declare Function AplicaPedido Lib "ApiMicrosip.dll" () As Integer

Public Declare Sub SetReglasVentas Lib "ApiMicrosip.dll" _
  (ByVal ExistenciasNegativas As Integer, ByVal PrecioMinimo As Integer)
Public Declare Function NuevaFactura Lib "ApiMicrosip.dll" _
(ByVal Fecha As String, ByVal Folio As String, _
 ByVal ClienteId As Integer, ByVal DirConsigId As Integer, ByVal AlmacenId As Integer, _
 ByVal TipoDscto As String, ByVal Descuento As Double, _
 ByVal OrdenCompra As String, ByVal Descripcion As String, _
 ByVal Fletes As Double, ByVal OtrosCargos As Double, ByVal PctjeComis As Double, _
 ByVal CondPagoId As Integer, ByVal VendedorId As Integer, _
 ByVal ImptoSustituidoId As Integer, ByVal ImptoSustitutoId As Integer, _
 ByVal ImporteCobro As Double, ByVal Descripcion As String, _
 ByVal PLHandle As Integer) As Integer
Public Declare Function DirClienteFactura Lib "ApiMicrosip.dll" _
(ByVal DirCliId As Integer) As Integer
Public Declare Function SetFormaCobroFactura Lib "ApiMicrosip.dll" _
(ByVal FormaCobroId As Integer, ByVal NumCtaPago As String) As Integer
Public Declare Function RenglonFactura Lib "ApiMicrosip.dll" _
(ByVal ArticuloId As Integer, ByVal Unidades As Double, ByVal PrecioUnitario As Double, _
 ByVal PctjeDscto As Double, ByVal Notas As String) As Integer
Public Declare Function RenglonFacturaSeries Lib "ApiMicrosip.dll" _
(ByVal ClaveSerie As String) As Integer
Public Declare Function RenglonFacturaLotes Lib "ApiMicrosip.dll" _
(ByVal ClaveLote As String, ByVal Unidades As Double) As Integer
Public Declare Function RenglonFacturaTercero Lib "ApiMicrosip.dll" _
(ByVal TerceroId As Integer) As Integer
Public Declare Function AplicaFactura Lib "ApiMicrosip.dll" () As Integer
