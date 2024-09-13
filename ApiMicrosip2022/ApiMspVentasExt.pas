unit ApiMspVentasExt;

interface
  // Chequeo de errores
  function veGetLastErrorCode: Integer; stdcall;
  function veGetLastErrorMessage(ErrorMessage: PAnsiChar): Integer; stdcall;
  procedure veSetErrorHandling(ExceptionOnError, MessageOnException: Integer); stdcall;

  function SetDBVentas(DBHandle: Integer): Integer; stdcall;
  procedure AbortaDoctoVentas; stdcall;
  function GetDoctoVeId(var DoctoId: integer): Integer;  stdcall;

  // Checar Compatibilidad
  function GetVersionApiVentasAsInteger: Integer; stdcall;
  procedure GetVersionApiVentasAsString(lVersion: PAnsiChar); stdcall;
  function ChecaCompatibilidadVentas(HdbMetadatos: Integer): Integer; stdcall;  

  // Pedidos
  procedure SetReglasPedidos(AComprometerUnidades, APedidosParciales, APartidasParciales: integer);
  function NuevoPedido(Fecha, Folio: PAnsiChar; ClienteId, DirConsigId, AlmacenId: Integer;
    FechaEntrega, TipoDscto: PAnsiChar; Descuento: Double; OrdenCompra, Descripcion: PAnsiChar;
    VendedorId, ImptoSustituidoId, ImptoSustitutoId: Integer; MonedaId: Integer): Integer; stdcall;
  function RenglonPedido(ArticuloId: Integer; Unidades, PrecioUnitario,
    PctjeDscto: Double; Notas: PAnsiChar): Integer; stdcall;
  function RenglonPedidoDesctos(ArticuloId: Integer; Unidades, PrecioUnitario,
    PctjeDsctoCli, PctjeDsctoVol, PctjeDsctoPromo: Double; Notas: PAnsiChar): Integer; stdcall;
  function AplicaPedido: Integer; stdcall;

  // Facturas
  procedure SetReglasVentas(ExistenciasNegativas, PrecioMinimo: Integer); stdcall;
  function NuevaFactura(Fecha, Folio: PAnsiChar;
                        ClienteId, DirConsigId, AlmacenId: Integer;
                        TipoDscto: PAnsiChar; Descuento: Double;
                        OrdenCompra, Descripcion: PAnsiChar;
                        Fletes, OtrosCargos, PctjeComis : Double ;
                        CondPagoId, VendedorId,  ImptoSustituidoId, ImptoSustitutoId: Integer;
                        ImporteCobro: Double ; DescripcionCobro: PAnsiChar; PLHandle: Integer): Integer; stdcall;
  function DirClienteFactura(DirCliId: Integer): Integer; stdcall;
  function SetFormaCobroFactura(FormaCobroId: Integer): Integer; stdcall;
  function RenglonFactura(ArticuloId: Integer; Unidades, PrecioUnitario,
                          PctjeDscto: Double; Notas: PAnsiChar): Integer; stdcall;
  function RenglonFacturaSeries(ClaveSerie: PAnsiChar): Integer; stdcall;
  function RenglonFacturaLotes(ClaveLote: PAnsiChar; Unidades: Double): Integer; stdcall;
  function RenglonFacturaTercero(TerceroId: Integer): Integer; stdcall;
  function AplicaFactura: Integer; stdcall;

const
  ApiMsp  = 'ApiMicrosip.dll';

implementation
  // Chequeo de errores
  function veGetLastErrorCode; external ApiMsp;
  function veGetLastErrorMessage; external ApiMsp;
  procedure veSetErrorHandling; external ApiMsp;

  function SetDBVentas; external ApiMsp;
  procedure AbortaDoctoVentas; external ApiMsp;  
  function GetDoctoVeId; external ApiMsp;

  // Checar Compatibilidad
  function GetVersionApiVentasAsInteger; external ApiMsp;
  procedure GetVersionApiVentasAsString; external ApiMsp;
  function ChecaCompatibilidadVentas; external ApiMsp;

  // Pedidos
  procedure SetReglasPedidos; external ApiMsp;
  function NuevoPedido; external ApiMsp;
  function RenglonPedido; external ApiMsp;
  function RenglonPedidoDesctos; external ApiMsp;
  function AplicaPedido; external ApiMsp;

  // Facturacion
  procedure SetReglasVentas; external ApiMsp;
  function NuevaFactura; external ApiMsp;
  function DirClienteFactura; external ApiMsp;
  function SetFormaCobroFactura; external ApiMsp;
  function RenglonFactura; external ApiMsp;
  function RenglonFacturaSeries; external ApiMsp;
  function RenglonFacturaLotes; external ApiMsp;
  function RenglonFacturaTercero; external ApiMsp;
  function AplicaFactura; external ApiMsp;
  
end.

