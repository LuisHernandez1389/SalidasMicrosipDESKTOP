unit ApiMspCxcExt;

interface
  // Chequeo de errores
  function ccGetLastErrorCode: Integer; stdcall;
  function ccGetLastErrorMessage(ErrorMessage: PAnsiChar): Integer; stdcall;
  procedure ccSetErrorHandling(ExceptionOnError, MessageOnException: Integer); stdcall;

  function SetDBCxc(DBHandle: Integer): Integer; stdcall;
  function SetDBMetadatos(DBHandle: Integer): Integer; stdcall;

  function NuevoCreditoCc(ConceptoCcId: Integer; Fecha, Folio: PAnsiChar;
    ClienteId: Integer; Descripcion: PAnsiChar; CobradorId: Integer; PLHandle: Integer): Integer; stdcall;
  function AplicaCreditoCc: Integer; stdcall;
  function RenglonCreditoImpuestoCc(ImpuestoId: Integer;
    Importe, Impuesto: Double): Integer; stdcall;
  function RenglonCreditoCc(TipoImporte: PAnsiChar; CargoId: Integer; FolioCargo: PAnsiChar;
    Importe, Impuesto, IvaRetenido, IsrRetenido, DsctoPpag: Double): Integer; stdcall;
  procedure AbortaDoctoCxc; stdcall;
  function GetDoctoCCId(var DoctoId: Integer): Integer;  stdcall;

  // Checar Compatibilidad
  function GetVersionApiCxcAsInteger: Integer; stdcall;
  procedure GetVersionApiCxcAsString(lVersion: PAnsiChar); stdcall;
  function ChecaCompatibilidadCxc(HdbMetadatos: Integer): Integer; stdcall;

  function GetImporteMonedaCliente(ClienteId: Integer; FormaCobroId: Integer;
    ImporteCobro: Double; Fecha: PAnsiChar; var Importe: Double): Integer; stdcall;

  function NuevoAnticipoCc(ConceptoCcId: Integer; Fecha, Folio: PAnsiChar;
    ClienteId: Integer; Referencia, Descripcion: PAnsiChar; CondPagoId: Integer;
    Importe: Double; ImpuestoId, PLHandle: Integer): Integer; stdcall;
  function AplicaAnticipoCc: Integer; stdcall;
const
  ApiMsp  = 'ApiMicrosip.dll';

implementation
  // Chequeo de errores
  function ccGetLastErrorCode; external ApiMsp;
  function ccGetLastErrorMessage; external ApiMsp;
  procedure ccSetErrorHandling; external ApiMsp;

  function SetDBCxc; external ApiMsp;
  function SetDBMetadatos; external ApiMsp;

  function NuevoCreditoCc; external ApiMsp;
  function RenglonCreditoImpuestoCc; external ApiMsp;
  function RenglonCreditoCc; external ApiMsp;
  function AplicaCreditoCc; external ApiMsp;
  procedure AbortaDoctoCxc; external ApiMsp;
  function GetDoctoCCId; external ApiMsp;

  // Checar Compatibilidad
  function GetVersionApiCxcAsInteger; external ApiMsp;
  procedure GetVersionApiCxcAsString; external ApiMsp;
  function ChecaCompatibilidadCxc; external ApiMsp;

  function GetImporteMonedaCliente; external ApiMsp;
  function NuevoAnticipoCc; external ApiMsp;
  function AplicaAnticipoCc; external ApiMsp;

end.
