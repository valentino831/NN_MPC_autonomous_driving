/*
 * control_system_types.h
 *
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * Code generation for model "control_system".
 *
 * Model version              : 1.1790
 * Simulink Coder version : 9.4 (R2020b) 29-Jul-2020
 * C source code generated on : Thu Feb 10 12:23:05 2022
 *
 * Target selection: grt.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Intel->x86-64 (Windows64)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#ifndef RTW_HEADER_control_system_types_h_
#define RTW_HEADER_control_system_types_h_
#include "rtwtypes.h"
#include "builtin_typeid_types.h"
#include "multiword_types.h"

/* Model Code Variants */
#ifndef DEFINED_TYPEDEF_FOR_BusActors1Actors_
#define DEFINED_TYPEDEF_FOR_BusActors1Actors_

typedef struct {
  real_T ActorID;
  real_T Position[3];
  real_T Velocity[3];
  real_T Roll;
  real_T Pitch;
  real_T Yaw;
  real_T AngularVelocity[3];
} BusActors1Actors;

#endif

#ifndef DEFINED_TYPEDEF_FOR_BusActors2_
#define DEFINED_TYPEDEF_FOR_BusActors2_

typedef struct {
  real_T NumActors;
  real_T Time;
  BusActors1Actors Actors[2];
} BusActors2;

#endif

#ifndef DEFINED_TYPEDEF_FOR_BusLaneBoundaries1LaneBoundaries_
#define DEFINED_TYPEDEF_FOR_BusLaneBoundaries1LaneBoundaries_

typedef struct {
  real_T Coordinates[33];
  real_T Curvature[11];
  real_T CurvatureDerivative[11];
  real_T HeadingAngle;
  real_T LateralOffset;
  uint8_T BoundaryType;
  real_T Strength;
  real_T Width;
  real_T Length;
  real_T Space;
} BusLaneBoundaries1LaneBoundaries;

#endif

#ifndef DEFINED_TYPEDEF_FOR_BusLaneBoundaries1_
#define DEFINED_TYPEDEF_FOR_BusLaneBoundaries1_

typedef struct {
  real_T NumLaneBoundaries;
  real_T Time;
  BusLaneBoundaries1LaneBoundaries LaneBoundaries[4];
} BusLaneBoundaries1;

#endif

#ifndef DEFINED_TYPEDEF_FOR_LaneBoundaryType_
#define DEFINED_TYPEDEF_FOR_LaneBoundaryType_

typedef uint8_T LaneBoundaryType;

/* enum LaneBoundaryType */
#define Unmarked                       ((LaneBoundaryType)0U)    /* Default value */
#define Solid                          ((LaneBoundaryType)1U)
#define Dashed                         ((LaneBoundaryType)2U)
#define BottsDots                      ((LaneBoundaryType)4U)
#define DoubleSolid                    ((LaneBoundaryType)5U)
#define DoubleDashed                   ((LaneBoundaryType)6U)
#define SolidDashed                    ((LaneBoundaryType)7U)
#define DashedSolid                    ((LaneBoundaryType)8U)
#endif

/* Custom Type definition for MATLAB Function: '<S5>/MPC_cntr' */
#ifndef struct_tag_sBt9857QWpEgxwzcDJWwV7
#define struct_tag_sBt9857QWpEgxwzcDJWwV7

struct tag_sBt9857QWpEgxwzcDJWwV7
{
  real_T acc_max;
  real_T acc_min;
  real_T acc_lat_max;
  real_T acc_lat_min;
};

#endif                                 /*struct_tag_sBt9857QWpEgxwzcDJWwV7*/

#ifndef typedef_sBt9857QWpEgxwzcDJWwV7_contro_T
#define typedef_sBt9857QWpEgxwzcDJWwV7_contro_T

typedef struct tag_sBt9857QWpEgxwzcDJWwV7 sBt9857QWpEgxwzcDJWwV7_contro_T;

#endif                               /*typedef_sBt9857QWpEgxwzcDJWwV7_contro_T*/

#ifndef struct_tag_seaNy2JVZpxjLNuq0djMccG
#define struct_tag_seaNy2JVZpxjLNuq0djMccG

struct tag_seaNy2JVZpxjLNuq0djMccG
{
  real_T Cf;
  real_T Cr;
  real_T m;
  real_T Iz;
  real_T lr;
  real_T lf;
  real_T ego_L;
  real_T L_wb;
};

#endif                                 /*struct_tag_seaNy2JVZpxjLNuq0djMccG*/

#ifndef typedef_seaNy2JVZpxjLNuq0djMccG_contr_T
#define typedef_seaNy2JVZpxjLNuq0djMccG_contr_T

typedef struct tag_seaNy2JVZpxjLNuq0djMccG seaNy2JVZpxjLNuq0djMccG_contr_T;

#endif                               /*typedef_seaNy2JVZpxjLNuq0djMccG_contr_T*/

#ifndef struct_tag_steiISV9YvKKUcANC1niFdH
#define struct_tag_steiISV9YvKKUcANC1niFdH

struct tag_steiISV9YvKKUcANC1niFdH
{
  real_T jerk_max;
  real_T jerk_min;
  real_T jerk_lat_max;
  real_T jerk_lat_min;
};

#endif                                 /*struct_tag_steiISV9YvKKUcANC1niFdH*/

#ifndef typedef_steiISV9YvKKUcANC1niFdH_contr_T
#define typedef_steiISV9YvKKUcANC1niFdH_contr_T

typedef struct tag_steiISV9YvKKUcANC1niFdH steiISV9YvKKUcANC1niFdH_contr_T;

#endif                               /*typedef_steiISV9YvKKUcANC1niFdH_contr_T*/

#ifndef struct_tag_s7RdrPWkr8UPAUyTdDJkLaG
#define struct_tag_s7RdrPWkr8UPAUyTdDJkLaG

struct tag_s7RdrPWkr8UPAUyTdDJkLaG
{
  boolean_T gradOK;
  boolean_T fevalOK;
  boolean_T done;
  boolean_T stepAccepted;
  boolean_T failedLineSearch;
  int32_T stepType;
};

#endif                                 /*struct_tag_s7RdrPWkr8UPAUyTdDJkLaG*/

#ifndef typedef_s7RdrPWkr8UPAUyTdDJkLaG_contr_T
#define typedef_s7RdrPWkr8UPAUyTdDJkLaG_contr_T

typedef struct tag_s7RdrPWkr8UPAUyTdDJkLaG s7RdrPWkr8UPAUyTdDJkLaG_contr_T;

#endif                               /*typedef_s7RdrPWkr8UPAUyTdDJkLaG_contr_T*/

#ifndef struct_tag_Py0FMRutXL1qGhhCx77fB
#define struct_tag_Py0FMRutXL1qGhhCx77fB

