#ifndef __BACKPORT_LINUX_FIRMWARE_H
#define __BACKPORT_LINUX_FIRMWARE_H
#include_next <linux/firmware.h>

#if LINUX_VERSION_IS_LESS(5,6,0)
#include <linux/module.h>
#endif

#ifndef FW_ACTION_NOUEVENT
#define FW_ACTION_NOUEVENT FW_ACTION_NOHOTPLUG
#endif

#ifndef FW_ACTION_UEVENT
#define FW_ACTION_UEVENT FW_ACTION_HOTPLUG
#endif

#if LINUX_VERSION_IS_LESS(5,10,0)
#define request_partial_firmware_into_buf LINUX_BACKPORT(request_partial_firmware_into_buf)
static inline int request_partial_firmware_into_buf
					(const struct firmware **firmware_p,
					 const char *name,
					 struct device *device,
					 void *buf, size_t size, size_t offset)
{
	return -ENOTSUPP;
}
#endif

#endif /* __BACKPORT_LINUX_FIRMWARE_H */
