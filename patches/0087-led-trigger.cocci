@r@
expression OPS;
identifier led_activate_fn;
fresh identifier led_activate_fn_wrap = "bp_" ## led_activate_fn;
@@
+#if LINUX_VERSION_IS_GEQ(4,19,0)
	OPS.activate = led_activate_fn;
+#else
+	OPS.activate = led_activate_fn_wrap;
+#endif

@@
identifier r.led_activate_fn_wrap;
identifier r.led_activate_fn;
@@
int led_activate_fn(...) {...}
+#if LINUX_VERSION_IS_LESS(4,19,0)
+static void
+led_activate_fn_wrap(struct led_classdev *led_cdev)
+{
+	led_activate_fn(led_cdev);
+}
+#endif