struct tag_Py0FMRutXL1qGhhCx77fB
{
  real_T f1[8];
};

#endif                                 /*struct_tag_Py0FMRutXL1qGhhCx77fB*/

#ifndef typedef_cell_wrap_16_control_system_T
#define typedef_cell_wrap_16_control_system_T

typedef struct tag_Py0FMRutXL1qGhhCx77fB cell_wrap_16_control_system_T;

#endif                                 /*typedef_cell_wrap_16_control_system_T*/

#ifndef struct_tag_2CMHxZzttNMF4kkjT1LagH
#define struct_tag_2CMHxZzttNMF4kkjT1LagH

struct tag_2CMHxZzttNMF4kkjT1LagH
{
  sBt9857QWpEgxwzcDJWwV7_contro_T contents;
};

#endif                                 /*struct_tag_2CMHxZzttNMF4kkjT1LagH*/

#ifndef typedef_captured_var_2_control_system_T
#define typedef_captured_var_2_control_system_T

typedef struct tag_2CMHxZzttNMF4kkjT1LagH captured_var_2_control_system_T;

#endif                               /*typedef_captured_var_2_control_system_T*/

#ifndef struct_tag_LDLtbjaUZ38UsUYdPsIbaC
#define struct_tag_LDLtbjaUZ38UsUYdPsIbaC

struct tag_LDLtbjaUZ38UsUYdPsIbaC
{
  steiISV9YvKKUcANC1niFdH_contr_T contents;
};

#endif                                 /*struct_tag_LDLtbjaUZ38UsUYdPsIbaC*/

#ifndef typedef_captured_var_control_system_T
#define typedef_captured_var_control_system_T

typedef struct tag_LDLtbjaUZ38UsUYdPsIbaC captured_var_control_system_T;

#endif                                 /*typedef_captured_var_control_system_T*/

#ifndef struct_tag_y5YMQKvWdo0GV7C3LrUbM
#define struct_tag_y5YMQKvWdo0GV7C3LrUbM

struct tag_y5YMQKvWdo0GV7C3LrUbM
{
  real_T contents;
};

#endif                                 /*struct_tag_y5YMQKvWdo0GV7C3LrUbM*/

#ifndef typedef_captured_var_1_control_system_T
#define typedef_captured_var_1_control_system_T

typedef struct tag_y5YMQKvWdo0GV7C3LrUbM captured_var_1_control_system_T;

#endif                               /*typedef_captured_var_1_control_system_T*/

#ifndef struct_tag_KmGEDUbBqhT1PEqj2LTYfD
#define struct_tag_KmGEDUbBqhT1PEqj2LTYfD

struct tag_KmGEDUbBqhT1PEqj2LTYfD
{
  seaNy2JVZpxjLNuq0djMccG_contr_T contents;
};

#endif                                 /*struct_tag_KmGEDUbBqhT1PEqj2LTYfD*/

#ifndef typedef_captured_var_9_control_system_T
#define typedef_captured_var_9_control_system_T

typedef struct tag_KmGEDUbBqhT1PEqj2LTYfD captured_var_9_control_system_T;

#endif                               /*typedef_captured_var_9_control_system_T*/

#ifndef struct_tag_z0S04IGd0jR0h7tkyt4RCH
#define struct_tag_z0S04IGd0jR0h7tkyt4RCH

struct tag_z0S04IGd0jR0h7tkyt4RCH
{
  real_T contents[8];
};

#endif                                 /*struct_tag_z0S04IGd0jR0h7tkyt4RCH*/

#ifndef typedef_captured_var_10_control_syste_T
#define typedef_captured_var_10_control_syste_T

typedef struct tag_z0S04IGd0jR0h7tkyt4RCH captured_var_10_control_syste_T;

#endif                               /*typedef_captured_var_10_control_syste_T*/

#ifndef struct_tag_sGaJ3YKdvZBSHFACdh6I6DE
#define struct_tag_sGaJ3YKdvZBSHFACdh6I6DE

struct tag_sGaJ3YKdvZBSHFACdh6I6DE
{
  real_T Elevation;
  real_T Roll;
  real_T Pitch;
  real_T Yaw;
};

#endif                                 /*struct_tag_sGaJ3YKdvZBSHFACdh6I6DE*/

#ifndef typedef_sGaJ3YKdvZBSHFACdh6I6DE_contr_T
#define typedef_sGaJ3YKdvZBSHFACdh6I6DE_contr_T

typedef struct tag_sGaJ3YKdvZBSHFACdh6I6DE sGaJ3YKdvZBSHFACdh6I6DE_contr_T;

#endif                               /*typedef_sGaJ3YKdvZBSHFACdh6I6DE_contr_T*/

#ifndef struct_emxArray_real_T
#define struct_emxArray_real_T

struct emxArray_real_T
{
  real_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};

#endif                                 /*struct_emxArray_real_T*/

#ifndef typedef_emxArray_real_T_control_syste_T
#define typedef_emxArray_real_T_control_syste_T

typedef struct emxArray_real_T emxArray_real_T_control_syste_T;

#endif                               /*typedef_emxArray_real_T_control_syste_T*/

#ifndef struct_emxArray_int32_T
#define struct_emxArray_int32_T

struct emxArray_int32_T
{
  int32_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};

#endif                                 /*struct_emxArray_int32_T*/

#ifndef typedef_emxArray_int32_T_control_syst_T
#define typedef_emxArray_int32_T_control_syst_T

typedef struct emxArray_int32_T emxArray_int32_T_control_syst_T;

#endif                               /*typedef_emxArray_int32_T_control_syst_T*/

#ifndef struct_emxArray_boolean_T
#define struct_emxArray_boolean_T

struct emxArray_boolean_T
{
  boolean_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};

#endif                                 /*struct_emxArray_boolean_T*/

#ifndef typedef_emxArray_boolean_T_control_sy_T
#define typedef_emxArray_boolean_T_control_sy_T

typedef struct emxArray_boolean_T emxArray_boolean_T_control_sy_T;

#endif                               /*typedef_emxArray_boolean_T_control_sy_T*/

/* Custom Type definition for MATLAB Function: '<S5>/MPC_cntr' */
#ifndef struct_tag_Vi59bSKqGvVqgU4stHzTOD
#define struct_tag_Vi59bSKqGvVqgU4stHzTOD

struct tag_Vi59bSKqGvVqgU4stHzTOD
{
  emxArray_real_T_control_syste_T *contents;
};

#endif                                 /*struct_tag_Vi59bSKqGvVqgU4stHzTOD*/

#ifndef typedef_captured_var_13_control_syste_T
#define typedef_captured_var_13_control_syste_T

typedef struct tag_Vi59bSKqGvVqgU4stHzTOD captured_var_13_control_syste_T;

