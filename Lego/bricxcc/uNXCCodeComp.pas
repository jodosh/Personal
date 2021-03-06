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
unit uNXCCodeComp;

interface

uses
  Classes;

function NXCCodeCompIndex(aName : string) : Integer;
procedure AddNXCCodeCompParams(aStrings : TStrings; Index : integer);
procedure SaveNXCCodeCompToFile(const aname : string);
procedure LoadNXCCodeCompFromFile(const aname : string);

implementation

uses
  SysUtils, uCppCode;

type
  TNXCCodeComp = record
    Name : string;
    Params : string;
  end;

var
  NXCCodeCompDataSize : integer = 0;
  NXCCodeCompData : array of TNXCCodeComp;

function NXCCodeCompIndex(aName : string) : Integer;
var
  i : Integer;
begin
  Result := -1;
  for i := 0 to NXCCodeCompDataSize - 1 do begin
    if NXCCodeCompData[i].Name = aName then begin
      Result := i;
      Exit;
    end;
  end;
end;

procedure AddNXCCodeCompParams(aStrings : TStrings; Index : integer);
begin
  if (Index < 0) or (Index >= NXCCodeCompDataSize) then Exit;
  AddCodeCompParamsHelper(aStrings, NXCCodeCompData[Index].Params, 'void', ',');
end;

procedure SaveNXCCodeCompToFile(const aname : string);
var
  i : Integer;
  SL : TStringList;
  cc : TNXCCodeComp;
begin
  SL := TStringList.Create;
  try
    for i := 0 to NXCCodeCompDataSize-1 do begin
      cc := NXCCodeCompData[i];
      SL.Add(cc.Name + cc.Params);
    end;
    SL.SaveToFile(aname);
  finally
    SL.Free;
  end;
end;

procedure LoadNXCCodeCompFromFile(const aname : string);
var
  SL : TStringList;
  i, p : integer;
  tmp, funcParams : string;
  cc : TNXCCodeComp;
begin
  NXCCodeCompDataSize := 0;
  SetLength(NXCCodeCompData, 0);
  if FileExists(aname) then
  begin
    SL := TStringList.Create;
    try
      SL.LoadFromFile(aname);
      NXCCodeCompDataSize := SL.Count;
      SetLength(NXCCodeCompData, NXCCodeCompDataSize);
      for i := 0 to SL.Count - 1 do
      begin
        tmp := SL[i];
        p := Pos('(', tmp);
        funcParams := Copy(tmp, p, MaxInt);
        System.Delete(tmp, p, MaxInt);
        cc.Name   := tmp;
        cc.Params := funcParams;
        NXCCodeCompData[i] := cc;
      end;
    finally
      SL.Free;
    end;
  end;
end;

end.
