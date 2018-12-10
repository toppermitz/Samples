procedure TCPUInfo.GetModel;
var
  Cmd : String;
begin
  try
    Cmd := 'cat /proc/cpuinfo | grep -i "^model name" | awk -F": " ''{print $2}'' | head -1 | sed ''s/ \+/ /g''';
    TLinuxUtils.RunCommand(Cmd,StrReturn);
  except
    on E:Exception do
    begin
    {$IFDEF DEBUG}
      TLinuxUtils.LogError('TCPUInfo.GetModel - ' + E.Message);
    {$ENDIF}
    end;
  end;
end;
