declare i32 @printf(i8* nocapture readonly, ...)

@helloStr = private unnamed_addr constant [38 x i8] c"Hello from \1b[38;2;%d;%d;%dmLLVM\1b[0m!\0A\00"

define void @hello_lltie() {
    %formatStr = getelementptr [38 x i8], [38 x i8]* @helloStr, i32 0, i32 0
    call i32 (i8*, ...) @printf(i8* %formatStr, i32 43, i32 97, i32 122)
    ret void
}
