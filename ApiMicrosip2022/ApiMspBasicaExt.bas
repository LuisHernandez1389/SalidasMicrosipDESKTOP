Attribute VB_Name = "ApiMspBasicaExt"
' Nota: Despues de que se indica "Lib" si se piensa correr el projecto desde el IDE es necesario
' poner todo el path de la DLL, si la DLL esta en el directorio C:\my project  se debe de declarar de la sig forma
' Lib "C:\my project\ApiMicrosip.dll".
' Solo puede quedar exento de esto hasta que se genere el EXE,
' una ves generado, la declaracion puede  quedar de la manera en que mas adelante se aprecia (sin el path),
' pero el proyecto solo va a funcionar desde el EXE y la DLL sera buscada en el directorio
' actual del EXE (De lo contrario marcara error).

' Constantes del Handle de los objetos creador por default por el API (1 objeto de cada tipo)
Public Const DBHandleDefault = 0          'Base de datos
Public Const TrnHandleDefault = 0         'Transaccion
Public Const DtstHandleDefault = 0        'DataSet
Public Const SqlHandleDefault = 0         'SQL
Public Const SpHandleDefault = 0          'Stored Procedure

' Constnates de los tipos de Transacciones
Public Const trnsSnapShot = 0
Public Const trnsReadComitedRec = 1
Public Const trnsReadComitedWait = 2
Public Const trnsReadComitedNoWait = 3

' Las variables de Handle de Transacciones, DataSet, SQL y StoredProc se DEBEN declarar de tipo Long
' Ej. Global DtstHandleAux1 As Long

' Funciones relacionadas  al manejo de Errores
Public Declare Function GetLastErrorCode Lib "ApiMicrosip.dll" () As Integer
Public Declare Function GetLastIBErrorCode Lib "ApiMicrosip.dll" () As Integer
Public Declare Function GetLastErrorMessage Lib "ApiMicrosip.dll" _
 (ByVal ErrorMessage As String) As Integer
Public Declare Sub SetErrorHandling Lib "ApiMicrosip.dll" _
 (ByVal ExceptionOnError As Integer, ByVal MessageOnException As Integer)

Public Declare Sub SuspendExceptions Lib "ApiMicrosip.dll" ()
Public Declare Sub RestoreExceptions Lib "ApiMicrosip.dll" ()
Public Declare Function ExceptionsSuspended Lib "ApiMicrosip.dll" () As Integer
Public Declare Sub LiberarRecursos Lib "ApiMicrosip.dll" ()


' Funciones relacionadas al objeto DataBase
Public Declare Function NewDB Lib "ApiMicrosip.dll" () As Integer
Public Declare Function DBCount Lib "ApiMicrosip.dll" () As Integer
Public Declare Function DBGetDefaultTrn Lib "ApiMicrosip.dll" _
(ByVal DBHandle As Integer) As Integer
Public Declare Function DBConnect Lib "ApiMicrosip.dll" _
(ByVal DBHandle As Integer, ByVal DataBaseName As String, ByVal UserName As String, _
  ByVal Password As String) As Integer
Public Declare Function DBDisconnect Lib "ApiMicrosip.dll" _
(ByVal DBHandle As Integer) As Integer
Public Declare Function DBConnected Lib "ApiMicrosip.dll" _
(ByVal DBHandle As Integer) As Integer
Public Declare Function DBCloseDatasets Lib "ApiMicrosip.dll" _
(ByVal DBHandle As Integer) As Integer

' Funciones relacionadas al objeto Transaction
Public Declare Function NewTrn Lib "ApiMicrosip.dll" _
(ByVal DBHandle As Integer, ByVal TrnType As Integer) As Integer
Public Declare Function TrnCount Lib "ApiMicrosip.dll" () As Integer
Public Declare Function TrnStart Lib "ApiMicrosip.dll" _
(ByVal TrnHandle As Integer) As Integer
Public Declare Function TrnInTransaction Lib "ApiMicrosip.dll" _
(ByVal TrnHandle As Integer) As Integer
Public Declare Function TrnCommit Lib "ApiMicrosip.dll" _
(ByVal TrnHandle As Integer) As Integer
Public Declare Function TrnRollback Lib "ApiMicrosip.dll" _
(ByVal TrnHandle As Integer) As Integer
Public Declare Function TrnConfig Lib "ApiMicrosip.dll" _
(ByVal TrnHandle As Integer, ByVal TrnType As Integer) As Integer

