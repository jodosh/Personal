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
unit uPSI_FakeSpirit;
{
This file has been generated by UnitParser v0.7, written by M. Knight
and updated by NP. v/d Spek and George Birbilis. 
Source Code from Carlo Kok has been used to implement various sections of
UnitParser. Components of ROPS are used in the construction of UnitParser,
code implementing the class wrapper is taken from Carlo Kok's conv utility

}
interface
 
uses
   SysUtils
  ,Classes
  ,uPSComponent
  ,uPSRuntime
  ,uPSCompiler
  ;
 
type 
(*----------------------------------------------------------------------------*)
  TPSImport_FakeSpirit = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TFakeSpirit(CL: TPSPascalCompiler);
procedure SIRegister_EMessageInvalid(CL: TPSPascalCompiler);
procedure SIRegister_FakeSpirit(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TFakeSpirit(CL: TPSRuntimeClassImporter);
procedure RIRegister_EMessageInvalid(CL: TPSRuntimeClassImporter);
procedure RIRegister_FakeSpirit(CL: TPSRuntimeClassImporter);

procedure Register;

implementation

uses
  FakeSpirit;
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_FakeSpirit]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TFakeSpirit(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TBrickComm', 'TFakeSpirit') do
  with CL.AddClassN(CL.FindClass('TBrickComm'),'TFakeSpirit') do
  begin
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_EMessageInvalid(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'Exception', 'EMessageInvalid') do
  with CL.AddClassN(CL.FindClass('Exception'),'EMessageInvalid') do
  begin
    RegisterMethod('Constructor Create( aMsg : string)');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_FakeSpirit(CL: TPSPascalCompiler);
begin
  SIRegister_EMessageInvalid(CL);
  SIRegister_TFakeSpirit(CL);
 CL.AddDelphiFunction('Function GetRCXErrorString( iErrCode : Integer) : string');
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure RIRegister_TFakeSpirit(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TFakeSpirit) do
  begin
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_EMessageInvalid(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(EMessageInvalid) do
  begin
    RegisterConstructor(@EMessageInvalid.Create, 'Create');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_FakeSpirit(CL: TPSRuntimeClassImporter);
begin
  RIRegister_EMessageInvalid(CL);
  RIRegister_TFakeSpirit(CL);
end;

 
 
{ TPSImport_FakeSpirit }
(*----------------------------------------------------------------------------*)
procedure TPSImport_FakeSpirit.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_FakeSpirit(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_FakeSpirit.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_FakeSpirit(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.