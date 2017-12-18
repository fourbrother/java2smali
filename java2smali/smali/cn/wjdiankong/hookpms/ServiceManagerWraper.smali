.class public Lcn/wjdiankong/hookpms/ServiceManagerWraper;
.super Ljava/lang/Object;
.source "ServiceManagerWraper.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static hookPMS(Landroid/content/Context;)V
    .registers 4

    .prologue
    .line 46
    const-string v0, "308203c7308202afa00302010202046aa5b23d300d06092a864886f70d01010b0500308192310b300906035504061302434e3112301006035504080c09e58c97e4baace5b882310f300d06035504070c06e58c97e4baac31333031060355040a0c2ae58c97e4baace5bda9e4ba91e59ca8e7babfe68a80e69cafe5bc80e58f91e69c89e99990e585ace58fb831183016060355040b130f4d65656c69766520416e64726f6964310f300d060355040313066d6565676f643020170d3135303331393032343933375a180f33303134303732303032343933375a308192310b300906035504061302434e3112301006035504080c09e58c97e4baace5b882310f300d06035504070c06e58c97e4baac31333031060355040a0c2ae58c97e4baace5bda9e4ba91e59ca8e7babfe68a80e69cafe5bc80e58f91e69c89e99990e585ace58fb831183016060355040b130f4d65656c69766520416e64726f6964310f300d060355040313066d6565676f6430820122300d06092a864886f70d01010105000382010f003082010a0282010100afa19f82b0a34cd2a40365dda2d9b6c088fc5eeab199175a268c7f2acc738c37a1dc8f705e17b2581cee7df93053495dd70f176c5865f41f6c6374e7b7d9fb31968694d95b623546f4e3b09b9b186dc282b97ac7d0f63441c9917790af1d26a2eeae4d0fd26ec26d6050c59bd9202080d87417fad819ddf70882c7c04137e3d2a07802de8882ef81e5458f7e7973faacfd19ede809bef680ed51b4f01a08eba4644185278e62c7bcff40e77958b803aa0ea1d2ed7e2294736b0745517188367b467472a1ef121d0ddca934b30a68ce6482b95c424701852dff1487575751cececdda382a4cd702b0a148622eb3f3b30ff9bdfaf53969da991c05307ee6b9d5ad0203010001a321301f301d0603551d0e041604148fdf3566bd514be0ab8057f60c309cf818df94b9300d06092a864886f70d01010b050003820101008bc52464264d39d67979aa39b7a0508670f85116c5510db03bf8a57f0fbcc9f0f80cce8d96a14afc3403f4466e7d37ad08c119873d47a471eaf83d92828879d9d62a1af02e33783f38d1ae1245fee410885c223ff5362f41ce0cd33735e7d70b6b1b9d625d558d1ae3db857c5fec33a62a61b54cebc260726f2db3425cef1217c6667ddd13a99445df9318d287e82b8d588a6805628ea0f131240796cb66d6371866dbf7ba04801e39d42c7d49a00bed479db3164872d0ffc12dec76e6b541e77e2844687cfb11559736825a36fa6d65cc75f6f4d95c75253db92ce7749013def632686b3a572bf0ab299c18c778f3948e22632a5da1e1505fea2d02768fbe9f"

    .line 47
    const-string v1, "com.meelive.ingkee"

    const/4 v2, 0x0

    invoke-static {p0, v0, v1, v2}, Lcn/wjdiankong/hookpms/ServiceManagerWraper;->hookPMS(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)V

    .line 48
    const-string v0, "jw"

    const-string v1, "hook succ"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    return-void
.end method

.method public static hookPMS(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)V
    .registers 11

    .prologue
    .line 19
    :try_start_0
    const-string v0, "android.app.ActivityThread"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 20
    const-string v1, "currentActivityThread"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 22
    const/4 v2, 0x0

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 24
    const-string v2, "sPackageManager"

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 25
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 28
    const-string v3, "android.content.pm.IPackageManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 29
    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    aput-object v3, v5, v6

    new-instance v3, Lcn/wjdiankong/hookpms/PmsHookBinderInvocationHandler;

    const/4 v6, 0x0

    invoke-direct {v3, v2, p1, p2, v6}, Lcn/wjdiankong/hookpms/PmsHookBinderInvocationHandler;-><init>(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-static {v4, v5, v3}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v2

    .line 34
    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 36
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 37
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v3, "mPM"

    invoke-virtual {v1, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 38
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 39
    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_57
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_57} :catch_58

    .line 43
    :goto_57
    return-void

    .line 40
    :catch_58
    move-exception v0

    .line 41
    const-string v1, "jw"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "hook pms error:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_57
.end method
