unit ApiMspBasicaExt;

interface

  // Chequeo de errores
  function GetLastErrorCode: Integer; stdcall;
  function GetLastIBErroCode: Integer; stdcall;
  function GetLastErrorMessage(ErrorMessage: PAnsiChar): Integer; stdcall;
  procedure SetErrorHandling(ExceptionOnError, MessageOnException: Integer); stdcall;

  procedure SuspendExceptions; stdcall;
  procedure RestoreExceptions; stdcall;
  function ExceptionsSuspended: Integer; stdcall;
  procedure LiberarRecursos; stdcall;

  // Objeto DB
  function NewDB: Integer; stdcall;
  function DBCount: Integer; stdcall;

  function DBGetDefaultTrn(DBHandle: Integer): Integer; stdcall;
  
  function DBConnect(DBHandle: Integer; DataBaseName: PAnsiChar; UserName, Password: PAnsiChar): Integer; stdcall; 
  function DBCloseDatasets(DBHandle: Integer): Integer; stdcall;
  function DBDisconnect(DBHandle: Integer): Integer; stdcall;
  function DBConnected(DBHandle: Integer): Integer; stdcall;

  // Objeto Transaction
  function NewTrn(DBHandle, TrnType: Integer): Integer; stdcall;
  function TrnCount: Integer; stdcall; 
  function TrnStart(TrnHandle: Integer): Integer; stdcall;
  function TrnInTransaction(TrnHandle: Integer): Integer; stdcall;
  function TrnCommit(TrnHandle: Integer): Integer; stdcall;
  function TrnRollback(TrnHandle: Integer): Integer; stdcall;
  function TrnConfig(TrnHandle: Integer; TrnType: Integer): Integer; stdcall;

  // Objeto DataSet
  function NewDtst(TrnHandle: Integer): Integer; stdcall;
  function DtstCount: Integer; stdcall;
  function DtstConfig(DtstHandle, TrnHandle: Integer): Integer; stdcall; 
  function DtstSelQry(DtstHandle: Integer; Query: PAnsiChar): Integer; stdcall; 
  function DtstInsQry(DtstHandle: Integer; Query: PAnsiChar): Integer; stdcall; 
  function DtstUpdQry(DtstHandle: Integer; Query: PAnsiChar): Integer; stdcall; 
  function DtstDelQry(DtstHandle: Integer; Query: PAnsiChar): Integer; stdcall; 
  function DtstRefreshQry(DtstHandle: Integer; Query: PAnsiChar): Integer; stdcall; 
  {Asignar Parametros}
  function DtstSetParamAsString(DtstHandle: Integer; ParamName:
    PAnsiChar; ParamValue: PAnsiChar): Integer; stdcall; 
  function DtstSetParamAsDateTime(DtstHandle: Integer; ParamName: PAnsiChar;
    Day, Month, Year, Hour, Minute, Second: Word): Integer; stdcall;
  function DtstSetParamAsInteger(DtstHandle: Integer; ParamName: PAnsiChar;
    ParamValue: Integer): Integer; stdcall; 
  function DtstSetParamAsDouble(DtstHandle: Integer; ParamName: PAnsiChar;
    ParamValue: Double): Integer; stdcall;
  function DtstSetParamAsNull(DtstHandle: Integer; ParamName: PAnsiChar): Integer; stdcall; 
  {Navegar}
  function DtstOpen(DtstHandle: Integer): Integer; stdcall;
  function DtstClose(DtstHandle: Integer): Integer; stdcall;
  function DtstFirst(DtstHandle: Integer): Integer; stdcall;
  function DtstNext(DtstHandle: Integer): Integer; stdcall;
  function DtstPrev(DtstHandle: Integer): Integer; stdcall;
  function DtstLast(DtstHandle: Integer): Integer; stdcall;
  function DtstEof(DtstHandle: Integer): Integer; stdcall;
  function DtstBof(DtstHandle: Integer): Integer; stdcall;
  function DtstRecordCount(DtstHandle: Integer): Integer; stdcall;
  {Obtener valores}
  function DtstGetFieldAsString(DtstHandle: Integer; FieldName:
    PAnsiChar; FieldValue: PAnsiChar): Integer; stdcall;
  function DtstGetFieldAsDate(DtstHandle: Integer; FieldName: PAnsiChar;
    Var Day, Month, Year: Word): Integer; stdcall;
  function DtstGetFieldAsTime(DtstHandle: Integer; FieldName: PAnsiChar;
    Var Hour, Minute, Second: Word): Integer; stdcall;
  function DtstGetFieldAsDateTime(DtstHandle: Integer; FieldName: PAnsiChar;
    Var Day, Month, Year, Hour, Minute, Second: Word): Integer; stdcall;
  function DtstGetFieldAsInteger(DtstHandle: Integer; FieldName: PAnsiChar;
    Var FieldValue: Integer): Integer; stdcall;
  function DtstGetFieldAsDouble(DtstHandle: Integer; FieldName: PAnsiChar;
    Var FieldValue: Double): Integer; stdcall;
  function DtstGetFieldAsMemo
  (DtstHandle: Integer; FieldName: PAnsiChar; FieldValue: PAnsiChar): Integer; stdcall;
  {Asignar valores}
  function DtstSetFieldAsString(dtstHandle: Integer; FieldName, FieldValue: PAnsiChar): Integer; stdcall;
  function DtstSetFieldAsDate(DtstHandle: Integer; FieldName: PAnsiChar; Day, Month, Year: Word): Integer; stdcall;
  function DtstSetFieldAsTime(DtstHandle: Integer; FieldName: PAnsiChar; Hour, Minute, Second: Word): Integer; stdcall;
  function DtstSetFieldAsDateTime (DtstHandle: Integer; FieldName: PAnsiChar;
   Day, Month, Year, Hour, Minute, Second: Word): Integer; stdcall;
  function DtstSetFieldAsInteger(DtstHandle: Integer; FieldName: PAnsiChar; FieldValue: Integer): Integer; stdcall;
  function DtstSetFieldAsDouble(DtstHandle: Integer; FieldName: PAnsiChar; FieldValue: Double): Integer; stdcall;
  function DtstSetFieldAsMemo(dtstHandle: Integer; FieldName, FieldValue: PAnsiChar): Integer; stdcall;
  function DtstSetFieldAsNull(dtstHandle: Integer; FieldName: PAnsiChar): Integer; stdcall;

  {Cambio de estados}
  function DtstInsert(DtstHandle: Integer): Integer; stdcall;
  function DtstEdit(DtstHandle: Integer): Integer; stdcall;
  function DtstDelete(DtstHandle: Integer): Integer; stdcall;
  function DtstCancel(DtstHandle: Integer): Integer; stdcall;
  function DtstPost(DtstHandle: Integer): Integer; stdcall;
  {Maestro/Detalle}
  function DtstLink(MasterDtstHandle: Integer; SlaveDtstHandle: Integer): Integer; stdcall;
  function DtstUnLink(SlaveDtstHandle: Integer): Integer; stdcall;

  // Objeto SQL
  function NewSql(TrnHandle: Integer): Integer; stdcall;
  function SqlCount: Integer; stdcall;
  function SqlConfig(SqlHandle, TrnHandle: Integer): Integer; stdcall;
  function SqlQry(SqlHandle: Integer; Query: PAnsiChar): Integer; stdcall;

  function SqlSetParamAsString(SqlHandle: Integer; ParamName: PAnsiChar; ParamValue: PAnsiChar): Integer; stdcall;
  function SqlSetParamAsDateTime(SqlHandle: Integer; ParamName: PAnsiChar;
    Day, Month, Year, Hour, Minute, Second: Word): Integer; stdcall;
  function SqlSetParamAsInteger(SqlHandle: Integer; ParamName: PAnsiChar; ParamValue: Integer): Integer; stdcall;
  function SqlSetParamAsDouble(SqlHandle: Integer; ParamName: PAnsiChar; ParamValue: Double): Integer; stdcall;
  function SqlSetParamAsMemo(SqlHandle: Integer; ParamName: PAnsiChar; ParamValue: PAnsiChar): Integer; stdcall;
  function SqlSetParamAsNull(SqlHandle: Integer; ParamName: PAnsiChar): Integer; stdcall;

  function SqlExecQuery(SqlHandle: Integer): Integer; stdcall;
  function SqlClose(SqlHandle: Integer): Integer; stdcall;
  function SqlNext(SqlHandle: Integer): Integer; stdcall;
  function SqlEof(SqlHandle: Integer): Integer; stdcall;
  function SqlRecordCount(SqlHandle: Integer): Integer; stdcall;
  function SqlGetFieldAsString(SqlHandle: Integer; FieldName: PAnsiChar; FieldValue: PAnsiChar): Integer; stdcall;
  function SqlGetFieldAsDate(SqlHandle: Integer; FieldName: PAnsiChar;
    Var Day, Month, Year: Word): Integer; stdcall;
  function SqlGetFieldAsTime(SqlHandle: Integer; FieldName: PAnsiChar;
    Var Hour, Minute, Second: Word): Integer; stdcall;
  function SqlGetFieldAsDateTime(SqlHandle: Integer; FieldName: PAnsiChar;
    Var Day, Month, Year, Hour, Minute, Second: Word): Integer; stdcall;
  function SqlGetFieldAsInteger(SqlHandle: Integer; FieldName: PAnsiChar;
    Var FieldValue: Integer): Integer; stdcall;
  function SqlGetFieldAsDouble(SqlHandle: Integer; FieldName: PAnsiChar;
    Var FieldValue: Double): Integer; stdcall;
  function SqlGetFieldAsMemo(SqlHandle: Integer; FieldName: PAnsiChar;
    FieldValue: PAnsiChar): Integer; stdcall;

  // Objeto StoredProc
  function NewSp(TrnHandle: Integer): Integer; stdcall;
  function SpCount: Integer; stdcall;
  function SpConfig(SpHandle, TrnHandle: Integer): Integer; stdcall;
  function SpName(SpHandle: Integer; ProcName: PAnsiChar): Integer; stdcall;
  function SpSetParamAsString(SpHandle: Integer; ParamName: PAnsiChar; ParamValue: PAnsiChar): Integer; stdcall;
  function SpSetParamAsDateTime(SpHandle: Integer; ParamName: PAnsiChar;
    Day, Month, Year, Hour, Minute, Second: Word): Integer; stdcall;
  function SpSetParamAsInteger(SpHandle: Integer; ParamName: PAnsiChar; ParamValue: Integer): Integer; stdcall;
  function SpSetParamAsDouble(SpHandle: Integer; ParamName: PAnsiChar; ParamValue: Double): Integer; stdcall;
  function SpSetParamAsNull(SpHandle: Integer; ParamName: PAnsiChar): Integer; stdcall;
  function SpExecProc(SpHandle: Integer): Integer; stdcall;
  function SpGetParamAsString(SpHandle: Integer; ParamName: PAnsiChar; ParamValue: PAnsiChar): Integer; stdcall;
  function SpGetParamAsDate(SpHandle: Integer; ParamName: PAnsiChar;
    Var Day, Month, Year: Word): Integer; stdcall;
  function SpGetParamAsTime(SpHandle: Integer; ParamName: PAnsiChar;
    Var Hour, Minute, Second: Word): Integer; stdcall;
  function SpGetParamAsDateTime(SpHandle: Integer; ParamName: PAnsiChar;
    Var Day, Month, Year, Hour, Minute, Second: Word): Integer; stdcall;
  function SpGetParamAsInteger(SpHandle: Integer; ParamName: PAnsiChar;
    Var ParamValue: Integer): Integer; stdcall;
  function SpGetParamAsDouble(SpHandle: Integer; ParamName: PAnsiChar;
    Var ParamValue: Double): Integer; stdcall;
  
  // Objeto semaforo
  function NewSem(DBHandle: Integer): Integer; stdcall;
  function SemCount: Integer; stdcall;
  function SemGetSemaforos(SemHandle: Integer; NombresSemaforos: PAnsiChar): Integer; stdcall;
  function SemRelSemaforos(SemHandle: Integer): Integer; stdcall;
  function SemGetSemaforoNoWait(SemHandle: Integer; NombreSemaforo: PAnsiChar):Integer; stdcall;
  function SemConfig(SemHandle, DBHandle: Integer): Integer; stdcall;

  // Objeto lista de parámetros
  function NewPL: Integer; stdcall;
  function PLCount: Integer; stdcall;
  function PLParamCount (PLHandle: Integer; var ParamCount: Integer): Integer; stdcall;
  function PLSetParamValue (PLHandle: Integer; ParamName, ParamValue: PAnsiChar): Integer; stdcall;
  function PLGetParamValue (PLHandle: Integer; ParamName, ParamValue: PAnsiChar): Integer;  stdcall;
  function PLGetParamName(PLHandle, Index: Integer; ParamName: PAnsiChar): Integer; stdcall;
  function PLDeleteParam (PLHandle: Integer; AParamName: PAnsiChar): Integer; stdcall;
  function PLClear(PLHandle: Integer): Integer; stdcall;

