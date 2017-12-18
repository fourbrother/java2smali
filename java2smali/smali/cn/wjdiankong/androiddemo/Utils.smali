.class public Lcn/wjdiankong/androiddemo/Utils;
.super Ljava/lang/Object;
.source "Utils.java"


# static fields
.field private static a:[C


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 7
    const/16 v0, 0x10

    new-array v0, v0, [C

    fill-array-data v0, :array_a

    sput-object v0, Lcn/wjdiankong/androiddemo/Utils;->a:[C

    return-void

    :array_a
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
    .end array-data
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .prologue
    .line 10
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-static {v0}, Lcn/wjdiankong/androiddemo/Utils;->a([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static a([B)Ljava/lang/String;
    .registers 3

    .prologue
    .line 14
    const/4 v0, 0x0

    .line 16
    :try_start_1
    const-string v1, "MD5"

    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    .line 17
    invoke-virtual {v1, p0}, Ljava/security/MessageDigest;->update([B)V

    .line 18
    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v1

    invoke-static {v1}, Lcn/wjdiankong/androiddemo/Utils;->b([B)Ljava/lang/String;
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_11} :catch_13

    move-result-object v0

    .line 22
    :goto_12
    return-object v0

    .line 19
    :catch_13
    move-exception v1

    .line 20
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_12
.end method

.method private static b([B)Ljava/lang/String;
    .registers 9

    .prologue
    const/4 v0, 0x0

    .line 26
    .line 27
    array-length v2, p0

    .line 28
    mul-int/lit8 v1, v2, 0x2

    new-array v3, v1, [C

    move v1, v0

    .line 30
    :goto_7
    if-ge v1, v2, :cond_24

    .line 31
    aget-byte v4, p0, v1

    .line 32
    add-int/lit8 v5, v0, 0x1

    .line 33
    sget-object v6, Lcn/wjdiankong/androiddemo/Utils;->a:[C

    ushr-int/lit8 v7, v4, 0x4

    and-int/lit8 v7, v7, 0xf

    aget-char v6, v6, v7

    aput-char v6, v3, v0

    .line 34
    add-int/lit8 v0, v5, 0x1

    .line 35
    sget-object v6, Lcn/wjdiankong/androiddemo/Utils;->a:[C

    and-int/lit8 v4, v4, 0xf

    aget-char v4, v6, v4

    aput-char v4, v3, v5

    .line 36
    add-int/lit8 v1, v1, 0x1

    .line 37
    goto :goto_7

    .line 38
    :cond_24
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v3}, Ljava/lang/String;-><init>([C)V

    return-object v0
.end method
