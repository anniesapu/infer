(*
 * Copyright (c) 2009-2013, Monoidics ltd.
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *)

open! IStd

(** Configuration values: either constant, determined at compile time, or set at startup time by
    system calls, environment variables, or command line options *)

type os_type = Unix | Win32 | Cygwin

type build_system =
  | BAnt
  | BBuck
  | BClang
  | BGradle
  | BJava
  | BJavac
  | BMake
  | BMvn
  | BNdk
  | BRebar3
  | BXcode

type scheduler = File | Restart | SyntacticCallGraph [@@deriving equal]

val build_system_of_exe_name : string -> build_system

val string_of_build_system : build_system -> string

val env_inside_maven : Unix.env

(** {2 Constant configuration values} *)

val anonymous_block_num_sep : string

val anonymous_block_prefix : string

val assign : string

val biabduction_models_sql : string

val biabduction_models_jar : string

val bin_dir : string

val bound_error_allowed_in_procedure_call : bool

val clang_exe_aliases : string list

val clang_initializer_prefix : string

val clang_inner_destructor_prefix : string

val clang_plugin_path : string

val default_failure_name : string

val dotty_frontend_output : string

val etc_dir : string

val fail_on_issue_exit_code : int

val fcp_dir : string

val idempotent_getters : bool

val initial_analysis_time : float

val is_WSL : bool
(** Windows Subsystem for Linux *)

val ivar_attributes : string

val java_lambda_marker_infix : string
(** marker to recognize methods generated by javalib to eliminate lambdas *)

val kotlin_source_extension : string

val lib_dir : string

val max_narrows : int

val max_widens : int

val meet_level : int

val nsnotification_center_checker_backend : bool

val os_type : os_type

val pp_version : Format.formatter -> unit -> unit

val property_attributes : string

val report_nullable_inconsistency : bool

val save_compact_summaries : bool

val smt_output : bool

val unsafe_unret : string

val weak : string

val allow_listed_cpp_classes : string list

val allow_listed_cpp_methods : string list

val wrappers_dir : string

(** {2 Configuration values specified by command-line options} *)

val annotation_reachability_cxx : Yojson.Basic.t

val annotation_reachability_cxx_sources : Yojson.Basic.t

val annotation_reachability_custom_pairs : Yojson.Basic.t

val append_buck_flavors : string list

val biabduction_abs_struct : int

val biabduction_abs_val : int

val biabduction_allow_leak : bool

val biabduction_array_level : int

val biabduction_models_mode : bool

val biabduction_iterations : int

val biabduction_join_cond : int

val biabduction_memleak_buckets :
  [`MLeak_all | `MLeak_arc | `MLeak_cf | `MLeak_cpp | `MLeak_no_arc | `MLeak_unknown] list

val biabduction_monitor_prop_size : bool

val biabduction_nelseg : bool

val biabduction_only_footprint : bool

val biabduction_seconds_per_iteration : float option

val biabduction_symops_per_iteration : int option

val biabduction_trace_join : bool

val biabduction_trace_rearrange : bool

val biabduction_type_size : bool

val biabduction_unsafe_malloc : bool

val biabduction_worklist_mode : int

val biabduction_write_dotty : bool

val bo_debug : int

val bo_field_depth_limit : int option

val bootclasspath : string option

val buck : bool

val buck_block_list : string list

val buck_build_args : string list

val buck_build_args_no_inline : string list

val buck_cache_mode : bool

val buck_clang_use_toolchain_config : bool

val buck_java_flavor_suppress_config : bool

val buck_java_heap_size_gb : int option

val buck_merge_all_deps : bool

val buck_mode : BuckMode.t option

val buck_out : string

val buck_out_gen : string

val buck_targets_block_list : string list

val capture : bool

val capture_block_list : string option

val censor_report : ((bool * Str.regexp) * (bool * Str.regexp) * string) list

val cfg_json : string option

val changed_files_index : string option

val check_version : string option

val clang_ast_file : [`Biniou of string | `Yojson of string] option

val clang_compound_literal_init_limit : int

val clang_extra_flags : string list

val clang_block_listed_flags : string list

val clang_block_listed_flags_with_arg : string list

val clang_frontend_action_string : string

val clang_ignore_regex : string option

val clang_isystem_to_override_regex : Str.regexp option

val clang_idirafter_to_override_regex : Str.regexp option

val clang_libcxx_include_to_override_regex : string option

val classpath : string option

val command : InferCommand.t

val config_impact_current : string option

val config_impact_data_file : string option

val config_impact_issues_tests : string option

val config_impact_max_callees_to_print : int

val config_impact_previous : string option

val config_impact_strict_mode : bool