const
  ApiMsp  = 'ApiMicrosip.dll';

implementation

  // Chequeo de errores
  function GetLastErrorCode; external ApiMsp;
  function GetLastIBErroCode; external ApiMsp;
  function GetLastErrorMessage; external ApiMsp;
  procedure SetErrorHandling; external ApiMsp;

  procedure SuspendExceptions; external ApiMsp;
  procedure RestoreExceptions; external ApiMsp;
  function ExceptionsSuspended; external ApiMsp;
  procedure LiberarRecursos; external ApiMsp;

  // Objeto DB
  function NewDB; external ApiMsp;
  function DBCount; external ApiMsp;

  function DBGetDefaultTrn; external ApiMsp;

  function DBConnect; external ApiMsp;
  function DBCloseDatasets; external ApiMsp;
  function DBDisconnect; external ApiMsp;
  function DBConnected; external ApiMsp;

  // Objeto Transaction
  function NewTrn; external ApiMsp;
  function TrnCount; external ApiMsp;
  function TrnStart; external ApiMsp;
  function TrnInTransaction; external ApiMsp;
  function TrnCommit; external ApiMsp;
  function TrnRollback; external ApiMsp;
  function TrnConfig; external ApiMsp;

  // Objeto DataSet
  function NewDtst; external ApiMsp;
  function DtstCount; external ApiMsp;
  function DtstConfig; external ApiMsp;
  function DtstSelQry; external ApiMsp;
  function DtstInsQry; external ApiMsp;
  function DtstUpdQry; external ApiMsp;
  function DtstDelQry; external ApiMsp;
  function DtstRefreshQry; external ApiMsp;
  {Asinar Parametros}
  function DtstSetParamAsString; external ApiMsp;
  function DtstSetParamAsDateTime; external ApiMsp;
  function DtstSetParamAsInteger; external ApiMsp;
  function DtstSetParamAsDouble; external ApiMsp;
  function DtstSetParamAsNull; external ApiMsp;
  {Navegar}
  function DtstOpen; external ApiMsp;
  function DtstClose; external ApiMsp;
  function DtstFirst; external ApiMsp;
  function DtstNext; external ApiMsp;
  function DtstPrev; external ApiMsp;
  function DtstLast; external ApiMsp;
  function DtstEof; external ApiMsp;
  function DtstBof; external ApiMsp;
  function DtstRecordCount; external ApiMsp;
  {Obtener valores}
  function DtstGetFieldAsString; external ApiMsp;
  function DtstGetFieldAsDate; external ApiMsp;
  function DtstGetFieldAsTime; external ApiMsp;
  function DtstGetFieldAsDateTime; external ApiMsp;
  function DtstGetFieldAsInteger; external ApiMsp;
  function DtstGetFieldAsDouble; external ApiMsp;
  function DtstGetFieldAsMemo; external ApiMsp;
  {Asignar valores}
  function DtstSetFieldAsString; external ApiMsp;
  function DtstSetFieldAsDate; external ApiMsp;
  function DtstSetFieldAsTime; external ApiMsp;
  function DtstSetFieldAsDateTime; external ApiMsp;
  function DtstSetFieldAsInteger; external ApiMsp;
  function DtstSetFieldAsDouble; external ApiMsp;
  function DtstSetFieldAsMemo; external ApiMsp;
  function DtstSetFieldAsNull; external ApiMsp;
  {Cambio de estados}
  function DtstInsert; external ApiMsp;
  function DtstEdit; external ApiMsp;
  function DtstDelete; external ApiMsp;
  function DtstCancel; external ApiMsp;
  function DtstPost; external ApiMsp;
  {Maestro/Detalle}
  function DtstLink; external ApiMsp;
  function DtstUnLink; external ApiMsp;

  // Objeto SQL
  function NewSql; external ApiMsp;
  function SqlCount; external ApiMsp;
  function SqlConfig; external ApiMsp;
  function SqlQry; external ApiMsp;
  function SqlSetParamAsString; external ApiMsp;
  function SqlSetParamAsDateTime; external ApiMsp;
  function SqlSetParamAsInteger; external ApiMsp;
  function SqlSetParamAsDouble; external ApiMsp;
  function SqlSetParamAsMemo; external ApiMsp;
  function SqlSetParamAsNull; external ApiMsp;
  function SqlExecQuery; external ApiMsp;
  function SqlClose; external ApiMsp;
  function SqlNext; external ApiMsp;
  function SqlEof; external ApiMsp;
  function SqlRecordCount; external ApiMsp;
  function SqlGetFieldAsString; external ApiMsp;
  function SqlGetFieldAsDate; external ApiMsp;
  function SqlGetFieldAsTime; external ApiMsp;
  function SqlGetFieldAsDateTime; external ApiMsp;
  function SqlGetFieldAsInteger; external ApiMsp;
  function SqlGetFieldAsDouble; external ApiMsp;
  function SqlGetFieldAsMemo; external ApiMsp;

  // Objeto StoredProc
  function NewSp; external ApiMsp;
  function SpCount; external ApiMsp;
  function SpConfig; external ApiMsp;
  function SpName; external ApiMsp;
  function SpSetParamAsString; external ApiMsp;
  function SpSetParamAsDateTime; external ApiMsp;
  function SpSetParamAsInteger; external ApiMsp;
  function SpSetParamAsDouble; external ApiMsp;
  function SpSetParamAsNull; external ApiMsp;
  function SpExecProc; external ApiMsp;
  function SpGetParamAsString; external ApiMsp;
  function SpGetParamAsDate; external ApiMsp;
  function SpGetParamAsTime; external ApiMsp;
  function SpGetParamAsDateTime; external ApiMsp;
  function SpGetParamAsInteger; external ApiMsp;
  function SpGetParamAsDouble; external ApiMsp;

  // Objeto Semaforo
  function NewSem; external ApiMsp;
  function SemCount; external ApiMsp;
  function SemGetSemaforos; external ApiMsp;
  function SemRelSemaforos; external ApiMsp;
  function SemGetSemaforoNoWait; external ApiMsp;
  function SemConfig; external ApiMsp;

   // Objeto lista de parámetros
  function NewPL; external ApiMsp;
  function PLCount; external ApiMsp;
  function PLParamCount; external ApiMsp;
  function PLSetParamValue; external ApiMsp;
  function PLGetParamValue; external ApiMsp;
  function PLGetParamName; external ApiMsp;
  function PLDeleteParam; external ApiMsp;
  function PLClear; external ApiMsp;
  
end.
