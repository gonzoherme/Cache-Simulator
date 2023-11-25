; ModuleID = 'trans.c'
source_filename = "trans.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@block_size = dso_local global i64 8, align 8, !dbg !0
@.str = private unnamed_addr constant [21 x i8] c"Transpose submission\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Basic transpose\00", align 1
@.str.2 = private unnamed_addr constant [36 x i8] c"Transpose using the temporary array\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"M > 0\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"trans.c\00", align 1
@__PRETTY_FUNCTION__.trans_basic = private unnamed_addr constant [73 x i8] c"void trans_basic(size_t, size_t, double (*)[M], double (*)[N], double *)\00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"N > 0\00", align 1
@.str.6 = private unnamed_addr constant [25 x i8] c"is_transpose(M, N, A, B)\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.7 = private unnamed_addr constant [72 x i8] c"Transpose incorrect.  Fails for B[%zd][%zd] = %.3f, A[%zd][%zd] = %.3f\0A\00", align 1
@__PRETTY_FUNCTION__.trans_tmp = private unnamed_addr constant [71 x i8] c"void trans_tmp(size_t, size_t, double (*)[M], double (*)[N], double *)\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @registerFunctions() #0 !dbg !16 {
  call void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef @transpose_submit, i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !20
  call void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef @trans_basic, i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !21
  call void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef @trans_tmp, i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !22
  ret void, !dbg !23
}

declare void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef, i8* noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @transpose_submit(i64 noundef %0, i64 noundef %1, double* noundef %2, double* noundef %3, double* noundef %4) #0 !dbg !24 {
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca double*, align 8
  %9 = alloca double*, align 8
  %10 = alloca double*, align 8
  store i64 %0, i64* %6, align 8
  call void @llvm.dbg.declare(metadata i64* %6, metadata !33, metadata !DIExpression()), !dbg !34
  store i64 %1, i64* %7, align 8
  call void @llvm.dbg.declare(metadata i64* %7, metadata !35, metadata !DIExpression()), !dbg !36
  store double* %2, double** %8, align 8
  call void @llvm.dbg.declare(metadata double** %8, metadata !37, metadata !DIExpression()), !dbg !38
  store double* %3, double** %9, align 8
  call void @llvm.dbg.declare(metadata double** %9, metadata !39, metadata !DIExpression()), !dbg !40
  store double* %4, double** %10, align 8
  call void @llvm.dbg.declare(metadata double** %10, metadata !41, metadata !DIExpression()), !dbg !42
  %11 = load i64, i64* %7, align 8, !dbg !43
  %12 = load i64, i64* %6, align 8, !dbg !44
  %13 = load i64, i64* %6, align 8, !dbg !45
  %14 = load i64, i64* %7, align 8, !dbg !46
  %15 = load i64, i64* %6, align 8, !dbg !47
  %16 = load i64, i64* %7, align 8, !dbg !49
  %17 = icmp eq i64 %15, %16, !dbg !50
  br i1 %17, label %18, label %30, !dbg !51

18:                                               ; preds = %5
  %19 = load i64, i64* %6, align 8, !dbg !52
  %20 = icmp eq i64 %19, 32, !dbg !53
  br i1 %20, label %24, label %21, !dbg !54

21:                                               ; preds = %18
  %22 = load i64, i64* %6, align 8, !dbg !55
  %23 = icmp eq i64 %22, 1024, !dbg !56
  br i1 %23, label %24, label %30, !dbg !57

24:                                               ; preds = %21, %18
  %25 = load i64, i64* %6, align 8, !dbg !58
  %26 = load i64, i64* %7, align 8, !dbg !60
  %27 = load double*, double** %8, align 8, !dbg !61
  %28 = load double*, double** %9, align 8, !dbg !62
  %29 = load double*, double** %10, align 8, !dbg !63
  call void @cool_trans(i64 noundef %25, i64 noundef %26, double* noundef %27, double* noundef %28, double* noundef %29), !dbg !64
  br label %36, !dbg !65

30:                                               ; preds = %21, %5
  %31 = load i64, i64* %6, align 8, !dbg !66
  %32 = load i64, i64* %7, align 8, !dbg !68
  %33 = load double*, double** %8, align 8, !dbg !69
  %34 = load double*, double** %9, align 8, !dbg !70
  %35 = load double*, double** %10, align 8, !dbg !71
  call void @trans_tmp(i64 noundef %31, i64 noundef %32, double* noundef %33, double* noundef %34, double* noundef %35), !dbg !72
  br label %36

36:                                               ; preds = %30, %24
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @trans_basic(i64 noundef %0, i64 noundef %1, double* noundef %2, double* noundef %3, double* noundef %4) #0 !dbg !74 {
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca double*, align 8
  %9 = alloca double*, align 8
  %10 = alloca double*, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  store i64 %0, i64* %6, align 8
  call void @llvm.dbg.declare(metadata i64* %6, metadata !75, metadata !DIExpression()), !dbg !76
  store i64 %1, i64* %7, align 8
  call void @llvm.dbg.declare(metadata i64* %7, metadata !77, metadata !DIExpression()), !dbg !78
  store double* %2, double** %8, align 8
  call void @llvm.dbg.declare(metadata double** %8, metadata !79, metadata !DIExpression()), !dbg !80
  store double* %3, double** %9, align 8
  call void @llvm.dbg.declare(metadata double** %9, metadata !81, metadata !DIExpression()), !dbg !82
  store double* %4, double** %10, align 8
  call void @llvm.dbg.declare(metadata double** %10, metadata !83, metadata !DIExpression()), !dbg !84
  %13 = load i64, i64* %7, align 8, !dbg !85
  %14 = load i64, i64* %6, align 8, !dbg !86
  %15 = load i64, i64* %6, align 8, !dbg !87
  %16 = load i64, i64* %7, align 8, !dbg !88
  %17 = load i64, i64* %6, align 8, !dbg !89
  %18 = icmp ugt i64 %17, 0, !dbg !89
  br i1 %18, label %19, label %20, !dbg !89

19:                                               ; preds = %5
  br label %22, !dbg !89

20:                                               ; preds = %5
  call void @__assert_fail(i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), i32 noundef 83, i8* noundef getelementptr inbounds ([73 x i8], [73 x i8]* @__PRETTY_FUNCTION__.trans_basic, i64 0, i64 0)) #4, !dbg !89
  unreachable, !dbg !89

21:                                               ; No predecessors!
  br label %22, !dbg !89

22:                                               ; preds = %21, %19
  %23 = load i64, i64* %7, align 8, !dbg !90
  %24 = icmp ugt i64 %23, 0, !dbg !90
  br i1 %24, label %25, label %26, !dbg !90

25:                                               ; preds = %22
  br label %28, !dbg !90

26:                                               ; preds = %22
  call void @__assert_fail(i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), i32 noundef 84, i8* noundef getelementptr inbounds ([73 x i8], [73 x i8]* @__PRETTY_FUNCTION__.trans_basic, i64 0, i64 0)) #4, !dbg !90
  unreachable, !dbg !90

27:                                               ; No predecessors!
  br label %28, !dbg !90

28:                                               ; preds = %27, %25
  call void @llvm.dbg.declare(metadata i64* %11, metadata !91, metadata !DIExpression()), !dbg !93
  store i64 0, i64* %11, align 8, !dbg !93
  br label %29, !dbg !94

29:                                               ; preds = %56, %28
  %30 = load i64, i64* %11, align 8, !dbg !95
  %31 = load i64, i64* %7, align 8, !dbg !97
  %32 = icmp ult i64 %30, %31, !dbg !98
  br i1 %32, label %33, label %59, !dbg !99

