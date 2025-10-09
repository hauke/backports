#ifndef __BACKPORT_NET_SOCK_H
#define __BACKPORT_NET_SOCK_H
#include_next <net/sock.h>
#include <linux/version.h>


#if LINUX_VERSION_IS_LESS(5,14,0)
static inline void backport_sk_error_report(struct sock *sk)
{
	sk->sk_error_report(sk);
}
#define sk_error_report(sk) LINUX_BACKPORT(sk_error_report(sk))
#endif /* <= 5.14 */

#endif /* __BACKPORT_NET_SOCK_H */
