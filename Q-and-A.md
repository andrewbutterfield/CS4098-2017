# Questions and Answers

(most recent first)

## Current most important answer:

**Ignore the load-factor, and concetrate on estimating hours of ideal effort required (1 hour - 2 points)**

PS: I think you are all under-estimating 
(remember all the work required to ***deliver*** a feature: code, test, document, deliver)

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