33:                                               ; preds = %29
  call void @llvm.dbg.declare(metadata i64* %12, metadata !100, metadata !DIExpression()), !dbg !103
  store i64 0, i64* %12, align 8, !dbg !103
  br label %34, !dbg !104

34:                                               ; preds = %52, %33
  %35 = load i64, i64* %12, align 8, !dbg !105
  %36 = load i64, i64* %6, align 8, !dbg !107
  %37 = icmp ult i64 %35, %36, !dbg !108
  br i1 %37, label %38, label %55, !dbg !109

38:                                               ; preds = %34
  %39 = load double*, double** %8, align 8, !dbg !110
  %40 = load i64, i64* %11, align 8, !dbg !112
  %41 = mul nsw i64 %40, %14, !dbg !110
  %42 = getelementptr inbounds double, double* %39, i64 %41, !dbg !110
  %43 = load i64, i64* %12, align 8, !dbg !113
  %44 = getelementptr inbounds double, double* %42, i64 %43, !dbg !110
  %45 = load double, double* %44, align 8, !dbg !110
  %46 = load double*, double** %9, align 8, !dbg !114
  %47 = load i64, i64* %12, align 8, !dbg !115
  %48 = mul nsw i64 %47, %16, !dbg !114
  %49 = getelementptr inbounds double, double* %46, i64 %48, !dbg !114
  %50 = load i64, i64* %11, align 8, !dbg !116
  %51 = getelementptr inbounds double, double* %49, i64 %50, !dbg !114
  store double %45, double* %51, align 8, !dbg !117
  br label %52, !dbg !118

52:                                               ; preds = %38
  %53 = load i64, i64* %12, align 8, !dbg !119
  %54 = add i64 %53, 1, !dbg !119
  store i64 %54, i64* %12, align 8, !dbg !119
  br label %34, !dbg !120, !llvm.loop !121

55:                                               ; preds = %34
  br label %56, !dbg !123

56:                                               ; preds = %55
  %57 = load i64, i64* %11, align 8, !dbg !124
  %58 = add i64 %57, 1, !dbg !124
  store i64 %58, i64* %11, align 8, !dbg !124
  br label %29, !dbg !125, !llvm.loop !126

59:                                               ; preds = %29
  %60 = load i64, i64* %6, align 8, !dbg !128
  %61 = load i64, i64* %7, align 8, !dbg !128
  %62 = load double*, double** %8, align 8, !dbg !128
  %63 = load double*, double** %9, align 8, !dbg !128
  %64 = call zeroext i1 @is_transpose(i64 noundef %60, i64 noundef %61, double* noundef %62, double* noundef %63), !dbg !128
  br i1 %64, label %65, label %66, !dbg !128

65:                                               ; preds = %59
  br label %68, !dbg !128

66:                                               ; preds = %59
  call void @__assert_fail(i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str.6, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), i32 noundef 92, i8* noundef getelementptr inbounds ([73 x i8], [73 x i8]* @__PRETTY_FUNCTION__.trans_basic, i64 0, i64 0)) #4, !dbg !128
  unreachable, !dbg !128

67:                                               ; No predecessors!
  br label %68, !dbg !128

68:                                               ; preds = %67, %65
  ret void, !dbg !129
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @trans_tmp(i64 noundef %0, i64 noundef %1, double* noundef %2, double* noundef %3, double* noundef %4) #0 !dbg !130 {
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca double*, align 8
  %9 = alloca double*, align 8
  %10 = alloca double*, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  store i64 %0, i64* %6, align 8
  call void @llvm.dbg.declare(metadata i64* %6, metadata !131, metadata !DIExpression()), !dbg !132
  store i64 %1, i64* %7, align 8
  call void @llvm.dbg.declare(metadata i64* %7, metadata !133, metadata !DIExpression()), !dbg !134
  store double* %2, double** %8, align 8
  call void @llvm.dbg.declare(metadata double** %8, metadata !135, metadata !DIExpression()), !dbg !136
  store double* %3, double** %9, align 8
  call void @llvm.dbg.declare(metadata double** %9, metadata !137, metadata !DIExpression()), !dbg !138
  store double* %4, double** %10, align 8
  call void @llvm.dbg.declare(metadata double** %10, metadata !139, metadata !DIExpression()), !dbg !140
  %15 = load i64, i64* %7, align 8, !dbg !141
  %16 = load i64, i64* %6, align 8, !dbg !142
  %17 = load i64, i64* %6, align 8, !dbg !143
  %18 = load i64, i64* %7, align 8, !dbg !144
  %19 = load i64, i64* %6, align 8, !dbg !145
  %20 = icmp ugt i64 %19, 0, !dbg !145
  br i1 %20, label %21, label %22, !dbg !145

21:                                               ; preds = %5
  br label %24, !dbg !145

22:                                               ; preds = %5
  call void @__assert_fail(i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), i32 noundef 103, i8* noundef getelementptr inbounds ([71 x i8], [71 x i8]* @__PRETTY_FUNCTION__.trans_tmp, i64 0, i64 0)) #4, !dbg !145
  unreachable, !dbg !145

23:                                               ; No predecessors!
  br label %24, !dbg !145

24:                                               ; preds = %23, %21
  %25 = load i64, i64* %7, align 8, !dbg !146
  %26 = icmp ugt i64 %25, 0, !dbg !146
  br i1 %26, label %27, label %28, !dbg !146

27:                                               ; preds = %24
  br label %30, !dbg !146

28:                                               ; preds = %24
  call void @__assert_fail(i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), i32 noundef 104, i8* noundef getelementptr inbounds ([71 x i8], [71 x i8]* @__PRETTY_FUNCTION__.trans_tmp, i64 0, i64 0)) #4, !dbg !146
  unreachable, !dbg !146

29:                                               ; No predecessors!
  br label %30, !dbg !146

30:                                               ; preds = %29, %27
  call void @llvm.dbg.declare(metadata i64* %11, metadata !147, metadata !DIExpression()), !dbg !149
  store i64 0, i64* %11, align 8, !dbg !149
  br label %31, !dbg !150

31:                                               ; preds = %75, %30
  %32 = load i64, i64* %11, align 8, !dbg !151
  %33 = load i64, i64* %7, align 8, !dbg !153
  %34 = icmp ult i64 %32, %33, !dbg !154
  br i1 %34, label %35, label %78, !dbg !155

35:                                               ; preds = %31
  call void @llvm.dbg.declare(metadata i64* %12, metadata !156, metadata !DIExpression()), !dbg !159
  store i64 0, i64* %12, align 8, !dbg !159
  br label %36, !dbg !160

36:                                               ; preds = %71, %35
  %37 = load i64, i64* %12, align 8, !dbg !161
  %38 = load i64, i64* %6, align 8, !dbg !163
  %39 = icmp ult i64 %37, %38, !dbg !164
  br i1 %39, label %40, label %74, !dbg !165

