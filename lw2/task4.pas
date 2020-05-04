PROGRAM WorkWithValue(INPUT, OUTPUT);

USES
  DOS;

VAR
  Value, SearchKey: STRING;
  Flag, StartPosition, EndPosition, LineLength: INTEGER;

FUNCTION GetValueParameter(Key: STRING): STRING;

BEGIN
  BEGIN {инициализация переменных}
    Value := GetEnv('QUERY_STRING');
    SearchKey := Key + '=';
    Flag := POS(SearchKey, Value);
    LineLength := LENGTH(Value);
    Value := COPY(Value, Flag, LineLength);
    StartPosition := POS('=', Value);
    EndPosition := POS('&', Value);
    LineLength := LENGTH(Value);
  END; {инициализация переменных}
  BEGIN {получение Value}
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
          Value := COPY(Value, StartPosition + 1, EndPosition - StartPosition - 1)
  END; {получение Value}
  GetValueParameter := Value
END;

BEGIN {WorkWithValue}
  WRITELN('Content-Type: text/plain');
  WRITELN;
  WRITELN('First Name: ', GetValueParameter('first_name'));
  WRITELN('Last Name: ', GetValueParameter('last_name'));
  WRITELN('Age: ', GetValueParameter('age'));
  READLN
END. {WorkWithValue}
