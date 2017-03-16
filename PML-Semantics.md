# PML Semantics

## Introduction

We give PML a semantics by showing how to convert it into a set of sequences of `action` elements

We shall use single letters like `a`,`b`, and `c` to refer to PML actions. We shall write a sequence containing `a`, `b`, and `c`, in that order as `abc`.

We shall use `P`,`Q` and `R` to refer to well-formed PML constructs.

So the meaning of

```
sequence{ branch{ a ; b } ; c }
```
would be `{ abc, bac }`.

We shall define a meaning function M that
maps a PML construct to a set of traces

```
M(P) = { ..... }
```

## Atomic actions

```
M(a) = { a }
```

## Sequential composition

```
M(sequence{ P1 ; P2 ; .. ; Pn }
= M(P1) +++ M(P2) +++ ...  +++ M(Pn)
```

Given two sets of traces `T1` and `T2`, `T1 +++ T2` is the set
formed by concatenating each trace in `T1` with every trace in `T2`.
So `{ ab, ba } +++ { c, d } = { abc, abd, bac, bad }`.

## Non-deterministic Choice

```
M(selection{ P1 ; P2 ; .. ; Pn })
=
M(P1) `union` M(P2) `union` .. `union` M(Pn)
```

## Parallel Composition

```
M(branch{ P1 ; P2 ; .. ; Pn })
=
M(P1) ||| M(P2) ||| .. ||| M(Pn)
```
Given two sets of traces `T1` and `T2`, `T1 ||| T2` is the set
formed by computing all the interleavings of each trace in `T1` with every trace in `T2`.
So 

```
{ ab, ba } ||| { c, d }
  = { abc, acb, cab   -- ab interleaved with c
    , abd, adb, dab   -- ab interleaved with d
    , bac, bca, cba   -- ba interleaved with c
    , bad, bda, dba   -- ba interleaved with d
    }
```

## Non-deterministic Iteration

```
M(iteration{ P1 ; P2 ; .. ; Pn })
=
M(iteration{sequence{P1 ; P2 ; .. ; Pn}})

M(iteration{P})
= { . } `union` M(P) +++ M(iteration{P})
```
Here `.` denotes an empty trace.

Note that the set of traces produced here is an **infinite** set, of **finite** traces.

We can also characterise the traces of iteration by the following:

```
M(iteration{P})
= { . } `union` M(P) 
        `union` M(P)+++M(P)
        `union` M(P)+++M(P)+++M(P)
        `union` M(P)+++M(P)+++M(P)+++M(P)
        `union` ...
```

## Top-level Process

The top-level PML `process` is treated just like a
`sequence` construct.

```
process{ P1 ; .. ; Pn }
=
sequence{ P1; .. ; Pn }
```