40:                                               ; preds = %36
  call void @llvm.dbg.declare(metadata i64* %13, metadata !166, metadata !DIExpression()), !dbg !168
  %41 = load i64, i64* %11, align 8, !dbg !169
  %42 = urem i64 %41, 2, !dbg !170
  store i64 %42, i64* %13, align 8, !dbg !168
  call void @llvm.dbg.declare(metadata i64* %14, metadata !171, metadata !DIExpression()), !dbg !172
  %43 = load i64, i64* %12, align 8, !dbg !173
  %44 = urem i64 %43, 2, !dbg !174
  store i64 %44, i64* %14, align 8, !dbg !172
  %45 = load double*, double** %8, align 8, !dbg !175
  %46 = load i64, i64* %11, align 8, !dbg !176
  %47 = mul nsw i64 %46, %16, !dbg !175
  %48 = getelementptr inbounds double, double* %45, i64 %47, !dbg !175
  %49 = load i64, i64* %12, align 8, !dbg !177
  %50 = getelementptr inbounds double, double* %48, i64 %49, !dbg !175
  %51 = load double, double* %50, align 8, !dbg !175
  %52 = load double*, double** %10, align 8, !dbg !178
  %53 = load i64, i64* %13, align 8, !dbg !179
  %54 = mul i64 2, %53, !dbg !180
  %55 = load i64, i64* %14, align 8, !dbg !181
  %56 = add i64 %54, %55, !dbg !182
  %57 = getelementptr inbounds double, double* %52, i64 %56, !dbg !178
  store double %51, double* %57, align 8, !dbg !183
  %58 = load double*, double** %10, align 8, !dbg !184
  %59 = load i64, i64* %13, align 8, !dbg !185
  %60 = mul i64 2, %59, !dbg !186
  %61 = load i64, i64* %14, align 8, !dbg !187
  %62 = add i64 %60, %61, !dbg !188
  %63 = getelementptr inbounds double, double* %58, i64 %62, !dbg !184
  %64 = load double, double* %63, align 8, !dbg !184
  %65 = load double*, double** %9, align 8, !dbg !189
  %66 = load i64, i64* %12, align 8, !dbg !190
  %67 = mul nsw i64 %66, %18, !dbg !189
  %68 = getelementptr inbounds double, double* %65, i64 %67, !dbg !189
  %69 = load i64, i64* %11, align 8, !dbg !191
  %70 = getelementptr inbounds double, double* %68, i64 %69, !dbg !189
  store double %64, double* %70, align 8, !dbg !192
  br label %71, !dbg !193

71:                                               ; preds = %40
  %72 = load i64, i64* %12, align 8, !dbg !194
  %73 = add i64 %72, 1, !dbg !194
  store i64 %73, i64* %12, align 8, !dbg !194
  br label %36, !dbg !195, !llvm.loop !196

74:                                               ; preds = %36
  br label %75, !dbg !198

75:                                               ; preds = %74
  %76 = load i64, i64* %11, align 8, !dbg !199
  %77 = add i64 %76, 1, !dbg !199
  store i64 %77, i64* %11, align 8, !dbg !199
  br label %31, !dbg !200, !llvm.loop !201

78:                                               ; preds = %31
  %79 = load i64, i64* %6, align 8, !dbg !203
  %80 = load i64, i64* %7, align 8, !dbg !203
  %81 = load double*, double** %8, align 8, !dbg !203
  %82 = load double*, double** %9, align 8, !dbg !203
  %83 = call zeroext i1 @is_transpose(i64 noundef %79, i64 noundef %80, double* noundef %81, double* noundef %82), !dbg !203
  br i1 %83, label %84, label %85, !dbg !203

84:                                               ; preds = %78
  br label %87, !dbg !203

85:                                               ; preds = %78
  call void @__assert_fail(i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str.6, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), i32 noundef 115, i8* noundef getelementptr inbounds ([71 x i8], [71 x i8]* @__PRETTY_FUNCTION__.trans_tmp, i64 0, i64 0)) #4, !dbg !203
  unreachable, !dbg !203

86:                                               ; No predecessors!
  br label %87, !dbg !203

87:                                               ; preds = %86, %84
  ret void, !dbg !204
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal void @cool_trans(i64 noundef %0, i64 noundef %1, double* noundef %2, double* noundef %3, double* noundef %4) #0 !dbg !205 {
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca double*, align 8
  %9 = alloca double*, align 8
  %10 = alloca double*, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  store i64 %0, i64* %6, align 8
  call void @llvm.dbg.declare(metadata i64* %6, metadata !206, metadata !DIExpression()), !dbg !207
  store i64 %1, i64* %7, align 8
  call void @llvm.dbg.declare(metadata i64* %7, metadata !208, metadata !DIExpression()), !dbg !209
  store double* %2, double** %8, align 8
  call void @llvm.dbg.declare(metadata double** %8, metadata !210, metadata !DIExpression()), !dbg !211
  store double* %3, double** %9, align 8
  call void @llvm.dbg.declare(metadata double** %9, metadata !212, metadata !DIExpression()), !dbg !213
  store double* %4, double** %10, align 8
  call void @llvm.dbg.declare(metadata double** %10, metadata !214, metadata !DIExpression()), !dbg !215
  %15 = load i64, i64* %7, align 8, !dbg !216
  %16 = load i64, i64* %6, align 8, !dbg !217
  %17 = load i64, i64* %6, align 8, !dbg !218
  %18 = load i64, i64* %7, align 8, !dbg !219
  call void @llvm.dbg.declare(metadata i64* %11, metadata !220, metadata !DIExpression()), !dbg !222
  store i64 0, i64* %11, align 8, !dbg !222
  br label %19, !dbg !223

19:                                               ; preds = %94, %5
  %20 = load i64, i64* %11, align 8, !dbg !224
  %21 = load i64, i64* %7, align 8, !dbg !226
  %22 = icmp ult i64 %20, %21, !dbg !227
  br i1 %22, label %23, label %98, !dbg !228

23:                                               ; preds = %19
  call void @llvm.dbg.declare(metadata i64* %12, metadata !229, metadata !DIExpression()), !dbg !232
  store i64 0, i64* %12, align 8, !dbg !232
  br label %24, !dbg !233

24:                                               ; preds = %89, %23
  %25 = load i64, i64* %12, align 8, !dbg !234
  %26 = load i64, i64* %6, align 8, !dbg !236
  %27 = icmp ult i64 %25, %26, !dbg !237
  br i1 %27, label %28, label %93, !dbg !238

28:                                               ; preds = %24
  call void @llvm.dbg.declare(metadata i64* %13, metadata !239, metadata !DIExpression()), !dbg !242
  %29 = load i64, i64* %11, align 8, !dbg !243
  store i64 %29, i64* %13, align 8, !dbg !242
  br label %30, !dbg !244

30:                                               ; preds = %85, %28
  %31 = load i64, i64* %13, align 8, !dbg !245
  %32 = load i64, i64* %11, align 8, !dbg !247
  %33 = load i64, i64* @block_size, align 8, !dbg !248
  %34 = add i64 %32, %33, !dbg !249
  %35 = icmp ult i64 %31, %34, !dbg !250
  br i1 %35, label %36, label %88, !dbg !251

36:                                               ; preds = %30
  call void @llvm.dbg.declare(metadata i64* %14, metadata !252, metadata !DIExpression()), !dbg !255
  %37 = load i64, i64* %12, align 8, !dbg !256
  store i64 %37, i64* %14, align 8, !dbg !255
  br label %38, !dbg !257

38:                                               ; preds = %63, %36
  %39 = load i64, i64* %14, align 8, !dbg !258
  %40 = load i64, i64* %12, align 8, !dbg !260
  %41 = load i64, i64* @block_size, align 8, !dbg !261
  %42 = add i64 %40, %41, !dbg !262
  %43 = icmp ult i64 %39, %42, !dbg !263
  br i1 %43, label %44, label %66, !dbg !264

44:                                               ; preds = %38
  %45 = load i64, i64* %13, align 8, !dbg !265
  %46 = load i64, i64* %14, align 8, !dbg !268
  %47 = icmp ne i64 %45, %46, !dbg !269
  br i1 %47, label %48, label %62, !dbg !270