' Funciones relacionadas al objeto DataSet
Public Declare Function NewDtst Lib "ApiMicrosip.dll" _
(ByVal TrnHandle As Integer) As Integer
Public Declare Function DtstCount Lib "ApiMicrosip.dll" () As Integer
Public Declare Function DtstConfig Lib "ApiMicrosip.dll" _
(ByVal DtstHandle As Integer, ByVal TrnHandle As Integer) As Integer
Public Declare Function DtstSelQry Lib "ApiMicrosip.dll" _
(ByVal DtstHandle As Integer, ByVal Query As String) As Integer
Public Declare Function DtstInsQry Lib "ApiMicrosip.dll" _
(ByVal DtstHandle As Integer, ByVal Query As String) As Integer
Public Declare Function DtstUpdQry Lib "ApiMicrosip.dll" _
(ByVal DtstHandle As Integer, ByVal Query As String) As Integer
Public Declare Function DtstDelQry Lib "ApiMicrosip.dll" _
(ByVal DtstHandle As Integer, ByVal Query As String) As Integer
Public Declare Function DtstRefreshQry Lib "ApiMicrosip.dll" _
(ByVal DtstHandle As Integer, ByVal Query As String) As Integer
' DtstSetParamAs...
Public Declare Function DtstSetParamAsString Lib "ApiMicrosip.dll" _
(ByVal DtstHandle As Integer, ByVal ParamName As String, ByVal ParamValue As String) As Integer
Public Declare Function DtstSetParamAsDateTime Lib "ApiMicrosip.dll" _
(ByVal DtstHandle As Integer, ByVal ParamName As String, _
 ByVal Day As Integer, ByVal Month As Integer, ByVal Year As Integer, ByVal Hour As Integer, _
 ByVal Minute As Integer, ByVal Second As Integer) As Integer
Public Declare Function DtstSetParamAsInteger Lib "ApiMicrosip.dll" _
(ByVal DtstHandle As Integer, ByVal ParamName As String, ByVal ParamValue As Integer) As Integer
Public Declare Function DtstSetParamAsDouble Lib "ApiMicrosip.dll" _
(ByVal DtstHandle As Integer, ByVal ParamName As String, ByVal ParamValue As Double) As Integer
Public Declare Function DtstSetParamAsNull Lib "ApiMicrosip.dll" _
(ByVal DtstHandle As Integer, ByVal ParamName As String) As Integer
Public Declare Function DtstOpen Lib "ApiMicrosip.dll" _
(ByVal DtstHandle As Integer) As Integer
Public Declare Function DtstClose Lib "ApiMicrosip.dll" _
(ByVal DtstHandle As Integer) As Integer
Public Declare Function DtstFirst Lib "ApiMicrosip.dll" _
(ByVal DtstHandle As Integer) As Integer
Public Declare Function DtstNext Lib "ApiMicrosip.dll" _
(ByVal DtstHandle As Integer) As Integer
Public Declare Function DtstPrev Lib "ApiMicrosip.dll" _
(ByVal DtstHandle As Integer) As Integer
Public Declare Function DtstLast Lib "ApiMicrosip.dll" _
(ByVal DtstHandle As Integer) As Integer
Public Declare Function DtstEof Lib "ApiMicrosip.dll" _
 (ByVal DtstHandle As Integer) As Integer
Public Declare Function DtstBof Lib "ApiMicrosip.dll" _
(ByVal DtstHandle As Integer) As Integer
Public Declare Function DtstRecordCount Lib "ApiMicrosip.dll" _
(ByVal DtstHandle As Integer) As Integer

' DtstGetFieldAs
Public Declare Function DtstGetFieldAsString Lib "ApiMicrosip.dll" _
 (ByVal DtstHandle As Integer, ByVal FieldName As String, ByVal FieldValue As String) As Integer
Public Declare Function DtstGetFieldAsDate Lib "ApiMicrosip.dll" _
 (ByVal DtstHandle As Integer, ByVal FieldName As String, _
  ByRef Day As Integer, ByRef Month As Integer, ByRef Year As Integer) As Integer
Public Declare Function DtstGetFieldAsTime Lib "ApiMicrosip.dll" _
 (ByVal DtstHandle As Integer, ByVal FieldName As String, _
  ByRef Hour As Integer, ByRef Minute As Integer, ByRef Second As Integer) As Integer
Public Declare Function DtstGetFieldAsDateTime Lib "ApiMicrosip.dll" _
 (ByVal DtstHandle As Integer, ByVal FieldName As String, _
  ByRef Day As Integer, ByRef Month As Integer, ByRef Year As Integer, ByRef Hour As Integer, _
  ByRef Minute As Integer, ByRef Second As Integer) As Integer