#endif                               /*typedef_captured_var_13_control_syste_T*/

#ifndef struct_tag_c0ZJ66PwiNsKqGc8DwgIz
#define struct_tag_c0ZJ66PwiNsKqGc8DwgIz

struct tag_c0ZJ66PwiNsKqGc8DwgIz
{
  emxArray_real_T_control_syste_T *contents;
};

#endif                                 /*struct_tag_c0ZJ66PwiNsKqGc8DwgIz*/

#ifndef typedef_captured_var_14_control_syste_T
#define typedef_captured_var_14_control_syste_T

typedef struct tag_c0ZJ66PwiNsKqGc8DwgIz captured_var_14_control_syste_T;

#endif                               /*typedef_captured_var_14_control_syste_T*/

#ifndef struct_tag_ndthfjnMB1vZlZKhpJ0c9G
#define struct_tag_ndthfjnMB1vZlZKhpJ0c9G

struct tag_ndthfjnMB1vZlZKhpJ0c9G
{
  emxArray_real_T_control_syste_T *contents;
};

#endif                                 /*struct_tag_ndthfjnMB1vZlZKhpJ0c9G*/

#ifndef typedef_captured_var_11_control_syste_T
#define typedef_captured_var_11_control_syste_T

typedef struct tag_ndthfjnMB1vZlZKhpJ0c9G captured_var_11_control_syste_T;

#endif                               /*typedef_captured_var_11_control_syste_T*/

#ifndef struct_tag_C2JiMZYW5TKZeWvpjtfdfE
#define struct_tag_C2JiMZYW5TKZeWvpjtfdfE

struct tag_C2JiMZYW5TKZeWvpjtfdfE
{
  emxArray_real_T_control_syste_T *contents;
};

#endif                                 /*struct_tag_C2JiMZYW5TKZeWvpjtfdfE*/

#ifndef typedef_captured_var_12_control_syste_T
#define typedef_captured_var_12_control_syste_T

typedef struct tag_C2JiMZYW5TKZeWvpjtfdfE captured_var_12_control_syste_T;

#endif                               /*typedef_captured_var_12_control_syste_T*/

#ifndef struct_tag_YRdjiTiYm7aEWExhPWwDO
#define struct_tag_YRdjiTiYm7aEWExhPWwDO

struct tag_YRdjiTiYm7aEWExhPWwDO
{
  emxArray_real_T_control_syste_T *contents;
};

#endif                                 /*struct_tag_YRdjiTiYm7aEWExhPWwDO*/

#ifndef typedef_captured_var_7_control_system_T
#define typedef_captured_var_7_control_system_T

typedef struct tag_YRdjiTiYm7aEWExhPWwDO captured_var_7_control_system_T;

#endif                               /*typedef_captured_var_7_control_system_T*/

#ifndef struct_tag_bQZyWWAgmUf3z4OoIhJhqD
#define struct_tag_bQZyWWAgmUf3z4OoIhJhqD

struct tag_bQZyWWAgmUf3z4OoIhJhqD
{
  captured_var_10_control_syste_T *f1;
  captured_var_1_control_system_T *f2;
  captured_var_9_control_system_T *f3;
  captured_var_14_control_syste_T *f4;
  captured_var_13_control_syste_T *f5;
  captured_var_2_control_system_T *f6;
  captured_var_1_control_system_T *f7;
  captured_var_1_control_system_T *f8;
  captured_var_control_system_T *f9;
  captured_var_1_control_system_T *f10;
  captured_var_12_control_syste_T *f11;
  captured_var_12_control_syste_T *f12;
};

#endif                                 /*struct_tag_bQZyWWAgmUf3z4OoIhJhqD*/

#ifndef typedef_cell_12_control_system_T
#define typedef_cell_12_control_system_T

typedef struct tag_bQZyWWAgmUf3z4OoIhJhqD cell_12_control_system_T;

#endif                                 /*typedef_cell_12_control_system_T*/

#ifndef struct_tag_ejvq9K38qim7eS0YXmV9d
#define struct_tag_ejvq9K38qim7eS0YXmV9d

struct tag_ejvq9K38qim7eS0YXmV9d
{
  emxArray_real_T_control_syste_T *workspace_double;
  emxArray_int32_T_control_syst_T *workspace_int;
  emxArray_int32_T_control_syst_T *workspace_sort;
};

#endif                                 /*struct_tag_ejvq9K38qim7eS0YXmV9d*/

#ifndef typedef_s_ejvq9K38qim7eS0YXmV9d_contr_T
#define typedef_s_ejvq9K38qim7eS0YXmV9d_contr_T

typedef struct tag_ejvq9K38qim7eS0YXmV9d s_ejvq9K38qim7eS0YXmV9d_contr_T;

#endif                               /*typedef_s_ejvq9K38qim7eS0YXmV9d_contr_T*/

#ifndef struct_tag_YjqVQUoAoJ9hCvKZpKjEEE
#define struct_tag_YjqVQUoAoJ9hCvKZpKjEEE

struct tag_YjqVQUoAoJ9hCvKZpKjEEE
{
  cell_12_control_system_T tunableEnvironment;
};

#endif                                 /*struct_tag_YjqVQUoAoJ9hCvKZpKjEEE*/

#ifndef typedef_anonymous_function_1_control__T
#define typedef_anonymous_function_1_control__T

typedef struct tag_YjqVQUoAoJ9hCvKZpKjEEE anonymous_function_1_control__T;

#endif                               /*typedef_anonymous_function_1_control__T*/

#ifndef struct_emxArray_int8_T
#define struct_emxArray_int8_T

struct emxArray_int8_T
{
  int8_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};

#endif                                 /*struct_emxArray_int8_T*/

#ifndef typedef_emxArray_int8_T_control_syste_T
#define typedef_emxArray_int8_T_control_syste_T

typedef struct emxArray_int8_T emxArray_int8_T_control_syste_T;

#endif                               /*typedef_emxArray_int8_T_control_syste_T*/

#ifndef struct_emxArray_tag_Py0FMRutXL1qGhhCx7
#define struct_emxArray_tag_Py0FMRutXL1qGhhCx7

struct emxArray_tag_Py0FMRutXL1qGhhCx7
{
  cell_wrap_16_control_system_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};

#endif                                /*struct_emxArray_tag_Py0FMRutXL1qGhhCx7*/

#ifndef typedef_emxArray_cell_wrap_16_control_T
#define typedef_emxArray_cell_wrap_16_control_T

typedef struct emxArray_tag_Py0FMRutXL1qGhhCx7 emxArray_cell_wrap_16_control_T;

#endif                               /*typedef_emxArray_cell_wrap_16_control_T*/