48:                                               ; preds = %44
  %49 = load double*, double** %8, align 8, !dbg !271
  %50 = load i64, i64* %13, align 8, !dbg !273
  %51 = mul nsw i64 %50, %16, !dbg !271
  %52 = getelementptr inbounds double, double* %49, i64 %51, !dbg !271
  %53 = load i64, i64* %14, align 8, !dbg !274
  %54 = getelementptr inbounds double, double* %52, i64 %53, !dbg !271
  %55 = load double, double* %54, align 8, !dbg !271
  %56 = load double*, double** %9, align 8, !dbg !275
  %57 = load i64, i64* %14, align 8, !dbg !276
  %58 = mul nsw i64 %57, %18, !dbg !275
  %59 = getelementptr inbounds double, double* %56, i64 %58, !dbg !275
  %60 = load i64, i64* %13, align 8, !dbg !277
  %61 = getelementptr inbounds double, double* %59, i64 %60, !dbg !275
  store double %55, double* %61, align 8, !dbg !278
  br label %62, !dbg !279

62:                                               ; preds = %48, %44
  br label %63, !dbg !280

63:                                               ; preds = %62
  %64 = load i64, i64* %14, align 8, !dbg !281
  %65 = add i64 %64, 1, !dbg !281
  store i64 %65, i64* %14, align 8, !dbg !281
  br label %38, !dbg !282, !llvm.loop !283

66:                                               ; preds = %38
  %67 = load i64, i64* %11, align 8, !dbg !285
  %68 = load i64, i64* %12, align 8, !dbg !287
  %69 = icmp eq i64 %67, %68, !dbg !288
  br i1 %69, label %70, label %84, !dbg !289

70:                                               ; preds = %66
  %71 = load double*, double** %8, align 8, !dbg !290
  %72 = load i64, i64* %13, align 8, !dbg !292
  %73 = mul nsw i64 %72, %16, !dbg !290
  %74 = getelementptr inbounds double, double* %71, i64 %73, !dbg !290
  %75 = load i64, i64* %13, align 8, !dbg !293
  %76 = getelementptr inbounds double, double* %74, i64 %75, !dbg !290
  %77 = load double, double* %76, align 8, !dbg !290
  %78 = load double*, double** %9, align 8, !dbg !294
  %79 = load i64, i64* %13, align 8, !dbg !295
  %80 = mul nsw i64 %79, %18, !dbg !294
  %81 = getelementptr inbounds double, double* %78, i64 %80, !dbg !294
  %82 = load i64, i64* %13, align 8, !dbg !296
  %83 = getelementptr inbounds double, double* %81, i64 %82, !dbg !294
  store double %77, double* %83, align 8, !dbg !297
  br label %84, !dbg !298

84:                                               ; preds = %70, %66
  br label %85, !dbg !299

85:                                               ; preds = %84
  %86 = load i64, i64* %13, align 8, !dbg !300
  %87 = add i64 %86, 1, !dbg !300
  store i64 %87, i64* %13, align 8, !dbg !300
  br label %30, !dbg !301, !llvm.loop !302

88:                                               ; preds = %30
  br label %89, !dbg !304

89:                                               ; preds = %88
  %90 = load i64, i64* %12, align 8, !dbg !305
  %91 = load i64, i64* @block_size, align 8, !dbg !306
  %92 = add i64 %90, %91, !dbg !307
  store i64 %92, i64* %12, align 8, !dbg !308
  br label %24, !dbg !309, !llvm.loop !310

93:                                               ; preds = %24
  br label %94, !dbg !312

94:                                               ; preds = %93
  %95 = load i64, i64* %11, align 8, !dbg !313
  %96 = load i64, i64* @block_size, align 8, !dbg !314
  %97 = add i64 %95, %96, !dbg !315
  store i64 %97, i64* %11, align 8, !dbg !316
  br label %19, !dbg !317, !llvm.loop !318

98:                                               ; preds = %19
  ret void, !dbg !320
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8* noundef, i8* noundef, i32 noundef, i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal zeroext i1 @is_transpose(i64 noundef %0, i64 noundef %1, double* noundef %2, double* noundef %3) #0 !dbg !321 {
  %5 = alloca i1, align 1
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca double*, align 8
  %9 = alloca double*, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  store i64 %0, i64* %6, align 8
  call void @llvm.dbg.declare(metadata i64* %6, metadata !325, metadata !DIExpression()), !dbg !326
  store i64 %1, i64* %7, align 8
  call void @llvm.dbg.declare(metadata i64* %7, metadata !327, metadata !DIExpression()), !dbg !328
  store double* %2, double** %8, align 8
  call void @llvm.dbg.declare(metadata double** %8, metadata !329, metadata !DIExpression()), !dbg !330
  store double* %3, double** %9, align 8
  call void @llvm.dbg.declare(metadata double** %9, metadata !331, metadata !DIExpression()), !dbg !332
  %12 = load i64, i64* %7, align 8, !dbg !333
  %13 = load i64, i64* %6, align 8, !dbg !334
  %14 = load i64, i64* %6, align 8, !dbg !335
  %15 = load i64, i64* %7, align 8, !dbg !336
  call void @llvm.dbg.declare(metadata i64* %10, metadata !337, metadata !DIExpression()), !dbg !339
  store i64 0, i64* %10, align 8, !dbg !339
  br label %16, !dbg !340

16:                                               ; preds = %67, %4
  %17 = load i64, i64* %10, align 8, !dbg !341
  %18 = load i64, i64* %7, align 8, !dbg !343
  %19 = icmp ult i64 %17, %18, !dbg !344
  br i1 %19, label %20, label %70, !dbg !345

20:                                               ; preds = %16
  call void @llvm.dbg.declare(metadata i64* %11, metadata !346, metadata !DIExpression()), !dbg !349
  store i64 0, i64* %11, align 8, !dbg !349
  br label %21, !dbg !350

21:                                               ; preds = %63, %20
  %22 = load i64, i64* %11, align 8, !dbg !351
  %23 = load i64, i64* %6, align 8, !dbg !353
  %24 = icmp ult i64 %22, %23, !dbg !354
  br i1 %24, label %25, label %66, !dbg !355

25:                                               ; preds = %21
  %26 = load double*, double** %8, align 8, !dbg !356
  %27 = load i64, i64* %10, align 8, !dbg !359
  %28 = mul nsw i64 %27, %13, !dbg !356
  %29 = getelementptr inbounds double, double* %26, i64 %28, !dbg !356
  %30 = load i64, i64* %11, align 8, !dbg !360
  %31 = getelementptr inbounds double, double* %29, i64 %30, !dbg !356
  %32 = load double, double* %31, align 8, !dbg !356
  %33 = load double*, double** %9, align 8, !dbg !361
  %34 = load i64, i64* %11, align 8, !dbg !362
  %35 = mul nsw i64 %34, %15, !dbg !361
  %36 = getelementptr inbounds double, double* %33, i64 %35, !dbg !361
  %37 = load i64, i64* %10, align 8, !dbg !363
  %38 = getelementptr inbounds double, double* %36, i64 %37, !dbg !361
  %39 = load double, double* %38, align 8, !dbg !361
  %40 = fcmp une double %32, %39, !dbg !364
  br i1 %40, label %41, label %62, !dbg !365