Public Declare Function DtstGetFieldAsInteger Lib "ApiMicrosip.dll" _
 (ByVal DtstHandle As Integer, ByVal FieldName As String, ByRef FieldValue As Integer) As Integer
Public Declare Function DtstGetFieldAsDouble Lib "ApiMicrosip.dll" _
 (ByVal DtstHandle As Integer, ByVal FieldName As String, ByRef FieldValue As Double) As Integer
Public Declare Function DtstGetFieldAsMemo Lib "ApiMicrosip.dll" _
 (ByVal DtstHandle As Integer, ByVal FieldName As String, ByVal FieldValue As String) As Integer

' DtstSetFieldAs...
Public Declare Function DtstSetFieldAsString Lib "ApiMicrosip.dll" _
(ByVal DtstHandle As Integer, ByVal FieldName As String, ByVal FieldValue As String) As Integer
Public Declare Function DtstSetFieldAsDate Lib "ApiMicrosip.dll" _
(ByVal DtstHandle As Integer, ByVal FieldName As String, _
 ByVal Day As Integer, ByVal Month As Integer, ByVal Year As Integer) As Integer
Public Declare Function DtstSetFieldAsTime Lib "ApiMicrosip.dll" _
(ByVal DtstHandle As Integer, ByVal FieldName As String, _
 ByVal Hour As Integer, ByVal Minute As Integer, ByVal Second As Integer) As Integer
Public Declare Function DtstSetFieldAsDateTime Lib "ApiMicrosip.dll" _
(ByVal DtstHandle As Integer, ByVal FieldName As String, _
 ByVal Day As Integer, ByVal Month As Integer, ByVal Year As Integer, ByVal Hour As Integer, _
 ByVal Minute As Integer, ByVal Second As Integer) As Integer
Public Declare Function DtstSetFieldAsInteger Lib "ApiMicrosip.dll" _
(ByVal DtstHandle As Integer, ByVal FieldName As String, ByVal FieldValue As Integer) As Integer
Public Declare Function DtstSetFieldAsDouble Lib "ApiMicrosip.dll" _
(ByVal DtstHandle As Integer, ByVal FieldName As String, ByVal FieldValue As Double) As Integer
Public Declare Function DtstSetFieldAsMemo Lib "ApiMicrosip.dll" _
(ByVal DtstHandle As Integer, ByVal FieldName As String, ByVal FieldValue As String) As Integer
Public Declare Function DtstSetFieldAsNull Lib "ApiMicrosip.dll" _
(ByVal DtstHandle As Integer, ByVal FieldName As String) As Integer
' Edicion
Public Declare Function DtstInsert Lib "ApiMicrosip.dll" _
(ByVal DtstHandle As Integer) As Integer
Public Declare Function DtstEdit Lib "ApiMicrosip.dll" _
(ByVal DtstHandle As Integer) As Integer
Public Declare Function DtstDelete Lib "ApiMicrosip.dll" _
(ByVal DtstHandle As Integer) As Integer
Public Declare Function DtstCancel Lib "ApiMicrosip.dll" _
(ByVal DtstHandle As Integer) As Integer
Public Declare Function DtstPost Lib "ApiMicrosip.dll" _
(ByVal DtstHandle As Integer) As Integer
' Maestro/Detalle
Public Declare Function DtstLink Lib "ApiMicrosip.dll" _
(ByVal MasterDtstHandle As Integer, ByVal SlaveDtstHandle As Integer) As Integer
Public Declare Function DtstUnLink Lib "ApiMicrosip.dll" _
(ByVal SlaveDtstHandle As Integer) As Integer

' Funciones relacionadas al objeto SQL
Public Declare Function NewSql Lib "ApiMicrosip.dll" _
(ByVal TrnHandle As Integer) As Integer

Public Declare Function SqlCount Lib "ApiMicrosip.dll" () As Integer

Public Declare Function SqlConfig Lib "ApiMicrosip.dll" _
(ByVal SqlHandle As Integer, ByVal TrnHandle As Integer) As Integer
Public Declare Function SqlQry Lib "ApiMicrosip.dll" _
(ByVal SqlHandle As Integer, ByVal Query As String) As Integer
' SqlSetParamAs ...
Public Declare Function SqlSetParamAsString Lib "ApiMicrosip.dll" _
(ByVal SqlHandle As Integer, ByVal ParamName As String, ByVal ParamValue As String) As Integer
Public Declare Function SqlSetParamAsMemo Lib "ApiMicrosip.dll" _
(ByVal SqlHandle As Integer, ByVal ParamName As String, ByVal ParamValue As String) As Integer
Public Declare Function SqlSetParamAsDateTime Lib "ApiMicrosip.dll" _
(ByVal SqlHandle As Integer, ByVal ParamName As String, _
 ByVal Day As Integer, ByVal Month As Integer, ByVal Year As Integer, ByVal Hour As Integer, _
 ByVal Minute As Integer, ByVal Second As Integer) As Integer
