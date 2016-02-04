/*-------------------------------------------------------------------------
 *
 * postgres_strict.h
 */

#ifndef POSTGRES_STRICT_H
#define POSTGRES_STRICT_H

extern int postgres_strict;

#define POSTGRES_STRICT_NONE				0
#define POSTGRES_STRICT_ALL					((int) ~0)

#endif   /* POSTGRES_STRICT_H */
