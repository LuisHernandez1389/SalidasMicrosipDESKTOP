Attribute VB_Name = "ApiMspInventExt"
'Microsip Api Modulo de Invent

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

' Funciones relacionadas  al manejo de Errores de la Api del modulo de Inventarios
Public Declare Function inGetLastErrorCode Lib "ApiMicrosip.dll" () As Integer
Public Declare Function inGetLastErrorMessage Lib "ApiMicrosip.dll" _
(ByVal ErrorMessage As String) As Integer
Public Declare Sub inSetErrorHandling Lib "ApiMicrosip.dll" _
(ByVal ExceptionOnError As Integer, ByVal MessageOnException As Integer)
Public Declare Function CheckABError Lib "ApiMicrosip.dll" _
(ByVal FunctionName As String) As Boolean

Public Declare Function SetDBInvent Lib "ApiMicrosip.dll" _
(ByVal DBHandle As Integer) As Integer

Public Declare Function NuevaEntrada Lib "ApiMicrosip.dll" _
(ByVal ConceptoInId As Integer, ByVal AlmacenId As Integer, ByVal Fecha As String, ByVal Folio As String, _
 ByVal Descripcion As String, ByVal CentroCostoId As Integer) As Integer
Public Declare Function RenglonEntrada Lib "ApiMicrosip.dll" _
(ByVal ArticuloId As Integer, ByVal Unidades As Double, ByVal CostoUnitario As Double, _
 ByVal CostoTotal As Double) As Integer
Public Declare Function RenglonEntradaLotes Lib "ApiMicrosip.dll" _
(ByVal ClaveLote As String, ByVal FechaCaducidad As String, ByVal Unidades As Double) As Integer
Public Declare Function RenglonEntradaSeries Lib "ApiMicrosip.dll" _
(ByVal ClaveSerie As String, ByVal NumConsecutivos As Integer) As Integer
Public Declare Function RenglonEntradaPedimento Lib "ApiMicrosip.dll" _
(ByVal ClavePedimento As String, ByVal FechaPedimento As String, ByVal AduanaPedimento As String) As Integer
 
Public Declare Function AplicaEntrada Lib "ApiMicrosip.dll" () As Integer
Public Declare Sub AbortaDoctoInvent Lib "ApiMicrosip.dll" ()

Public Declare Function GetVersionApiInventAsInteger Lib "ApiMicrosip.dll" () As Integer
Public Declare Sub GetVersionApiInventAsString Lib "ApiMicrosip.dll" _
(ByVal lVersion As String)
Public Declare Function ChecaCompatibilidadInvent Lib "ApiMicrosip.dll" _
  (ByVal HdbMetadatos As Integer) As Integer

Public Declare Function NuevaSalida Lib "ApiMicrosip.dll" _
(ByVal ConceptoInId As Integer, ByVal AlmacenId As Integer, ByVal AlmacenDestinoId As Integer, ByVal Fecha As String, ByVal Folio As String, _
 ByVal Descripcion As String, ByVal CentroCostoId As Integer) As Integer

Public Declare Function RenglonSalida Lib "ApiMicrosip.dll" _
(ByVal ArticuloId As Integer, ByVal Unidades As Double, ByVal CostoUnitario As Double, _
 ByVal CostoTotal As Double) As Integer

Public Declare Function RenglonSalidaSeries Lib "ApiMicrosip.dll" _
(ByVal ClaveSerie As String) As Integer

Public Declare Function RenglonSalidaLotes Lib "ApiMicrosip.dll" _
(ByVal ClaveLote As String, ByVal Unidades As Double) As Integer

Public Declare Function AplicaSalida Lib "ApiMicrosip.dll" () As Integer

Public Declare Sub SetReglasInventarios Lib "ApiMicrosip.dll" _
  (ByVal ExistenciasNegativas As Integer)



