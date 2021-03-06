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
program RXEDumper;

{$IFNDEF FPC}
{$R 'RXEDumpImages.res' 'RXEDumpImages.rc'}
{$ENDIF}

uses
{$IFNDEF FPC}
  XPMan,
  FastMM4,
  FastMove,
{$ELSE}
  Interfaces,
{$ENDIF}
  Forms,
  uRxeDump in 'uRxeDump.pas' {frmNXTDumper},
  uAbout in 'uAbout.pas' {frmAboutRXE},
  uNXTClasses in 'uNXTClasses.pas';

{$IFNDEF FPC}
{$R *.res}
{$ENDIF}

begin
  Application.Initialize;
  Application.Title := 'NXT Program Dumper';
  Application.CreateForm(TfrmNXTDumper, frmNXTDumper);
  Application.Run;
end.
