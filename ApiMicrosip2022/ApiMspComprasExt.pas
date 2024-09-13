unit ApiMspComprasExt;

interface

  // Chequeo de errores
  function cmGetLastErrorCode: Integer; stdcall;
  function cmGetLastErrorMessage(ErrorMessage: PAnsiChar): Integer; stdcall;
  procedure cmSetErrorHandling(ExceptionOnError, MessageOnException: Integer); stdcall;

  function SetDBCompras(DBHandle: Integer): Integer; stdcall;
  procedure AbortaDoctoCompras; stdcall;
  function DireccionProveedorEventualDocCompras(CiudadId, EstadoId, PaisId: Integer;
    NombreProv, Calle, CodigoPostal, Telefono1, Telefono2, Fax, Email, RfcCurp, Contacto: PAnsiChar): Integer; stdcall;   

    // Checar Compatibilidad
  function GetVersionApiComprasAsInteger: Integer; stdcall;
  procedure GetVersionApiComprasAsString(lVersion: PAnsiChar); stdcall;
  function ChecaCompatibilidadCompras(HdbMetadatos: Integer): Integer; stdcall;

  // Ordenes de compras
  function NuevaOrdenCompra(Fecha, Folio: PAnsiChar; ProveedorId, DirConsigId, AlmacenId: Integer;
    FechaEntrega, TipoDscto: PAnsiChar; Descuento: Double; Descripcion: PAnsiChar;
    CondPagoId, ViaEmbarqueId, ImptoSustituidoId, ImptoSustitutoId: Integer; MonedaId: Integer): Integer; stdcall;
  function RenglonOrdenCompra(ArticuloId: Integer; Unidades, PrecioUnitario, PctjeDscto: Double;
     Notas, TipoPrecio: PAnsiChar): Integer; stdcall;
  function AplicaOrdenCompra: Integer; stdcall;

  // Documentos de compras
  function NuevaCompra(Fecha, Folio: PAnsiChar; ProveedorId, AlmacenId: Integer;
    TipoDscto: PAnsiChar; Descuento, TipoCambio: Double;
    Factura, Descripcion: PAnsiChar;
    Fletes, OtrosCargos, GastosAduanales: Double;
    CondPagoId, ImptoSustituidoId, ImptoSustitutoId: Integer): Integer; stdcall;
  function RenglonCompra(ArticuloId: Integer; Unidades, PrecioUnitario, PctjeDscto: Double;
     Notas, TipoPrecio: PAnsiChar): Integer; stdcall;
  function CompraPedimento(ClavePedimento, FechaPedimento,
    AduanaPedimento: PAnsiChar): Integer; stdcall;
  function RenglonCompraLotes(ClaveLote, FechaCaducidad: PAnsiChar;
    Unidades: Double): Integer; stdcall;
  function RenglonCompraSeries(ClaveSerie: PAnsiChar; NumConsecutivos:
    Integer): Integer; stdcall;
  function AplicaCompra: Integer; stdcall;  

const
  ApiMsp  = 'ApiMicrosip.dll';

implementation
  // Chequeo de errores
  function cmGetLastErrorCode; external ApiMsp;
  function cmGetLastErrorMessage; external ApiMsp;
  procedure cmSetErrorHandling; external ApiMsp;

  function SetDBCompras; external ApiMsp;
  procedure AbortaDoctoCompras; external ApiMsp;
  function DireccionProveedorEventualDocCompras; external ApiMsp;

  // Checar Compatibilidad
  function GetVersionApiComprasAsInteger; external ApiMsp;
  procedure GetVersionApiComprasAsString; external ApiMsp;
  function ChecaCompatibilidadCompras; external ApiMsp;

  // Ordenes de compra
  function NuevaOrdenCompra; external ApiMsp;
  function RenglonOrdenCompra; external ApiMsp;
  function AplicaOrdenCompra; external ApiMsp;

  // Documentos de compras
  function NuevaCompra; external ApiMsp;
  function RenglonCompra; external ApiMsp;
  function CompraPedimento; external ApiMsp;
  function RenglonCompraLotes; external ApiMsp;
  function RenglonCompraSeries; external ApiMsp;
  function AplicaCompra; external ApiMsp;
end.
