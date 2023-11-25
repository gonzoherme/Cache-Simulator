; ModuleID = 'trans.c'
source_filename = "trans.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@block_size = dso_local local_unnamed_addr global i64 8, align 8, !dbg !0
@.str = private unnamed_addr constant [21 x i8] c"Transpose submission\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Basic transpose\00", align 1
@.str.2 = private unnamed_addr constant [36 x i8] c"Transpose using the temporary array\00", align 1

; Function Attrs: nounwind uwtable
define dso_local void @registerFunctions() local_unnamed_addr #0 !dbg !15 {
  tail call void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef nonnull @transpose_submit, i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)) #4, !dbg !19
  tail call void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef nonnull @trans_basic, i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)) #4, !dbg !20
  tail call void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef nonnull @trans_tmp, i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)) #4, !dbg !21
  ret void, !dbg !22
}

declare !dbg !23 void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef, i8* noundef) local_unnamed_addr #1

; Function Attrs: nofree norecurse nosync nounwind uwtable
define internal void @transpose_submit(i64 noundef %0, i64 noundef %1, double* nocapture noundef readonly %2, double* nocapture noundef writeonly %3, double* nocapture noundef writeonly %4) #2 !dbg !39 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !41, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.value(metadata i64 %1, metadata !42, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.value(metadata double* %2, metadata !43, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.value(metadata double* %3, metadata !44, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.value(metadata double* %4, metadata !45, metadata !DIExpression()), !dbg !46
  %6 = icmp eq i64 %0, %1, !dbg !47
  br i1 %6, label %7, label %85, !dbg !49

7:                                                ; preds = %5
  switch i64 %0, label %85 [
    i64 1024, label %8
    i64 32, label %8
  ], !dbg !50