/* Custom Type definition for MATLAB Function: '<S5>/MPC_cntr' */
#ifndef struct_tag_8rFFaC7jywG4yMeMwUWwtG
#define struct_tag_8rFFaC7jywG4yMeMwUWwtG

struct tag_8rFFaC7jywG4yMeMwUWwtG
{
  emxArray_real_T_control_syste_T *grad;
  emxArray_real_T_control_syste_T *Hx;
  boolean_T hasLinear;
  int32_T nvar;
  int32_T maxVar;
  real_T beta;
  real_T rho;
  int32_T objtype;
  int32_T prev_objtype;
  int32_T prev_nvar;
  boolean_T prev_hasLinear;
  real_T gammaScalar;
};

#endif                                 /*struct_tag_8rFFaC7jywG4yMeMwUWwtG*/

#ifndef typedef_s_8rFFaC7jywG4yMeMwUWwtG_cont_T
#define typedef_s_8rFFaC7jywG4yMeMwUWwtG_cont_T

typedef struct tag_8rFFaC7jywG4yMeMwUWwtG s_8rFFaC7jywG4yMeMwUWwtG_cont_T;

#endif                               /*typedef_s_8rFFaC7jywG4yMeMwUWwtG_cont_T*/

#ifndef struct_tag_abfzVwEo8BkE2LYNcAJHvE
#define struct_tag_abfzVwEo8BkE2LYNcAJHvE

struct tag_abfzVwEo8BkE2LYNcAJHvE
{
  int32_T mConstr;
  int32_T mConstrOrig;
  int32_T mConstrMax;
  int32_T nVar;
  int32_T nVarOrig;
  int32_T nVarMax;
  int32_T ldA;
  emxArray_real_T_control_syste_T *Aineq;
  emxArray_real_T_control_syste_T *bineq;
  emxArray_real_T_control_syste_T *lb;
  emxArray_real_T_control_syste_T *ub;
  emxArray_int32_T_control_syst_T *indexLB;
  emxArray_int32_T_control_syst_T *indexUB;
  emxArray_int32_T_control_syst_T *indexFixed;
  int32_T mEqRemoved;
  emxArray_real_T_control_syste_T *ATwset;
  emxArray_real_T_control_syste_T *bwset;
  int32_T nActiveConstr;
  emxArray_real_T_control_syste_T *maxConstrWorkspace;
  int32_T sizes[5];
  int32_T sizesNormal[5];
  int32_T sizesPhaseOne[5];
  int32_T sizesRegularized[5];
  int32_T sizesRegPhaseOne[5];
  int32_T isActiveIdx[6];
  int32_T isActiveIdxNormal[6];
  int32_T isActiveIdxPhaseOne[6];
  int32_T isActiveIdxRegularized[6];
  int32_T isActiveIdxRegPhaseOne[6];
  emxArray_boolean_T_control_sy_T *isActiveConstr;
  emxArray_int32_T_control_syst_T *Wid;
  emxArray_int32_T_control_syst_T *Wlocalidx;
  int32_T nWConstr[5];
  int32_T probType;
  real_T SLACK0;
};

#endif                                 /*struct_tag_abfzVwEo8BkE2LYNcAJHvE*/

#ifndef typedef_s_abfzVwEo8BkE2LYNcAJHvE_cont_T
#define typedef_s_abfzVwEo8BkE2LYNcAJHvE_cont_T

typedef struct tag_abfzVwEo8BkE2LYNcAJHvE s_abfzVwEo8BkE2LYNcAJHvE_cont_T;

#endif                               /*typedef_s_abfzVwEo8BkE2LYNcAJHvE_cont_T*/

#ifndef struct_tag_s6ICcRyulWOFjNCN0ll7VsE
#define struct_tag_s6ICcRyulWOFjNCN0ll7VsE

struct tag_s6ICcRyulWOFjNCN0ll7VsE
{
  real_T penaltyParam;
  real_T threshold;
  int32_T nPenaltyDecreases;
  real_T linearizedConstrViol;
  real_T initFval;
  real_T initConstrViolationEq;
  real_T initConstrViolationIneq;
  real_T phi;
  real_T phiPrimePlus;
  real_T phiFullStep;
  real_T feasRelativeFactor;
  real_T nlpPrimalFeasError;
  real_T nlpDualFeasError;
  real_T nlpComplError;
  real_T firstOrderOpt;
  boolean_T hasObjective;
};

#endif                                 /*struct_tag_s6ICcRyulWOFjNCN0ll7VsE*/

#ifndef typedef_s6ICcRyulWOFjNCN0ll7VsE_contr_T
#define typedef_s6ICcRyulWOFjNCN0ll7VsE_contr_T

typedef struct tag_s6ICcRyulWOFjNCN0ll7VsE s6ICcRyulWOFjNCN0ll7VsE_contr_T;

#endif                               /*typedef_s6ICcRyulWOFjNCN0ll7VsE_contr_T*/

#ifndef struct_tag_q3r9IZMCHFhIgloG7mbQ0E
#define struct_tag_q3r9IZMCHFhIgloG7mbQ0E

struct tag_q3r9IZMCHFhIgloG7mbQ0E
{
  int32_T ldq;
  emxArray_real_T_control_syste_T *QR;
  emxArray_real_T_control_syste_T *Q;
  emxArray_int32_T_control_syst_T *jpvt;
  int32_T mrows;
  int32_T ncols;
  emxArray_real_T_control_syste_T *tau;
  int32_T minRowCol;
  boolean_T usedPivoting;
};

#endif                                 /*struct_tag_q3r9IZMCHFhIgloG7mbQ0E*/

#ifndef typedef_s_q3r9IZMCHFhIgloG7mbQ0E_cont_T
#define typedef_s_q3r9IZMCHFhIgloG7mbQ0E_cont_T

typedef struct tag_q3r9IZMCHFhIgloG7mbQ0E s_q3r9IZMCHFhIgloG7mbQ0E_cont_T;

#endif                               /*typedef_s_q3r9IZMCHFhIgloG7mbQ0E_cont_T*/

#ifndef struct_tag_C5zUoIuK89Wyj7kNfqdpED
#define struct_tag_C5zUoIuK89Wyj7kNfqdpED

struct tag_C5zUoIuK89Wyj7kNfqdpED
{
  emxArray_real_T_control_syste_T *FMat;
  int32_T ldm;
  int32_T ndims;
  int32_T info;
};

#endif                                 /*struct_tag_C5zUoIuK89Wyj7kNfqdpED*/

#ifndef typedef_s_C5zUoIuK89Wyj7kNfqdpED_cont_T
#define typedef_s_C5zUoIuK89Wyj7kNfqdpED_cont_T

typedef struct tag_C5zUoIuK89Wyj7kNfqdpED s_C5zUoIuK89Wyj7kNfqdpED_cont_T;

