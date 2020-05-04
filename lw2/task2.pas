PROGRAM SarahRevere(INPUT, OUTPUT);

USES
  DOS;

VAR
  QueryString: STRING;

BEGIN {SarahRevere}
  WRITELN('Content-Type: text/plain');
  WRITELN;
  BEGIN {инициализация QueryString}
    QueryString := GetEnv('QUERY_STRING');
  END;{инициализация QueryString}
  BEGIN {создание сообщения Sarah}
    IF QueryString = 'lanterns=1'
    THEN
      WRITELN('The British are coming by land.')
    ELSE
      IF QueryString = 'lanterns=2'
      THEN
        WRITELN('The British are coming by sea.')
      ELSE
        WRITELN('Sarah didn''t say')
  END{создание сообщения Sarah}
END. {SarahRevere}
