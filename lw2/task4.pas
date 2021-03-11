PROGRAM QueryStringParameter(INPUT, OUTPUT);

USES
  DOS;

VAR
  Value, SearchKey: STRING;
  Flag, StartPosition, EndPosition, LineLength: INTEGER;

FUNCTION GetQueryStringParameter(Key: STRING): STRING;

BEGIN {GetQueryStringParameter}
  Value := GetEnv('QUERY_STRING');
  SearchKey := Key + '=';
  Flag := POS(SearchKey, Value);
  LineLength := LENGTH(Value);
  Value := COPY(Value, Flag, LineLength);
  StartPosition := POS('=', Value);
  EndPosition := POS('&', Value);
  LineLength := LENGTH(Value);
  IF Flag = 0
  THEN
    Value := ''
  ELSE
    IF StartPosition = 0
    THEN
      Value := ''
    ELSE
      IF EndPosition = 0
      THEN
        Value := COPY(Value, StartPosition + 1, LineLength)
      ELSE
        Value := COPY(Value, StartPosition + 1, EndPosition - StartPosition - 1);
  GetQueryStringParameter := Value
END; {GetQueryStringParameter}

BEGIN {QueryStringParameter}
  WRITELN('Content-Type: text/plain');
  WRITELN;
  WRITELN('First Name: ', GetQueryStringParameter('first_name'));
  WRITELN('Last Name: ', GetQueryStringParameter('last_name'));
  WRITELN('Age: ', GetQueryStringParameter('age'));
  READLN
END. {QueryStringParameter}