#endif                               /*typedef_s_C5zUoIuK89Wyj7kNfqdpED_cont_T*/

#ifndef struct_tag_s3UjME7xHKGvivxNi5dGfp
#define struct_tag_s3UjME7xHKGvivxNi5dGfp

struct tag_s3UjME7xHKGvivxNi5dGfp
{
  real_T Ql[10];
  real_T Qo[10];
  real_T Qdv[100];
  real_T Qddelta[100];
  real_T Qv[100];
  real_T Qd[100];
};

#endif                                 /*struct_tag_s3UjME7xHKGvivxNi5dGfp*/

#ifndef typedef_s3UjME7xHKGvivxNi5dGfp_contro_T
#define typedef_s3UjME7xHKGvivxNi5dGfp_contro_T

typedef struct tag_s3UjME7xHKGvivxNi5dGfp s3UjME7xHKGvivxNi5dGfp_contro_T;

#endif                               /*typedef_s3UjME7xHKGvivxNi5dGfp_contro_T*/

#ifndef struct_tag_s1TgE9KstXgkd2qJxO1bF4F
#define struct_tag_s1TgE9KstXgkd2qJxO1bF4F

struct tag_s1TgE9KstXgkd2qJxO1bF4F
{
  char_T SolverName[7];
  int32_T MaxIterations;
  real_T StepTolerance;
  real_T OptimalityTolerance;
  real_T ConstraintTolerance;
  real_T ObjectiveLimit;
  real_T PricingTolerance;
  real_T ConstrRelTolFactor;
  real_T ProbRelTolFactor;
  boolean_T RemainFeasible;
  boolean_T IterDisplayQP;
};

#endif                                 /*struct_tag_s1TgE9KstXgkd2qJxO1bF4F*/

#ifndef typedef_s1TgE9KstXgkd2qJxO1bF4F_contr_T
#define typedef_s1TgE9KstXgkd2qJxO1bF4F_contr_T

typedef struct tag_s1TgE9KstXgkd2qJxO1bF4F s1TgE9KstXgkd2qJxO1bF4F_contr_T;

#endif                               /*typedef_s1TgE9KstXgkd2qJxO1bF4F_contr_T*/

#ifndef struct_tag_s2Sdh1LWFf6aTBwZ8BHQ75D
#define struct_tag_s2Sdh1LWFf6aTBwZ8BHQ75D

struct tag_s2Sdh1LWFf6aTBwZ8BHQ75D
{
  real_T iterations;
  real_T funcCount;
  char_T algorithm[3];
  real_T constrviolation;
  real_T stepsize;
  real_T lssteplength;
  real_T firstorderopt;
};

#endif                                 /*struct_tag_s2Sdh1LWFf6aTBwZ8BHQ75D*/

#ifndef typedef_s2Sdh1LWFf6aTBwZ8BHQ75D_contr_T
#define typedef_s2Sdh1LWFf6aTBwZ8BHQ75D_contr_T

typedef struct tag_s2Sdh1LWFf6aTBwZ8BHQ75D s2Sdh1LWFf6aTBwZ8BHQ75D_contr_T;

#endif                               /*typedef_s2Sdh1LWFf6aTBwZ8BHQ75D_contr_T*/

#ifndef struct_tag_tsFIbx87aO2Y4pkpf6PrPB
#define struct_tag_tsFIbx87aO2Y4pkpf6PrPB

struct tag_tsFIbx87aO2Y4pkpf6PrPB
{
  s3UjME7xHKGvivxNi5dGfp_contro_T contents;
};

#endif                                 /*struct_tag_tsFIbx87aO2Y4pkpf6PrPB*/

#ifndef typedef_captured_var_3_control_system_T
#define typedef_captured_var_3_control_system_T

typedef struct tag_tsFIbx87aO2Y4pkpf6PrPB captured_var_3_control_system_T;

#endif                               /*typedef_captured_var_3_control_system_T*/

#ifndef struct_tag_V33yS3rnL4rlKvbvDh830F
#define struct_tag_V33yS3rnL4rlKvbvDh830F

struct tag_V33yS3rnL4rlKvbvDh830F
{
  BusActors1Actors contents;
};

#endif                                 /*struct_tag_V33yS3rnL4rlKvbvDh830F*/

#ifndef typedef_captured_var_6_control_system_T
#define typedef_captured_var_6_control_system_T

typedef struct tag_V33yS3rnL4rlKvbvDh830F captured_var_6_control_system_T;

#endif                               /*typedef_captured_var_6_control_system_T*/

#ifndef struct_tag_6jtfraCP6HVTYQaWlEK7C
#define struct_tag_6jtfraCP6HVTYQaWlEK7C

struct tag_6jtfraCP6HVTYQaWlEK7C
{
  BusActors2 contents;
};

#endif                                 /*struct_tag_6jtfraCP6HVTYQaWlEK7C*/

#ifndef typedef_captured_var_5_control_system_T
#define typedef_captured_var_5_control_system_T

typedef struct tag_6jtfraCP6HVTYQaWlEK7C captured_var_5_control_system_T;

#endif                               /*typedef_captured_var_5_control_system_T*/

#ifndef struct_tag_guuyIoxbuIdg2NHQpcQ1BF
#define struct_tag_guuyIoxbuIdg2NHQpcQ1BF

struct tag_guuyIoxbuIdg2NHQpcQ1BF
{
  BusLaneBoundaries1 contents;
};

#endif                                 /*struct_tag_guuyIoxbuIdg2NHQpcQ1BF*/

#ifndef typedef_captured_var_8_control_system_T
#define typedef_captured_var_8_control_system_T

typedef struct tag_guuyIoxbuIdg2NHQpcQ1BF captured_var_8_control_system_T;

#endif                               /*typedef_captured_var_8_control_system_T*/

#ifndef struct_tag_GiFgfCC38ZaXczDbSSDxcD
#define struct_tag_GiFgfCC38ZaXczDbSSDxcD

struct tag_GiFgfCC38ZaXczDbSSDxcD
{
  real_T contents[9];
};

#endif                                 /*struct_tag_GiFgfCC38ZaXczDbSSDxcD*/

#ifndef typedef_captured_var_4_control_system_T
#define typedef_captured_var_4_control_system_T

typedef struct tag_GiFgfCC38ZaXczDbSSDxcD captured_var_4_control_system_T;

#endif                               /*typedef_captured_var_4_control_system_T*/

#ifndef struct_tag_sr2qVktpORUaoubI3UB0dKG
#define struct_tag_sr2qVktpORUaoubI3UB0dKG

struct tag_sr2qVktpORUaoubI3UB0dKG
{
  real_T SimulationTime;
  BusActors1Actors ActorPoses[2];
};

#endif                                 /*struct_tag_sr2qVktpORUaoubI3UB0dKG*/

