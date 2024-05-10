with AUnit;
with AUnit.Test_Cases;          
with AUnit.Assertions;

with Q_STATISTICS; use Q_STATISTICS;

-- Esto son a la vez pruebas UNITARIAS y de SISTEMA
-- Por un motivo... y es que este SISTEMA no depende de nadie
package body Q_STATISTICS.TEST_CASE is


    procedure Register_Tests(V_Test: in out Q_STATISTICS_TEST) is
    begin
        AUnit.Test_Cases.Registration.Register_Routine(V_Test, TEST_NUEVAS_ESTADISTICAS_CON_DATOS'Access, "Crear nuevas estadísticas con datos");
        AUnit.Test_Cases.Registration.Register_Routine(V_Test, TEST_NUEVAS_ESTADISTICAS_PERO_NUEVAS'Access, "Crear nuevas estadísticas sin datos");
        AUnit.Test_Cases.Registration.Register_Routine(V_Test, TEST_GET_WINS'Access, "Obtener número de victorias");
        AUnit.Test_Cases.Registration.Register_Routine(V_Test, TEST_GET_LOOSES'Access, "Obtener número de derrotas");
        AUnit.Test_Cases.Registration.Register_Routine(V_Test, TEST_GET_TIES'Access, "Obtener número de empates");
        AUnit.Test_Cases.Registration.Register_Routine(V_Test, TEST_GET_PLAYED_GAMES'Access, "Obtener número de partidas jugadas");
        AUnit.Test_Cases.Registration.Register_Routine(V_Test, TEST_INCREMENT_WINS'Access, "Incrementar número de victorias");
        AUnit.Test_Cases.Registration.Register_Routine(V_Test, TEST_INCREMENT_WINS_MAXIMO'Access, "Incrementar número de victorias al máximo");
        AUnit.Test_Cases.Registration.Register_Routine(V_Test, TEST_INCREMENT_LOSSES'Access, "Incrementar número de derrotas");
        AUnit.Test_Cases.Registration.Register_Routine(V_Test, TEST_INCREMENT_LOSSES_MAXIMO'Access, "Incrementar número de derrotas al máximo");
        AUnit.Test_Cases.Registration.Register_Routine(V_Test, TEST_INCREMENT_TIES'Access, "Incrementar número de empates");
        AUnit.Test_Cases.Registration.Register_Routine(V_Test, TEST_INCREMENT_TIES_MAXIMO'Access, "Incrementar número de empates al máximo");
    end Register_Tests;

    function Name(V_Test_Case: Q_STATISTICS_TEST) return AUnit.Test_String is
    begin
        return AUnit.Format("Estadísticas de jugador");
    end Name;

    procedure Set_Up_Case(Test: in out Q_STATISTICS_TEST) is
    begin
      null;
    end Set_Up_Case;

    procedure Tear_Down_Case(Test: in out Q_STATISTICS_TEST) is
    begin
      null;
    end Tear_Down_Case;

    procedure Set_Up(Test: in out Q_STATISTICS_TEST) is
    begin
      null;
    end Set_Up;

    procedure Tear_Down(Test: in out Q_STATISTICS_TEST)  is
    begin
      null;
    end Tear_Down;

  procedure TEST_NUEVAS_ESTADISTICAS_CON_DATOS(Test: in out AUnit.Test_Cases.Test_Case'Class) is
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
    AUnit.Assertions.Assert(V_WINS = V_RESULTADO.R_WINS, "No se asigna bien el número de victorias");
    AUnit.Assertions.Assert(V_LOSSES = V_RESULTADO.R_LOSSES, "No se asigna bien el número de derrotas");
    AUnit.Assertions.Assert(V_TIES = V_RESULTADO.R_TIES, "No se asigna bien el número de empates");
  end TEST_NUEVAS_ESTADISTICAS_CON_DATOS;

  procedure TEST_NUEVAS_ESTADISTICAS_PERO_NUEVAS(Test: in out AUnit.Test_Cases.Test_Case'Class) is
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
    AUnit.Assertions.Assert(V_WINS = V_RESULTADO.R_WINS, "No se asigna bien el número de victorias");
    AUnit.Assertions.Assert(V_LOSSES = V_RESULTADO.R_LOSSES, "No se asigna bien el número de derrotas");
    AUnit.Assertions.Assert(V_TIES = V_RESULTADO.R_TIES, "No se asigna bien el número de empates");
  end TEST_NUEVAS_ESTADISTICAS_PERO_NUEVAS;

  procedure TEST_GET_WINS(Test: in out AUnit.Test_Cases.Test_Case'Class) is
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
    V_RESULTADO := F_GET_WINS(V_OBJETO);

    -- THEN La función me un T_STATISTICS con los datos (que tenía) asignados:
    AUnit.Assertions.Assert(V_WINS = V_RESULTADO, "No se asigna bien el número de victorias");

  end TEST_GET_WINS;

  procedure TEST_GET_LOOSES(Test: in out AUnit.Test_Cases.Test_Case'Class) is
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
    V_RESULTADO := F_GET_LOSSES(V_OBJETO);

    -- THEN La función me un T_STATISTICS con los datos (que tenía) asignados:
    AUnit.Assertions.Assert(V_LOSSES = V_RESULTADO, "No se asigna bien el número de derrotas");

  end TEST_GET_LOOSES;

  procedure TEST_GET_TIES(Test: in out AUnit.Test_Cases.Test_Case'Class) is
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
    V_RESULTADO := F_GET_TIES(V_OBJETO);

    -- THEN La función me un T_STATISTICS con los datos (que tenía) asignados:
    AUnit.Assertions.Assert(V_TIES = V_RESULTADO, "No se asigna bien el número de empates");

  end TEST_GET_TIES;

  procedure TEST_GET_PLAYED_GAMES(Test: in out AUnit.Test_Cases.Test_Case'Class) is
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
    V_RESULTADO := F_GET_PLAYED_GAMES(V_OBJETO);

    -- THEN La función me un T_STATISTICS con los datos (que tenía) asignados:
    AUnit.Assertions.Assert(V_WINS + V_LOSSES + V_TIES = V_RESULTADO, "No se asigna bien el número de partidas jugadas");

  end TEST_GET_PLAYED_GAMES;

  procedure TEST_INCREMENT_WINS(Test: in out AUnit.Test_Cases.Test_Case'Class) is
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
      P_INCREMENT_WINS(V_OBJETO, V_SE_INCREMENTO);
  
      -- THEN La función me un T_STATISTICS con los datos (que tenía) asignados:
      AUnit.Assertions.Assert(V_SE_INCREMENTO, "No se indica bien que se ha incrementado");  
      AUnit.Assertions.Assert(V_WINS+1 = V_OBJETO.R_WINS, "No se incrementa bien el número de victorias");
    end TEST_INCREMENT_WINS;

  procedure TEST_INCREMENT_WINS_MAXIMO(Test: in out AUnit.Test_Cases.Test_Case'Class) is
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
      P_INCREMENT_WINS(V_OBJETO, V_SE_INCREMENTO);
  
      -- THEN La función me un T_STATISTICS con los datos (que tenía) asignados:
      AUnit.Assertions.Assert(V_WINS = V_OBJETO.R_WINS, "No se incrementa bien el número de victorias");
      AUnit.Assertions.Assert(not V_SE_INCREMENTO, "No se indica bien que se ha incrementado");
  
    end TEST_INCREMENT_WINS_MAXIMO;

  procedure TEST_INCREMENT_LOSSES(Test: in out AUnit.Test_Cases.Test_Case'Class) is
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
      P_INCREMENT_LOSSES(V_OBJETO, V_SE_INCREMENTO);
  
      -- THEN La función me un T_STATISTICS con los datos (que tenía) asignados:
      AUnit.Assertions.Assert(V_LOSSES+1 = V_OBJETO.R_LOSSES, "No se incrementa bien el número de derrotas");
      AUnit.Assertions.Assert(V_SE_INCREMENTO, "No se indica bien que se ha incrementado");
  
    end TEST_INCREMENT_LOSSES;

  procedure TEST_INCREMENT_LOSSES_MAXIMO(Test: in out AUnit.Test_Cases.Test_Case'Class) is
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
      P_INCREMENT_LOSSES(V_OBJETO, V_SE_INCREMENTO);
  
      -- THEN La función me un T_STATISTICS con los datos (que tenía) asignados:
      AUnit.Assertions.Assert(V_LOSSES = V_OBJETO.R_LOSSES, "No se incrementa bien el número de derrotas");
      AUnit.Assertions.Assert(not V_SE_INCREMENTO, "No se indica bien que se ha incrementado");
  
    end TEST_INCREMENT_LOSSES_MAXIMO;

  procedure TEST_INCREMENT_TIES(Test: in out AUnit.Test_Cases.Test_Case'Class) is
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
      P_INCREMENT_TIES(V_OBJETO, V_SE_INCREMENTO);
  
      -- THEN La función me un T_STATISTICS con los datos (que tenía) asignados:
      AUnit.Assertions.Assert(V_TIES+1 = V_OBJETO.R_TIES, "No se incrementa bien el número de empates");
      AUnit.Assertions.Assert(V_SE_INCREMENTO, "No se indica bien que se ha incrementado");
  
    end TEST_INCREMENT_TIES;
  
  procedure TEST_INCREMENT_TIES_MAXIMO(Test: in out AUnit.Test_Cases.Test_Case'Class) is
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
      P_INCREMENT_TIES(V_OBJETO, V_SE_INCREMENTO);
  
      -- THEN La función me un T_STATISTICS con los datos (que tenía) asignados:
      AUnit.Assertions.Assert(V_TIES = V_OBJETO.R_TIES, "No se incrementa bien el número de empates");
      AUnit.Assertions.Assert(not V_SE_INCREMENTO, "No se indica bien que se ha incrementado");
  
    end TEST_INCREMENT_TIES_MAXIMO;

end Q_STATISTICS.TEST_CASE;
