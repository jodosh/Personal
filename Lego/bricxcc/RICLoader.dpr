(*
 * The contents of this file are subject to the Mozilla Public License
 * Version 1.1 (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS"
 * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
 * License for the specific language governing rights and limitations
 * under the License.
 *
 * The Initial Developer of this code is John Hansen.
 * Portions created by John Hansen are Copyright (C) 2009 John Hansen.
 * All Rights Reserved.
 *
 *)
program RICLoader;

uses
  Forms,
  XPMan,
  uRICLoader in 'uRICLoader.pas' {frmRICLoader},
  uRICView in 'uRICView.pas' {frmRICView},
  uRIC in 'nxt\uRIC.pas',
  uRICComp in 'nxt\uRICComp.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'RIC Loader';
  Application.CreateForm(TfrmRICLoader, frmRICLoader);
  Application.CreateForm(TfrmRICView, frmRICView);
  Application.Run;
end.