#ifndef typedef_sr2qVktpORUaoubI3UB0dKG_contr_T
#define typedef_sr2qVktpORUaoubI3UB0dKG_contr_T

typedef struct tag_sr2qVktpORUaoubI3UB0dKG sr2qVktpORUaoubI3UB0dKG_contr_T;

#endif                               /*typedef_sr2qVktpORUaoubI3UB0dKG_contr_T*/

#ifndef struct_tag_wGXWMpYL18Lw9XSBx3IsbE
#define struct_tag_wGXWMpYL18Lw9XSBx3IsbE

struct tag_wGXWMpYL18Lw9XSBx3IsbE
{
  real_T f1[4];
};

#endif                                 /*struct_tag_wGXWMpYL18Lw9XSBx3IsbE*/

#ifndef typedef_c_cell_wrap_control_system_T
#define typedef_c_cell_wrap_control_system_T

typedef struct tag_wGXWMpYL18Lw9XSBx3IsbE c_cell_wrap_control_system_T;

#endif                                 /*typedef_c_cell_wrap_control_system_T*/

#ifndef struct_tag_mhtnfXKdXHG02Ur42C0BUD
#define struct_tag_mhtnfXKdXHG02Ur42C0BUD

struct tag_mhtnfXKdXHG02Ur42C0BUD
{
  real_T f1[6];
};

#endif                                 /*struct_tag_mhtnfXKdXHG02Ur42C0BUD*/

#ifndef typedef_e_cell_wrap_control_system_T
#define typedef_e_cell_wrap_control_system_T

typedef struct tag_mhtnfXKdXHG02Ur42C0BUD e_cell_wrap_control_system_T;

#endif                                 /*typedef_e_cell_wrap_control_system_T*/

/* Custom Type definition for MATLAB Function: '<S5>/MPC_cntr' */
#ifndef struct_tag_1ZiYIDwtcQJmklyeDxLzGF
#define struct_tag_1ZiYIDwtcQJmklyeDxLzGF

struct tag_1ZiYIDwtcQJmklyeDxLzGF
{
  captured_var_10_control_syste_T *f1;
  captured_var_1_control_system_T *f2;
  captured_var_9_control_system_T *f3;
  captured_var_13_control_syste_T *f4;
  captured_var_14_control_syste_T *f5;
  captured_var_1_control_system_T *f6;
  captured_var_11_control_syste_T *f7;
  captured_var_8_control_system_T *f8;
  captured_var_1_control_system_T *f9;
  captured_var_1_control_system_T *f10;
  captured_var_1_control_system_T *f11;
  captured_var_1_control_system_T *f12;
  captured_var_1_control_system_T *f13;
  captured_var_12_control_syste_T *f14;
  captured_var_7_control_system_T *f15;
  captured_var_6_control_system_T *f16;
  captured_var_5_control_system_T *f17;
  captured_var_1_control_system_T *f18;
  captured_var_4_control_system_T *f19;
  captured_var_12_control_syste_T *f20;
  captured_var_1_control_system_T *f21;
  captured_var_1_control_system_T *f22;
  captured_var_3_control_system_T *f23;
  captured_var_1_control_system_T *f24;
};

#endif                                 /*struct_tag_1ZiYIDwtcQJmklyeDxLzGF*/

#ifndef typedef_cell_11_control_system_T
#define typedef_cell_11_control_system_T

typedef struct tag_1ZiYIDwtcQJmklyeDxLzGF cell_11_control_system_T;

#endif                                 /*typedef_cell_11_control_system_T*/

#ifndef struct_tag_E8t560qalwm2ruf0Cx60QC
#define struct_tag_E8t560qalwm2ruf0Cx60QC

struct tag_E8t560qalwm2ruf0Cx60QC
{
  int32_T nVarMax;
  int32_T mNonlinIneq;
  int32_T mNonlinEq;
  int32_T mIneq;
  int32_T mEq;
  int32_T iNonIneq0;
  int32_T iNonEq0;
  real_T sqpFval;
  real_T sqpFval_old;
  real_T xstarsqp[20];
  real_T xstarsqp_old[20];
  emxArray_real_T_control_syste_T *cIneq;
  emxArray_real_T_control_syste_T *cIneq_old;
  emxArray_real_T_control_syste_T *grad;
  emxArray_real_T_control_syste_T *grad_old;
  int32_T FunctionEvaluations;
  int32_T sqpIterations;
  int32_T sqpExitFlag;
  emxArray_real_T_control_syste_T *lambdasqp;
  emxArray_real_T_control_syste_T *lambdasqp_old;
  real_T steplength;
  emxArray_real_T_control_syste_T *delta_x;
  emxArray_real_T_control_syste_T *socDirection;
  emxArray_real_T_control_syste_T *lambda_old;
  emxArray_int32_T_control_syst_T *workingset_old;
  emxArray_real_T_control_syste_T *JacCineqTrans_old;
  emxArray_real_T_control_syste_T *gradLag;
  emxArray_real_T_control_syste_T *delta_gradLag;
  emxArray_real_T_control_syste_T *xstar;
  real_T fstar;
  real_T firstorderopt;
  emxArray_real_T_control_syste_T *lambda;
  int32_T state;
  real_T maxConstr;
  int32_T iterations;
  emxArray_real_T_control_syste_T *searchDir;
};

#endif                                 /*struct_tag_E8t560qalwm2ruf0Cx60QC*/

#ifndef typedef_s_E8t560qalwm2ruf0Cx60QC_cont_T
#define typedef_s_E8t560qalwm2ruf0Cx60QC_cont_T

typedef struct tag_E8t560qalwm2ruf0Cx60QC s_E8t560qalwm2ruf0Cx60QC_cont_T;

#endif                               /*typedef_s_E8t560qalwm2ruf0Cx60QC_cont_T*/

#ifndef struct_tag_t08u9pLILFPFGPSoVJAAvB
#define struct_tag_t08u9pLILFPFGPSoVJAAvB

struct tag_t08u9pLILFPFGPSoVJAAvB
{
  cell_11_control_system_T tunableEnvironment;
};

#endif                                 /*struct_tag_t08u9pLILFPFGPSoVJAAvB*/

#ifndef typedef_anonymous_function_control_sy_T
#define typedef_anonymous_function_control_sy_T

typedef struct tag_t08u9pLILFPFGPSoVJAAvB anonymous_function_control_sy_T;

#endif                               /*typedef_anonymous_function_control_sy_T*/

/* Custom Type definition for MATLAB Function: '<S5>/MPC_cntr' */
#ifndef struct_tag_Zl6JYtLRqS5XgVM9EWU2uF
#define struct_tag_Zl6JYtLRqS5XgVM9EWU2uF

