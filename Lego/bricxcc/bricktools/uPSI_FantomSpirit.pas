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
 * Portions created by John Hansen are Copyright (C) 2009 John Hansen.
 * All Rights Reserved.
 *
 *)
unit uPSI_FantomSpirit;
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
  TPSImport_FantomSpirit = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;


{ compile-time registration functions }
procedure SIRegister_TFantomSpirit(CL: TPSPascalCompiler);
procedure SIRegister_FantomSpirit(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TFantomSpirit(CL: TPSRuntimeClassImporter);
procedure RIRegister_FantomSpirit(CL: TPSRuntimeClassImporter);

procedure Register;

implementation

uses
  FantomSpirit;

procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_FantomSpirit]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TFantomSpirit(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TBrickComm', 'TFantomSpirit') do
  with CL.AddClassN(CL.FindClass('TBRICKCOMM'),'TFANTOMSPIRIT') do
  begin
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_FantomSpirit(CL: TPSPascalCompiler);
begin
  SIRegister_TFantomSpirit(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure RIRegister_TFantomSpirit(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TFantomSpirit) do
  begin
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_FantomSpirit(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TFantomSpirit(CL);
end;

 
 
{ TPSImport_FantomSpirit }
(*----------------------------------------------------------------------------*)
procedure TPSImport_FantomSpirit.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_FantomSpirit(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_FantomSpirit.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_FantomSpirit(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.
