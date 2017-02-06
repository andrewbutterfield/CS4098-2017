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

The zero-velocity release requires loading, analysing and reporting on PML, but that is very basic.
The feastures below are intended to be more polished and part of a system that integrates with DINTO. So a uniform look and feel will be wanted.

Each feature has a `Name` and possibly some explanatory text.

The feature list is tentative and may change over time. However, for any given Release, your group's feature list will be fixed. Note also, that most groups will not be implementing all of these features - in general the feature-list  will will probably grow beyond any groups capacity.

You are also welcome to suggest features!

### Load PML

1. `PML File selection`
2. `PML File Loading`
   Issue: will the PEOS internal representation do for the planned DINTO analyses as well?

### Analyse PML

1. `PML Analysis Selection`
2. `Running PML Analysis`

### Report Analysis

1. `On-Screen PML Reporting`
2. `PML Log-file Generation`
3. `PML Error and Warning highlights`

### Load DINTO

1. `Select specific OWL Ontology`
2. `Load Selected Ontology`
### Re-analyse

1. `Identify drugs in PML`
2. `Lookup drugs in DINTO`
3. `Identify DDIs` (Drug-Drug Interactions)

### Report Analysis

1. `On-Screen DINTO Reporting`
2. `DINTO Logfile Generation`
3. `DINTO Error and Warning highlights`

### Enhancements (and Practicalities)

1. `Adding Time to PML`
2. `DDI Timing Analysis`
2. `Merging Clinical Pathways written in PML`
3. `DDI-aware Pathway modifications`
4. `Subsetting DINTO`
   The DINTO files are very large, so the ability to pull out a useful test subset would be nice.
5. `DINTO re-structuring`
   The DINTO OWL files really need to be broken down in a modular fashion (see comments of 2 Feb 2016 in DINTO [Issue #1](https://github.com/labda/DINTO/issues/1)).
6. `finfer-friendly PEOS` Fix the PEOS makefiles so that [fbinfer](http://www.fbinfer.com) can easily check all the sources. 
6. `fbinfer-proof PEOS` Fix the PEOS sources so that [fbinfer](http://www.fbinfer.com) no longer reports any errors.