val config_impact_strict_mode_paths : Str.regexp list

val continue_analysis : bool

val continue_capture : bool

val costs_current : string option

val cost_issues_tests : string option

val cost_scuba_logging : bool

val costs_previous : string option

val cost_suppress_func_ptr : bool

val cost_tests_only_autoreleasepool : bool

val cxx : bool

val cxx_scope_guards : Yojson.Basic.t

val dbwriter : bool

val deduplicate : bool

val debug_exceptions : bool

val debug_level_analysis : int

val debug_level_capture : int

val debug_level_linters : int

val debug_level_test_determinator : int

val debug_mode : bool

val default_linters : bool

val dependency_mode : bool

val developer_mode : bool

val differential_filter_files : string option

val differential_filter_set : [`Introduced | `Fixed | `Preexisting] list

val dotty_cfg_libs : bool

val dump_duplicate_symbols : bool

val eradicate_condition_redundant : bool

val eradicate_field_over_annotated : bool

val eradicate_return_over_annotated : bool

val eradicate_verbose : bool

val erlang_ast_dir : string option

val erlang_skip_rebar3 : bool

val erlang_list_unfold_depth : int

val fail_on_bug : bool

val fcp_apple_clang : string option

val fcp_syntax_only : bool

val file_renamings : string option

val filter_paths : bool

val filtering : bool

val force_delete_results_dir : bool

val force_integration : build_system option

val from_json_report : string

val from_json_config_impact_report : string

val from_json_costs_report : string

val frontend_stats : bool

val frontend_tests : bool

val function_pointer_specialization : bool

val generated_classes : string option

val genrule_mode : bool

val get_linter_doc_url : linter_id:string -> string option

val global_tenv : bool

val help_checker : Checker.t list

val help_issue_type : IssueType.t list

val hoisting_report_only_expensive : bool

val html : bool

val infer_binary : string
(** absolute canonicalized path to the current executable *)

val icfg_dotty_outfile : string option

val impurity_report_immutable_modifications : bool

val incremental_analysis : bool

val infer_is_clang : bool

val infer_is_javac : bool

val implicit_sdk_root : string option

val inclusive_cost : bool

val inferconfig_file : string option

val inferconfig_dir : string option

val is_checker_enabled : Checker.t -> bool

val issues_tests : string option

val issues_tests_fields : IssuesTestField.t list

val java_debug_source_file_info : string option

val java_jar_compiler : string option

val java_source_parser_experimental : bool

val java_version : int option

val javac_classes_out : string

val job_id : string option

val jobs : int

val keep_going : bool

val kotlin_capture : bool

val linter : string option

val linters_def_file : string list

val linters_def_folder : string list

val linters_developer_mode : bool

val linters_ignore_clang_failures : bool

val linters_validate_syntax_only : bool

val list_checkers : bool

val list_issue_types : bool

val liveness_dangerous_classes : Yojson.Basic.t

val liveness_ignored_constant : string list

val load_average : float option

val mask_sajwa_exceptions : bool

val max_nesting : int option

val memtrace_analysis : bool

val memtrace_sampling_rate : float

val merge : bool

val merge_report : string list

val method_decls_info : string option

val modified_lines : string option

val no_censor_report : Str.regexp list

val no_translate_libs : bool

val nullable_annotation : string option

val nullsafe_annotation_graph : bool

val nullsafe_disable_field_not_initialized_in_nonstrict_classes : bool

val nullsafe_optimistic_third_party_in_default_mode : bool

val nullsafe_third_party_signatures : string option

val nullsafe_third_party_location_for_messaging_only : string option

val nullsafe_strict_containers : bool

val oom_threshold : int option

val only_cheap_debug : bool

val patterns_modeled_expensive : string * Yojson.Basic.t

val patterns_never_returning_null : string * Yojson.Basic.t

val patterns_skip_translation : string * Yojson.Basic.t

val pmd_xml : bool

val print_active_checkers : bool

val print_builtins : bool

val print_jbir : bool

val print_logs : bool

val print_types : bool

val print_using_diff : bool

val procedures : bool

val procedures_attributes : bool

val procedures_cfg : bool

val procedures_definedness : bool

val procedures_filter : string option

val procedures_name : bool

val procedures_source_file : bool

val procedures_summary : bool

val procedures_summary_json : bool

val process_clang_ast : bool

val profiler_samples : string option

val progress_bar : [`MultiLine | `Plain | `Quiet]

val project_root : string

val pulse_cut_to_one_path_procedures_pattern : Str.regexp option

val pulse_intraprocedural_only : bool

val pulse_isl : bool

val pulse_manifest_emp : bool

val pulse_max_disjuncts : int

val pulse_model_abort : string list

