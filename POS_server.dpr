program POS_server;

uses
  Forms,
  u_inventory in 'u_inventory.pas' {F_Inventory},
  u_dm in 'u_dm.pas' {dm: TDataModule},
  U_fungsi in 'U_fungsi.pas',
  U_toko in 'U_toko.pas' {F_toko},
  U_Login in 'U_Login.pas' {F_Login},
  u_setor in 'u_setor.pas' {F_Setor},
  u_utama in 'u_utama.pas' {F_Utama},
  u_SO in 'u_SO.pas' {F_SO},
  u_cari in 'u_cari.pas' {f_cari},
  u_kirim_data in 'u_kirim_data.pas' {F_kirim_data},
  u_lap in 'u_lap.pas' {f_lap},
  u_planogram in 'u_planogram.pas' {f_planogram},
  u_RO in 'u_RO.pas' {f_RO},
  u_list_receipt in 'u_list_receipt.pas' {f_list_receipt},
  u_list_return in 'u_list_return.pas' {f_list_return},
  u_return in 'u_return.pas' {f_return},
  u_list_purchase in 'u_list_purchase.pas' {f_List_purchase},
  u_purchase in 'u_purchase.pas' {f_purchase},
  u_hari in 'u_hari.pas' {f_hari},
  u_list_SO in 'u_list_SO.pas' {f_list_SO},
  u_barcode in 'u_barcode.pas' {f_Barcode},
  u_list_so_plan in 'u_list_so_plan.pas' {f_list_so_plan},
  u_stok_opname in 'u_stok_opname.pas' {f_stok_opname};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'POS Server';
  Application.CreateForm(Tdm, dm);
  tf_login.Execute;
  if pilihan=1 then
  Application.CreateForm(TF_utama, F_utama) else
  if pilihan=2 then
  Application.CreateForm(Tf_so, f_so) else
  if pilihan=0 then
  application.Terminate;   
  Application.Run;
end.
