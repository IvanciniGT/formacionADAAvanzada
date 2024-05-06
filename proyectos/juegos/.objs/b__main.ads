pragma Warnings (Off);
pragma Ada_95;
with System;
with System.Parameters;
with System.Secondary_Stack;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: 10.5.0" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_main" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#e7ad4323#;
   pragma Export (C, u00001, "mainB");
   u00002 : constant Version_32 := 16#050ff2f0#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#4113f22b#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#1d001432#;
   pragma Export (C, u00004, "gameengineB");
   u00005 : constant Version_32 := 16#06271efa#;
   pragma Export (C, u00005, "gameengineS");
   u00006 : constant Version_32 := 16#185015e7#;
   pragma Export (C, u00006, "ada__exceptionsB");
   u00007 : constant Version_32 := 16#d6578bab#;
   pragma Export (C, u00007, "ada__exceptionsS");
   u00008 : constant Version_32 := 16#76789da1#;
   pragma Export (C, u00008, "adaS");
   u00009 : constant Version_32 := 16#5726abed#;
   pragma Export (C, u00009, "ada__exceptions__last_chance_handlerB");
   u00010 : constant Version_32 := 16#cfec26ee#;
   pragma Export (C, u00010, "ada__exceptions__last_chance_handlerS");
   u00011 : constant Version_32 := 16#4635ec04#;
   pragma Export (C, u00011, "systemS");
   u00012 : constant Version_32 := 16#ae860117#;
   pragma Export (C, u00012, "system__soft_linksB");
   u00013 : constant Version_32 := 16#8d3f9472#;
   pragma Export (C, u00013, "system__soft_linksS");
   u00014 : constant Version_32 := 16#f32b4133#;
   pragma Export (C, u00014, "system__secondary_stackB");
   u00015 : constant Version_32 := 16#03a1141d#;
   pragma Export (C, u00015, "system__secondary_stackS");
   u00016 : constant Version_32 := 16#86dbf443#;
   pragma Export (C, u00016, "system__parametersB");
   u00017 : constant Version_32 := 16#0ed9b82f#;
   pragma Export (C, u00017, "system__parametersS");
   u00018 : constant Version_32 := 16#ced09590#;
   pragma Export (C, u00018, "system__storage_elementsB");
   u00019 : constant Version_32 := 16#6bf6a600#;
   pragma Export (C, u00019, "system__storage_elementsS");
   u00020 : constant Version_32 := 16#75bf515c#;
   pragma Export (C, u00020, "system__soft_links__initializeB");
   u00021 : constant Version_32 := 16#5697fc2b#;
   pragma Export (C, u00021, "system__soft_links__initializeS");
   u00022 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00022, "system__stack_checkingB");
   u00023 : constant Version_32 := 16#c88a87ec#;
   pragma Export (C, u00023, "system__stack_checkingS");
   u00024 : constant Version_32 := 16#34742901#;
   pragma Export (C, u00024, "system__exception_tableB");
   u00025 : constant Version_32 := 16#1b9b8546#;
   pragma Export (C, u00025, "system__exception_tableS");
   u00026 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00026, "system__exceptionsB");
   u00027 : constant Version_32 := 16#2e5681f2#;
   pragma Export (C, u00027, "system__exceptionsS");
   u00028 : constant Version_32 := 16#69416224#;
   pragma Export (C, u00028, "system__exceptions__machineB");
   u00029 : constant Version_32 := 16#5c74e542#;
   pragma Export (C, u00029, "system__exceptions__machineS");
   u00030 : constant Version_32 := 16#aa0563fc#;
   pragma Export (C, u00030, "system__exceptions_debugB");
   u00031 : constant Version_32 := 16#38bf15c0#;
   pragma Export (C, u00031, "system__exceptions_debugS");
   u00032 : constant Version_32 := 16#6c2f8802#;
   pragma Export (C, u00032, "system__img_intB");
   u00033 : constant Version_32 := 16#44ee0cc6#;
   pragma Export (C, u00033, "system__img_intS");
   u00034 : constant Version_32 := 16#39df8c17#;
   pragma Export (C, u00034, "system__tracebackB");
   u00035 : constant Version_32 := 16#181732c0#;
   pragma Export (C, u00035, "system__tracebackS");
   u00036 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00036, "system__traceback_entriesB");
   u00037 : constant Version_32 := 16#466e1a74#;
   pragma Export (C, u00037, "system__traceback_entriesS");
   u00038 : constant Version_32 := 16#448e9548#;
   pragma Export (C, u00038, "system__traceback__symbolicB");
   u00039 : constant Version_32 := 16#46491211#;
   pragma Export (C, u00039, "system__traceback__symbolicS");
   u00040 : constant Version_32 := 16#179d7d28#;
   pragma Export (C, u00040, "ada__containersS");
   u00041 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00041, "ada__exceptions__tracebackB");
   u00042 : constant Version_32 := 16#ae2d2db5#;
   pragma Export (C, u00042, "ada__exceptions__tracebackS");
   u00043 : constant Version_32 := 16#5ab55268#;
   pragma Export (C, u00043, "interfacesS");
   u00044 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00044, "interfaces__cB");
   u00045 : constant Version_32 := 16#467817d8#;
   pragma Export (C, u00045, "interfaces__cS");
   u00046 : constant Version_32 := 16#e865e681#;
   pragma Export (C, u00046, "system__bounded_stringsB");
   u00047 : constant Version_32 := 16#31c8cd1d#;
   pragma Export (C, u00047, "system__bounded_stringsS");
   u00048 : constant Version_32 := 16#0062635e#;
   pragma Export (C, u00048, "system__crtlS");
   u00049 : constant Version_32 := 16#bba79bcb#;
   pragma Export (C, u00049, "system__dwarf_linesB");
   u00050 : constant Version_32 := 16#9a78d181#;
   pragma Export (C, u00050, "system__dwarf_linesS");
   u00051 : constant Version_32 := 16#5b4659fa#;
   pragma Export (C, u00051, "ada__charactersS");
   u00052 : constant Version_32 := 16#8f637df8#;
   pragma Export (C, u00052, "ada__characters__handlingB");
   u00053 : constant Version_32 := 16#3b3f6154#;
   pragma Export (C, u00053, "ada__characters__handlingS");
   u00054 : constant Version_32 := 16#4b7bb96a#;
   pragma Export (C, u00054, "ada__characters__latin_1S");
   u00055 : constant Version_32 := 16#e6d4fa36#;
   pragma Export (C, u00055, "ada__stringsS");
   u00056 : constant Version_32 := 16#96df1a3f#;
   pragma Export (C, u00056, "ada__strings__mapsB");
   u00057 : constant Version_32 := 16#1e526bec#;
   pragma Export (C, u00057, "ada__strings__mapsS");
   u00058 : constant Version_32 := 16#5886cb31#;
   pragma Export (C, u00058, "system__bit_opsB");
   u00059 : constant Version_32 := 16#0765e3a3#;
   pragma Export (C, u00059, "system__bit_opsS");
   u00060 : constant Version_32 := 16#72b39087#;
   pragma Export (C, u00060, "system__unsigned_typesS");
   u00061 : constant Version_32 := 16#92f05f13#;
   pragma Export (C, u00061, "ada__strings__maps__constantsS");
   u00062 : constant Version_32 := 16#a0d3d22b#;
   pragma Export (C, u00062, "system__address_imageB");
   u00063 : constant Version_32 := 16#e7d9713e#;
   pragma Export (C, u00063, "system__address_imageS");
   u00064 : constant Version_32 := 16#ec78c2bf#;
   pragma Export (C, u00064, "system__img_unsB");
   u00065 : constant Version_32 := 16#ed47ac70#;
   pragma Export (C, u00065, "system__img_unsS");
   u00066 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00066, "system__ioB");
   u00067 : constant Version_32 := 16#d8771b4b#;
   pragma Export (C, u00067, "system__ioS");
   u00068 : constant Version_32 := 16#f790d1ef#;
   pragma Export (C, u00068, "system__mmapB");
   u00069 : constant Version_32 := 16#7c445363#;
   pragma Export (C, u00069, "system__mmapS");
   u00070 : constant Version_32 := 16#92d882c5#;
   pragma Export (C, u00070, "ada__io_exceptionsS");
   u00071 : constant Version_32 := 16#91eaca2e#;
   pragma Export (C, u00071, "system__mmap__os_interfaceB");
   u00072 : constant Version_32 := 16#1fc2f713#;
   pragma Export (C, u00072, "system__mmap__os_interfaceS");
   u00073 : constant Version_32 := 16#1e7d913a#;
   pragma Export (C, u00073, "system__mmap__unixS");
   u00074 : constant Version_32 := 16#54420b60#;
   pragma Export (C, u00074, "system__os_libB");
   u00075 : constant Version_32 := 16#d872da39#;
   pragma Export (C, u00075, "system__os_libS");
   u00076 : constant Version_32 := 16#ec4d5631#;
   pragma Export (C, u00076, "system__case_utilB");
   u00077 : constant Version_32 := 16#79e05a50#;
   pragma Export (C, u00077, "system__case_utilS");
   u00078 : constant Version_32 := 16#2a8e89ad#;
   pragma Export (C, u00078, "system__stringsB");
   u00079 : constant Version_32 := 16#2623c091#;
   pragma Export (C, u00079, "system__stringsS");
   u00080 : constant Version_32 := 16#5a3f5337#;
   pragma Export (C, u00080, "system__object_readerB");
   u00081 : constant Version_32 := 16#82413105#;
   pragma Export (C, u00081, "system__object_readerS");
   u00082 : constant Version_32 := 16#fb020d94#;
   pragma Export (C, u00082, "system__val_lliB");
   u00083 : constant Version_32 := 16#2a5b7ef4#;
   pragma Export (C, u00083, "system__val_lliS");
   u00084 : constant Version_32 := 16#b8e72903#;
   pragma Export (C, u00084, "system__val_lluB");
   u00085 : constant Version_32 := 16#1f7d1d65#;
   pragma Export (C, u00085, "system__val_lluS");
   u00086 : constant Version_32 := 16#269742a9#;
   pragma Export (C, u00086, "system__val_utilB");
   u00087 : constant Version_32 := 16#ea955afa#;
   pragma Export (C, u00087, "system__val_utilS");
   u00088 : constant Version_32 := 16#d7bf3f29#;
   pragma Export (C, u00088, "system__exception_tracesB");
   u00089 : constant Version_32 := 16#62eacc9e#;
   pragma Export (C, u00089, "system__exception_tracesS");
   u00090 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00090, "system__wch_conB");
   u00091 : constant Version_32 := 16#5d48ced6#;
   pragma Export (C, u00091, "system__wch_conS");
   u00092 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00092, "system__wch_stwB");
   u00093 : constant Version_32 := 16#7059e2d7#;
   pragma Export (C, u00093, "system__wch_stwS");
   u00094 : constant Version_32 := 16#a831679c#;
   pragma Export (C, u00094, "system__wch_cnvB");
   u00095 : constant Version_32 := 16#52ff7425#;
   pragma Export (C, u00095, "system__wch_cnvS");
   u00096 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00096, "system__wch_jisB");
   u00097 : constant Version_32 := 16#d28f6d04#;
   pragma Export (C, u00097, "system__wch_jisS");
   u00098 : constant Version_32 := 16#5d91da9f#;
   pragma Export (C, u00098, "ada__tagsB");
   u00099 : constant Version_32 := 16#12a0afb8#;
   pragma Export (C, u00099, "ada__tagsS");
   u00100 : constant Version_32 := 16#796f31f1#;
   pragma Export (C, u00100, "system__htableB");
   u00101 : constant Version_32 := 16#c2f75fee#;
   pragma Export (C, u00101, "system__htableS");
   u00102 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00102, "system__string_hashB");
   u00103 : constant Version_32 := 16#60a93490#;
   pragma Export (C, u00103, "system__string_hashS");
   u00104 : constant Version_32 := 16#5698d220#;
   pragma Export (C, u00104, "gamelibraryB");
   u00105 : constant Version_32 := 16#c9329437#;
   pragma Export (C, u00105, "gamelibraryS");
   u00106 : constant Version_32 := 16#351539c5#;
   pragma Export (C, u00106, "ada__strings__unboundedB");
   u00107 : constant Version_32 := 16#6552cb60#;
   pragma Export (C, u00107, "ada__strings__unboundedS");
   u00108 : constant Version_32 := 16#60da0992#;
   pragma Export (C, u00108, "ada__strings__searchB");
   u00109 : constant Version_32 := 16#c1ab8667#;
   pragma Export (C, u00109, "ada__strings__searchS");
   u00110 : constant Version_32 := 16#acee74ad#;
   pragma Export (C, u00110, "system__compare_array_unsigned_8B");
   u00111 : constant Version_32 := 16#ef369d89#;
   pragma Export (C, u00111, "system__compare_array_unsigned_8S");
   u00112 : constant Version_32 := 16#a8025f3c#;
   pragma Export (C, u00112, "system__address_operationsB");
   u00113 : constant Version_32 := 16#55395237#;
   pragma Export (C, u00113, "system__address_operationsS");
   u00114 : constant Version_32 := 16#a02f73f2#;
   pragma Export (C, u00114, "system__storage_pools__subpoolsB");
   u00115 : constant Version_32 := 16#cc5a1856#;
   pragma Export (C, u00115, "system__storage_pools__subpoolsS");
   u00116 : constant Version_32 := 16#57674f80#;
   pragma Export (C, u00116, "system__finalization_mastersB");
   u00117 : constant Version_32 := 16#1dc9d5ce#;
   pragma Export (C, u00117, "system__finalization_mastersS");
   u00118 : constant Version_32 := 16#7268f812#;
   pragma Export (C, u00118, "system__img_boolB");
   u00119 : constant Version_32 := 16#b3ec9def#;
   pragma Export (C, u00119, "system__img_boolS");
   u00120 : constant Version_32 := 16#86c56e5a#;
   pragma Export (C, u00120, "ada__finalizationS");
   u00121 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00121, "ada__streamsB");
   u00122 : constant Version_32 := 16#67e31212#;
   pragma Export (C, u00122, "ada__streamsS");
   u00123 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00123, "system__finalization_rootB");
   u00124 : constant Version_32 := 16#09c79f94#;
   pragma Export (C, u00124, "system__finalization_rootS");
   u00125 : constant Version_32 := 16#6d4d969a#;
   pragma Export (C, u00125, "system__storage_poolsB");
   u00126 : constant Version_32 := 16#65d872a9#;
   pragma Export (C, u00126, "system__storage_poolsS");
   u00127 : constant Version_32 := 16#84042202#;
   pragma Export (C, u00127, "system__storage_pools__subpools__finalizationB");
   u00128 : constant Version_32 := 16#fe2f4b3a#;
   pragma Export (C, u00128, "system__storage_pools__subpools__finalizationS");
   u00129 : constant Version_32 := 16#020a3f4d#;
   pragma Export (C, u00129, "system__atomic_countersB");
   u00130 : constant Version_32 := 16#f269c189#;
   pragma Export (C, u00130, "system__atomic_countersS");
   u00131 : constant Version_32 := 16#039168f8#;
   pragma Export (C, u00131, "system__stream_attributesB");
   u00132 : constant Version_32 := 16#8bc30a4e#;
   pragma Export (C, u00132, "system__stream_attributesS");
   u00133 : constant Version_32 := 16#758a590c#;
   pragma Export (C, u00133, "adivinarnumerojuegoB");
   u00134 : constant Version_32 := 16#cae089fb#;
   pragma Export (C, u00134, "adivinarnumerojuegoS");
   u00135 : constant Version_32 := 16#20725158#;
   pragma Export (C, u00135, "juegoB");
   u00136 : constant Version_32 := 16#eb93d502#;
   pragma Export (C, u00136, "juegoS");
   u00137 : constant Version_32 := 16#3c66e3a8#;
   pragma Export (C, u00137, "partidaB");
   u00138 : constant Version_32 := 16#3fbeeca8#;
   pragma Export (C, u00138, "partidaS");
   u00139 : constant Version_32 := 16#90ae706e#;
   pragma Export (C, u00139, "uigameengineB");
   u00140 : constant Version_32 := 16#297d6bf5#;
   pragma Export (C, u00140, "uigameengineS");
   u00141 : constant Version_32 := 16#f4e097a7#;
   pragma Export (C, u00141, "ada__text_ioB");
   u00142 : constant Version_32 := 16#777d5329#;
   pragma Export (C, u00142, "ada__text_ioS");
   u00143 : constant Version_32 := 16#73d2d764#;
   pragma Export (C, u00143, "interfaces__c_streamsB");
   u00144 : constant Version_32 := 16#b1330297#;
   pragma Export (C, u00144, "interfaces__c_streamsS");
   u00145 : constant Version_32 := 16#ec9c64c3#;
   pragma Export (C, u00145, "system__file_ioB");
   u00146 : constant Version_32 := 16#e1440d61#;
   pragma Export (C, u00146, "system__file_ioS");
   u00147 : constant Version_32 := 16#bbaa76ac#;
   pragma Export (C, u00147, "system__file_control_blockS");
   u00148 : constant Version_32 := 16#fd83e873#;
   pragma Export (C, u00148, "system__concat_2B");
   u00149 : constant Version_32 := 16#44953bd4#;
   pragma Export (C, u00149, "system__concat_2S");
   u00150 : constant Version_32 := 16#c06f7bb4#;
   pragma Export (C, u00150, "randomhelpersB");
   u00151 : constant Version_32 := 16#0f0e06fb#;
   pragma Export (C, u00151, "randomhelpersS");
   u00152 : constant Version_32 := 16#cd2959fb#;
   pragma Export (C, u00152, "ada__numericsS");
   u00153 : constant Version_32 := 16#ec9cfed1#;
   pragma Export (C, u00153, "system__random_numbersB");
   u00154 : constant Version_32 := 16#852d5c9e#;
   pragma Export (C, u00154, "system__random_numbersS");
   u00155 : constant Version_32 := 16#15692802#;
   pragma Export (C, u00155, "system__random_seedB");
   u00156 : constant Version_32 := 16#1d25c55f#;
   pragma Export (C, u00156, "system__random_seedS");
   u00157 : constant Version_32 := 16#6feb5362#;
   pragma Export (C, u00157, "ada__calendarB");
   u00158 : constant Version_32 := 16#31350a81#;
   pragma Export (C, u00158, "ada__calendarS");
   u00159 : constant Version_32 := 16#51f2d040#;
   pragma Export (C, u00159, "system__os_primitivesB");
   u00160 : constant Version_32 := 16#41c889f2#;
   pragma Export (C, u00160, "system__os_primitivesS");
   u00161 : constant Version_32 := 16#383fd226#;
   pragma Export (C, u00161, "system__val_unsB");
   u00162 : constant Version_32 := 16#47b5ed3e#;
   pragma Export (C, u00162, "system__val_unsS");
   u00163 : constant Version_32 := 16#950b4c85#;
   pragma Export (C, u00163, "uiadivinarnumerojuegoB");
   u00164 : constant Version_32 := 16#d317302d#;
   pragma Export (C, u00164, "uiadivinarnumerojuegoS");
   u00165 : constant Version_32 := 16#f64b89a4#;
   pragma Export (C, u00165, "ada__integer_text_ioB");
   u00166 : constant Version_32 := 16#2ec7c168#;
   pragma Export (C, u00166, "ada__integer_text_ioS");
   u00167 : constant Version_32 := 16#fdedfd10#;
   pragma Export (C, u00167, "ada__text_io__integer_auxB");
   u00168 : constant Version_32 := 16#2fe01d89#;
   pragma Export (C, u00168, "ada__text_io__integer_auxS");
   u00169 : constant Version_32 := 16#181dc502#;
   pragma Export (C, u00169, "ada__text_io__generic_auxB");
   u00170 : constant Version_32 := 16#305a076a#;
   pragma Export (C, u00170, "ada__text_io__generic_auxS");
   u00171 : constant Version_32 := 16#b10ba0c7#;
   pragma Export (C, u00171, "system__img_biuB");
   u00172 : constant Version_32 := 16#b49118ca#;
   pragma Export (C, u00172, "system__img_biuS");
   u00173 : constant Version_32 := 16#4e06ab0c#;
   pragma Export (C, u00173, "system__img_llbB");
   u00174 : constant Version_32 := 16#f5560834#;
   pragma Export (C, u00174, "system__img_llbS");
   u00175 : constant Version_32 := 16#9dca6636#;
   pragma Export (C, u00175, "system__img_lliB");
   u00176 : constant Version_32 := 16#577ab9d5#;
   pragma Export (C, u00176, "system__img_lliS");
   u00177 : constant Version_32 := 16#a756d097#;
   pragma Export (C, u00177, "system__img_llwB");
   u00178 : constant Version_32 := 16#5c3a2ba2#;
   pragma Export (C, u00178, "system__img_llwS");
   u00179 : constant Version_32 := 16#eb55dfbb#;
   pragma Export (C, u00179, "system__img_wiuB");
   u00180 : constant Version_32 := 16#dad09f58#;
   pragma Export (C, u00180, "system__img_wiuS");
   u00181 : constant Version_32 := 16#0f9783a4#;
   pragma Export (C, u00181, "system__val_intB");
   u00182 : constant Version_32 := 16#f3ca8567#;
   pragma Export (C, u00182, "system__val_intS");
   u00183 : constant Version_32 := 16#1ce6fc05#;
   pragma Export (C, u00183, "juegoahorcadoB");
   u00184 : constant Version_32 := 16#34e00c4d#;
   pragma Export (C, u00184, "juegoahorcadoS");
   u00185 : constant Version_32 := 16#bf363ed2#;
   pragma Export (C, u00185, "ada__strings__fixedB");
   u00186 : constant Version_32 := 16#fec1aafc#;
   pragma Export (C, u00186, "ada__strings__fixedS");
   u00187 : constant Version_32 := 16#d0c82f0d#;
   pragma Export (C, u00187, "helpersjuegoahorcadoB");
   u00188 : constant Version_32 := 16#13021cee#;
   pragma Export (C, u00188, "helpersjuegoahorcadoS");
   u00189 : constant Version_32 := 16#c89f77d5#;
   pragma Export (C, u00189, "ada__containers__helpersB");
   u00190 : constant Version_32 := 16#4adfc5eb#;
   pragma Export (C, u00190, "ada__containers__helpersS");
   u00191 : constant Version_32 := 16#5a895de2#;
   pragma Export (C, u00191, "system__pool_globalB");
   u00192 : constant Version_32 := 16#7141203e#;
   pragma Export (C, u00192, "system__pool_globalS");
   u00193 : constant Version_32 := 16#e31b7c4e#;
   pragma Export (C, u00193, "system__memoryB");
   u00194 : constant Version_32 := 16#1f488a30#;
   pragma Export (C, u00194, "system__memoryS");
   u00195 : constant Version_32 := 16#203b8c49#;
   pragma Export (C, u00195, "system__strings__stream_opsB");
   u00196 : constant Version_32 := 16#ec029138#;
   pragma Export (C, u00196, "system__strings__stream_opsS");
   u00197 : constant Version_32 := 16#698c7797#;
   pragma Export (C, u00197, "uijuegoahorcadoB");
   u00198 : constant Version_32 := 16#7f4ed453#;
   pragma Export (C, u00198, "uijuegoahorcadoS");
   u00199 : constant Version_32 := 16#46b1f5ea#;
   pragma Export (C, u00199, "system__concat_8B");
   u00200 : constant Version_32 := 16#a532a1d3#;
   pragma Export (C, u00200, "system__concat_8S");
   u00201 : constant Version_32 := 16#46899fd1#;
   pragma Export (C, u00201, "system__concat_7B");
   u00202 : constant Version_32 := 16#baf2b71b#;
   pragma Export (C, u00202, "system__concat_7S");
   u00203 : constant Version_32 := 16#a83b7c85#;
   pragma Export (C, u00203, "system__concat_6B");
   u00204 : constant Version_32 := 16#94f2c1b6#;
   pragma Export (C, u00204, "system__concat_6S");
   u00205 : constant Version_32 := 16#608e2cd1#;
   pragma Export (C, u00205, "system__concat_5B");
   u00206 : constant Version_32 := 16#c16baf2a#;
   pragma Export (C, u00206, "system__concat_5S");
   u00207 : constant Version_32 := 16#932a4690#;
   pragma Export (C, u00207, "system__concat_4B");
   u00208 : constant Version_32 := 16#3851c724#;
   pragma Export (C, u00208, "system__concat_4S");
   u00209 : constant Version_32 := 16#2b70b149#;
   pragma Export (C, u00209, "system__concat_3B");
   u00210 : constant Version_32 := 16#4d45b0a1#;
   pragma Export (C, u00210, "system__concat_3S");
   u00211 : constant Version_32 := 16#8225628b#;
   pragma Export (C, u00211, "ada__containers__red_black_treesS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.latin_1%s
   --  interfaces%s
   --  system%s
   --  system.address_operations%s
   --  system.address_operations%b
   --  system.atomic_counters%s
   --  system.atomic_counters%b
   --  system.img_bool%s
   --  system.img_bool%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.img_lli%s
   --  system.img_lli%b
   --  system.io%s
   --  system.io%b
   --  system.os_primitives%s
   --  system.os_primitives%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%s
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  system.unsigned_types%s
   --  system.img_biu%s
   --  system.img_biu%b
   --  system.img_llb%s
   --  system.img_llb%b
   --  system.img_llw%s
   --  system.img_llw%b
   --  system.img_uns%s
   --  system.img_uns%b
   --  system.img_wiu%s
   --  system.img_wiu%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%s
   --  system.wch_cnv%b
   --  system.compare_array_unsigned_8%s
   --  system.compare_array_unsigned_8%b
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.concat_3%s
   --  system.concat_3%b
   --  system.concat_4%s
   --  system.concat_4%b
   --  system.concat_5%s
   --  system.concat_5%b
   --  system.concat_6%s
   --  system.concat_6%b
   --  system.concat_7%s
   --  system.concat_7%b
   --  system.concat_8%s
   --  system.concat_8%b
   --  system.traceback%s
   --  system.traceback%b
   --  ada.characters.handling%s
   --  system.case_util%s
   --  system.os_lib%s
   --  system.secondary_stack%s
   --  system.standard_library%s
   --  ada.exceptions%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.soft_links%s
   --  system.val_lli%s
   --  system.val_llu%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  ada.exceptions.traceback%s
   --  ada.exceptions.traceback%b
   --  system.address_image%s
   --  system.address_image%b
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  system.bounded_strings%s
   --  system.bounded_strings%b
   --  system.case_util%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.containers%s
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  ada.strings.maps%s
   --  ada.strings.maps%b
   --  ada.strings.maps.constants%s
   --  interfaces.c%s
   --  interfaces.c%b
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.exceptions.machine%s
   --  system.exceptions.machine%b
   --  ada.characters.handling%b
   --  system.exception_traces%s
   --  system.exception_traces%b
   --  system.memory%s
   --  system.memory%b
   --  system.mmap%s
   --  system.mmap.os_interface%s
   --  system.mmap%b
   --  system.mmap.unix%s
   --  system.mmap.os_interface%b
   --  system.object_reader%s
   --  system.object_reader%b
   --  system.dwarf_lines%s
   --  system.dwarf_lines%b
   --  system.os_lib%b
   --  system.secondary_stack%b
   --  system.soft_links.initialize%s
   --  system.soft_links.initialize%b
   --  system.soft_links%b
   --  system.standard_library%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  ada.exceptions%b
   --  system.val_lli%b
   --  system.val_llu%b
   --  ada.numerics%s
   --  ada.strings.search%s
   --  ada.strings.search%b
   --  ada.strings.fixed%s
   --  ada.strings.fixed%b
   --  ada.tags%s
   --  ada.tags%b
   --  ada.streams%s
   --  ada.streams%b
   --  system.file_control_block%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  ada.containers.helpers%s
   --  ada.containers.helpers%b
   --  ada.containers.red_black_trees%s
   --  system.file_io%s
   --  system.file_io%b
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  system.finalization_masters%s
   --  system.finalization_masters%b
   --  system.storage_pools.subpools%s
   --  system.storage_pools.subpools.finalization%s
   --  system.storage_pools.subpools.finalization%b
   --  system.storage_pools.subpools%b
   --  system.stream_attributes%s
   --  system.stream_attributes%b
   --  ada.strings.unbounded%s
   --  ada.strings.unbounded%b
   --  system.val_uns%s
   --  system.val_uns%b
   --  system.val_int%s
   --  system.val_int%b
   --  ada.calendar%s
   --  ada.calendar%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  ada.text_io.generic_aux%s
   --  ada.text_io.generic_aux%b
   --  ada.text_io.integer_aux%s
   --  ada.text_io.integer_aux%b
   --  ada.integer_text_io%s
   --  ada.integer_text_io%b
   --  system.pool_global%s
   --  system.pool_global%b
   --  system.random_seed%s
   --  system.random_seed%b
   --  system.random_numbers%s
   --  system.random_numbers%b
   --  system.strings.stream_ops%s
   --  system.strings.stream_ops%b
   --  randomhelpers%s
   --  randomhelpers%b
   --  helpersjuegoahorcado%s
   --  helpersjuegoahorcado%b
   --  uiadivinarnumerojuego%s
   --  uiadivinarnumerojuego%b
   --  uijuegoahorcado%s
   --  uijuegoahorcado%b
   --  partida%s
   --  gamelibrary%s
   --  juego%s
   --  juego%b
   --  adivinarnumerojuego%s
   --  adivinarnumerojuego%b
   --  juegoahorcado%s
   --  juegoahorcado%b
   --  uigameengine%s
   --  uigameengine%b
   --  gamelibrary%b
   --  partida%b
   --  gameengine%s
   --  gameengine%b
   --  main%b
   --  END ELABORATION ORDER

end ada_main;
