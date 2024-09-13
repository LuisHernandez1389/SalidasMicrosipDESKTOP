Attribute VB_Name = "ApiMspComprasExt"
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
Public Declare Function cmGetLastErrorCode Lib "ApiMicrosip.dll" () As Integer
Public Declare Function cmGetLastErrorMessage Lib "ApiMicrosip.dll" _
(ByVal ErrorMessage As String) As Integer
Public Declare Sub cmSetErrorHandling Lib "ApiMicrosip.dll" _
(ByVal ExceptionOnError As Integer, ByVal MessageOnException As Integer)
Public Declare Function CheckABError Lib "ApiMicrosip.dll" _
(ByVal FunctionName As String) As Boolean
 
' Funciones comunes
Public Declare Function SetDBCompras Lib "ApiMicrosip.dll" _
(ByVal DBHandle As Integer) As Integer
Public Declare Sub AbortaDoctoCompras Lib "ApiMicrosip.dll" ()
Public Declare Function DireccionProveedorEventualDocCompras Lib "ApiMicrosip.dll" _
(ByVal CiudadId As Integer, ByVal EstadoId As Integer, ByVal PaisId As Integer, _
 ByVal NombreProv As String, ByVal Calle As String, ByVal CodigoPostal As String, _
 ByVal Telefono1 As String, ByVal Telefono2 As String, ByVal Fax As String, ByVal Email As String, _
 ByVal RfcCurp As String, ByVal Contacto As String) As Integer

' Compatibilidad
Public Declare Function GetVersionApiComprasAsInteger Lib "ApiMicrosip.dll" () As Integer
Public Declare Sub GetVersionApiComprasAsString Lib "ApiMicrosip.dll" _
(ByVal lVersion As String)
Public Declare Function ChecaCompatibilidadCompras Lib "ApiMicrosip.dll" _
  (ByVal HdbMetadatos As Integer) As Integer
  
' Ordenes de compra
Public Declare Function NuevaOrdenCompra Lib "ApiMicrosip.dll" _
(ByVal Fecha As String, ByVal Folio As String, _
 ByVal ProveedorId As Integer, ByVal DirConsigId As Integer, ByVal AlmacenId As Integer, _
 ByVal FechaEntrega As String, ByVal TipoDscto As String, ByVal Descuento As Double, _
 ByVal Descripcion As String, ByVal CondPagoId As Integer, ByVal ViaEmbarqueId As Integer, _
 ByVal ImptoSustituidoId As Integer, ByVal ImptoSustitutoId As Integer, _
 ByVal MonedaId As Integer ) As Integer
Public Declare Function RenglonOrdenCompra Lib "ApiMicrosip.dll" _
(ByVal ArticuloId As Integer, ByVal Unidades As Double, ByVal PrecioUnitario As Double, _
 ByVal PctjeDscto As Double, ByVal Notas As String, ByVal TipoPrecio As String) As Integer
Public Declare Function AplicaOrdenCompra Lib "ApiMicrosip.dll" () As Integer
  
'Documentos de Compras
Public Declare Function NuevaCompra Lib "ApiMicrosip.dll" _
(ByVal Fecha As String, ByVal Folio As String, _
 ByVal ProveedorId As Integer, ByVal AlmacenId As Integer, _
 ByVal TipoDscto As String, ByVal Descuento As Double, ByVal TipoCambio As Double, _
 ByVal Factura As String, ByVal Descripcion As String, _
 ByVal Fletes As Double, ByVal OtrosCargos As Double, ByVal GastosAduanales As Double, _
 ByVal CondPagoId As Integer, ByVal ImptoSustituidoId As Integer, ByVal ImptoSustitutoId As Integer) As Integer
Public Declare Function RenglonCompra Lib "ApiMicrosip.dll" _
(ByVal ArticuloId As Integer, ByVal Unidades As Double, ByVal PrecioUnitario As Double, _
 ByVal PctjeDscto As Double, ByVal Notas As String, ByVal TipoPrecio As String) As Integer
Public Declare Function CompraPedimento Lib "ApiMicrosip.dll" _
(ByVal ClavePedimento As String, ByVal FechaPedimento As String, ByVal AduanaPedimento As String) As Integer
Public Declare Function RenglonCompraLotes Lib "ApiMicrosip.dll" _
(ByVal ClaveLote As String, ByVal FechaCaducidad As String, ByVal Unidades As Double) As Integer
Public Declare Function RenglonCompraSeries Lib "ApiMicrosip.dll" _
(ByVal ClaveSerie As String, ByVal NumConsecutivos As Integer) As Integer
Public Declare Function AplicaCompra Lib "ApiMicrosip.dll" () As Integer