struct tag_Zl6JYtLRqS5XgVM9EWU2uF
{
  anonymous_function_control_sy_T objfun;
  anonymous_function_1_control__T nonlcon;
  int32_T nVar;
  int32_T mCineq;
  int32_T mCeq;
  boolean_T NonFiniteSupport;
  boolean_T SpecifyObjectiveGradient;
  boolean_T SpecifyConstraintGradient;
  boolean_T ScaleProblem;
};

#endif                                 /*struct_tag_Zl6JYtLRqS5XgVM9EWU2uF*/

#ifndef typedef_s_Zl6JYtLRqS5XgVM9EWU2uF_cont_T
#define typedef_s_Zl6JYtLRqS5XgVM9EWU2uF_cont_T

typedef struct tag_Zl6JYtLRqS5XgVM9EWU2uF s_Zl6JYtLRqS5XgVM9EWU2uF_cont_T;

#endif                               /*typedef_s_Zl6JYtLRqS5XgVM9EWU2uF_cont_T*/

#ifndef struct_tag_uSCUCLv73VZCdlxNgM4GHE
#define struct_tag_uSCUCLv73VZCdlxNgM4GHE

struct tag_uSCUCLv73VZCdlxNgM4GHE
{
  anonymous_function_control_sy_T objfun;
  anonymous_function_1_control__T nonlin;
  real_T f_1;
  emxArray_real_T_control_syste_T *cIneq_1;
  real_T f_2;
  emxArray_real_T_control_syste_T *cIneq_2;
  int32_T nVar;
  int32_T mIneq;
  int32_T mEq;
  int32_T numEvals;
  boolean_T SpecifyObjectiveGradient;
  boolean_T SpecifyConstraintGradient;
  boolean_T hasLB[20];
  boolean_T hasUB[20];
  boolean_T hasBounds;
  int32_T FiniteDifferenceType;
};

#endif                                 /*struct_tag_uSCUCLv73VZCdlxNgM4GHE*/

#ifndef typedef_s_uSCUCLv73VZCdlxNgM4GHE_cont_T
#define typedef_s_uSCUCLv73VZCdlxNgM4GHE_cont_T

typedef struct tag_uSCUCLv73VZCdlxNgM4GHE s_uSCUCLv73VZCdlxNgM4GHE_cont_T;

#endif                               /*typedef_s_uSCUCLv73VZCdlxNgM4GHE_cont_T*/

#ifndef typedef_emxArray_creal_T_control_syst_T
#define typedef_emxArray_creal_T_control_syst_T

typedef struct {
  creal_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
} emxArray_creal_T_control_syst_T;

#endif                               /*typedef_emxArray_creal_T_control_syst_T*/

#ifndef struct_tag_kJBHBW4TrQl3t7Y0cjRpRD
#define struct_tag_kJBHBW4TrQl3t7Y0cjRpRD

struct tag_kJBHBW4TrQl3t7Y0cjRpRD
{
  LaneBoundaryType f1[4];
};

#endif                                 /*struct_tag_kJBHBW4TrQl3t7Y0cjRpRD*/

#ifndef typedef_cell_wrap_control_system_T
#define typedef_cell_wrap_control_system_T

typedef struct tag_kJBHBW4TrQl3t7Y0cjRpRD cell_wrap_control_system_T;

#endif                                 /*typedef_cell_wrap_control_system_T*/

#ifndef struct_emxArray_LaneBoundaryType
#define struct_emxArray_LaneBoundaryType

struct emxArray_LaneBoundaryType
{
  LaneBoundaryType *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};

#endif                                 /*struct_emxArray_LaneBoundaryType*/

#ifndef typedef_emxArray_LaneBoundaryType_con_T
#define typedef_emxArray_LaneBoundaryType_con_T

typedef struct emxArray_LaneBoundaryType emxArray_LaneBoundaryType_con_T;

#endif                               /*typedef_emxArray_LaneBoundaryType_con_T*/

#ifndef struct_tag_WyZSzTc0Xpec0GcA4s9v6E
#define struct_tag_WyZSzTc0Xpec0GcA4s9v6E

struct tag_WyZSzTc0Xpec0GcA4s9v6E
{
  real_T f1;
};

#endif                                 /*struct_tag_WyZSzTc0Xpec0GcA4s9v6E*/

#ifndef typedef_g_cell_wrap_control_system_T
#define typedef_g_cell_wrap_control_system_T

typedef struct tag_WyZSzTc0Xpec0GcA4s9v6E g_cell_wrap_control_system_T;

#endif                                 /*typedef_g_cell_wrap_control_system_T*/

#ifndef struct_tag_VmrHyngLRQszNsfzL4YbGD
#define struct_tag_VmrHyngLRQszNsfzL4YbGD

struct tag_VmrHyngLRQszNsfzL4YbGD
{
  cell_wrap_control_system_T f1;
};

#endif                                 /*struct_tag_VmrHyngLRQszNsfzL4YbGD*/

#ifndef typedef_b_cell_wrap_control_system_T
#define typedef_b_cell_wrap_control_system_T

typedef struct tag_VmrHyngLRQszNsfzL4YbGD b_cell_wrap_control_system_T;

#endif                                 /*typedef_b_cell_wrap_control_system_T*/

#ifndef struct_tag_3zfaUyQhQ5iWm0TXJk8yFG
#define struct_tag_3zfaUyQhQ5iWm0TXJk8yFG

struct tag_3zfaUyQhQ5iWm0TXJk8yFG
{
  c_cell_wrap_control_system_T f1;
};

#endif                                 /*struct_tag_3zfaUyQhQ5iWm0TXJk8yFG*/

#ifndef typedef_d_cell_wrap_control_system_T
#define typedef_d_cell_wrap_control_system_T

typedef struct tag_3zfaUyQhQ5iWm0TXJk8yFG d_cell_wrap_control_system_T;

#endif                                 /*typedef_d_cell_wrap_control_system_T*/

#ifndef struct_tag_4W5QsMZcMk95PDqdcC2MaD
#define struct_tag_4W5QsMZcMk95PDqdcC2MaD

struct tag_4W5QsMZcMk95PDqdcC2MaD
{
  e_cell_wrap_control_system_T f1;
};

#endif                                 /*struct_tag_4W5QsMZcMk95PDqdcC2MaD*/

#ifndef typedef_f_cell_wrap_control_system_T
#define typedef_f_cell_wrap_control_system_T

typedef struct tag_4W5QsMZcMk95PDqdcC2MaD f_cell_wrap_control_system_T;

#endif                                 /*typedef_f_cell_wrap_control_system_T*/

#ifndef struct_tag_ey2LVZQpkyWmSWIc58aggG
#define struct_tag_ey2LVZQpkyWmSWIc58aggG

