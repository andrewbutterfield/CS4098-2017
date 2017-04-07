# Example PML Files

## Language Constructs and DDIs

There are three files named `ConstructDDITest` present:

* A PML file describing a Clinical Pathway, mentioning drugs 1-4.
* A JPG image that gives a graphical overview
* A CSV file containing DDI data that asserts that every drug has a bad interaction with every other drug.

The following lists what should be reported by the various "Construct DDI" features

### `Identify Sequential DDIs`

* SEQ1  (1,2) (1,3) (1,4) (2,4) (3,4)
* SEQ2  (2,3)
* SEQ3  (1,2) (1,3)
* SEQ4  (2,4)

### `Identify Parallel DDIs`

* PAR (1,2) (1,4) (2,4) (3,2) (3,4)

### `Report Alternative non-DDIs`

* SEL1 (1,2) (1,3) (1,4) (2,1) (2,3) (2,4) (3,1) (3,2) (3,4) (4,1) (4,2) (4,3)
* SEL2 (2,3)

### `Report Repeated Alternative DDIs`

* ITER SEL2 (2,3)

## Drugs and Timing

We have a few files involving two daily-use drugs: 
statin and alcohol, 
with a bad interaction between them with a safe seperation of at least 6 hours.

All the drug interactions relevant here are in `Example-DDIs.csv`.

### PML Files

* `Daily_Statin.pml`
   A healthcare process whereby a patient takes a daily dose of statins every evening
* `Daily_Drink.pml`
   A "healthcare" process whereby a patient takes a daily tot of whiskey every evening
* `Daily_StatinDrink_merge.pml`
   A possible result of running the feature "Merging Clinical Pathways written in PML" on the above two files.
* `Daily_StatinDrink_unnamed.pml`
   The merged file above with construct names removed
* `Daily_StatinDrink_onename.pml`
   The merged file above with the same construct name everywhere.
* `Daily_StatinDrink_safe.pml`
   A reconfigured merge where the statin is now taken in the morning,
so avoiding any interaction with the evening drink.



The other five files are simply copied from the ui/carepathways folder of peos,
but will probably be modified later to have drug and timing information added.