41:                                               ; preds = %25
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !366
  %43 = load i64, i64* %11, align 8, !dbg !368
  %44 = load i64, i64* %10, align 8, !dbg !369
  %45 = load double*, double** %9, align 8, !dbg !370
  %46 = load i64, i64* %11, align 8, !dbg !371
  %47 = mul nsw i64 %46, %15, !dbg !370
  %48 = getelementptr inbounds double, double* %45, i64 %47, !dbg !370
  %49 = load i64, i64* %10, align 8, !dbg !372
  %50 = getelementptr inbounds double, double* %48, i64 %49, !dbg !370
  %51 = load double, double* %50, align 8, !dbg !370
  %52 = load i64, i64* %10, align 8, !dbg !373
  %53 = load i64, i64* %11, align 8, !dbg !374
  %54 = load double*, double** %8, align 8, !dbg !375
  %55 = load i64, i64* %10, align 8, !dbg !376
  %56 = mul nsw i64 %55, %13, !dbg !375
  %57 = getelementptr inbounds double, double* %54, i64 %56, !dbg !375
  %58 = load i64, i64* %11, align 8, !dbg !377
  %59 = getelementptr inbounds double, double* %57, i64 %58, !dbg !375
  %60 = load double, double* %59, align 8, !dbg !375
  %61 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %42, i8* noundef getelementptr inbounds ([72 x i8], [72 x i8]* @.str.7, i64 0, i64 0), i64 noundef %43, i64 noundef %44, double noundef %51, i64 noundef %52, i64 noundef %53, double noundef %60), !dbg !378
  store i1 false, i1* %5, align 1, !dbg !379
  br label %71, !dbg !379

62:                                               ; preds = %25
  br label %63, !dbg !380

63:                                               ; preds = %62
  %64 = load i64, i64* %11, align 8, !dbg !381
  %65 = add i64 %64, 1, !dbg !381
  store i64 %65, i64* %11, align 8, !dbg !381
  br label %21, !dbg !382, !llvm.loop !383

66:                                               ; preds = %21
  br label %67, !dbg !385

67:                                               ; preds = %66
  %68 = load i64, i64* %10, align 8, !dbg !386
  %69 = add i64 %68, 1, !dbg !386
  store i64 %69, i64* %10, align 8, !dbg !386
  br label %16, !dbg !387, !llvm.loop !388

70:                                               ; preds = %16
  store i1 true, i1* %5, align 1, !dbg !390
  br label %71, !dbg !390

71:                                               ; preds = %70, %41
  %72 = load i1, i1* %5, align 1, !dbg !391
  ret i1 %72, !dbg !391
}

