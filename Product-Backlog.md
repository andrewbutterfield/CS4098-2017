# CS4098 Product Backlog


## Zero Velocity Release

**Due:** 23:59, Sun 5th Feb. 2017

See Blackboard for submission details

The zero-velocity release should contain

1. the PEOS software developed by John Noll (see [https://github.com/jnoll/peos](https://github.com/jnoll/peos) )
1. something that can read the OWL files from the DINTO repository (see [https://github.com/labda/DINTO.git](https://github.com/labda/DINTO.git) )
2. Documentation that covers:
  3. How to install these components
  4. How to test them

It should be possible to use the PEOS system to analyse a PML file - provide a test file.

It should be possible to parse some OWL from the
DINTO ontlogy and report some statistic about the file contents

It must run on either Ubuntu 16.04 or OS X (Sierra).

## Product Backlog 
###(Revised for Release 2)

**Due** 23:59, Sun 9th April 2017

The features below are intended to be more polished and part of a system that integrates with DINTO. So a uniform look and feel will be wanted.

All features appear below in bulleted lists
where each entry starts with a  `Feature Tagline` and possibly some explanatory text:

* `Feature One`  
What one is all about
* `Feature Numero Duo`  
Key aspects of number 2

... and so on.

You are also always welcome to suggest features!

### Carried over from Release 1

Some of these you may have already done. Also some of them are now, or may be,  subsumed by new more detailed Release 2 features.

* `Identify drugs in PML`
* `Lookup drugs in DINTO`
* `Identify DDIs` (Drug-Drug Interactions)
* `Adding Time to PML` (**subsumed**)
* `DDI Timing Analysis` (**subsumed**)
* `DDI-aware Pathway modifications` (*may be subsumed*)

### Clinical Pathway features

We shall split these features into a number of sub-groups that look at specific aspects of pathway-induced drug interactions.

We shall expect a well-formed Clinical Healthcare Pathway PML file to always have unique names associated with every composite construct (`task`, `sequence`, `branch`, `selection`, and `iteration`).

#### New ways to break PML files

* `Report un-named PML construct`  
A construct in PML without a name should be reported in a warning, which should give the line number of the construct.
* `Report PML construct name-clash`  
If two PML constructs have the same name, this should be reported, identifying the clashing name, and the kinds of construct involved. Again line numbers would be given.
* `Report use of task construct`  
The `task` construct in PML is now deprecated. It is interpreted the same as `sequence`. This feature identifies and reports all use of the `task` construct.

#### Identifying Drug Interference

This sub-group of features focusses on different ways in which a drug interaction may arise because of the pathway's control-flow. For Release 1 we took a coarse view - an interaction existed simply by the fact that a PML fle mentioned both drugs. Now we want to get more precise.

* `Mock DDI Characterisation Data`  
A file that contains records, each with four components: 
2 drug names of drugs with a DDI, 
an indicator that states if the DDI is good or bad,
and a time limit within which the DDI is effective.
* `Identify Sequential DDIs`
A sequential DDI is one that arises because the PML contains a workflow in which the dispensing of one drug is always followed afterwards by the dispensing of another drug, that has an known interaction with the first. This feature should identify the drugs involved and the name of the smallest enclosing PML `sequence` construct.
* `Identify Parallel DDIs`
A parallel DDI is one that arises when two interacting drugs occur in two different "arms" of a PML branch construct. This feature should identify the drugs involved and the name of the smallest enclosing PML `branch` construct.
* `Report Alternative non-DDIs`
These are cases when interacting drugs occur in different arms of a PML selection construct, so will not be given together to the patient because only one arm is ever taken. This feature should identify the drugs involved and the name of the smallest enclosing PML `selection` construct.
* `Report Repeated Alternative DDIs`
A PML selection may keep two interacting drugs apart,
as per the feature immediately above, if that selection runs only once in the pathway's lifetime. But if that section is inside an iteration, then it is possible that the second time around might switch drugs, leading to a possible interaction. This feature identifies selections reported by the "Report Alternative non-DDIs" feature above that reside within an iteration.
This feature should identify the drugs involved and the name of the smallest enclosing PML `iteration` construct, and the relevant enclosed `selection` construct.

#### Specifying Timings in PML

The only PML construct that has 'extra' fields is `action`. This means it is not possible to add annotations to any other construct, without changing the syntax of PML. Consider trying to describe a pathway fragment where a drug is administered weekly.
We can imagine that this should be an `iteration`. The question is where do we specify this time interval? 

Without changing PML syntax, the best we can do is put in a 'delay task' at the end of the iteration,
that does nothing but wait one week.
If we choose to modify PML syntax, then we could add the notion of some way to specify *attributes* of constructs like `iteration`, `selection`, etc. We could then introduce a repeat interval attribute denoting one week into the iteration construct itself.

All the features below do not specify how you handle this issue. You can choose to leave PML syntax alone, and use special actions to capture timing requirements, or take the step to add attributes (timing or otherwise) to the other language constructs. You may even want to mix both approaches. How you handle this is entirely up to you, but you should feel free to consult the customer/product owner about anything you plan to do here.

* `Specifying Periodic Drug Use`  
Provide a way to specify in PML that a given drug is to be given at a regular interval. The feature should report/log all such specifications.

* `Specifying Sequential Drug Use Gap`  
Given two drugs that participate in a Sequential DDI (see above) provide a way to stipulate the minimum time gap between the administration of the two drugs. 

* `Specifying Parallel Drug Use Gap`  
Given two drugs that participate in a Parallel DDI (see above) provide a way to stipulate the minimum time gap between the administration of the two drugs. 

* `Specifying Repeated Alternative Drug Use Gap`  
Given two drugs that participate in a Repeated Alternative DDI (see above) provide a way to stipulate the minimum time gap between the administration of the two drugs. 

* `Specify a Delay`  
Provide a way to say, at any point in a sequential workflow, that the enactment of the pathway will pause/delay for a given time.

* `Specify a time interval offset`  
This corresponds to specifying a day for a week long interval (e.g. "Monday") or a time within a daily interval (e.g., "9am", "afternoon", etc). It may be implemented as a modifier of some sort for the Periodic Drug Use feature above.

#### Timing Analysis

* `Report Timing Inconsistencies`  
A PML file may have timings that are not feasible. For example, an iteration may have a specification that it repeats daily, but may contain an action with a one-week delay. This features checks the timings to ensure such inconsistent timing are not present. Any inconsistencies should be reported as an error that precludes any further timing analysis.

* `Identify DDI Closest Approach`  
Given drugs participating in a DDI, and a PML description with or without timing information, identify and report the closest the drugs might be administered to each other in time. Any resulting time interval greater than zero must be justified by the available timing and control-flow information. If the drugs can never be administered together in a complete run of the behaviour given in the PML file, then a result of 'infinity' should be reported. This feature is designed to identify adverse DDIs that may need to be moved further part.

* `Identify DDI Furthest Separation`  
Given drugs participating in a DDI, and a PML description with or without timing information, identify and report the farthest apart the drugs might be administered to each other in time. Any resulting time interval less than infinity must be justified by the available timing and control-flow information. If the drugs can never be administered together in a complete run of the behaviour given in the PML file, then a result of 'infinity' should be reported. This feature is intended to spot good DDIs that could be made more benefical if brought closer together.


#### PML Refactoring

We may want to merge a number of clinical pathways,
perhaps by putting them in parallel to begin with.
After DDI/timing analysis we might want to try some transformations to the PML to improve matters. In effect these are features that change the PML anstract syntax tree, and which need to be able to outpur well-formed PML.

* `Merging Clinical Pathways written in PML`   
Given a number of PML files each containing a helthcare pathway, merge these into a new PML file by putting each pathway into its own arm of a top-level branch construct, which will, of course, need to be named
(see "Report un-named construct" above).

PML transformations fall into two basic categories:

1. *try-it-and-see:* just do some transformation that takes no account of any DDI or timing information, and then re-analyse, and make a keep or discard decision based on the new analysis results (relativey easy)

Simple transformations could include converting a sequential to a branch, or vice-versa. We may also want to distinguish between semantics preserving/changing transformations. 

So for example, given P and Q representing arbitrary pieces of well-formed PML,
changing `branch{P;Q}`
to `sequence{P;Q}` is semantics changing,
while changing `branch{P;Q}` to
`selection{sequence{P;Q};sequence{Q;P}}`
is semantics preserving (can you see why?).

2. *smart-adaptation:* based on current structure and analysis result, determine an improving transformation in advance and apply it (HARD).

We now give a series of PML transformation features, named `PML-TX ....`. All transformations require some way for the user to designate an appropriate language construct in the PML file. All transformations need to ensure that any introduced constructs have names.

* `PML-TX Save PML to File`  
No point in transforming PML below if we can't save it afterwards!

* `PML-TX Reorder Sequence`  
This takes a designated `sequence` construct and a permutation of the list [1..N] where N is the sequence length,
and returns a sequence with its sub-constructs re-ordered correspondingly.

* `PML-TX Serialise Branch (Naive)`  
Thss converts a designated branch construct into a sequence:  

```
branch{P1;..;Pn} --> sequence{P1;..;Pn}
```
This is not a semantics preserving transformation, but is in fact a refinment that removes all the non-determinism in a simplistic manner.

* `PML-TX Serialize Branch (Two-Way)`  
This convert a designated `branch` construct with two components into a selection of sequences, according to the rule:

```
branch{P;Q} 
 = selection{sequence{P;Q};sequence{Q;P}}
```


* `PML-TX Serialize Branch (Three-Way)`  
This converts a designated `branch` construct with three components into a selection of sequences, according to the rule:  

```
branch{P;Q;R} 
 = selection{ sequence{P;Q;R}; sequence{P;R;Q}  
            , sequence{Q;P;R}; sequence{Q;R;P}
            , sequence{R;P;Q}; sequence{R;Q;P} }
```
 
* `PML-TX Serialize Branch (n-Way)`  
This converts a designated `branch` construct to selection of sequences, one for each possible ordering of the n original branches

```
branch{P1;..;Pn}
 = selection{ sequence{P1;..;Pn}
            ; ...
            ; sequence{Pn;..;P1} }
```

* `PML-TX Remove Selections`  
This takes a designated `selection` construct,
and a choice of one or more of its components (but not all of them) and removes them. 

```
selection{P1;..Pa;Pb;Pc;..;Pn} less [Pb]
 = selection{P1;..;Pa;Pc;..;Pn}
```

It is not semantics preserving, but is instead a refinement - it removes some non-determinism. 

* `PML-TX Unroll Iteration`  
Given a designated iteration, and a number, un-roll the loop that number of times using the following laws for a single unroll:  

```
iteration{P} = sequence{P;iteration{P}}
iteration{P;Q;..;R}
 = sequence{P;Q;..;R;iteration{P;Q;..;R}}
```

Note that an iteration with multiple sub-components treats those sub-components as being in sequence. This is a refinement.

* `PML-TX Parallelise Sequence`  
This converts a designated `sequence` construct into a branch: 

```
sequence{P1;..;Pn}
 --> branch{P1;..;Pn}
```
It is not semantics preserving, being an anti-refinement that adds maximal non-determinism.

* `PML-TX Rule-Based Transformation`  
This takes a designated construct and tries
to match it against a collection of transformation rules, applying the first that matches. A transformation rule is a rule similar to those shown above, with a lefthand side pattern and a righthand side outcome. A pattern is a nesting of sequence, branch, selection and iteration constructs, with variables to denote arbitrary PML components, as seen above. Notation like `P1;..;Pn` above is too vague and need not be supported, however a non-empty list
of components can be specified using cons-notation.
The rules may be semantics preserving, but can also be refinements or anti-refinements. Collections of rules will be stored in files, with a `.rules` extension. See `sample.rules` for examples.

* `Pathway Badness Ranking`  
Use DDI and timing analysis results to compute a badness score for a PML pathway.

* `PML-TX Gradient Descent Time Optimisation`  
Given a PML description with a badness ranking considered too high, iteratively try out various transformations, re-running the `Pathway Badness Ranking` feature each time, and selecting the result if it is an improvement. Repeat until a pathways is found  that is not improved by any transformations. Hint: prefer refinements, and definitely don't try any anti-refinements!

* `PML-TX Brute Force Time Optimisation`  
Given a PML description with a badness ranking considered too high, iteratively try out various transformations, re-running the `Pathway Badness Ranking` feature each time, and then giving each result the same treatment. After a certain  number of transformations have been done, stop and return the best result. 

### Features no longer of interest

These include features that no longer seem relevant, are subsumed by new features, or which have been done for Release 1 and are now considered part of the infrastructure.

* `PML File selection`
* `PML File Loading`
   Issue: will the PEOS internal representation do for the planned DINTO analyses as well?
* `PML Analysis Selection`
* `Running PML Analysis`
* `On-Screen PML Reporting`
* `PML Log-file Generation`
* `PML Error and Warning highlights`
* `Select specific OWL Ontology`
* `Load Selected Ontology`
* `On-Screen DINTO Reporting`
* `DINTO Logfile Generation`
* `DINTO Error and Warning highlights`
* `Subsetting DINTO`
   The DINTO files are very large, so the ability to pull out a useful test subset would be nice.
* `DINTO re-structuring`
   The DINTO OWL files really need to be broken down in a modular fashion (see comments of 2 Feb 2016 in DINTO [Issue #1](https://github.com/labda/DINTO/issues/1)).
* `fbinfer-friendly PEOS`  
Fix the PEOS makefiles so that [fbinfer](http://www.fbinfer.com) can easily check all the sources. 
* `fbinfer-proof PEOS`  
Fix the PEOS sources so that [fbinfer](http://www.fbinfer.com) no longer reports any errors.

