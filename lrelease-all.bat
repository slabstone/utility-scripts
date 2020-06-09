for %i in (*.ts) do lrelease -compress -removeidentical -silent %~ni.ts -qm %~ni.qm
