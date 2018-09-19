@r1@
struct net_device *NDEV;
identifier D, C;
identifier TRUE =~ "true";
@@
C(...)
{
	<+...
-	NDEV->needs_free_netdev = TRUE;
-	NDEV->priv_destructor = D;
+	netdev_set_priv_destructor(NDEV, D);
	...+>
}

@r2 depends on r1@
identifier r1.D, r1.C;
fresh identifier E = "__" ## D;
@@

+#if LINUX_VERSION_IS_LESS(4,12,0)
+static void E(struct net_device *ndev)
+{
+	D(ndev);
+	free_netdev(ndev);
+}
+#endif
+
C(...)
{
	...
}

@r3 depends on r1@
type T;
identifier NDEV;
identifier r1.D;
T RET;
@@

RET = \(register_netdevice\|register_ndev\)(NDEV);
if (<+... RET ...+>) {
	<...
+#if LINUX_VERSION_IS_LESS(4,12,0)
+	D(NDEV);
+#endif
	free_netdev(NDEV);
	...>
}

@r4 depends on r1@
identifier NDEV;
identifier r1.D;
type T;
T RET;
@@

if (...)
	RET = register_netdevice(NDEV);
else
	RET = register_netdev(NDEV);
if (<+... RET ...+>) {
	<...
+#if LINUX_VERSION_IS_LESS(4,12,0)
+	D(NDEV);
+#endif
	free_netdev(NDEV);
	...>
}

@r11@
struct net_device *NDEV;
identifier D, C;
identifier TRUE =~ "true";
@@
C(...)
{
	<+...
-	NDEV->priv_destructor = D;
-	NDEV->needs_free_netdev = TRUE;
+	netdev_set_priv_destructor(NDEV, D);
	...+>
}

@r12 depends on r11@
identifier r11.D, r11.C;
fresh identifier E = "__" ## D;
@@

+#if LINUX_VERSION_IS_LESS(4,12,0)
+static void E(struct net_device *ndev)
+{
+	D(ndev);
+	free_netdev(ndev);
+}
+#endif
+
C(...)
{
	...
}

@r5@
struct net_device *NDEV;
identifier TRUE =~ "true";
@@

-NDEV->needs_free_netdev = TRUE;
+netdev_set_def_destructor(NDEV);

@r6@
struct net_device *NDEV;
identifier D;
@@

-NDEV->priv_destructor = D;
+netdev_set_priv_destructor(NDEV, D);
