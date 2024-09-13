unit ApiMspInventExt;

interface
  // Chequeo de errores
  function inGetLastErrorCode: Integer; stdcall;
  function inGetLastErrorMessage(ErrorMessage: PAnsiChar): Integer; stdcall;
  procedure inSetErrorHandling(ExceptionOnError, MessageOnException: Integer); stdcall;

  function SetDBInventarios(DBHandle: Integer): Integer; stdcall;

  // Funciones principales Entradas
  function NuevaEntrada(ConceptoInId, AlmacenId: Integer; Fecha, Folio,
    Descripcion: PAnsiChar; CentroCostoId: Integer): Integer; stdcall;
  function RenglonEntrada(ArticuloId: Integer; Unidades, CostoUnitario,
    CostoTotal: Double): Integer; stdcall;
  function RenglonEntradaLotes(ClaveLote, FechaCaducidad: PAnsiChar;
    Unidades: Double): Integer; stdcall;
  function RenglonEntradaSeries(ClaveSerie: PAnsiChar; NumConsecutivos:
    Integer): Integer; stdcall;
  function RenglonEntradaPedimento(ClavePedimento, FechaPedimento,
    AduanaPedimento: PAnsiChar): Integer; stdcall;

  function AplicaEntrada: Integer; stdcall;
  procedure AbortaDoctoInventarios; stdcall;

  // Checar Compatibilidad
  function GetVersionApiInventariosAsInteger: Integer; stdcall;
  procedure GetVersionApiInventariosAsString(AVersion: PAnsiChar); stdcall;
  function ChecaCompatibilidadInventarios(HdbMetadatos: Integer): Integer; stdcall;

  // Funciones principales Salidas
  function NuevaSalida(ConceptoInId, AlmacenId, AlmacenDestinoId: Integer; Fecha, Folio,
    Descripcion: PAnsiChar; CentroCostoId: Integer): Integer; stdcall;
  function RenglonSalida(ArticuloId: Integer; Unidades, CostoUnitario,
    CostoTotal: Double): Integer; stdcall;
  function RenglonSalidaSeries(ClaveSerie: PAnsiChar): Integer; stdcall;
  function RenglonSalidaLotes(ClaveLote: PAnsiChar; Unidades: Double): Integer; stdcall;
  function AplicaSalida: Integer; stdcall;
  procedure SetReglasInventarios(ExistenciasNegativas: Integer); stdcall; 
  
const
  ApiMsp  = 'ApiMicrosip.dll';

implementation
  // Chequeo de errores
  function inGetLastErrorCode; external ApiMsp;
  function inGetLastErrorMessage; external ApiMsp;
  procedure inSetErrorHandling; external ApiMsp;

  function SetDBInventarios; external ApiMsp;

  // Funciones principales Entradas
  function NuevaEntrada; external ApiMsp;
  function RenglonEntrada; external ApiMsp;
  function RenglonEntradaLotes; external ApiMsp;
  function RenglonEntradaSeries; external ApiMsp;
  function RenglonEntradaPedimento; external ApiMsp;

  function AplicaEntrada; external ApiMsp;
  procedure AbortaDoctoInventarios; external ApiMsp;

  // Checar Compatibilidad
  function GetVersionApiInventariosAsInteger; external ApiMsp;
  procedure GetVersionApiInventariosAsString; external ApiMsp;
  function ChecaCompatibilidadInventarios; external ApiMsp;

  // Funciones principales Salidas
  function NuevaSalida; external ApiMsp;
  function RenglonSalida; external ApiMsp;
  function RenglonSalidaSeries; external ApiMsp;
  function RenglonSalidaLotes; external ApiMsp;
  function AplicaSalida; external ApiMsp;
  procedure SetReglasInventarios; external ApiMsp;

end.
