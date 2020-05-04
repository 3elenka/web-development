PROGRAM HelloDear(INPUT, OUTPUT);

USES
  DOS;

VAR
  Name: STRING;
  StartPosition, EndPosition, LineLength: INTEGER;

BEGIN {HelloDear}
  WRITELN('Content-Type: text/plain');
  WRITELN;
  BEGIN {инициализация переменных}
    Name := GetEnv('QUERY_STRING');
    StartPosition := POS('=', Name);
    EndPosition := POS('&', Name);
    LineLength := LENGTH(Name);
  END; {инициализация переменных}
  BEGIN {получение Name}
    IF StartPosition = 0
    THEN
      Name := ''
    ELSE
      IF EndPosition = 0
      THEN
        Name := COPY(Name, StartPosition + 1, LineLength)
      ELSE
        Name := COPY(Name, StartPosition + 1, EndPosition - StartPosition - 1)
  END; {получение Name}
  BEGIN {создание приветствия}
    IF Name = ''
    THEN
      WRITELN('Hello Anonimous!')
    ELSE
      WRITELN('Hello dear, ', Name, '!')
  END {создание приветствия}
END. {HelloDear}