8:                                                ; preds = %7, %7
  call void @llvm.dbg.value(metadata i64 %0, metadata !51, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.value(metadata i64 %1, metadata !54, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.value(metadata double* %2, metadata !55, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.value(metadata double* %3, metadata !56, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.value(metadata double* undef, metadata !57, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.value(metadata i64 0, metadata !58, metadata !DIExpression()), !dbg !75
  %9 = load i64, i64* @block_size, align 8
  br label %10, !dbg !76

10:                                               ; preds = %8, %19
  %11 = phi i64 [ %21, %19 ], [ %9, %8 ]
  %12 = phi i64 [ %13, %19 ], [ 0, %8 ]
  call void @llvm.dbg.value(metadata i64 %12, metadata !58, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.value(metadata i64 0, metadata !60, metadata !DIExpression()), !dbg !77
  %13 = add i64 %12, %9
  %14 = icmp ult i64 %12, %13
  br i1 %14, label %22, label %15, !dbg !78

15:                                               ; preds = %10, %15
  %16 = phi i64 [ %17, %15 ], [ 0, %10 ]
  call void @llvm.dbg.value(metadata i64 %16, metadata !60, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.value(metadata i64 %12, metadata !64, metadata !DIExpression()), !dbg !79
  %17 = add i64 %16, %9, !dbg !80
  call void @llvm.dbg.value(metadata i64 %17, metadata !60, metadata !DIExpression()), !dbg !77
  %18 = icmp ult i64 %17, %0, !dbg !81
  br i1 %18, label %15, label %19, !dbg !76, !llvm.loop !82

19:                                               ; preds = %15, %29
  call void @llvm.dbg.value(metadata i64 %13, metadata !58, metadata !DIExpression()), !dbg !75
  %20 = icmp ult i64 %13, %0, !dbg !85
  %21 = add i64 %11, %9, !dbg !86
  br i1 %20, label %10, label %110, !dbg !86, !llvm.loop !87

22:                                               ; preds = %10, %29
  %23 = phi i64 [ %31, %29 ], [ %9, %10 ]
  %24 = phi i64 [ %25, %29 ], [ 0, %10 ]
  call void @llvm.dbg.value(metadata i64 %24, metadata !60, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.value(metadata i64 %12, metadata !64, metadata !DIExpression()), !dbg !79
  %25 = add i64 %24, %9
  %26 = icmp ult i64 %24, %25
  %27 = icmp eq i64 %12, %24
  br i1 %26, label %32, label %28, !dbg !89

28:                                               ; preds = %22
  br i1 %27, label %52, label %29, !dbg !90

29:                                               ; preds = %52, %49, %78, %28
  call void @llvm.dbg.value(metadata i64 %25, metadata !60, metadata !DIExpression()), !dbg !77
  %30 = icmp ult i64 %25, %0, !dbg !81
  %31 = add i64 %23, %9, !dbg !76
  br i1 %30, label %22, label %19, !dbg !76, !llvm.loop !91

32:                                               ; preds = %22
  br i1 %27, label %62, label %33, !dbg !90

33:                                               ; preds = %32, %49
  %34 = phi i64 [ %50, %49 ], [ %12, %32 ]
  call void @llvm.dbg.value(metadata i64 %34, metadata !64, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.value(metadata i64 %24, metadata !68, metadata !DIExpression()), !dbg !92
  %35 = mul nsw i64 %34, %0
  %36 = getelementptr inbounds double, double* %2, i64 %35
  %37 = getelementptr inbounds double, double* %3, i64 %34
  br label %38, !dbg !89

38:                                               ; preds = %46, %33
  %39 = phi i64 [ %24, %33 ], [ %47, %46 ]
  call void @llvm.dbg.value(metadata i64 %39, metadata !68, metadata !DIExpression()), !dbg !92
  %40 = icmp eq i64 %34, %39, !dbg !93
  br i1 %40, label %46, label %41, !dbg !97

41:                                               ; preds = %38
  %42 = getelementptr inbounds double, double* %36, i64 %39, !dbg !98
  %43 = load double, double* %42, align 8, !dbg !98, !tbaa !100
  %44 = mul nsw i64 %39, %0, !dbg !104
  %45 = getelementptr inbounds double, double* %37, i64 %44, !dbg !104
  store double %43, double* %45, align 8, !dbg !105, !tbaa !100
  br label %46, !dbg !106

46:                                               ; preds = %41, %38
  %47 = add nuw i64 %39, 1, !dbg !107
  call void @llvm.dbg.value(metadata i64 %47, metadata !68, metadata !DIExpression()), !dbg !92
  %48 = icmp eq i64 %47, %23, !dbg !108
  br i1 %48, label %49, label %38, !dbg !89, !llvm.loop !109

49:                                               ; preds = %46
  %50 = add i64 %34, 1, !dbg !111
  call void @llvm.dbg.value(metadata i64 %50, metadata !64, metadata !DIExpression()), !dbg !79
  %51 = icmp eq i64 %50, %11, !dbg !112
  br i1 %51, label %29, label %33, !dbg !78, !llvm.loop !113

52:                                               ; preds = %28, %52
  %53 = phi i64 [ %60, %52 ], [ %12, %28 ]
  call void @llvm.dbg.value(metadata i64 %53, metadata !64, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.value(metadata i64 %24, metadata !68, metadata !DIExpression()), !dbg !92
  %54 = mul nsw i64 %53, %0, !dbg !115
  %55 = getelementptr inbounds double, double* %2, i64 %54, !dbg !115
  %56 = getelementptr inbounds double, double* %55, i64 %53, !dbg !115
  %57 = load double, double* %56, align 8, !dbg !115, !tbaa !100
  %58 = getelementptr inbounds double, double* %3, i64 %54, !dbg !118
  %59 = getelementptr inbounds double, double* %58, i64 %53, !dbg !118
  store double %57, double* %59, align 8, !dbg !119, !tbaa !100
  %60 = add i64 %53, 1, !dbg !111
  call void @llvm.dbg.value(metadata i64 %60, metadata !64, metadata !DIExpression()), !dbg !79
  %61 = icmp eq i64 %60, %11, !dbg !112
  br i1 %61, label %29, label %52, !dbg !78, !llvm.loop !120

62:                                               ; preds = %32, %78
  %63 = phi i64 [ %83, %78 ], [ %12, %32 ]
  call void @llvm.dbg.value(metadata i64 %63, metadata !64, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.value(metadata i64 %24, metadata !68, metadata !DIExpression()), !dbg !92
  %64 = mul nsw i64 %63, %0
  %65 = getelementptr inbounds double, double* %2, i64 %64
  %66 = getelementptr inbounds double, double* %3, i64 %63
  br label %67, !dbg !89

67:                                               ; preds = %75, %62
  %68 = phi i64 [ %12, %62 ], [ %76, %75 ]
  call void @llvm.dbg.value(metadata i64 %68, metadata !68, metadata !DIExpression()), !dbg !92
  %69 = icmp eq i64 %63, %68, !dbg !93
  br i1 %69, label %75, label %70, !dbg !97

70:                                               ; preds = %67
  %71 = getelementptr inbounds double, double* %65, i64 %68, !dbg !98
  %72 = load double, double* %71, align 8, !dbg !98, !tbaa !100
  %73 = mul nsw i64 %68, %0, !dbg !104
  %74 = getelementptr inbounds double, double* %66, i64 %73, !dbg !104
  store double %72, double* %74, align 8, !dbg !105, !tbaa !100
  br label %75, !dbg !106

75:                                               ; preds = %70, %67
  %76 = add nuw i64 %68, 1, !dbg !107
  call void @llvm.dbg.value(metadata i64 %76, metadata !68, metadata !DIExpression()), !dbg !92
  %77 = icmp eq i64 %76, %23, !dbg !108
  br i1 %77, label %78, label %67, !dbg !89, !llvm.loop !121

78:                                               ; preds = %75
  %79 = getelementptr inbounds double, double* %65, i64 %63, !dbg !115
  %80 = load double, double* %79, align 8, !dbg !115, !tbaa !100
  %81 = getelementptr inbounds double, double* %3, i64 %64, !dbg !118
  %82 = getelementptr inbounds double, double* %81, i64 %63, !dbg !118
  store double %80, double* %82, align 8, !dbg !119, !tbaa !100
  %83 = add i64 %63, 1, !dbg !111
  call void @llvm.dbg.value(metadata i64 %83, metadata !64, metadata !DIExpression()), !dbg !79
  %84 = icmp eq i64 %83, %11, !dbg !112
  br i1 %84, label %29, label %62, !dbg !78, !llvm.loop !122

85:                                               ; preds = %7, %5
  call void @llvm.dbg.value(metadata i64 %0, metadata !123, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.value(metadata i64 %1, metadata !126, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.value(metadata double* %2, metadata !127, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.value(metadata double* %3, metadata !128, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.value(metadata double* %4, metadata !129, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.value(metadata i64 0, metadata !130, metadata !DIExpression()), !dbg !143
  %86 = icmp eq i64 %1, 0, !dbg !144
  %87 = icmp eq i64 %0, 0
  %88 = or i1 %87, %86, !dbg !145
  br i1 %88, label %110, label %89, !dbg !145

89:                                               ; preds = %85, %107
  %90 = phi i64 [ %108, %107 ], [ 0, %85 ]
  call void @llvm.dbg.value(metadata i64 %90, metadata !130, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.value(metadata i64 0, metadata !132, metadata !DIExpression()), !dbg !146
  %91 = mul nsw i64 %90, %0
  %92 = getelementptr inbounds double, double* %2, i64 %91
  %93 = shl i64 %90, 1
  %94 = and i64 %93, 2
  %95 = getelementptr inbounds double, double* %3, i64 %90
  br label %96, !dbg !147

96:                                               ; preds = %96, %89
  %97 = phi i64 [ 0, %89 ], [ %105, %96 ]
  call void @llvm.dbg.value(metadata i64 %97, metadata !132, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.value(metadata i64 %90, metadata !136, metadata !DIExpression(DW_OP_constu, 1, DW_OP_and, DW_OP_stack_value)), !dbg !148
  %98 = and i64 %97, 1, !dbg !149
  call void @llvm.dbg.value(metadata i64 %98, metadata !139, metadata !DIExpression()), !dbg !148
  %99 = getelementptr inbounds double, double* %92, i64 %97, !dbg !150
  %100 = load double, double* %99, align 8, !dbg !150, !tbaa !100
  %101 = or i64 %98, %94, !dbg !151
  %102 = getelementptr inbounds double, double* %4, i64 %101, !dbg !152
  store double %100, double* %102, align 8, !dbg !153, !tbaa !100
  %103 = mul nsw i64 %97, %1, !dbg !154
  %104 = getelementptr inbounds double, double* %95, i64 %103, !dbg !154
  store double %100, double* %104, align 8, !dbg !155, !tbaa !100
  %105 = add nuw i64 %97, 1, !dbg !156
  call void @llvm.dbg.value(metadata i64 %105, metadata !132, metadata !DIExpression()), !dbg !146
  %106 = icmp eq i64 %105, %0, !dbg !157
  br i1 %106, label %107, label %96, !dbg !147, !llvm.loop !158

107:                                              ; preds = %96
  %108 = add nuw i64 %90, 1, !dbg !160
  call void @llvm.dbg.value(metadata i64 %108, metadata !130, metadata !DIExpression()), !dbg !143
  %109 = icmp eq i64 %108, %1, !dbg !144
  br i1 %109, label %110, label %89, !dbg !145, !llvm.loop !161

110:                                              ; preds = %19, %107, %85
  ret void, !dbg !163
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define internal void @trans_basic(i64 noundef %0, i64 noundef %1, double* nocapture noundef readonly %2, double* nocapture noundef writeonly %3, double* nocapture noundef readnone %4) #2 !dbg !164 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !166, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.value(metadata i64 %1, metadata !167, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.value(metadata double* %2, metadata !168, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.value(metadata double* %3, metadata !169, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.value(metadata double* %4, metadata !170, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.value(metadata i64 0, metadata !171, metadata !DIExpression()), !dbg !178
  %6 = icmp eq i64 %1, 0, !dbg !179
  %7 = icmp eq i64 %0, 0
  %8 = or i1 %6, %7, !dbg !180
  br i1 %8, label %55, label %9, !dbg !180

9:                                                ; preds = %5
  %10 = icmp ugt i64 %0, 1
  %11 = icmp eq i64 %1, 1
  %12 = and i1 %10, %11
  %13 = and i64 %0, -2
  %14 = icmp eq i64 %13, %0
  br label %15, !dbg !180

15:                                               ; preds = %9, %52
  %16 = phi i64 [ %53, %52 ], [ 0, %9 ]
  call void @llvm.dbg.value(metadata i64 %16, metadata !171, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.value(metadata i64 0, metadata !173, metadata !DIExpression()), !dbg !181
  %17 = mul i64 %16, %0
  %18 = mul nsw i64 %16, %0
  %19 = getelementptr inbounds double, double* %2, i64 %18
  %20 = getelementptr inbounds double, double* %3, i64 %16
  br i1 %12, label %21, label %42, !dbg !182

21:                                               ; preds = %15
  %22 = add i64 %17, %0
  %23 = getelementptr double, double* %2, i64 %22
  %24 = getelementptr double, double* %2, i64 %17
  %25 = add i64 %16, %0
  %26 = getelementptr double, double* %3, i64 %25
  %27 = getelementptr double, double* %3, i64 %16
  %28 = icmp ult double* %27, %23, !dbg !182
  %29 = icmp ult double* %24, %26, !dbg !182
  %30 = and i1 %28, %29, !dbg !182
  br i1 %30, label %42, label %31

31:                                               ; preds = %21, %31
  %32 = phi i64 [ %39, %31 ], [ 0, %21 ], !dbg !183
  %33 = getelementptr inbounds double, double* %19, i64 %32, !dbg !183
  %34 = bitcast double* %33 to <2 x double>*, !dbg !185
  %35 = load <2 x double>, <2 x double>* %34, align 8, !dbg !185, !tbaa !100, !alias.scope !187
  %36 = mul nsw i64 %32, %1, !dbg !183
  %37 = getelementptr inbounds double, double* %20, i64 %36, !dbg !183
  %38 = bitcast double* %37 to <2 x double>*, !dbg !190
  store <2 x double> %35, <2 x double>* %38, align 8, !dbg !190, !tbaa !100, !alias.scope !191, !noalias !187
  %39 = add nuw i64 %32, 2, !dbg !183
  %40 = icmp eq i64 %39, %13, !dbg !183
  br i1 %40, label %41, label %31, !dbg !183, !llvm.loop !193

41:                                               ; preds = %31
  br i1 %14, label %52, label %42, !dbg !182

42:                                               ; preds = %21, %15, %41
  %43 = phi i64 [ 0, %21 ], [ 0, %15 ], [ %13, %41 ]
  br label %44, !dbg !182

44:                                               ; preds = %42, %44
  %45 = phi i64 [ %50, %44 ], [ %43, %42 ]
  call void @llvm.dbg.value(metadata i64 %45, metadata !173, metadata !DIExpression()), !dbg !181
  %46 = getelementptr inbounds double, double* %19, i64 %45, !dbg !185
  %47 = load double, double* %46, align 8, !dbg !185, !tbaa !100
  %48 = mul nsw i64 %45, %1, !dbg !196
  %49 = getelementptr inbounds double, double* %20, i64 %48, !dbg !196
  store double %47, double* %49, align 8, !dbg !190, !tbaa !100
  %50 = add nuw i64 %45, 1, !dbg !183
  call void @llvm.dbg.value(metadata i64 %50, metadata !173, metadata !DIExpression()), !dbg !181
  %51 = icmp eq i64 %50, %0, !dbg !197
  br i1 %51, label %52, label %44, !dbg !182, !llvm.loop !198

52:                                               ; preds = %44, %41
  %53 = add nuw i64 %16, 1, !dbg !199
  call void @llvm.dbg.value(metadata i64 %53, metadata !171, metadata !DIExpression()), !dbg !178
  %54 = icmp eq i64 %53, %1, !dbg !179
  br i1 %54, label %55, label %15, !dbg !180, !llvm.loop !200

55:                                               ; preds = %52, %5
  ret void, !dbg !202
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define internal void @trans_tmp(i64 noundef %0, i64 noundef %1, double* nocapture noundef readonly %2, double* nocapture noundef writeonly %3, double* nocapture noundef writeonly %4) #2 !dbg !124 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !123, metadata !DIExpression()), !dbg !203
  call void @llvm.dbg.value(metadata i64 %1, metadata !126, metadata !DIExpression()), !dbg !203
  call void @llvm.dbg.value(metadata double* %2, metadata !127, metadata !DIExpression()), !dbg !203
  call void @llvm.dbg.value(metadata double* %3, metadata !128, metadata !DIExpression()), !dbg !203
  call void @llvm.dbg.value(metadata double* %4, metadata !129, metadata !DIExpression()), !dbg !203
  call void @llvm.dbg.value(metadata i64 0, metadata !130, metadata !DIExpression()), !dbg !204
  %6 = icmp eq i64 %1, 0, !dbg !205
  %7 = icmp eq i64 %0, 0
  %8 = or i1 %6, %7, !dbg !206
  br i1 %8, label %30, label %9, !dbg !206

9:                                                ; preds = %5, %27
  %10 = phi i64 [ %28, %27 ], [ 0, %5 ]
  call void @llvm.dbg.value(metadata i64 %10, metadata !130, metadata !DIExpression()), !dbg !204
  call void @llvm.dbg.value(metadata i64 0, metadata !132, metadata !DIExpression()), !dbg !207
  %11 = mul nsw i64 %10, %0
  %12 = getelementptr inbounds double, double* %2, i64 %11
  %13 = shl i64 %10, 1
  %14 = and i64 %13, 2
  %15 = getelementptr inbounds double, double* %3, i64 %10
  br label %16, !dbg !208

16:                                               ; preds = %9, %16
  %17 = phi i64 [ 0, %9 ], [ %25, %16 ]
  call void @llvm.dbg.value(metadata i64 %17, metadata !132, metadata !DIExpression()), !dbg !207
  call void @llvm.dbg.value(metadata i64 %10, metadata !136, metadata !DIExpression(DW_OP_constu, 1, DW_OP_and, DW_OP_stack_value)), !dbg !209
  %18 = and i64 %17, 1, !dbg !210
  call void @llvm.dbg.value(metadata i64 %18, metadata !139, metadata !DIExpression()), !dbg !209
  %19 = getelementptr inbounds double, double* %12, i64 %17, !dbg !211
  %20 = load double, double* %19, align 8, !dbg !211, !tbaa !100
  %21 = or i64 %18, %14, !dbg !212
  %22 = getelementptr inbounds double, double* %4, i64 %21, !dbg !213
  store double %20, double* %22, align 8, !dbg !214, !tbaa !100
  %23 = mul nsw i64 %17, %1, !dbg !215
  %24 = getelementptr inbounds double, double* %15, i64 %23, !dbg !215
  store double %20, double* %24, align 8, !dbg !216, !tbaa !100
  %25 = add nuw i64 %17, 1, !dbg !217
  call void @llvm.dbg.value(metadata i64 %25, metadata !132, metadata !DIExpression()), !dbg !207
  %26 = icmp eq i64 %25, %0, !dbg !218
  br i1 %26, label %27, label %16, !dbg !208, !llvm.loop !219

27:                                               ; preds = %16
  %28 = add nuw i64 %10, 1, !dbg !221
  call void @llvm.dbg.value(metadata i64 %28, metadata !130, metadata !DIExpression()), !dbg !204
  %29 = icmp eq i64 %28, %1, !dbg !205
  br i1 %29, label %30, label %9, !dbg !206, !llvm.loop !222

30:                                               ; preds = %27, %5
  ret void, !dbg !224
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #3

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!8, !9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "block_size", scope: !2, file: !3, line: 118, type: !5, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, globals: !4, splitDebugInlining: false, nameTableKind: None)
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
!14 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!15 = distinct !DISubprogram(name: "registerFunctions", scope: !3, file: !3, line: 171, type: !16, scopeLine: 171, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !18)
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocation(line: 173, column: 5, scope: !15)
!20 = !DILocation(line: 176, column: 5, scope: !15)
!21 = !DILocation(line: 177, column: 5, scope: !15)
!22 = !DILocation(line: 178, column: 1, scope: !15)
!23 = !DISubprogram(name: "registerTransFunction", scope: !24, file: !24, line: 99, type: !25, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !18)
!24 = !DIFile(filename: "./cachelab.h", directory: "/afs/andrew.cmu.edu/usr16/gdeherme/private/15213/labs/cachelab-f23-gonzoherme")
!25 = !DISubroutineType(types: !26)
!26 = !{null, !27, !36}
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!28 = !DISubroutineType(types: !29)
!29 = !{null, !5, !5, !30, !30, !35}
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 64)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !32, elements: !33)
!32 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!33 = !{!34}
!34 = !DISubrange(count: -1)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 64)
!37 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !38)
!38 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!39 = distinct !DISubprogram(name: "transpose_submit", scope: !3, file: !3, line: 151, type: !28, scopeLine: 152, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !40)
!40 = !{!41, !42, !43, !44, !45}
!41 = !DILocalVariable(name: "M", arg: 1, scope: !39, file: !3, line: 151, type: !5)
!42 = !DILocalVariable(name: "N", arg: 2, scope: !39, file: !3, line: 151, type: !5)
!43 = !DILocalVariable(name: "A", arg: 3, scope: !39, file: !3, line: 151, type: !30)
!44 = !DILocalVariable(name: "B", arg: 4, scope: !39, file: !3, line: 151, type: !30)
!45 = !DILocalVariable(name: "tmp", arg: 5, scope: !39, file: !3, line: 152, type: !35)
!46 = !DILocation(line: 0, scope: !39)
!47 = !DILocation(line: 154, column: 11, scope: !48)
!48 = distinct !DILexicalBlock(scope: !39, file: !3, line: 154, column: 9)
!49 = !DILocation(line: 154, column: 16, scope: !48)
!50 = !DILocation(line: 154, column: 28, scope: !48)
!51 = !DILocalVariable(name: "M", arg: 1, scope: !52, file: !3, line: 120, type: !5)
!52 = distinct !DISubprogram(name: "cool_trans", scope: !3, file: !3, line: 120, type: !28, scopeLine: 121, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !53)
!53 = !{!51, !54, !55, !56, !57, !58, !60, !64, !68}
!54 = !DILocalVariable(name: "N", arg: 2, scope: !52, file: !3, line: 120, type: !5)
!55 = !DILocalVariable(name: "A", arg: 3, scope: !52, file: !3, line: 120, type: !30)
!56 = !DILocalVariable(name: "B", arg: 4, scope: !52, file: !3, line: 120, type: !30)
!57 = !DILocalVariable(name: "tmp", arg: 5, scope: !52, file: !3, line: 121, type: !35)
!58 = !DILocalVariable(name: "i", scope: !59, file: !3, line: 124, type: !5)
!59 = distinct !DILexicalBlock(scope: !52, file: !3, line: 124, column: 5)
!60 = !DILocalVariable(name: "j", scope: !61, file: !3, line: 125, type: !5)
!61 = distinct !DILexicalBlock(scope: !62, file: !3, line: 125, column: 9)
!62 = distinct !DILexicalBlock(scope: !63, file: !3, line: 124, column: 51)
!63 = distinct !DILexicalBlock(scope: !59, file: !3, line: 124, column: 5)
!64 = !DILocalVariable(name: "block_i", scope: !65, file: !3, line: 128, type: !5)
!65 = distinct !DILexicalBlock(scope: !66, file: !3, line: 128, column: 13)
!66 = distinct !DILexicalBlock(scope: !67, file: !3, line: 125, column: 55)
!67 = distinct !DILexicalBlock(scope: !61, file: !3, line: 125, column: 9)
!68 = !DILocalVariable(name: "block_j", scope: !69, file: !3, line: 129, type: !5)
!69 = distinct !DILexicalBlock(scope: !70, file: !3, line: 129, column: 17)
!70 = distinct !DILexicalBlock(scope: !71, file: !3, line: 128, column: 75)
!71 = distinct !DILexicalBlock(scope: !65, file: !3, line: 128, column: 13)
!72 = !DILocation(line: 0, scope: !52, inlinedAt: !73)
!73 = distinct !DILocation(line: 156, column: 9, scope: !74)
!74 = distinct !DILexicalBlock(scope: !48, file: !3, line: 154, column: 43)
!75 = !DILocation(line: 0, scope: !59, inlinedAt: !73)
!76 = !DILocation(line: 125, column: 9, scope: !61, inlinedAt: !73)
!77 = !DILocation(line: 0, scope: !61, inlinedAt: !73)
!78 = !DILocation(line: 128, column: 13, scope: !65, inlinedAt: !73)
!79 = !DILocation(line: 0, scope: !65, inlinedAt: !73)
!80 = !DILocation(line: 125, column: 41, scope: !67, inlinedAt: !73)
!81 = !DILocation(line: 125, column: 30, scope: !67, inlinedAt: !73)
!82 = distinct !{!82, !76, !83, !84}
!83 = !DILocation(line: 140, column: 9, scope: !61, inlinedAt: !73)
!84 = !{!"llvm.loop.unroll.disable"}
!85 = !DILocation(line: 124, column: 26, scope: !63, inlinedAt: !73)
!86 = !DILocation(line: 124, column: 5, scope: !59, inlinedAt: !73)
!87 = distinct !{!87, !86, !88, !84}
!88 = !DILocation(line: 141, column: 5, scope: !59, inlinedAt: !73)
!89 = !DILocation(line: 129, column: 17, scope: !69, inlinedAt: !73)
!90 = !DILocation(line: 136, column: 21, scope: !70, inlinedAt: !73)
!91 = distinct !{!91, !76, !83, !84}
!92 = !DILocation(line: 0, scope: !69, inlinedAt: !73)
!93 = !DILocation(line: 132, column: 33, scope: !94, inlinedAt: !73)
!94 = distinct !DILexicalBlock(scope: !95, file: !3, line: 132, column: 25)
!95 = distinct !DILexicalBlock(scope: !96, file: !3, line: 129, column: 79)
!96 = distinct !DILexicalBlock(scope: !69, file: !3, line: 129, column: 17)
!97 = !DILocation(line: 132, column: 25, scope: !95, inlinedAt: !73)
!98 = !DILocation(line: 133, column: 47, scope: !99, inlinedAt: !73)
!99 = distinct !DILexicalBlock(scope: !94, file: !3, line: 132, column: 45)
!100 = !{!101, !101, i64 0}
!101 = !{!"double", !102, i64 0}
!102 = !{!"omnipotent char", !103, i64 0}
!103 = !{!"Simple C/C++ TBAA"}
!104 = !DILocation(line: 133, column: 25, scope: !99, inlinedAt: !73)
!105 = !DILocation(line: 133, column: 45, scope: !99, inlinedAt: !73)
!106 = !DILocation(line: 134, column: 21, scope: !99, inlinedAt: !73)
!107 = !DILocation(line: 129, column: 75, scope: !96, inlinedAt: !73)
!108 = !DILocation(line: 129, column: 50, scope: !96, inlinedAt: !73)
!109 = distinct !{!109, !89, !110, !84}
!110 = !DILocation(line: 135, column: 17, scope: !69, inlinedAt: !73)
!111 = !DILocation(line: 128, column: 71, scope: !71, inlinedAt: !73)
!112 = !DILocation(line: 128, column: 46, scope: !71, inlinedAt: !73)
!113 = distinct !{!113, !78, !114, !84}
!114 = !DILocation(line: 139, column: 13, scope: !65, inlinedAt: !73)
!115 = !DILocation(line: 137, column: 43, scope: !116, inlinedAt: !73)
!116 = distinct !DILexicalBlock(scope: !117, file: !3, line: 136, column: 29)
!117 = distinct !DILexicalBlock(scope: !70, file: !3, line: 136, column: 21)
!118 = !DILocation(line: 137, column: 21, scope: !116, inlinedAt: !73)
!119 = !DILocation(line: 137, column: 41, scope: !116, inlinedAt: !73)
!120 = distinct !{!120, !78, !114, !84}
!121 = distinct !{!121, !89, !110, !84}
!122 = distinct !{!122, !78, !114, !84}
!123 = !DILocalVariable(name: "M", arg: 1, scope: !124, file: !3, line: 101, type: !5)
!124 = distinct !DISubprogram(name: "trans_tmp", scope: !3, file: !3, line: 101, type: !28, scopeLine: 102, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !125)
!125 = !{!123, !126, !127, !128, !129, !130, !132, !136, !139}
!126 = !DILocalVariable(name: "N", arg: 2, scope: !124, file: !3, line: 101, type: !5)
!127 = !DILocalVariable(name: "A", arg: 3, scope: !124, file: !3, line: 101, type: !30)
!128 = !DILocalVariable(name: "B", arg: 4, scope: !124, file: !3, line: 101, type: !30)
!129 = !DILocalVariable(name: "tmp", arg: 5, scope: !124, file: !3, line: 102, type: !35)
!130 = !DILocalVariable(name: "i", scope: !131, file: !3, line: 106, type: !5)
!131 = distinct !DILexicalBlock(scope: !124, file: !3, line: 106, column: 5)
!132 = !DILocalVariable(name: "j", scope: !133, file: !3, line: 107, type: !5)
!133 = distinct !DILexicalBlock(scope: !134, file: !3, line: 107, column: 9)
!134 = distinct !DILexicalBlock(scope: !135, file: !3, line: 106, column: 36)
!135 = distinct !DILexicalBlock(scope: !131, file: !3, line: 106, column: 5)
!136 = !DILocalVariable(name: "di", scope: !137, file: !3, line: 108, type: !5)
!137 = distinct !DILexicalBlock(scope: !138, file: !3, line: 107, column: 40)
!138 = distinct !DILexicalBlock(scope: !133, file: !3, line: 107, column: 9)
!139 = !DILocalVariable(name: "dj", scope: !137, file: !3, line: 109, type: !5)
!140 = !DILocation(line: 0, scope: !124, inlinedAt: !141)
!141 = distinct !DILocation(line: 160, column: 9, scope: !142)
!142 = distinct !DILexicalBlock(scope: !48, file: !3, line: 159, column: 10)
!143 = !DILocation(line: 0, scope: !131, inlinedAt: !141)
!144 = !DILocation(line: 106, column: 26, scope: !135, inlinedAt: !141)
!145 = !DILocation(line: 106, column: 5, scope: !131, inlinedAt: !141)
!146 = !DILocation(line: 0, scope: !133, inlinedAt: !141)
!147 = !DILocation(line: 107, column: 9, scope: !133, inlinedAt: !141)
!148 = !DILocation(line: 0, scope: !137, inlinedAt: !141)
!149 = !DILocation(line: 109, column: 27, scope: !137, inlinedAt: !141)
!150 = !DILocation(line: 110, column: 32, scope: !137, inlinedAt: !141)
!151 = !DILocation(line: 110, column: 24, scope: !137, inlinedAt: !141)
!152 = !DILocation(line: 110, column: 13, scope: !137, inlinedAt: !141)
!153 = !DILocation(line: 110, column: 30, scope: !137, inlinedAt: !141)
!154 = !DILocation(line: 111, column: 13, scope: !137, inlinedAt: !141)
!155 = !DILocation(line: 111, column: 21, scope: !137, inlinedAt: !141)
!156 = !DILocation(line: 107, column: 36, scope: !138, inlinedAt: !141)
!157 = !DILocation(line: 107, column: 30, scope: !138, inlinedAt: !141)
!158 = distinct !{!158, !147, !159, !84}
!159 = !DILocation(line: 112, column: 9, scope: !133, inlinedAt: !141)
!160 = !DILocation(line: 106, column: 32, scope: !135, inlinedAt: !141)
!161 = distinct !{!161, !145, !162, !84}
!162 = !DILocation(line: 113, column: 5, scope: !131, inlinedAt: !141)
!163 = !DILocation(line: 162, column: 1, scope: !39)
!164 = distinct !DISubprogram(name: "trans_basic", scope: !3, file: !3, line: 81, type: !28, scopeLine: 82, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !165)
!165 = !{!166, !167, !168, !169, !170, !171, !173}
!166 = !DILocalVariable(name: "M", arg: 1, scope: !164, file: !3, line: 81, type: !5)
!167 = !DILocalVariable(name: "N", arg: 2, scope: !164, file: !3, line: 81, type: !5)
!168 = !DILocalVariable(name: "A", arg: 3, scope: !164, file: !3, line: 81, type: !30)
!169 = !DILocalVariable(name: "B", arg: 4, scope: !164, file: !3, line: 81, type: !30)
!170 = !DILocalVariable(name: "tmp", arg: 5, scope: !164, file: !3, line: 82, type: !35)
!171 = !DILocalVariable(name: "i", scope: !172, file: !3, line: 86, type: !5)
!172 = distinct !DILexicalBlock(scope: !164, file: !3, line: 86, column: 5)
!173 = !DILocalVariable(name: "j", scope: !174, file: !3, line: 87, type: !5)
!174 = distinct !DILexicalBlock(scope: !175, file: !3, line: 87, column: 9)
!175 = distinct !DILexicalBlock(scope: !176, file: !3, line: 86, column: 36)
!176 = distinct !DILexicalBlock(scope: !172, file: !3, line: 86, column: 5)
!177 = !DILocation(line: 0, scope: !164)
!178 = !DILocation(line: 0, scope: !172)
!179 = !DILocation(line: 86, column: 26, scope: !176)
!180 = !DILocation(line: 86, column: 5, scope: !172)
!181 = !DILocation(line: 0, scope: !174)
!182 = !DILocation(line: 87, column: 9, scope: !174)
!183 = !DILocation(line: 87, column: 36, scope: !184)
!184 = distinct !DILexicalBlock(scope: !174, file: !3, line: 87, column: 9)
!185 = !DILocation(line: 88, column: 23, scope: !186)
!186 = distinct !DILexicalBlock(scope: !184, file: !3, line: 87, column: 40)
!187 = !{!188}
!188 = distinct !{!188, !189}
!189 = distinct !{!189, !"LVerDomain"}
!190 = !DILocation(line: 88, column: 21, scope: !186)
!191 = !{!192}
!192 = distinct !{!192, !189}
!193 = distinct !{!193, !182, !194, !84, !195}
!194 = !DILocation(line: 89, column: 9, scope: !174)
!195 = !{!"llvm.loop.isvectorized", i32 1}
!196 = !DILocation(line: 88, column: 13, scope: !186)
!197 = !DILocation(line: 87, column: 30, scope: !184)
!198 = distinct !{!198, !182, !194, !84, !195}
!199 = !DILocation(line: 86, column: 32, scope: !176)
!200 = distinct !{!200, !180, !201, !84}
!201 = !DILocation(line: 90, column: 5, scope: !172)
!202 = !DILocation(line: 93, column: 1, scope: !164)
!203 = !DILocation(line: 0, scope: !124)
!204 = !DILocation(line: 0, scope: !131)
!205 = !DILocation(line: 106, column: 26, scope: !135)
!206 = !DILocation(line: 106, column: 5, scope: !131)
!207 = !DILocation(line: 0, scope: !133)
!208 = !DILocation(line: 107, column: 9, scope: !133)
!209 = !DILocation(line: 0, scope: !137)
!210 = !DILocation(line: 109, column: 27, scope: !137)
!211 = !DILocation(line: 110, column: 32, scope: !137)
!212 = !DILocation(line: 110, column: 24, scope: !137)
!213 = !DILocation(line: 110, column: 13, scope: !137)
!214 = !DILocation(line: 110, column: 30, scope: !137)
!215 = !DILocation(line: 111, column: 13, scope: !137)
!216 = !DILocation(line: 111, column: 21, scope: !137)
!217 = !DILocation(line: 107, column: 36, scope: !138)
!218 = !DILocation(line: 107, column: 30, scope: !138)
!219 = distinct !{!219, !208, !220, !84}
!220 = !DILocation(line: 112, column: 9, scope: !133)
!221 = !DILocation(line: 106, column: 32, scope: !135)
!222 = distinct !{!222, !206, !223, !84}
!223 = !DILocation(line: 113, column: 5, scope: !131)
!224 = !DILocation(line: 116, column: 1, scope: !124)
