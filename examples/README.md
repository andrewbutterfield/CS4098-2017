# Example PML Files

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
but will probably me modified later to have drug and timing information added.
