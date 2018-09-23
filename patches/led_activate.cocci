@act@
identifier activate_fn, p;
identifier m =~ "rx_led|tx_led|assoc_led|radio_led|tpt_led";
fresh identifier activate_fn_wrap = "bp_" ## activate_fn;
@@
<+...
+#if LINUX_VERSION_IS_GEQ(4,19,0)
p->m.activate = activate_fn;
+#else
+p->m.activate = activate_fn_wrap;
+#endif
...+>

@@
identifier act.activate_fn;
identifier act.activate_fn_wrap;
@@
int activate_fn(...) {...}
+#if LINUX_VERSION_IS_LESS(4,19,0)
+static void activate_fn_wrap(struct led_classdev *led_cdev)
+{
+	activate_fn(led_cdev);
+}
+#endif