val pulse_model_alloc_pattern : Str.regexp option

val pulse_model_free_pattern : Str.regexp option

val pulse_model_malloc_pattern : Str.regexp option

val pulse_model_realloc_pattern : Str.regexp option

val pulse_model_release_pattern : Str.regexp option

val pulse_model_return_first_arg : Str.regexp option

val pulse_model_return_nonnull : Str.regexp option

val pulse_model_skip_pattern : Str.regexp option

val pulse_prune_unsupported_arithmetic : bool

val pulse_report_ignore_unknown_java_methods_patterns : Str.regexp option

val pulse_model_transfer_ownership_namespace : (string * string) list

val pulse_model_transfer_ownership : string list

val pulse_report_latent_issues : bool

val pulse_recency_limit : int

val pulse_widen_threshold : int

val pulse_nullsafe_report_npe : bool

val pure_by_default : bool

val quandary_endpoints : Yojson.Basic.t

val quandary_sanitizers : Yojson.Basic.t

val quandary_show_passthroughs : bool

val quandary_sinks : Yojson.Basic.t

val quandary_sources : Yojson.Basic.t

val quiet : bool

val racerd_guardedby : bool

val reactive_mode : bool

val reanalyze : bool

val relative_path_backtrack : int

val remodel_class : string option

val report : bool

val report_block_list_files_containing : string list

val report_console_limit : int option

val report_current : string option

val report_custom_error : bool

val report_force_relative_path : bool

val report_formatter : [`No_formatter | `Phabricator_formatter]

val report_path_regex_block_list : string list

val report_path_regex_allow_list : string list

val report_previous : string option

val report_suppress_errors : string list

val reports_include_ml_loc : bool

val rest : string list

val results_dir : string

val scheduler : scheduler

val scuba_logging : bool

val scuba_normals : string String.Map.t

val scuba_tags : string list String.Map.t

val select : [`All | `Select of int] option

val show_buckets : bool

val simple_lineage_json_report : bool

val simple_lineage_keep_temporaries : bool

val simple_lineage_max_cfg_size : int option

val simple_lineage_dedup : bool

val simple_lineage_seed : int

val siof_check_iostreams : bool

val siof_safe_methods : string list

val skip_analysis_in_path : string list

val skip_analysis_in_path_skips_compilation : bool

val skip_duplicated_types : bool

val skip_non_capture_clang_commands : bool

val skip_translation_headers : string list

val source_files : bool

val source_files_cfg : bool

val source_files_filter : string option

val source_files_freshly_captured : bool

val source_files_procedure_names : bool

val source_files_type_environment : bool

val source_preview : bool

val sourcepath : string option

val sources : string list

val sqlite_cache_size : int

val sqlite_page_size : int

val sqlite_lock_timeout : int

val sqlite_vacuum : bool

val sqlite_vfs : string option

val starvation_skip_analysis : Yojson.Basic.t

val starvation_strict_mode : bool

val starvation_whole_program : bool

val subtype_multirange : bool

val summaries_caches_max_size : int

val suppress_lint_ignore_types : bool

val tenv_json : string option

val test_determinator : bool

val export_changed_functions : bool

val testing_mode : bool

val threadsafe_aliases : Yojson.Basic.t

val topl_max_conjuncts : int

val topl_max_disjuncts : int

val topl_properties : string list

val trace_absarray : bool

val trace_error : bool

val trace_events : bool

val trace_ondemand : bool

val trace_topl : bool

val tv_commit : string option

val tv_limit : int

val tv_limit_filtered : int

val uninit_interproc : bool

val workspace : string option

val write_html : bool

val write_html_allow_list_regex : string list

val write_website : string option

val xcode_developer_dir : string option

val xcode_isysroot_suffix : string option

val xcpretty : bool

(** {2 Configuration values derived from command-line options} *)

val dynamic_dispatch : bool

val toplevel_results_dir : string
(** In some integrations, eg Buck, infer subprocesses started by the build system (started by the
    toplevel infer process) will have their own results directory; this points to the results
    directory of the toplevel infer process, which can be useful for, eg, storing debug info. In
    other cases this is equal to {!results_dir}. *)

val is_in_custom_symbols : string -> string -> bool
(** Does named symbol match any prefix in the named custom symbol list? *)

val java_package_is_external : string -> bool
(** Check if a Java package is external to the repository *)

val scuba_execution_id : Int64.t option
(** a random number to (hopefully) uniquely identify this run *)

val is_originator : bool
(** is the current process (forked from) the root of the Infer process tree *)

(** {2 Global variables with initial values specified by command-line options} *)

val clang_compilation_dbs : [`Escaped of string | `Raw of string] list
