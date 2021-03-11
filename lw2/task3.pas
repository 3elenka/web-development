PROGRAM HelloDear(INPUT, OUTPUT);

USES
  DOS;

VAR
  Name: STRING;
  StartPosition, EndPosition, LineLength: INTEGER;

BEGIN {HelloDear}
  WRITELN('Content-Type: text/plain');
  WRITELN;
  Name := GetEnv('QUERY_STRING');
  StartPosition := POS('=', Name);
  EndPosition := POS('&', Name);
  LineLength := LENGTH(Name);
  IF StartPosition = 0
  THEN
    Name := ''
  ELSE
    IF EndPosition = 0
    THEN
      Name := COPY(Name, StartPosition + 1, LineLength)
    ELSE
      Name := COPY(Name, StartPosition + 1, EndPosition - StartPosition - 1);
  IF Name = ''
  THEN
    WRITELN('Hello Anonimous!')
  ELSE
    WRITELN('Hello dear, ', Name, '!')
END. {HelloDear}