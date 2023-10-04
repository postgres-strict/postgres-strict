/*-------------------------------------------------------------------------
 *
 * postgres_strict.h
 */

#ifndef POSTGRES_STRICT_H
#define POSTGRES_STRICT_H

extern int postgres_strict;

#define POSTGRES_STRICT_NONE				0
#define POSTGRES_STRICT_ALL					((int) ~0)

/* Used in guc.c; must not be equal to any of the codes in utils/elog.h */
#define POSTGRES_STRICT_ASSERT				((PANIC * 2) + 20)

extern int postgres_strict_violation_level;
extern int postgres_strict_violation_sqlstate;

#endif   /* POSTGRES_STRICT_H */
