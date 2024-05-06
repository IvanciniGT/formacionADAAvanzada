pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);
with Ada.Exceptions;

package body ada_main is

   E073 : Short_Integer; pragma Import (Ada, E073, "system__os_lib_E");
   E018 : Short_Integer; pragma Import (Ada, E018, "ada__exceptions_E");
   E014 : Short_Integer; pragma Import (Ada, E014, "system__soft_links_E");
   E012 : Short_Integer; pragma Import (Ada, E012, "system__exception_table_E");
   E009 : Short_Integer; pragma Import (Ada, E009, "ada__containers_E");
   E068 : Short_Integer; pragma Import (Ada, E068, "ada__io_exceptions_E");
   E053 : Short_Integer; pragma Import (Ada, E053, "ada__strings_E");
   E055 : Short_Integer; pragma Import (Ada, E055, "ada__strings__maps_E");
   E059 : Short_Integer; pragma Import (Ada, E059, "ada__strings__maps__constants_E");
   E041 : Short_Integer; pragma Import (Ada, E041, "interfaces__c_E");
   E022 : Short_Integer; pragma Import (Ada, E022, "system__exceptions_E");
   E079 : Short_Integer; pragma Import (Ada, E079, "system__object_reader_E");
   E048 : Short_Integer; pragma Import (Ada, E048, "system__dwarf_lines_E");
   E097 : Short_Integer; pragma Import (Ada, E097, "system__soft_links__initialize_E");
   E036 : Short_Integer; pragma Import (Ada, E036, "system__traceback__symbolic_E");
   E152 : Short_Integer; pragma Import (Ada, E152, "ada__numerics_E");
   E105 : Short_Integer; pragma Import (Ada, E105, "ada__tags_E");
   E122 : Short_Integer; pragma Import (Ada, E122, "ada__streams_E");
   E147 : Short_Integer; pragma Import (Ada, E147, "system__file_control_block_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "system__finalization_root_E");
   E120 : Short_Integer; pragma Import (Ada, E120, "ada__finalization_E");
   E146 : Short_Integer; pragma Import (Ada, E146, "system__file_io_E");
   E126 : Short_Integer; pragma Import (Ada, E126, "system__storage_pools_E");
   E117 : Short_Integer; pragma Import (Ada, E117, "system__finalization_masters_E");
   E115 : Short_Integer; pragma Import (Ada, E115, "system__storage_pools__subpools_E");
   E101 : Short_Integer; pragma Import (Ada, E101, "ada__strings__unbounded_E");
   E158 : Short_Integer; pragma Import (Ada, E158, "ada__calendar_E");
   E142 : Short_Integer; pragma Import (Ada, E142, "ada__text_io_E");
   E192 : Short_Integer; pragma Import (Ada, E192, "system__pool_global_E");
   E156 : Short_Integer; pragma Import (Ada, E156, "system__random_seed_E");
   E138 : Short_Integer; pragma Import (Ada, E138, "partida_E");
   E140 : Short_Integer; pragma Import (Ada, E140, "uigameengine_E");
   E136 : Short_Integer; pragma Import (Ada, E136, "juego_E");
   E151 : Short_Integer; pragma Import (Ada, E151, "randomhelpers_E");
   E188 : Short_Integer; pragma Import (Ada, E188, "helpersjuegoahorcado_E");
   E164 : Short_Integer; pragma Import (Ada, E164, "uiadivinarnumerojuego_E");
   E134 : Short_Integer; pragma Import (Ada, E134, "adivinarnumerojuego_E");
   E198 : Short_Integer; pragma Import (Ada, E198, "uijuegoahorcado_E");
   E184 : Short_Integer; pragma Import (Ada, E184, "juegoahorcado_E");
   E007 : Short_Integer; pragma Import (Ada, E007, "gamelibrary_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "gameengine_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      declare
         procedure F1;
         pragma Import (Ada, F1, "gamelibrary__finalize_body");
      begin
         E007 := E007 - 1;
         F1;
      end;
      declare
         procedure F2;
         pragma Import (Ada, F2, "gamelibrary__finalize_spec");
      begin
         F2;
      end;
      E184 := E184 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "juegoahorcado__finalize_spec");
      begin
         F3;
      end;
      E134 := E134 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "adivinarnumerojuego__finalize_spec");
      begin
         F4;
      end;
      E188 := E188 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "helpersjuegoahorcado__finalize_spec");
      begin
         F5;
      end;
      E136 := E136 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "juego__finalize_spec");
      begin
         F6;
      end;
      E192 := E192 - 1;
      declare
         procedure F7;
         pragma Import (Ada, F7, "system__pool_global__finalize_spec");
      begin
         F7;
      end;
      E142 := E142 - 1;
      declare
         procedure F8;
         pragma Import (Ada, F8, "ada__text_io__finalize_spec");
      begin
         F8;
      end;
      E101 := E101 - 1;
      declare
         procedure F9;
         pragma Import (Ada, F9, "ada__strings__unbounded__finalize_spec");
      begin
         F9;
      end;
      E115 := E115 - 1;
      declare
         procedure F10;
         pragma Import (Ada, F10, "system__storage_pools__subpools__finalize_spec");
      begin
         F10;
      end;
      E117 := E117 - 1;
      declare
         procedure F11;
         pragma Import (Ada, F11, "system__finalization_masters__finalize_spec");
      begin
         F11;
      end;
      declare
         procedure F12;
         pragma Import (Ada, F12, "system__file_io__finalize_body");
      begin
         E146 := E146 - 1;
         F12;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;
   pragma Favor_Top_Level (No_Param_Proc);

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      Ada.Exceptions'Elab_Spec;
      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E012 := E012 + 1;
      Ada.Containers'Elab_Spec;
      E009 := E009 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E068 := E068 + 1;
      Ada.Strings'Elab_Spec;
      E053 := E053 + 1;
      Ada.Strings.Maps'Elab_Spec;
      E055 := E055 + 1;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E059 := E059 + 1;
      Interfaces.C'Elab_Spec;
      E041 := E041 + 1;
      System.Exceptions'Elab_Spec;
      E022 := E022 + 1;
      System.Object_Reader'Elab_Spec;
      E079 := E079 + 1;
      System.Dwarf_Lines'Elab_Spec;
      E048 := E048 + 1;
      System.Os_Lib'Elab_Body;
      E073 := E073 + 1;
      System.Soft_Links.Initialize'Elab_Body;
      E097 := E097 + 1;
      E014 := E014 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E036 := E036 + 1;
      E018 := E018 + 1;
      Ada.Numerics'Elab_Spec;
      E152 := E152 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E105 := E105 + 1;
      Ada.Streams'Elab_Spec;
      E122 := E122 + 1;
      System.File_Control_Block'Elab_Spec;
      E147 := E147 + 1;
      System.Finalization_Root'Elab_Spec;
      E124 := E124 + 1;
      Ada.Finalization'Elab_Spec;
      E120 := E120 + 1;
      System.File_Io'Elab_Body;
      E146 := E146 + 1;
      System.Storage_Pools'Elab_Spec;
      E126 := E126 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E117 := E117 + 1;
      System.Storage_Pools.Subpools'Elab_Spec;
      E115 := E115 + 1;
      Ada.Strings.Unbounded'Elab_Spec;
      E101 := E101 + 1;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E158 := E158 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E142 := E142 + 1;
      System.Pool_Global'Elab_Spec;
      E192 := E192 + 1;
      System.Random_Seed'Elab_Body;
      E156 := E156 + 1;
      E140 := E140 + 1;
      E138 := E138 + 1;
      Juego'Elab_Spec;
      Juego'Elab_Body;
      E136 := E136 + 1;
      E151 := E151 + 1;
      HELPERSJUEGOAHORCADO'ELAB_SPEC;
      E188 := E188 + 1;
      E164 := E164 + 1;
      ADIVINARNUMEROJUEGO'ELAB_SPEC;
      ADIVINARNUMEROJUEGO'ELAB_BODY;
      E134 := E134 + 1;
      E198 := E198 + 1;
      JUEGOAHORCADO'ELAB_SPEC;
      JUEGOAHORCADO'ELAB_BODY;
      E184 := E184 + 1;
      GAMELIBRARY'ELAB_SPEC;
      GAMELIBRARY'ELAB_BODY;
      E007 := E007 + 1;
      E005 := E005 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_main");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      if gnat_argc = 0 then
         gnat_argc := argc;
         gnat_argv := argv;
      end if;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   /home/parallels/Desktop/ada/proyectos/juegos/.objs/uigameengine.o
   --   /home/parallels/Desktop/ada/proyectos/juegos/.objs/partida.o
   --   /home/parallels/Desktop/ada/proyectos/juegos/.objs/juego.o
   --   /home/parallels/Desktop/ada/proyectos/juegos/.objs/randomhelpers.o
   --   /home/parallels/Desktop/ada/proyectos/juegos/.objs/helpersjuegoahorcado.o
   --   /home/parallels/Desktop/ada/proyectos/juegos/.objs/uiadivinarnumerojuego.o
   --   /home/parallels/Desktop/ada/proyectos/juegos/.objs/adivinarnumerojuego.o
   --   /home/parallels/Desktop/ada/proyectos/juegos/.objs/uijuegoahorcado.o
   --   /home/parallels/Desktop/ada/proyectos/juegos/.objs/juegoahorcado.o
   --   /home/parallels/Desktop/ada/proyectos/juegos/.objs/gamelibrary.o
   --   /home/parallels/Desktop/ada/proyectos/juegos/.objs/gameengine.o
   --   /home/parallels/Desktop/ada/proyectos/juegos/.objs/main.o
   --   -L/home/parallels/Desktop/ada/proyectos/juegos/.objs/
   --   -L/home/parallels/Desktop/ada/proyectos/juegos/.objs/
   --   -L/usr/lib/gcc/x86_64-linux-gnu/10/adalib/
   --   -shared
   --   -lgnat-10
   --   -ldl
--  END Object file/option list   

end ada_main;
