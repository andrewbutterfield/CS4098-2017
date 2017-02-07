# Questions and Answers

(most recent first)

## Current most important answer:

**Ignore the load-factor, and concetrate on estimating hours of ideal effort required (1 hour - 2 points)**

PS: I think you are all under-estimating 
(remember all the work required to ***deliver*** a feature: code, test, document, deliver)

PPS: Especially any feature involving DINTO !
(Hint: lookup SPARQL and RDF)

## Q:

DINTO re-structuring: What would the scale and nature of this re-structuring be?

### A: 

Considerable. They distribute using .zip even though the OBOFoundry requires them to have an owl file available unwrapped. This is because their full owl file is too large for github filesize restrictions.
This feature involves trying out the modularization referred to in [DINTO Issue 1](https://github.com/labda/DINTO/issues/1).

It is a seriously non-trivial exercise to split an OWL file into parts, as there can be arbitrary cross-references between different components.

I think we may defer this to Release 2.

## Q:

DINTO Error and Warning highlights: what would the source of these errors be? Malformed .owl files or dangerous drug combinations that should produce a warning?

### A:

Malformed .owl files.

## Q:

Identify DDIs: Does this involve identifying all of those drugs that would interact with a certain specified drug?

### A:

Yes. You have to do this for every drug mentioned in the particular PML file being processed,
but *only for other drugs that are also mentioned in that PML file*. There is point in a pathway finding interactions between drugs that are not used by thst pathway.

The app workflow would be something like:

1. Load PML file of Clinical Pathway under consideration
  2. Check for malformed PML
  3. If malformed give user option to abort/continue
2. Load DINTO
  3. Check for malformed OWL
  4. If malformed, inform user, and quit.
3. Identify DDIs and report to user
4. Assist user in improiong pathways
5. Save new improved pathway

## Q:

Identify drugs in DINTO: Is this a simple "lookup", given a drug name or alias?

### A:  

It depends on how the drug is described in PML, which has to be determined by another feature. Initially it will suffice to find some "interesting" drugs in DINTO and add their identifers (somehow) to PML.

## Q:

As regards the last two features i.e. running FB-Infer on PEOS.
If for example we decided not to use PEOS and to use your generated PML Parsers, could we still be assigned the last 2 features to complete?

### A:

Yes --- those features are about improving PEOS in a specific way. You can contribute even if you don't use it. Just keep in mind, when estimating, that there may be an additional cost to you to do this if is not part of your regular build.

## Q:

Could we get clarification on what the Error and Warning highlighting would entail?

Is it just highlighting the most important errors?
Or is it highlighting the conflicts in a pathway?

### A:

The precise answer depends on how you are handling and displaying the PML. Basically once a PML file is loaded, some way needs to be devloped to bring any errors and warnings to the attention of the user. What is not wanted is forcing the read to work through a list of log message, most of the harmless, in order to find the warnings and errors.

Whether these are automatically shown in full, or simply given a one-line alert to their presence
and then require the user to request the details, is a matter of user-interface design. 

## Q:

Is the load factor a multiple of the estimate or just added to it?

### A:

It's a multiple, at least three but may be more. Ignore this for now.

## Q:
In your slides, you state that each developer should spend 120 points for each sprint (i.e release). This would result in a total of 1,440 points in total for the two releases for our group. Is that accurate in terms of what we need for the feature form estimate form? (I.e Is that approximately the number of points you will allocate to us?)

### A:

* First, ignore Release 2 for now. All will probably be utterly different by then.
* One developer does 30 *ideal* points a week, and so 120 over a (full) Release cycle. So a group of six has 720 points of effort available.
* Ideal points are a perfect in-the-zone 30mins of effort. The load-factor will reduce the amount of points I have available to spend. 
* **The load factor will be applied by me after the ideal points have been finalised.**
* *For now, you should focus on what you think the ideal effort will be for each feature.*

## Q:

Just to confirm, the FB Infer features would be applying infer to the PEOS program, not the PML files (as PEOS is a C program and PML is not supported by Infer). Just wanted to confirm that.

### A:

Yes - that's right - think of fbinfer as a very smart tester, properly known as a static anlyser. It is design to work on C, C++, Java (Android) and Objective-C (iOS). PML is a totally different kind of language.
