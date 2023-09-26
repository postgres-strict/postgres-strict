/*-------------------------------------------------------------------------
 *
 * nodeRandomize.h
 *
 *
 *
 * Portions Copyright (c) 1996-2021, PostgreSQL Global Development Group
 * Portions Copyright (c) 1994, Regents of the University of California
 *
 * src/include/executor/nodeRandomize.h
 *
 *-------------------------------------------------------------------------
 */
#ifndef NODERANDOMIZE_H
#define NODERANDOMIZE_H

#include "access/parallel.h"
#include "nodes/execnodes.h"

extern RandomizeState *ExecInitRandomize(Randomize *node, EState *estate, int eflags);
extern void ExecEndRandomize(RandomizeState *node);
extern void ExecRandomizeMarkPos(RandomizeState *node);
extern void ExecRandomizeRestrPos(RandomizeState *node);
extern void ExecReScanRandomize(RandomizeState *node);

/* parallel instrumentation support */
extern void ExecRandomizeEstimate(RandomizeState *node, ParallelContext *pcxt);
extern void ExecRandomizeInitializeDSM(RandomizeState *node, ParallelContext *pcxt);
extern void ExecRandomizeInitializeWorker(RandomizeState *node, ParallelWorkerContext *pwcxt);
extern void ExecRandomizeRetrieveInstrumentation(RandomizeState *node);

#endif							/* NODERANDOMIZE_H */
