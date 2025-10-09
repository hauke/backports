#ifndef __BACKPORT_TIMEKEEPING_H
#define __BACKPORT_TIMEKEEPING_H
#include <linux/version.h>
#include <linux/types.h>

#include_next <linux/timekeeping.h>

#if LINUX_VERSION_IS_LESS(5,3,0)
#define ktime_get_boottime_ns LINUX_BACKPORT(ktime_get_boottime_ns)
static inline u64 ktime_get_boottime_ns(void)
{
	return ktime_get_boot_ns();
}
#endif /* < 5.3 */

#endif /* __BACKPORT_TIMEKEEPING_H */