declare i32 @fprintf(%struct._IO_FILE* noundef, i8* noundef, ...) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!8, !9, !10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "block_size", scope: !2, file: !3, line: 118, type: !5, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !4, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "trans.c", directory: "/afs/andrew.cmu.edu/usr16/gdeherme/private/15213/labs/cachelab-f23-gonzoherme")
!4 = !{!0}
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !7)
!6 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "")
!7 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"PIC Level", i32 2}
!12 = !{i32 7, !"PIE Level", i32 2}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!16 = distinct !DISubprogram(name: "registerFunctions", scope: !3, file: !3, line: 171, type: !17, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocation(line: 173, column: 5, scope: !16)
!21 = !DILocation(line: 176, column: 5, scope: !16)
!22 = !DILocation(line: 177, column: 5, scope: !16)
!23 = !DILocation(line: 178, column: 1, scope: !16)
!24 = distinct !DISubprogram(name: "transpose_submit", scope: !3, file: !3, line: 151, type: !25, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !19)
!25 = !DISubroutineType(types: !26)
!26 = !{null, !5, !5, !27, !27, !32}
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, elements: !30)
!29 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!30 = !{!31}
!31 = !DISubrange(count: -1)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!33 = !DILocalVariable(name: "M", arg: 1, scope: !24, file: !3, line: 151, type: !5)
!34 = !DILocation(line: 151, column: 37, scope: !24)
!35 = !DILocalVariable(name: "N", arg: 2, scope: !24, file: !3, line: 151, type: !5)
!36 = !DILocation(line: 151, column: 47, scope: !24)
!37 = !DILocalVariable(name: "A", arg: 3, scope: !24, file: !3, line: 151, type: !27)
!38 = !DILocation(line: 151, column: 57, scope: !24)
!39 = !DILocalVariable(name: "B", arg: 4, scope: !24, file: !3, line: 151, type: !27)
!40 = !DILocation(line: 151, column: 73, scope: !24)
!41 = !DILocalVariable(name: "tmp", arg: 5, scope: !24, file: !3, line: 152, type: !32)
!42 = !DILocation(line: 152, column: 37, scope: !24)
!43 = !DILocation(line: 151, column: 59, scope: !24)
!44 = !DILocation(line: 151, column: 62, scope: !24)
!45 = !DILocation(line: 151, column: 75, scope: !24)
!46 = !DILocation(line: 151, column: 78, scope: !24)
!47 = !DILocation(line: 154, column: 9, scope: !48)
!48 = distinct !DILexicalBlock(scope: !24, file: !3, line: 154, column: 9)
!49 = !DILocation(line: 154, column: 14, scope: !48)
!50 = !DILocation(line: 154, column: 11, scope: !48)
!51 = !DILocation(line: 154, column: 16, scope: !48)
!52 = !DILocation(line: 154, column: 20, scope: !48)
!53 = !DILocation(line: 154, column: 22, scope: !48)
!54 = !DILocation(line: 154, column: 28, scope: !48)
!55 = !DILocation(line: 154, column: 31, scope: !48)
!56 = !DILocation(line: 154, column: 33, scope: !48)
!57 = !DILocation(line: 154, column: 9, scope: !24)
!58 = !DILocation(line: 156, column: 20, scope: !59)
!59 = distinct !DILexicalBlock(scope: !48, file: !3, line: 154, column: 43)
!60 = !DILocation(line: 156, column: 23, scope: !59)
!61 = !DILocation(line: 156, column: 26, scope: !59)
!62 = !DILocation(line: 156, column: 29, scope: !59)
!63 = !DILocation(line: 156, column: 32, scope: !59)
!64 = !DILocation(line: 156, column: 9, scope: !59)
!65 = !DILocation(line: 157, column: 5, scope: !59)
!66 = !DILocation(line: 160, column: 19, scope: !67)
!67 = distinct !DILexicalBlock(scope: !48, file: !3, line: 159, column: 10)
!68 = !DILocation(line: 160, column: 22, scope: !67)
!69 = !DILocation(line: 160, column: 25, scope: !67)
!70 = !DILocation(line: 160, column: 28, scope: !67)
!71 = !DILocation(line: 160, column: 31, scope: !67)
!72 = !DILocation(line: 160, column: 9, scope: !67)
!73 = !DILocation(line: 162, column: 1, scope: !24)
!74 = distinct !DISubprogram(name: "trans_basic", scope: !3, file: !3, line: 81, type: !25, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !19)
!75 = !DILocalVariable(name: "M", arg: 1, scope: !74, file: !3, line: 81, type: !5)
!76 = !DILocation(line: 81, column: 32, scope: !74)
!77 = !DILocalVariable(name: "N", arg: 2, scope: !74, file: !3, line: 81, type: !5)
!78 = !DILocation(line: 81, column: 42, scope: !74)
!79 = !DILocalVariable(name: "A", arg: 3, scope: !74, file: !3, line: 81, type: !27)
!80 = !DILocation(line: 81, column: 52, scope: !74)
!81 = !DILocalVariable(name: "B", arg: 4, scope: !74, file: !3, line: 81, type: !27)
!82 = !DILocation(line: 81, column: 68, scope: !74)
!83 = !DILocalVariable(name: "tmp", arg: 5, scope: !74, file: !3, line: 82, type: !32)
!84 = !DILocation(line: 82, column: 32, scope: !74)
!85 = !DILocation(line: 81, column: 54, scope: !74)
!86 = !DILocation(line: 81, column: 57, scope: !74)
!87 = !DILocation(line: 81, column: 70, scope: !74)
!88 = !DILocation(line: 81, column: 73, scope: !74)
!89 = !DILocation(line: 83, column: 5, scope: !74)
!90 = !DILocation(line: 84, column: 5, scope: !74)
!91 = !DILocalVariable(name: "i", scope: !92, file: !3, line: 86, type: !5)
!92 = distinct !DILexicalBlock(scope: !74, file: !3, line: 86, column: 5)
!93 = !DILocation(line: 86, column: 17, scope: !92)
!94 = !DILocation(line: 86, column: 10, scope: !92)
!95 = !DILocation(line: 86, column: 24, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !3, line: 86, column: 5)
!97 = !DILocation(line: 86, column: 28, scope: !96)
!98 = !DILocation(line: 86, column: 26, scope: !96)
!99 = !DILocation(line: 86, column: 5, scope: !92)
!100 = !DILocalVariable(name: "j", scope: !101, file: !3, line: 87, type: !5)
!101 = distinct !DILexicalBlock(scope: !102, file: !3, line: 87, column: 9)
!102 = distinct !DILexicalBlock(scope: !96, file: !3, line: 86, column: 36)
!103 = !DILocation(line: 87, column: 21, scope: !101)
!104 = !DILocation(line: 87, column: 14, scope: !101)
!105 = !DILocation(line: 87, column: 28, scope: !106)
!106 = distinct !DILexicalBlock(scope: !101, file: !3, line: 87, column: 9)
!107 = !DILocation(line: 87, column: 32, scope: !106)
!108 = !DILocation(line: 87, column: 30, scope: !106)
!109 = !DILocation(line: 87, column: 9, scope: !101)
!110 = !DILocation(line: 88, column: 23, scope: !111)
!111 = distinct !DILexicalBlock(scope: !106, file: !3, line: 87, column: 40)
!112 = !DILocation(line: 88, column: 25, scope: !111)
!113 = !DILocation(line: 88, column: 28, scope: !111)
!114 = !DILocation(line: 88, column: 13, scope: !111)
!115 = !DILocation(line: 88, column: 15, scope: !111)
!116 = !DILocation(line: 88, column: 18, scope: !111)
!117 = !DILocation(line: 88, column: 21, scope: !111)
!118 = !DILocation(line: 89, column: 9, scope: !111)
!119 = !DILocation(line: 87, column: 36, scope: !106)
!120 = !DILocation(line: 87, column: 9, scope: !106)
!121 = distinct !{!121, !109, !122}
!122 = !DILocation(line: 89, column: 9, scope: !101)
!123 = !DILocation(line: 90, column: 5, scope: !102)
!124 = !DILocation(line: 86, column: 32, scope: !96)
!125 = !DILocation(line: 86, column: 5, scope: !96)
!126 = distinct !{!126, !99, !127}
!127 = !DILocation(line: 90, column: 5, scope: !92)
!128 = !DILocation(line: 92, column: 5, scope: !74)
!129 = !DILocation(line: 93, column: 1, scope: !74)
!130 = distinct !DISubprogram(name: "trans_tmp", scope: !3, file: !3, line: 101, type: !25, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !19)
!131 = !DILocalVariable(name: "M", arg: 1, scope: !130, file: !3, line: 101, type: !5)
!132 = !DILocation(line: 101, column: 30, scope: !130)
!133 = !DILocalVariable(name: "N", arg: 2, scope: !130, file: !3, line: 101, type: !5)
!134 = !DILocation(line: 101, column: 40, scope: !130)
!135 = !DILocalVariable(name: "A", arg: 3, scope: !130, file: !3, line: 101, type: !27)
!136 = !DILocation(line: 101, column: 50, scope: !130)
!137 = !DILocalVariable(name: "B", arg: 4, scope: !130, file: !3, line: 101, type: !27)
!138 = !DILocation(line: 101, column: 66, scope: !130)
!139 = !DILocalVariable(name: "tmp", arg: 5, scope: !130, file: !3, line: 102, type: !32)
!140 = !DILocation(line: 102, column: 30, scope: !130)
!141 = !DILocation(line: 101, column: 52, scope: !130)
!142 = !DILocation(line: 101, column: 55, scope: !130)
!143 = !DILocation(line: 101, column: 68, scope: !130)
!144 = !DILocation(line: 101, column: 71, scope: !130)
!145 = !DILocation(line: 103, column: 5, scope: !130)
!146 = !DILocation(line: 104, column: 5, scope: !130)
!147 = !DILocalVariable(name: "i", scope: !148, file: !3, line: 106, type: !5)
!148 = distinct !DILexicalBlock(scope: !130, file: !3, line: 106, column: 5)
!149 = !DILocation(line: 106, column: 17, scope: !148)
!150 = !DILocation(line: 106, column: 10, scope: !148)
!151 = !DILocation(line: 106, column: 24, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !3, line: 106, column: 5)
!153 = !DILocation(line: 106, column: 28, scope: !152)
!154 = !DILocation(line: 106, column: 26, scope: !152)
!155 = !DILocation(line: 106, column: 5, scope: !148)
!156 = !DILocalVariable(name: "j", scope: !157, file: !3, line: 107, type: !5)
!157 = distinct !DILexicalBlock(scope: !158, file: !3, line: 107, column: 9)
!158 = distinct !DILexicalBlock(scope: !152, file: !3, line: 106, column: 36)
!159 = !DILocation(line: 107, column: 21, scope: !157)
!160 = !DILocation(line: 107, column: 14, scope: !157)
!161 = !DILocation(line: 107, column: 28, scope: !162)
!162 = distinct !DILexicalBlock(scope: !157, file: !3, line: 107, column: 9)
!163 = !DILocation(line: 107, column: 32, scope: !162)
!164 = !DILocation(line: 107, column: 30, scope: !162)
!165 = !DILocation(line: 107, column: 9, scope: !157)
!166 = !DILocalVariable(name: "di", scope: !167, file: !3, line: 108, type: !5)
!167 = distinct !DILexicalBlock(scope: !162, file: !3, line: 107, column: 40)
!168 = !DILocation(line: 108, column: 20, scope: !167)
!169 = !DILocation(line: 108, column: 25, scope: !167)
!170 = !DILocation(line: 108, column: 27, scope: !167)
!171 = !DILocalVariable(name: "dj", scope: !167, file: !3, line: 109, type: !5)
!172 = !DILocation(line: 109, column: 20, scope: !167)
!173 = !DILocation(line: 109, column: 25, scope: !167)
!174 = !DILocation(line: 109, column: 27, scope: !167)
!175 = !DILocation(line: 110, column: 32, scope: !167)
!176 = !DILocation(line: 110, column: 34, scope: !167)
!177 = !DILocation(line: 110, column: 37, scope: !167)
!178 = !DILocation(line: 110, column: 13, scope: !167)
!179 = !DILocation(line: 110, column: 21, scope: !167)
!180 = !DILocation(line: 110, column: 19, scope: !167)
!181 = !DILocation(line: 110, column: 26, scope: !167)
!182 = !DILocation(line: 110, column: 24, scope: !167)
!183 = !DILocation(line: 110, column: 30, scope: !167)
!184 = !DILocation(line: 111, column: 23, scope: !167)
!185 = !DILocation(line: 111, column: 31, scope: !167)
!186 = !DILocation(line: 111, column: 29, scope: !167)
!187 = !DILocation(line: 111, column: 36, scope: !167)
!188 = !DILocation(line: 111, column: 34, scope: !167)
!189 = !DILocation(line: 111, column: 13, scope: !167)
!190 = !DILocation(line: 111, column: 15, scope: !167)
!191 = !DILocation(line: 111, column: 18, scope: !167)
!192 = !DILocation(line: 111, column: 21, scope: !167)
!193 = !DILocation(line: 112, column: 9, scope: !167)
!194 = !DILocation(line: 107, column: 36, scope: !162)
!195 = !DILocation(line: 107, column: 9, scope: !162)
!196 = distinct !{!196, !165, !197}
!197 = !DILocation(line: 112, column: 9, scope: !157)
!198 = !DILocation(line: 113, column: 5, scope: !158)
!199 = !DILocation(line: 106, column: 32, scope: !152)
!200 = !DILocation(line: 106, column: 5, scope: !152)
!201 = distinct !{!201, !155, !202}
!202 = !DILocation(line: 113, column: 5, scope: !148)
!203 = !DILocation(line: 115, column: 5, scope: !130)
!204 = !DILocation(line: 116, column: 1, scope: !130)
!205 = distinct !DISubprogram(name: "cool_trans", scope: !3, file: !3, line: 120, type: !25, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !19)
!206 = !DILocalVariable(name: "M", arg: 1, scope: !205, file: !3, line: 120, type: !5)
!207 = !DILocation(line: 120, column: 31, scope: !205)
!208 = !DILocalVariable(name: "N", arg: 2, scope: !205, file: !3, line: 120, type: !5)
!209 = !DILocation(line: 120, column: 41, scope: !205)
!210 = !DILocalVariable(name: "A", arg: 3, scope: !205, file: !3, line: 120, type: !27)
!211 = !DILocation(line: 120, column: 51, scope: !205)
!212 = !DILocalVariable(name: "B", arg: 4, scope: !205, file: !3, line: 120, type: !27)
!213 = !DILocation(line: 120, column: 67, scope: !205)
!214 = !DILocalVariable(name: "tmp", arg: 5, scope: !205, file: !3, line: 121, type: !32)
!215 = !DILocation(line: 121, column: 31, scope: !205)
!216 = !DILocation(line: 120, column: 53, scope: !205)
!217 = !DILocation(line: 120, column: 56, scope: !205)
!218 = !DILocation(line: 120, column: 69, scope: !205)
!219 = !DILocation(line: 120, column: 72, scope: !205)
!220 = !DILocalVariable(name: "i", scope: !221, file: !3, line: 124, type: !5)
!221 = distinct !DILexicalBlock(scope: !205, file: !3, line: 124, column: 5)
!222 = !DILocation(line: 124, column: 17, scope: !221)
!223 = !DILocation(line: 124, column: 10, scope: !221)
!224 = !DILocation(line: 124, column: 24, scope: !225)
!225 = distinct !DILexicalBlock(scope: !221, file: !3, line: 124, column: 5)
!226 = !DILocation(line: 124, column: 28, scope: !225)
!227 = !DILocation(line: 124, column: 26, scope: !225)
!228 = !DILocation(line: 124, column: 5, scope: !221)
!229 = !DILocalVariable(name: "j", scope: !230, file: !3, line: 125, type: !5)
!230 = distinct !DILexicalBlock(scope: !231, file: !3, line: 125, column: 9)
!231 = distinct !DILexicalBlock(scope: !225, file: !3, line: 124, column: 51)
!232 = !DILocation(line: 125, column: 21, scope: !230)
!233 = !DILocation(line: 125, column: 14, scope: !230)
!234 = !DILocation(line: 125, column: 28, scope: !235)
!235 = distinct !DILexicalBlock(scope: !230, file: !3, line: 125, column: 9)
!236 = !DILocation(line: 125, column: 32, scope: !235)
!237 = !DILocation(line: 125, column: 30, scope: !235)
!238 = !DILocation(line: 125, column: 9, scope: !230)
!239 = !DILocalVariable(name: "block_i", scope: !240, file: !3, line: 128, type: !5)
!240 = distinct !DILexicalBlock(scope: !241, file: !3, line: 128, column: 13)
!241 = distinct !DILexicalBlock(scope: !235, file: !3, line: 125, column: 55)
!242 = !DILocation(line: 128, column: 25, scope: !240)
!243 = !DILocation(line: 128, column: 35, scope: !240)
!244 = !DILocation(line: 128, column: 18, scope: !240)
!245 = !DILocation(line: 128, column: 38, scope: !246)
!246 = distinct !DILexicalBlock(scope: !240, file: !3, line: 128, column: 13)
!247 = !DILocation(line: 128, column: 48, scope: !246)
!248 = !DILocation(line: 128, column: 52, scope: !246)
!249 = !DILocation(line: 128, column: 50, scope: !246)
!250 = !DILocation(line: 128, column: 46, scope: !246)
!251 = !DILocation(line: 128, column: 13, scope: !240)
!252 = !DILocalVariable(name: "block_j", scope: !253, file: !3, line: 129, type: !5)
!253 = distinct !DILexicalBlock(scope: !254, file: !3, line: 129, column: 17)
!254 = distinct !DILexicalBlock(scope: !246, file: !3, line: 128, column: 75)
!255 = !DILocation(line: 129, column: 29, scope: !253)
!256 = !DILocation(line: 129, column: 39, scope: !253)
!257 = !DILocation(line: 129, column: 22, scope: !253)
!258 = !DILocation(line: 129, column: 42, scope: !259)
!259 = distinct !DILexicalBlock(scope: !253, file: !3, line: 129, column: 17)
!260 = !DILocation(line: 129, column: 52, scope: !259)
!261 = !DILocation(line: 129, column: 56, scope: !259)
!262 = !DILocation(line: 129, column: 54, scope: !259)
!263 = !DILocation(line: 129, column: 50, scope: !259)
!264 = !DILocation(line: 129, column: 17, scope: !253)
!265 = !DILocation(line: 132, column: 25, scope: !266)
!266 = distinct !DILexicalBlock(scope: !267, file: !3, line: 132, column: 25)
!267 = distinct !DILexicalBlock(scope: !259, file: !3, line: 129, column: 79)
!268 = !DILocation(line: 132, column: 36, scope: !266)
!269 = !DILocation(line: 132, column: 33, scope: !266)
!270 = !DILocation(line: 132, column: 25, scope: !267)
!271 = !DILocation(line: 133, column: 47, scope: !272)
!272 = distinct !DILexicalBlock(scope: !266, file: !3, line: 132, column: 45)
!273 = !DILocation(line: 133, column: 49, scope: !272)
!274 = !DILocation(line: 133, column: 58, scope: !272)
!275 = !DILocation(line: 133, column: 25, scope: !272)
!276 = !DILocation(line: 133, column: 27, scope: !272)
!277 = !DILocation(line: 133, column: 36, scope: !272)
!278 = !DILocation(line: 133, column: 45, scope: !272)
!279 = !DILocation(line: 134, column: 21, scope: !272)
!280 = !DILocation(line: 135, column: 17, scope: !267)
!281 = !DILocation(line: 129, column: 75, scope: !259)
!282 = !DILocation(line: 129, column: 17, scope: !259)
!283 = distinct !{!283, !264, !284}
!284 = !DILocation(line: 135, column: 17, scope: !253)
!285 = !DILocation(line: 136, column: 21, scope: !286)
!286 = distinct !DILexicalBlock(scope: !254, file: !3, line: 136, column: 21)
!287 = !DILocation(line: 136, column: 26, scope: !286)
!288 = !DILocation(line: 136, column: 23, scope: !286)
!289 = !DILocation(line: 136, column: 21, scope: !254)
!290 = !DILocation(line: 137, column: 43, scope: !291)
!291 = distinct !DILexicalBlock(scope: !286, file: !3, line: 136, column: 29)
!292 = !DILocation(line: 137, column: 45, scope: !291)
!293 = !DILocation(line: 137, column: 54, scope: !291)
!294 = !DILocation(line: 137, column: 21, scope: !291)
!295 = !DILocation(line: 137, column: 23, scope: !291)
!296 = !DILocation(line: 137, column: 32, scope: !291)
!297 = !DILocation(line: 137, column: 41, scope: !291)
!298 = !DILocation(line: 138, column: 17, scope: !291)
!299 = !DILocation(line: 139, column: 13, scope: !254)
!300 = !DILocation(line: 128, column: 71, scope: !246)
!301 = !DILocation(line: 128, column: 13, scope: !246)
!302 = distinct !{!302, !251, !303}
!303 = !DILocation(line: 139, column: 13, scope: !240)
!304 = !DILocation(line: 140, column: 9, scope: !241)
!305 = !DILocation(line: 125, column: 39, scope: !235)
!306 = !DILocation(line: 125, column: 43, scope: !235)
!307 = !DILocation(line: 125, column: 41, scope: !235)
!308 = !DILocation(line: 125, column: 37, scope: !235)
!309 = !DILocation(line: 125, column: 9, scope: !235)
!310 = distinct !{!310, !238, !311}
!311 = !DILocation(line: 140, column: 9, scope: !230)
!312 = !DILocation(line: 141, column: 5, scope: !231)
!313 = !DILocation(line: 124, column: 35, scope: !225)
!314 = !DILocation(line: 124, column: 39, scope: !225)
!315 = !DILocation(line: 124, column: 37, scope: !225)
!316 = !DILocation(line: 124, column: 33, scope: !225)
!317 = !DILocation(line: 124, column: 5, scope: !225)
!318 = distinct !{!318, !228, !319}
!319 = !DILocation(line: 141, column: 5, scope: !221)
!320 = !DILocation(line: 142, column: 1, scope: !205)
!321 = distinct !DISubprogram(name: "is_transpose", scope: !3, file: !3, line: 52, type: !322, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !19)
!322 = !DISubroutineType(types: !323)
!323 = !{!324, !5, !5, !27, !27}
!324 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!325 = !DILocalVariable(name: "M", arg: 1, scope: !321, file: !3, line: 52, type: !5)
!326 = !DILocation(line: 52, column: 33, scope: !321)
!327 = !DILocalVariable(name: "N", arg: 2, scope: !321, file: !3, line: 52, type: !5)
!328 = !DILocation(line: 52, column: 43, scope: !321)
!329 = !DILocalVariable(name: "A", arg: 3, scope: !321, file: !3, line: 52, type: !27)
!330 = !DILocation(line: 52, column: 53, scope: !321)
!331 = !DILocalVariable(name: "B", arg: 4, scope: !321, file: !3, line: 52, type: !27)
!332 = !DILocation(line: 52, column: 69, scope: !321)
!333 = !DILocation(line: 52, column: 55, scope: !321)
!334 = !DILocation(line: 52, column: 58, scope: !321)
!335 = !DILocation(line: 52, column: 71, scope: !321)
!336 = !DILocation(line: 52, column: 74, scope: !321)
!337 = !DILocalVariable(name: "i", scope: !338, file: !3, line: 53, type: !5)
!338 = distinct !DILexicalBlock(scope: !321, file: !3, line: 53, column: 5)
!339 = !DILocation(line: 53, column: 17, scope: !338)
!340 = !DILocation(line: 53, column: 10, scope: !338)
!341 = !DILocation(line: 53, column: 24, scope: !342)
!342 = distinct !DILexicalBlock(scope: !338, file: !3, line: 53, column: 5)
!343 = !DILocation(line: 53, column: 28, scope: !342)
!344 = !DILocation(line: 53, column: 26, scope: !342)
!345 = !DILocation(line: 53, column: 5, scope: !338)
!346 = !DILocalVariable(name: "j", scope: !347, file: !3, line: 54, type: !5)
!347 = distinct !DILexicalBlock(scope: !348, file: !3, line: 54, column: 9)
!348 = distinct !DILexicalBlock(scope: !342, file: !3, line: 53, column: 36)
!349 = !DILocation(line: 54, column: 21, scope: !347)
!350 = !DILocation(line: 54, column: 14, scope: !347)
!351 = !DILocation(line: 54, column: 28, scope: !352)
!352 = distinct !DILexicalBlock(scope: !347, file: !3, line: 54, column: 9)
!353 = !DILocation(line: 54, column: 32, scope: !352)
!354 = !DILocation(line: 54, column: 30, scope: !352)
!355 = !DILocation(line: 54, column: 9, scope: !347)
!356 = !DILocation(line: 55, column: 17, scope: !357)
!357 = distinct !DILexicalBlock(scope: !358, file: !3, line: 55, column: 17)
!358 = distinct !DILexicalBlock(scope: !352, file: !3, line: 54, column: 40)
!359 = !DILocation(line: 55, column: 19, scope: !357)
!360 = !DILocation(line: 55, column: 22, scope: !357)
!361 = !DILocation(line: 55, column: 28, scope: !357)
!362 = !DILocation(line: 55, column: 30, scope: !357)
!363 = !DILocation(line: 55, column: 33, scope: !357)
!364 = !DILocation(line: 55, column: 25, scope: !357)
!365 = !DILocation(line: 55, column: 17, scope: !358)
!366 = !DILocation(line: 56, column: 25, scope: !367)
!367 = distinct !DILexicalBlock(scope: !357, file: !3, line: 55, column: 37)
!368 = !DILocation(line: 59, column: 25, scope: !367)
!369 = !DILocation(line: 59, column: 28, scope: !367)
!370 = !DILocation(line: 59, column: 31, scope: !367)
!371 = !DILocation(line: 59, column: 33, scope: !367)
!372 = !DILocation(line: 59, column: 36, scope: !367)
!373 = !DILocation(line: 59, column: 40, scope: !367)
!374 = !DILocation(line: 59, column: 43, scope: !367)
!375 = !DILocation(line: 59, column: 46, scope: !367)
!376 = !DILocation(line: 59, column: 48, scope: !367)
!377 = !DILocation(line: 59, column: 51, scope: !367)
!378 = !DILocation(line: 56, column: 17, scope: !367)
!379 = !DILocation(line: 60, column: 17, scope: !367)
!380 = !DILocation(line: 62, column: 9, scope: !358)
!381 = !DILocation(line: 54, column: 35, scope: !352)
!382 = !DILocation(line: 54, column: 9, scope: !352)
!383 = distinct !{!383, !355, !384}
!384 = !DILocation(line: 62, column: 9, scope: !347)
!385 = !DILocation(line: 63, column: 5, scope: !348)
!386 = !DILocation(line: 53, column: 32, scope: !342)
!387 = !DILocation(line: 53, column: 5, scope: !342)
!388 = distinct !{!388, !345, !389}
!389 = !DILocation(line: 63, column: 5, scope: !338)
!390 = !DILocation(line: 64, column: 5, scope: !321)
!391 = !DILocation(line: 65, column: 1, scope: !321)
