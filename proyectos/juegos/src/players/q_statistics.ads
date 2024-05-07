
package Q_STATISTICS is

    -- 1 bit: 2 valores diferentes
    -- 2 bytes: 2¹⁶ = 65536
    -- 1 byte: 2⁸ = 256
    -- 7 bits: 2⁷ = 128
    -- 6 bits: 2⁶ = 64

    -- para qué metemos rangos?
        -- Type safe: Quiero asegurar que los valores no pueden salir de los rangos
        -- Acotar el uso de RAM
    -- Y cuanto ocupan 7 bits en RAM? 7 bits? 1 byte.. La RAM trabaja en bytes, no en bits
    -- Y cuanto ocupan 7 bits en un fichero? 7 bits
    -- Y si quiero guardar 8 bits en ram... 8 booleanos en ram? cuanto ocupa? 8 bits? 8 bytes
    -- Si tengo una restriccion muy grande de memoria... trabajo con byte... y aplico mascaras binarias

    subtype T_STATISTICS_COUNT is Natural range 0 .. 255; -- 65535
        -- El haber metido un subtipo tiene un impacto adicional? Controlar el desbordamiento

    type T_STATISTICS is tagged record
        R_WINS   : T_STATISTICS_COUNT := 0;
        R_LOSSES : T_STATISTICS_COUNT := 0;
        R_TIES   : T_STATISTICS_COUNT := 0;
        -- TODO Fecha ultima partida
    end record;
        
end Q_STATISTICS;