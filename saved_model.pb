??
??
:
Add
x"T
y"T
z"T"
Ttype:
2	
?
ApplyGradientDescent
var"T?

alpha"T

delta"T
out"T?" 
Ttype:
2	"
use_lockingbool( 
?
ArgMax

input"T
	dimension"Tidx
output"output_type" 
Ttype:
2	"
Tidxtype0:
2	"
output_typetype0	:
2	
x
Assign
ref"T?

value"T

output_ref"T?"	
Ttype"
validate_shapebool("
use_lockingbool(?
R
BroadcastGradientArgs
s0"T
s1"T
r0"T
r1"T"
Ttype0:
2	
8
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype
8
Const
output"dtype"
valuetensor"
dtypetype
B
Equal
x"T
y"T
z
"
Ttype:
2	
?
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
?
HashTableV2
table_handle"
	containerstring "
shared_namestring "!
use_node_name_sharingbool( "
	key_dtypetype"
value_dtypetype?
.
Identity

input"T
output"T"	
Ttype
b
InitializeTableV2
table_handle
keys"Tkey
values"Tval"
Tkeytype"
Tvaltype?
,
Log
x"T
y"T"
Ttype:

2
w
LookupTableFindV2
table_handle
keys"Tin
default_value"Tout
values"Tout"
Tintype"
Touttype?
p
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:
	2
?
Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(?
=
Mul
x"T
y"T
z"T"
Ttype:
2	?
.
Neg
x"T
y"T"
Ttype:

2	

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
?
ParseExample

serialized	
names
sparse_keys*Nsparse

dense_keys*Ndense
dense_defaults2Tdense
sparse_indices	*Nsparse
sparse_values2sparse_types
sparse_shapes	*Nsparse
dense_values2Tdense"
Nsparseint("
Ndenseint("%
sparse_types
list(type)(:
2	"
Tdense
list(type)(:
2	"
dense_shapeslist(shape)(
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
a
Range
start"Tidx
limit"Tidx
delta"Tidx
output"Tidx"
Tidxtype0:	
2	
5

Reciprocal
x"T
y"T"
Ttype:

2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
9
Softmax
logits"T
softmax"T"
Ttype:
2
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
:
Sub
x"T
y"T
z"T"
Ttype:
2	
?
Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	
f
TopKV2

input"T
k
values"T
indices"
sortedbool("
Ttype:
2	
s

VariableV2
ref"dtype?"
shapeshape"
dtypetype"
	containerstring "
shared_namestring ?"serve*1.10.12v1.10.1-0-g4dcfddc5d18?k
@

tf_examplePlaceholder*
dtype0*
_output_shapes
:
U
ParseExample/ConstConst*
valueB *
dtype0*
_output_shapes
: 
b
ParseExample/ParseExample/namesConst*
valueB *
dtype0*
_output_shapes
: 
h
&ParseExample/ParseExample/dense_keys_0Const*
value	B Bx*
dtype0*
_output_shapes
: 
?
ParseExample/ParseExampleParseExample
tf_exampleParseExample/ParseExample/names&ParseExample/ParseExample/dense_keys_0ParseExample/Const*
Ndense*(
_output_shapes
:??????????*
Nsparse *
sparse_types
 *
dense_shapes	
:?*
Tdense
2
[
xIdentityParseExample/ParseExample*
T0*(
_output_shapes
:??????????
n
PlaceholderPlaceholder*
shape:?????????
*
dtype0*'
_output_shapes
:?????????

f
zeros/shape_as_tensorConst*
valueB"  
   *
dtype0*
_output_shapes
:
P
zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
[
zerosFillzeros/shape_as_tensorzeros/Const*
_output_shapes
:	?
*
T0
Z
Variable
VariableV2*
shape:	?
*
dtype0*
_output_shapes
:	?

q
Variable/AssignAssignVariablezeros*
T0*
_class
loc:@Variable*
_output_shapes
:	?

j
Variable/readIdentityVariable*
_output_shapes
:	?
*
T0*
_class
loc:@Variable
T
zeros_1Const*
valueB
*    *
dtype0*
_output_shapes
:

R

Variable_1
VariableV2*
shape:
*
dtype0*
_output_shapes
:

t
Variable_1/AssignAssign
Variable_1zeros_1*
T0*
_class
loc:@Variable_1*
_output_shapes
:

k
Variable_1/readIdentity
Variable_1*
_output_shapes
:
*
T0*
_class
loc:@Variable_1
2
initNoOp^Variable/Assign^Variable_1/Assign
T
MatMulMatMulxVariable/read*'
_output_shapes
:?????????
*
T0
U
addAddMatMulVariable_1/read*
T0*'
_output_shapes
:?????????

C
ySoftmaxadd*
T0*'
_output_shapes
:?????????

?
LogLogy*
T0*'
_output_shapes
:?????????

N
mulMulPlaceholderLog*
T0*'
_output_shapes
:?????????

V
ConstConst*
dtype0*
_output_shapes
:*
valueB"       
7
SumSummulConst*
T0*
_output_shapes
: 
0
NegNegSum*
T0*
_output_shapes
: 
R
gradients/ShapeConst*
_output_shapes
: *
valueB *
dtype0
X
gradients/grad_ys_0Const*
dtype0*
_output_shapes
: *
valueB
 *  ??
]
gradients/FillFillgradients/Shapegradients/grad_ys_0*
T0*
_output_shapes
: 
N
gradients/Neg_grad/NegNeggradients/Fill*
T0*
_output_shapes
: 
q
 gradients/Sum_grad/Reshape/shapeConst*
valueB"      *
dtype0*
_output_shapes
:
?
gradients/Sum_grad/ReshapeReshapegradients/Neg_grad/Neg gradients/Sum_grad/Reshape/shape*
_output_shapes

:*
T0
K
gradients/Sum_grad/ShapeShapemul*
T0*
_output_shapes
:
?
gradients/Sum_grad/TileTilegradients/Sum_grad/Reshapegradients/Sum_grad/Shape*
T0*'
_output_shapes
:?????????

S
gradients/mul_grad/ShapeShapePlaceholder*
_output_shapes
:*
T0
M
gradients/mul_grad/Shape_1ShapeLog*
_output_shapes
:*
T0
?
(gradients/mul_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/mul_grad/Shapegradients/mul_grad/Shape_1*2
_output_shapes 
:?????????:?????????
m
gradients/mul_grad/MulMulgradients/Sum_grad/TileLog*
T0*'
_output_shapes
:?????????

?
gradients/mul_grad/SumSumgradients/mul_grad/Mul(gradients/mul_grad/BroadcastGradientArgs*
_output_shapes
:*
T0
?
gradients/mul_grad/ReshapeReshapegradients/mul_grad/Sumgradients/mul_grad/Shape*
T0*'
_output_shapes
:?????????

w
gradients/mul_grad/Mul_1MulPlaceholdergradients/Sum_grad/Tile*
T0*'
_output_shapes
:?????????

?
gradients/mul_grad/Sum_1Sumgradients/mul_grad/Mul_1*gradients/mul_grad/BroadcastGradientArgs:1*
_output_shapes
:*
T0
?
gradients/mul_grad/Reshape_1Reshapegradients/mul_grad/Sum_1gradients/mul_grad/Shape_1*
T0*'
_output_shapes
:?????????

g
#gradients/mul_grad/tuple/group_depsNoOp^gradients/mul_grad/Reshape^gradients/mul_grad/Reshape_1
?
+gradients/mul_grad/tuple/control_dependencyIdentitygradients/mul_grad/Reshape$^gradients/mul_grad/tuple/group_deps*
T0*-
_class#
!loc:@gradients/mul_grad/Reshape*'
_output_shapes
:?????????

?
-gradients/mul_grad/tuple/control_dependency_1Identitygradients/mul_grad/Reshape_1$^gradients/mul_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/mul_grad/Reshape_1*'
_output_shapes
:?????????

?
gradients/Log_grad/Reciprocal
Reciprocaly.^gradients/mul_grad/tuple/control_dependency_1*
T0*'
_output_shapes
:?????????

?
gradients/Log_grad/mulMul-gradients/mul_grad/tuple/control_dependency_1gradients/Log_grad/Reciprocal*'
_output_shapes
:?????????
*
T0
h
gradients/y_grad/mulMulgradients/Log_grad/muly*
T0*'
_output_shapes
:?????????

p
&gradients/y_grad/Sum/reduction_indicesConst*
_output_shapes
:*
valueB:*
dtype0
?
gradients/y_grad/SumSumgradients/y_grad/mul&gradients/y_grad/Sum/reduction_indices*
T0*#
_output_shapes
:?????????
o
gradients/y_grad/Reshape/shapeConst*
valueB"????   *
dtype0*
_output_shapes
:
?
gradients/y_grad/ReshapeReshapegradients/y_grad/Sumgradients/y_grad/Reshape/shape*
T0*'
_output_shapes
:?????????

gradients/y_grad/subSubgradients/Log_grad/mulgradients/y_grad/Reshape*
T0*'
_output_shapes
:?????????

h
gradients/y_grad/mul_1Mulgradients/y_grad/suby*
T0*'
_output_shapes
:?????????

N
gradients/add_grad/ShapeShapeMatMul*
T0*
_output_shapes
:
d
gradients/add_grad/Shape_1Const*
valueB:
*
dtype0*
_output_shapes
:
?
(gradients/add_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_grad/Shapegradients/add_grad/Shape_1*2
_output_shapes 
:?????????:?????????
?
gradients/add_grad/SumSumgradients/y_grad/mul_1(gradients/add_grad/BroadcastGradientArgs*
T0*
_output_shapes
:
?
gradients/add_grad/ReshapeReshapegradients/add_grad/Sumgradients/add_grad/Shape*
T0*'
_output_shapes
:?????????

?
gradients/add_grad/Sum_1Sumgradients/y_grad/mul_1*gradients/add_grad/BroadcastGradientArgs:1*
_output_shapes
:*
T0
?
gradients/add_grad/Reshape_1Reshapegradients/add_grad/Sum_1gradients/add_grad/Shape_1*
_output_shapes
:
*
T0
g
#gradients/add_grad/tuple/group_depsNoOp^gradients/add_grad/Reshape^gradients/add_grad/Reshape_1
?
+gradients/add_grad/tuple/control_dependencyIdentitygradients/add_grad/Reshape$^gradients/add_grad/tuple/group_deps*
T0*-
_class#
!loc:@gradients/add_grad/Reshape*'
_output_shapes
:?????????

?
-gradients/add_grad/tuple/control_dependency_1Identitygradients/add_grad/Reshape_1$^gradients/add_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/add_grad/Reshape_1*
_output_shapes
:

?
gradients/MatMul_grad/MatMulMatMul+gradients/add_grad/tuple/control_dependencyVariable/read*
transpose_b(*
T0*(
_output_shapes
:??????????
?
gradients/MatMul_grad/MatMul_1MatMulx+gradients/add_grad/tuple/control_dependency*
T0*
transpose_a(*
_output_shapes
:	?

n
&gradients/MatMul_grad/tuple/group_depsNoOp^gradients/MatMul_grad/MatMul^gradients/MatMul_grad/MatMul_1
?
.gradients/MatMul_grad/tuple/control_dependencyIdentitygradients/MatMul_grad/MatMul'^gradients/MatMul_grad/tuple/group_deps*(
_output_shapes
:??????????*
T0*/
_class%
#!loc:@gradients/MatMul_grad/MatMul
?
0gradients/MatMul_grad/tuple/control_dependency_1Identitygradients/MatMul_grad/MatMul_1'^gradients/MatMul_grad/tuple/group_deps*
_output_shapes
:	?
*
T0*1
_class'
%#loc:@gradients/MatMul_grad/MatMul_1
b
GradientDescent/learning_rateConst*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
4GradientDescent/update_Variable/ApplyGradientDescentApplyGradientDescentVariableGradientDescent/learning_rate0gradients/MatMul_grad/tuple/control_dependency_1*
T0*
_class
loc:@Variable*
_output_shapes
:	?

?
6GradientDescent/update_Variable_1/ApplyGradientDescentApplyGradientDescent
Variable_1GradientDescent/learning_rate-gradients/add_grad/tuple/control_dependency_1*
_output_shapes
:
*
T0*
_class
loc:@Variable_1
?
GradientDescentNoOp5^GradientDescent/update_Variable/ApplyGradientDescent7^GradientDescent/update_Variable_1/ApplyGradientDescent
J
TopKV2/kConst*
_output_shapes
: *
value	B :
*
dtype0
b
TopKV2TopKV2yTopKV2/k*
T0*:
_output_shapes(
&:?????????
:?????????

l
Const_1Const*1
value(B&
B0B1B2B3B4B5B6B7B8B9*
dtype0*
_output_shapes
:

V
index_to_string/SizeConst*
value	B :
*
dtype0*
_output_shapes
: 
]
index_to_string/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
]
index_to_string/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
?
index_to_string/rangeRangeindex_to_string/range/startindex_to_string/Sizeindex_to_string/range/delta*
_output_shapes
:

j
index_to_string/ToInt64Castindex_to_string/range*

SrcT0*

DstT0	*
_output_shapes
:

Z
index_to_stringHashTableV2*
	key_dtype0	*
value_dtype0*
_output_shapes
: 
Y
index_to_string/ConstConst*
valueB	 BUNK*
dtype0*
_output_shapes
: 
z
index_to_string/table_initInitializeTableV2index_to_stringindex_to_string/ToInt64Const_1*

Tval0*

Tkey0	
Z
ToInt64CastTopKV2:1*

DstT0	*'
_output_shapes
:?????????
*

SrcT0
?
index_to_string_LookupLookupTableFindV2index_to_stringToInt64index_to_string/Const*	
Tin0	*'
_output_shapes
:?????????
*

Tout0
R
ArgMax/dimensionConst*
value	B :*
dtype0*
_output_shapes
: 
S
ArgMaxArgMaxyArgMax/dimension*#
_output_shapes
:?????????*
T0
T
ArgMax_1/dimensionConst*
value	B :*
dtype0*
_output_shapes
: 
a
ArgMax_1ArgMaxPlaceholderArgMax_1/dimension*#
_output_shapes
:?????????*
T0
N
EqualEqualArgMaxArgMax_1*#
_output_shapes
:?????????*
T0	
P
CastCastEqual*

DstT0*#
_output_shapes
:?????????*

SrcT0

Q
Const_2Const*
valueB: *
dtype0*
_output_shapes
:
<
MeanMeanCastConst_2*
T0*
_output_shapes
: 
4
init_all_tablesNoOp^index_to_string/table_init
P

save/ConstConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
?
save/StringJoin/inputs_1Const*<
value3B1 B+_temp_0acd7a17e12549ae95994915fe534160/part*
dtype0*
_output_shapes
: 
d
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
N*
_output_shapes
: 
Q
save/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
k
save/ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
value	B : *
dtype0
?
save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards"/device:CPU:0*
_output_shapes
: 
?
save/SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*)
value BBVariableB
Variable_1*
dtype0
v
save/SaveV2/shape_and_slicesConst"/device:CPU:0*
valueBB B *
dtype0*
_output_shapes
:
?
save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesVariable
Variable_1"/device:CPU:0*
dtypes
2
?
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2"/device:CPU:0*
T0*'
_class
loc:@save/ShardedFilename*
_output_shapes
: 
?
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilename^save/control_dependency"/device:CPU:0*
T0*
N*
_output_shapes
:
u
save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const"/device:CPU:0
?
save/IdentityIdentity
save/Const^save/MergeV2Checkpoints^save/control_dependency"/device:CPU:0*
_output_shapes
: *
T0
?
save/RestoreV2/tensor_namesConst"/device:CPU:0*)
value BBVariableB
Variable_1*
dtype0*
_output_shapes
:
y
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueBB B 
?
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*
_output_shapes

::*
dtypes
2
v
save/AssignAssignVariablesave/RestoreV2*
T0*
_class
loc:@Variable*
_output_shapes
:	?

y
save/Assign_1Assign
Variable_1save/RestoreV2:1*
T0*
_class
loc:@Variable_1*
_output_shapes
:

8
save/restore_shardNoOp^save/Assign^save/Assign_1
-
save/restore_allNoOp^save/restore_shard"<
save/Const:0save/Identity:0save/restore_all (5 @F8"?
trainable_variables?~
9

Variable:0Variable/AssignVariable/read:02zeros:08
A
Variable_1:0Variable_1/AssignVariable_1/read:02	zeros_1:08"
train_op

GradientDescent"*
saved_model_main_op

init_all_tables"?
	variables?~
9

Variable:0Variable/AssignVariable/read:02zeros:08
A
Variable_1:0Variable_1/AssignVariable_1/read:02	zeros_1:08"3
table_initializer

index_to_string/table_init*{
predict_imagesi
%
images
x:0??????????$
scores
y:0?????????
tensorflow/serving/predict*?
serving_default?

inputs
tf_example:0)
scores
TopKV2:0?????????
:
classes/
index_to_string_Lookup:0?????????
tensorflow/serving/classify