Public Declare Function SqlSetParamAsInteger Lib "ApiMicrosip.dll" _
(ByVal SqlHandle As Integer, ByVal ParamName As String, ByVal ParamValue As Integer) As Integer
Public Declare Function SqlSetParamAsDouble Lib "ApiMicrosip.dll" _
(ByVal SqlHandle As Integer, ByVal ParamName As String, ByVal ParamValue As Double) As Integer
Public Declare Function SqlSetParamAsNull Lib "ApiMicrosip.dll" _
(ByVal SqlHandle As Integer, ByVal ParamName As String) As Integer
Public Declare Function SqlExecQuery Lib "ApiMicrosip.dll" _
(ByVal SqlHandle As Integer) As Integer
Public Declare Function SqlClose Lib "ApiMicrosip.dll" _
(ByVal SqlHandle As Integer) As Integer
Public Declare Function SqlNext Lib "ApiMicrosip.dll" _
(ByVal SqlHandle As Integer) As Integer
Public Declare Function SqlEof Lib "ApiMicrosip.dll" _
(ByVal SqlHandle As Integer) As Integer
Public Declare Function SqlRecordCount Lib "ApiMicrosip.dll" _
(ByVal SqlHandle As Integer) As Integer
' SqlGetFieldAs...
Public Declare Function SqlGetFieldAsString Lib "ApiMicrosip.dll" _
 (ByVal SqlHandle As Integer, ByVal FieldName As String, ByVal FieldValue As String) As Integer
Public Declare Function SqlGetFieldAsMemo Lib "ApiMicrosip.dll" _
 (ByVal SqlHandle As Integer, ByVal FieldName As String, ByVal FieldValue As String) As Integer
Public Declare Function SqlGetFieldAsDate Lib "ApiMicrosip.dll" _
 (ByVal SqlHandle As Integer, ByVal FieldName As String, _
  ByRef Day As Integer, ByRef Month As Integer, ByRef Year As Integer) As Integer
Public Declare Function SqlGetFieldAsTime Lib "ApiMicrosip.dll" _
 (ByVal SqlHandle As Integer, ByVal FieldName As String, _
  ByRef Hour As Integer, ByRef Minute As Integer, ByRef Second As Integer) As Integer
Public Declare Function SqlGetFieldAsDateTime Lib "ApiMicrosip.dll" _
 (ByVal SqlHandle As Integer, ByVal FieldName As String, _
  ByRef Day As Integer, ByRef Month As Integer, ByRef Year As Integer, ByRef Hour As Integer, _
  ByRef Minute As Integer, ByRef Second As Integer) As Integer
Public Declare Function SqlGetFieldAsInteger Lib "ApiMicrosip.dll" _
 (ByVal SqlHandle As Integer, ByVal FieldName As String, ByRef FieldValue As Integer) As Integer
Public Declare Function SqlGetFieldAsDouble Lib "ApiMicrosip.dll" _
 (ByVal SqlHandle As Integer, ByVal FieldName As String, ByRef FieldValue As Double) As Integer
 
' Funciones relacionadas al objeto StoredProcedure
Public Declare Function NewSp Lib "ApiMicrosip.dll" _
(ByVal TrnHandle As Integer) As Integer
Public Declare Function SpCount Lib "ApiMicrosip.dll" () As Integer
Public Declare Function SpConfig Lib "ApiMicrosip.dll" _
(ByVal SpHandle As Integer, ByVal TrnHandle As Integer) As Integer
Public Declare Function SpName Lib "ApiMicrosip.dll" _
(ByVal SpHandle As Integer, ByVal ProcName As String) As Integer
' SpSetParamAs...
Public Declare Function SpSetParamAsString Lib "ApiMicrosip.dll" _
(ByVal SpHandle As Integer, ByVal ParamName As String, ByVal ParamValue As String) As Integer
Public Declare Function SpSetParamAsDateTime Lib "ApiMicrosip.dll" _
(ByVal SpHandle As Integer, ByVal ParamName As String, _
 ByVal Day As Integer, ByVal Month As Integer, ByVal Year As Integer, ByVal Hour As Integer, _
 ByVal Minute As Integer, ByVal Second As Integer) As Integer