struct tag_ey2LVZQpkyWmSWIc58aggG
{
  boolean_T IsLoop;
  real_T RoadWidth;
  real_T DistanceTraveled[2501];
  real_T DistanceTraveledLength;
  real_T TileID[2500];
  real_T TileIDLength;
  real_T hcd[2];
  real_T hl;
  real_T hip[2];
  real_T course[2];
  real_T k0;
  real_T k1;
  real_T vppBreaks[2];
  real_T vppCoefs[4];
  real_T vppPieces;
  real_T vppOrder;
  real_T vppDim;
  real_T bppBreaks[2];
  real_T bppCoefs[4];
  real_T bppPieces;
  real_T bppOrder;
  real_T bppDim;
  real_T NumRowsVppCoefs;
  real_T NumColsVppCoefs;
  real_T NumRowsBppCoefs;
  real_T NumColsBppCoefs;
  real_T NumRoadCenters;
  real_T RoadTileVertices[30000];
  real_T RoadTileCentroids[7500];
  boolean_T RoadTileHasLaneMarking[2500];
  real_T RoadTileLaneSpecIdx[2500];
  boolean_T RoadHasElevation;
  b_cell_wrap_control_system_T LaneMarkingType;
  d_cell_wrap_control_system_T LaneMarkingWidth;
  d_cell_wrap_control_system_T LaneMarkingStrength;
  d_cell_wrap_control_system_T LaneMarkingLength;
  d_cell_wrap_control_system_T LaneMarkingSpace;
  d_cell_wrap_control_system_T LaneMarkingRange;
  d_cell_wrap_control_system_T LaneMarkingLocation;
  f_cell_wrap_control_system_T InnerLaneBoundaryLocation;
  f_cell_wrap_control_system_T ModifiedInnerLaneBoundaryLocation;
  d_cell_wrap_control_system_T CenterLaneBoundaryLocation;
  d_cell_wrap_control_system_T ModifiedCenterLaneBoundaryLocation;
  g_cell_wrap_control_system_T NumMarkings;
  g_cell_wrap_control_system_T LaneSpecRange;
  g_cell_wrap_control_system_T ActualLaneSpecLength;
  g_cell_wrap_control_system_T ModifiedLaneSpecLength;
  real_T MaxLaneBoundaryInner[6];
  real_T MaxLaneBoundaryCenter[4];
};

#endif                                 /*struct_tag_ey2LVZQpkyWmSWIc58aggG*/

#ifndef typedef_s_ey2LVZQpkyWmSWIc58aggG_cont_T
#define typedef_s_ey2LVZQpkyWmSWIc58aggG_cont_T

typedef struct tag_ey2LVZQpkyWmSWIc58aggG s_ey2LVZQpkyWmSWIc58aggG_cont_T;

#endif                               /*typedef_s_ey2LVZQpkyWmSWIc58aggG_cont_T*/

#ifndef struct_tag_AGOq4tf5NpnXH9NE912ddE
#define struct_tag_AGOq4tf5NpnXH9NE912ddE

struct tag_AGOq4tf5NpnXH9NE912ddE
{
  boolean_T matlabCodegenIsDeleted;
  int32_T isInitialized;
  boolean_T isSetupComplete;
  real_T currentTime;
  sr2qVktpORUaoubI3UB0dKG_contr_T pActors[1002];
  real_T pCurrentTime;
  real_T pCurrentIndex;
  real_T pMaxIndex;
  s_ey2LVZQpkyWmSWIc58aggG_cont_T pRoadNetwork;
  real_T pSampleTimeCached;
  sGaJ3YKdvZBSHFACdh6I6DE_contr_T pActorOrientCache;
  boolean_T pCanOrientActor;
};

#endif                                 /*struct_tag_AGOq4tf5NpnXH9NE912ddE*/

#ifndef typedef_driving_scenario_internal_Sce_T
#define typedef_driving_scenario_internal_Sce_T

typedef struct tag_AGOq4tf5NpnXH9NE912ddE driving_scenario_internal_Sce_T;

#endif                               /*typedef_driving_scenario_internal_Sce_T*/

#ifndef struct_emxArray_real_T_1x1
#define struct_emxArray_real_T_1x1

struct emxArray_real_T_1x1
{
  real_T data;
  int32_T size[2];
};

#endif                                 /*struct_emxArray_real_T_1x1*/

#ifndef typedef_emxArray_real_T_1x1_control_s_T
#define typedef_emxArray_real_T_1x1_control_s_T

typedef struct emxArray_real_T_1x1 emxArray_real_T_1x1_control_s_T;

#endif                               /*typedef_emxArray_real_T_1x1_control_s_T*/

#ifndef struct_tag_0pNi1aNDD6CyI5VQtjNVeF
#define struct_tag_0pNi1aNDD6CyI5VQtjNVeF

struct tag_0pNi1aNDD6CyI5VQtjNVeF
{
  char_T form[2];
  emxArray_real_T_control_syste_T *breaks;
  emxArray_real_T_control_syste_T *coefs;
  emxArray_real_T_1x1_control_s_T pieces;
  emxArray_real_T_1x1_control_s_T order;
  emxArray_real_T_1x1_control_s_T dim;
};

#endif                                 /*struct_tag_0pNi1aNDD6CyI5VQtjNVeF*/

#ifndef typedef_s_0pNi1aNDD6CyI5VQtjNVeF_cont_T
#define typedef_s_0pNi1aNDD6CyI5VQtjNVeF_cont_T

typedef struct tag_0pNi1aNDD6CyI5VQtjNVeF s_0pNi1aNDD6CyI5VQtjNVeF_cont_T;

#endif                               /*typedef_s_0pNi1aNDD6CyI5VQtjNVeF_cont_T*/

#ifndef struct_emxArray_tag_0pNi1aNDD6CyI5VQtj
#define struct_emxArray_tag_0pNi1aNDD6CyI5VQtj

struct emxArray_tag_0pNi1aNDD6CyI5VQtj
{
  s_0pNi1aNDD6CyI5VQtjNVeF_cont_T data;
  int32_T size[2];
};

#endif                                /*struct_emxArray_tag_0pNi1aNDD6CyI5VQtj*/

#ifndef typedef_emxArray_s_0pNi1aNDD6CyI5VQtj_T
#define typedef_emxArray_s_0pNi1aNDD6CyI5VQtj_T

typedef struct emxArray_tag_0pNi1aNDD6CyI5VQtj emxArray_s_0pNi1aNDD6CyI5VQtj_T;

#endif                               /*typedef_emxArray_s_0pNi1aNDD6CyI5VQtj_T*/

/* Parameters (default storage) */
typedef struct P_control_system_T_ P_control_system_T;

/* Forward declaration for rtModel */
typedef struct tag_RTM_control_system_T RT_MODEL_control_system_T;

#endif                                 /* RTW_HEADER_control_system_types_h_ */
