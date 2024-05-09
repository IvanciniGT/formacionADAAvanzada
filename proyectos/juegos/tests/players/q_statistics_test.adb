
with Q_STATISTICS; use Q_STATISTICS;
with Ada.Text_IO; use Ada.Text_IO;

-- Esto son a la vez pruebas UNITARIAS y de SISTEMA
-- Por un motivo... y es que este SISTEMA no depende de nadie
package body Q_STATISTICS.TEST is

  procedure TEST_NUEVAS_ESTADISTICAS_CON_DATOS is
    V_WINS: T_STATISTICS_COUNT;
    V_LOSSES: T_STATISTICS_COUNT;
    V_TIES: T_STATISTICS_COUNT;
    V_RESULTADO: T_STATISTICS;
  begin

    -- GIVEN: Dado que tengo unos datos de estadisticas:
    V_WINS:= 17;
    V_LOSSES:= 33;
    V_TIES:= 14;

    -- WHEN: Invoco a la función F_CREATE_EXISTING_STATISTICS con esos datos
    V_RESULTADO:= F_CREATE_EXISTING_STATISTICS(V_WINS, V_LOSSES, V_TIES);

    -- THEN La función me un T_STATISTICS con los datos (que tenía) asignados:
    if V_WINS = V_RESULTADO.R_WINS then
      Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - OK");
    else
      Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - NOK");
    end if;
    --Assert(V_WINS = V_RESULTADO.R_WINS, "No se asigna bien el número de victorias");
    if V_LOSSES = V_RESULTADO.R_LOSSES then
      Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - OK");
    else
      Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - NOK");
    end if;
    if V_TIES = V_RESULTADO.R_TIES then
      Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - OK");
    else
      Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - NOK");
    end if;
  end TEST_NUEVAS_ESTADISTICAS_CON_DATOS;

  procedure TEST_NUEVAS_ESTADISTICAS_PERO_NUEVAS is
    V_WINS: T_STATISTICS_COUNT;
    V_LOSSES: T_STATISTICS_COUNT;
    V_TIES: T_STATISTICS_COUNT;
    V_RESULTADO: T_STATISTICS;
  begin

    -- GIVEN: Dado que tengo unos datos de estadisticas:
    V_WINS:= 0;
    V_LOSSES:= 0;
    V_TIES:= 0;

    -- WHEN: Invoco a la función F_CREATE_NEW_STATISTICS
    V_RESULTADO:= F_CREATE_NEW_STATISTICS;

    -- THEN La función me un T_STATISTICS con los datos (que tenía) asignados:
    if V_WINS = V_RESULTADO.R_WINS then
      Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - OK");
    else
      Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - NOK");
    end if;
    --Assert(V_WINS = V_RESULTADO.R_WINS, "No se asigna bien el número de victorias");
    if V_LOSSES = V_RESULTADO.R_LOSSES then
      Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - OK");
    else
      Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - NOK");
    end if;
    if V_TIES = V_RESULTADO.R_TIES then
      Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - OK");
    else
      Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - NOK");
    end if;
  end TEST_NUEVAS_ESTADISTICAS_CON_DATOS;

  procedure TEST_GET_WINS is
    V_WINS: T_STATISTICS_COUNT;
    V_LOSSES: T_STATISTICS_COUNT;
    V_TIES: T_STATISTICS_COUNT;
    V_OBJETO: T_STATISTICS;
    V_RESULTADO: T_STATISTICS_COUNT;
  begin

    -- GIVEN: Dado que tengo unos datos de estadisticas y un objeto T_STATISTICS:
    V_WINS:= 17;
    V_LOSSES:= 33;
    V_TIES:= 14;
    V_OBJETO:= F_CREATE_EXISTING_STATISTICS(V_WINS, V_LOSSES, V_TIES);

    -- WHEN: Invoco a la función F_CREATE_EXISTING_STATISTICS con esos datos
    V_RESULTADO := F_GET_WINS(V_RESULTADO);

    -- THEN La función me un T_STATISTICS con los datos (que tenía) asignados:
    if V_WINS = V_RESULTADO then
      Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - OK");
    else
      Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - NOK");
    end if;

  end TEST_NUEVAS_ESTADISTICAS_CON_DATOS;

  procedure TEST_GET_LOOSES is
    V_WINS: T_STATISTICS_COUNT;
    V_LOSSES: T_STATISTICS_COUNT;
    V_TIES: T_STATISTICS_COUNT;
    V_OBJETO: T_STATISTICS;
    V_RESULTADO: T_STATISTICS_COUNT;
  begin

    -- GIVEN: Dado que tengo unos datos de estadisticas y un objeto T_STATISTICS:
    V_WINS:= 17;
    V_LOSSES:= 33;
    V_TIES:= 14;
    V_OBJETO:= F_CREATE_EXISTING_STATISTICS(V_WINS, V_LOSSES, V_TIES);

    -- WHEN: Invoco a la función F_CREATE_EXISTING_STATISTICS con esos datos
    V_RESULTADO := F_GET_LOSSES(V_RESULTADO);

    -- THEN La función me un T_STATISTICS con los datos (que tenía) asignados:
    if V_LOSSES = V_RESULTADO then
      Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - OK");
    else
      Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - NOK");
    end if;

  end TEST_NUEVAS_ESTADISTICAS_CON_DATOS;

  procedure TEST_GET_TIES is
    V_WINS: T_STATISTICS_COUNT;
    V_LOSSES: T_STATISTICS_COUNT;
    V_TIES: T_STATISTICS_COUNT;
    V_OBJETO: T_STATISTICS;
    V_RESULTADO: T_STATISTICS_COUNT;
  begin

    -- GIVEN: Dado que tengo unos datos de estadisticas y un objeto T_STATISTICS:
    V_WINS:= 17;
    V_LOSSES:= 33;
    V_TIES:= 14;
    V_OBJETO:= F_CREATE_EXISTING_STATISTICS(V_WINS, V_LOSSES, V_TIES);

    -- WHEN: Invoco a la función F_CREATE_EXISTING_STATISTICS con esos datos
    V_RESULTADO := F_GET_TIES(V_RESULTADO);

    -- THEN La función me un T_STATISTICS con los datos (que tenía) asignados:
    if V_TIES = V_RESULTADO then
      Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - OK");
    else
      Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - NOK");
    end if;

  end TEST_NUEVAS_ESTADISTICAS_CON_DATOS;

  procedure TEST_GET_PLAYED_GAMES is
    V_WINS: T_STATISTICS_COUNT;
    V_LOSSES: T_STATISTICS_COUNT;
    V_TIES: T_STATISTICS_COUNT;
    V_OBJETO: T_STATISTICS;
    V_RESULTADO: T_STATISTICS_COUNT;
  begin
  
    -- GIVEN: Dado que tengo unos datos de estadisticas y un objeto T_STATISTICS:
    V_WINS:= 17;
    V_LOSSES:= 33;
    V_TIES:= 14;
    V_OBJETO:= F_CREATE_EXISTING_STATISTICS(V_WINS, V_LOSSES, V_TIES);

    -- WHEN: Invoco a la función F_CREATE_EXISTING_STATISTICS con esos datos
    V_RESULTADO := F_GET_PLAYED_GAMES(V_RESULTADO);

    -- THEN La función me un T_STATISTICS con los datos (que tenía) asignados:
    if V_TIES+V_LOSSES+V_WINS = V_RESULTADO then
      Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - OK");
    else
      Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - NOK");
    end if;

  end TEST_NUEVAS_ESTADISTICAS_CON_DATOS;

  procedure TEST_INCREMENT_WINS is
    V_WINS: T_STATISTICS_COUNT;
    V_LOSSES: T_STATISTICS_COUNT;
    V_TIES: T_STATISTICS_COUNT;
    V_OBJETO: T_STATISTICS;
    V_RESULTADO: T_STATISTICS;
    V_SE_INCREMENTO: BOOLEAN;
  begin
  
      -- GIVEN: Dado que tengo unos datos de estadisticas y un objeto T_STATISTICS:
      V_WINS:= 17;
      V_LOSSES:= 33;
      V_TIES:= 14;
      V_OBJETO:= F_CREATE_EXISTING_STATISTICS(V_WINS, V_LOSSES, V_TIES);
  
      -- WHEN: Invoco a la función F_CREATE_EXISTING_STATISTICS con esos datos
      F_INCREMENT_WINS(V_OBJETO, V_SE_INCREMENTO);
  
      -- THEN La función me un T_STATISTICS con los datos (que tenía) asignados:
      if V_WINS+1 = V_OBJETO.R_WINS then
        Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - OK");
      else
        Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - NOK");
      end if;
      if V_SE_INCREMENTO then
        Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - OK");
      else
        Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - NOK");
      end if;
  
    end TEST_NUEVAS_ESTADISTICAS_CON_DATOS;

  procedure TEST_INCREMENT_WINS_MAXIMO is
    V_WINS: T_STATISTICS_COUNT;
    V_LOSSES: T_STATISTICS_COUNT;
    V_TIES: T_STATISTICS_COUNT;
    V_OBJETO: T_STATISTICS;
    V_RESULTADO: T_STATISTICS;
    V_SE_INCREMENTO: BOOLEAN;
  begin
  
      -- GIVEN: Dado que tengo unos datos de estadisticas y un objeto T_STATISTICS:
      V_WINS:= 255;
      V_LOSSES:= 33;
      V_TIES:= 14;
      V_OBJETO:= F_CREATE_EXISTING_STATISTICS(V_WINS, V_LOSSES, V_TIES);
  
      -- WHEN: Invoco a la función F_CREATE_EXISTING_STATISTICS con esos datos
      F_INCREMENT_WINS(V_OBJETO, V_SE_INCREMENTO);
  
      -- THEN La función me un T_STATISTICS con los datos (que tenía) asignados:
      if V_WINS = V_OBJETO.R_WINS then
        Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - OK");
      else
        Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - NOK");
      end if;
      if not V_SE_INCREMENTO then
        Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - OK");
      else
        Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - NOK");
      end if;
  
    end TEST_NUEVAS_ESTADISTICAS_CON_DATOS;

  procedure TEST_INCREMENT_LOSSES is
    V_WINS: T_STATISTICS_COUNT;
    V_LOSSES: T_STATISTICS_COUNT;
    V_TIES: T_STATISTICS_COUNT;
    V_OBJETO: T_STATISTICS;
    V_RESULTADO: T_STATISTICS;
    V_SE_INCREMENTO: BOOLEAN;
  begin
  
      -- GIVEN: Dado que tengo unos datos de estadisticas y un objeto T_STATISTICS:
      V_WINS:= 17;
      V_LOSSES:= 33;
      V_TIES:= 14;
      V_OBJETO:= F_CREATE_EXISTING_STATISTICS(V_WINS, V_LOSSES, V_TIES);
  
      -- WHEN: Invoco a la función F_CREATE_EXISTING_STATISTICS con esos datos
      F_INCREMENT_LOSSES(V_OBJETO, V_SE_INCREMENTO);
  
      -- THEN La función me un T_STATISTICS con los datos (que tenía) asignados:
      if V_LOSSES+1 = V_OBJETO.R_LOSSES then
        Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - OK");
      else
        Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - NOK");
      end if;
      if V_SE_INCREMENTO then
        Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - OK");
      else
        Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - NOK");
      end if;
  
    end TEST_NUEVAS_ESTADISTICAS_CON_DATOS;

  procedure TEST_INCREMENT_LOSSES_MAXIMO is
    V_WINS: T_STATISTICS_COUNT;
    V_LOSSES: T_STATISTICS_COUNT;
    V_TIES: T_STATISTICS_COUNT;
    V_OBJETO: T_STATISTICS;
    V_RESULTADO: T_STATISTICS;
    V_SE_INCREMENTO: BOOLEAN;
  begin
  
      -- GIVEN: Dado que tengo unos datos de estadisticas y un objeto T_STATISTICS:
      V_WINS:= 17;
      V_LOSSES:= 255;
      V_TIES:= 14;
      V_OBJETO:= F_CREATE_EXISTING_STATISTICS(V_WINS, V_LOSSES, V_TIES);
  
      -- WHEN: Invoco a la función F_CREATE_EXISTING_STATISTICS con esos datos
      F_INCREMENT_LOSSES(V_OBJETO, V_SE_INCREMENTO);
  
      -- THEN La función me un T_STATISTICS con los datos (que tenía) asignados:
      if V_LOSSES = V_OBJETO.R_LOSSES then
        Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - OK");
      else
        Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - NOK");
      end if;
      if not V_SE_INCREMENTO then
        Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - OK");
      else
        Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - NOK");
      end if;
  
    end TEST_NUEVAS_ESTADISTICAS_CON_DATOS;

  procedure TEST_INCREMENT_TIES is
    V_WINS: T_STATISTICS_COUNT;
    V_LOSSES: T_STATISTICS_COUNT;
    V_TIES: T_STATISTICS_COUNT;
    V_OBJETO: T_STATISTICS;
    V_RESULTADO: T_STATISTICS;
    V_SE_INCREMENTO: BOOLEAN;
  begin
  
      -- GIVEN: Dado que tengo unos datos de estadisticas y un objeto T_STATISTICS:
      V_WINS:= 17;
      V_LOSSES:= 33;
      V_TIES:= 14;
      V_OBJETO:= F_CREATE_EXISTING_STATISTICS(V_WINS, V_LOSSES, V_TIES);
  
      -- WHEN: Invoco a la función F_CREATE_EXISTING_STATISTICS con esos datos
      F_INCREMENT_TIES(V_OBJETO, V_SE_INCREMENTO);
  
      -- THEN La función me un T_STATISTICS con los datos (que tenía) asignados:
      if V_TIES+1 = V_OBJETO.R_TIES then
        Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - OK");
      else
        Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - NOK");
      end if;
      if V_SE_INCREMENTO then
        Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - OK");
      else
        Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - NOK");
      end if;
  
    end TEST_NUEVAS_ESTADISTICAS_CON_DATOS;
  
  procedure TEST_INCREMENT_TIES_MAXIMO is
    V_WINS: T_STATISTICS_COUNT;
    V_LOSSES: T_STATISTICS_COUNT;
    V_TIES: T_STATISTICS_COUNT;
    V_OBJETO: T_STATISTICS;
    V_RESULTADO: T_STATISTICS;
    V_SE_INCREMENTO: BOOLEAN;
  begin
  
      -- GIVEN: Dado que tengo unos datos de estadisticas y un objeto T_STATISTICS:
      V_WINS:= 17;
      V_LOSSES:= 33;
      V_TIES:= 255;
      V_OBJETO:= F_CREATE_EXISTING_STATISTICS(V_WINS, V_LOSSES, V_TIES);
  
      -- WHEN: Invoco a la función F_CREATE_EXISTING_STATISTICS con esos datos
      F_INCREMENT_TIES(V_OBJETO, V_SE_INCREMENTO);
  
      -- THEN La función me un T_STATISTICS con los datos (que tenía) asignados:
      if V_TIES = V_OBJETO.R_TIES then
        Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - OK");
      else
        Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - NOK");
      end if;
      if not V_SE_INCREMENTO then
        Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - OK");
      else
        Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - NOK");
      end if;
  
    end TEST_NUEVAS_ESTADISTICAS_CON_DATOS;

end Q_STATISTICS_TEST;