Public Declare Function SpSetParamAsInteger Lib "ApiMicrosip.dll" _
(ByVal SpHandle As Integer, ByVal ParamName As String, ByVal ParamValue As Integer) As Integer
Public Declare Function SpSetParamAsDouble Lib "ApiMicrosip.dll" _
(ByVal SpHandle As Integer, ByVal ParamName As String, ByVal ParamValue As Double) As Integer
Public Declare Function SpSetParamAsNull Lib "ApiMicrosip.dll" _
(ByVal SpHandle As Integer, ByVal ParamName As String) As Integer
Public Declare Function SpExecProc Lib "ApiMicrosip.dll" _
(ByVal SpHandle As Integer) As Integer
' SpGetParamAs...
Public Declare Function SpGetParamAsString Lib "ApiMicrosip.dll" _
 (ByVal SpHandle As Integer, ByVal ParamName As String, ByVal ParamValue As String) As Integer
Public Declare Function SpGetParamAsDate Lib "ApiMicrosip.dll" _
 (ByVal SpHandle As Integer, ByVal ParamName As String, _
  ByRef Day As Integer, ByRef Month As Integer, ByRef Year As Integer) As Integer
Public Declare Function SpGetParamAsTime Lib "ApiMicrosip.dll" _
 (ByVal SpHandle As Integer, ByVal ParamName As String, _
  ByRef Hour As Integer, ByRef Minute As Integer, ByRef Second As Integer) As Integer
Public Declare Function SpGetParamAsDateTime Lib "ApiMicrosip.dll" _
 (ByVal SpHandle As Integer, ByVal ParamName As String, _
  ByRef Day As Integer, ByRef Month As Integer, ByRef Year As Integer, ByRef Hour As Integer, _
  ByRef Minute As Integer, ByRef Second As Integer) As Integer
Public Declare Function SpGetParamAsInteger Lib "ApiMicrosip.dll" _
 (ByVal SpHandle As Integer, ByVal ParamName As String, ByRef ParamValue As Integer) As Integer
Public Declare Function SpGetParamAsDouble Lib "ApiMicrosip.dll" _
 (ByVal SpHandle As Integer, ByVal ParamName As String, ByRef ParamValue As Double) As Integer
 
'Funciones relacionadas con el Semaforo
Public Declare Function NewSem Lib "ApiMicrosip.dll" _
 (ByVal DBHandle As Integer) As Integer
Public Declare Function SemCount Lib "ApiMicrosip.dll" () As Integer
Public Declare Function SemGetSemaforos Lib "ApiMicrosip.dll" _
 (ByVal SemHandle As Integer, ByVal NombresSemaforos As String) As Integer
Public Declare Function SemRelSemaforos Lib "ApiMicrosip.dll" _
 (ByVal SemHandle As Integer) As Integer
Public Declare Function SemGetSemaforoNoWait Lib "ApiMicrosip.dll" _
 (ByVal SemHandle As Integer, ByVal NombreSemaforo As String) As Integer
Public Declare Function SemConfig Lib "ApiMicrosip.dll" _
 (ByVal SemHandle As Integer, ByVal DBHandle As Integer) As Integer

'Funciones relacionadas con la lista de parámetros
public Declare Function NewPL Lib "ApiMicrosip.dll" () As Integer
public Declare Function PLCount Lib "ApiMicrosip.dll" () As Integer
public Declare Function PLParamCount Lib "ApiMicrosip.dll" _
  (ByVal PLHandle As Integer, ByRef ParamCount As Integer) As Integer
public Declare Function PLSetParamValue Lib "ApiMicrosip.dll" _
  (ByVal PLHandle As Integer, ByVal ParamName As String, ByVal ParamValue As String) As Integer
public Declare Function PLGetParamValue Lib "ApiMicrosip.dll" _
  (ByVal PLHandle As Integer, ByVal ParamName As String, ByVal ParamValue As String) As Integer
public Declare Function PLGetParamName  Lib "ApiMicrosip.dll" _
  (ByVal PLHandle As Integer, ByVal Index As Integer, ByVal ParamName As String) As Integer
public Declare Function PLDeleteParam  Lib "ApiMicrosip.dll" _
  (ByVal PLHandle As Integer; ByVal AParamName As String) As Integer
public Declare Function PLClear(ByVal PLHandle As Integer) Lib "ApiMicrosip.dll" As Integer
