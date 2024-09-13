Attribute VB_Name = "ApiMspCxcExt"
'Microsip Api Modulo de Cxc

'Constantes del Handle de los objetos creador por default por el API (1 objeto de cada tipo)
'Public Const DBHandleDefault = 0          'Base de datos
'Public Const TrnHandleDefault = 0         'Transaccion
'Public Const DtstHandleDefault = 0        'DataSet
'Public Const SqlHandleDefault = 0         'SQL
'Public Const SpHandleDefault = 0          'Stored Procedure

'Constnates de los tipos de Transacciones
'Public Const trnsSnapShot = 0
'Public Const trnsReadComitedRec = 1
'Public Const trnsReadComitedWait = 2
'Public Const trnsReadComitedNoWait = 3

' Las variables de Handle de Transacciones, DataSet, SQL y StoredProc se DEBEN declarar de tipo Long
' Ej. Global DtstHandleAux1 As Long

' Funciones relacionadas  al manejo de Errores de la Api del modulo de Cxc
Public Declare Function ccGetLastErrorCode Lib "ApiMicrosip.dll" () As Integer
Public Declare Function ccGetLastErrorMessage Lib "ApiMicrosip.dll" _
(ByVal ErrorMessage As String) As Integer
Public Declare Sub ccSetErrorHandling Lib "ApiMicrosip.dll" _
(ByVal ExceptionOnError As Integer, ByVal MessageOnException As Integer)
Public Declare Function CheckABError Lib "ApiMicrosip.dll" _
(ByVal FunctionName As String) As Boolean

Public Declare Function SetDBCxc Lib "ApiMicrosip.dll" _
(ByVal DBHandle As Integer) As Integer
Public Declare Function SetDBMetadatos Lib "ApiMicrosip.dll" _
(ByVal DBHandle As Integer) As Integer

Public Declare Function NuevoCreditoCc Lib "ApiMicrosip.dll" _
(ByVal ConceptoCcId As Integer, ByVal Fecha As String, ByVal Folio As String, _
 ByVal ClienteId As Integer, ByVal Descripcion As String, ByVal CobradorId As Integer, _
 ByVal PLHandle As Integer) As Integer

Public Declare Function RenglonCreditoImpuestoCc Lib "ApiMicrosip.dll" _
(ByVal ImpuestoId As Integer, _
 ByVal Importe As Double, ByVal Impuesto As Double) As Integer

Public Declare Function RenglonCreditoCc Lib "ApiMicrosip.dll" _
(ByVal TipoImporte As String, ByVal CargoId As Integer, ByVal FolioCargo As String, _
 ByVal Importe As Double, ByVal Impuesto As Double, ByVal IvaRetenido As Double, ByVal IsrRetenido As Double, _
 ByVal DsctoPpag As Double) As Integer

Public Declare Function AplicaCreditoCc Lib "ApiMicrosip.dll" () As Integer
Public Declare Sub AbortaDoctoCxc Lib "ApiMicrosip.dll" ()
Public Declare Function GetDoctoCCId Lib "ApiMicrosip.dll" _
(ByRef DoctoId As Integer) As Integer

Public Declare Function GetVersionApiCxcAsInteger Lib "ApiMicrosip.dll" () As Integer
Public Declare Sub GetVersionApiCxcAsString Lib "ApiMicrosip.dll" _
(ByVal lVersion As String)
Public Declare Function ChecaCompatibilidadCxc Lib "ApiMicrosip.dll" _
  (ByVal HdbMetadatos As Integer) As Integer
Public Declare Function GetImporteMonedaCliente Lib "ApiMicrosip.dll" _
  (ByVal ClienteId As Integer, ByVal FormaCobroId As Integer, ByVal ImporteCobro As Double, _
   ByVal Fecha As String, ByVal Importe As Double) As Integer

Public Declare Function NuevoAnticipoCc Lib "ApiMicrosip.dll" _
(ByVal ConceptoCcId As Integer, ByVal Fecha As String, ByVal Folio As String, _
 ByVal ClienteId As Integer, ByVal Referencia As String, ByVal Descripcion As String, ByVal CondPagoId As Integer, _
 ByVal Importe As Double, ByVal ImpuestoId As Integer, ByVal PLHandle As Integer) As Integer
Public Declare Function AplicaAnticipoCc Lib "ApiMicrosip.dll" () As Integer
