program pos_server;

uses
  Vcl.Forms,
  u_barcode in '..\src\u_barcode.pas' {f_Barcode},
  u_cari in '..\src\u_cari.pas' {f_cari},
  u_dm in '..\src\u_dm.pas' {dm: TDataModule},
  u_hari in '..\src\u_hari.pas' {f_hari},
  u_inventory in '..\src\u_inventory.pas' {F_Inventory},
  u_kirim_data in '..\src\u_kirim_data.pas' {F_kirim_data},
  u_lap in '..\src\u_lap.pas' {f_lap},
  u_list_purchase in '..\src\u_list_purchase.pas' {f_List_purchase},
  u_list_receipt in '..\src\u_list_receipt.pas' {f_list_receipt},
  u_list_return in '..\src\u_list_return.pas' {f_list_return},
  u_list_SO in '..\src\u_list_SO.pas' {f_list_SO},
  u_list_so_plan in '..\src\u_list_so_plan.pas' {f_list_so_plan},
  U_Login in '..\src\U_Login.pas' {F_Login},
  u_planogram in '..\src\u_planogram.pas' {f_planogram},
  u_purchase in '..\src\u_purchase.pas' {f_purchase},
  u_return in '..\src\u_return.pas' {f_return},
  u_RO in '..\src\u_RO.pas' {f_RO},
  u_setor in '..\src\u_setor.pas' {F_Setor},
  u_stok_opname in '..\src\u_stok_opname.pas' {f_stok_opname},
  U_toko in '..\src\U_toko.pas' {F_toko},
  u_utama in '..\src\u_utama.pas' {F_Utama},
  UFungsi in '..\..\tools\pascal\UFungsi.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TF_Utama, F_Utama);
  Application.Run;
end.
