Feature: C.3.30.0700 User Interface: The system shall ensure users with Randomization Setup can create and modify randomization models while in project development mode. 
# A: Stratified Randomization C.3.30.0700.0100 to C.3.30.0700.0300

Setup: 
create project with project 3.30 Rand
Add test user to full rights
Log in with Test user.

Enable stratified randomization with one stratum.
note - you mustenable stratified randomization before you disable it and you can't save without deleting the entire randomizaiton model to change it.

Click Add new randomization model
call it simple_strata
Enable Stratified randomization with one stratum (don't save) 
click Use stratified randomization?
choose strata strat_var1
verify: choose strata dropdown appears

C.3.30.0700.0100: Disable stratified randomization.
uncheck the checkbox "Use stratified Randomization
verify: choose strata dropdown disappears

C.3.30.0700.0200: Enable stratified randomization with one stratum.
click Use stratified randomization?
choose strata strat_var1
choose your randomization field simple_rand
Save randomization model

verify
Saved successfully with one strat variable.
click randomization and check strat variable appears under stratification column beside the simple_rand target.
Check Logging module and verify that the above randomization steps are logged appropriately. (think it may only say "Save randomization model")

C.3.30.0700.0300: Enable stratified randomization with up to 14 strata (test all 14).
Setup: Click "summary"
Click Add new randomization model
Call it complex_strata
click Use stratified randomization?
choose strata strat_var1
Click add another stratum
verify: select a field appears
choose strata strat_var2
Click add another stratum
choose strata strat_var3
Click add another stratum
choose strata strat_var4
Click add another stratum
choose strata strat_var5
Click add another stratum
choose strata strat_var6Click add another stratum
choose strata strat_var7
Click add another stratum
choose strata strat_var8
Click add another stratum
choose strata strat_var9
Click add another stratum
choose strata strat_var10
Click add another stratum
choose strata strat_var11
Click add another stratum
choose strata strat_var12
Click add another stratum
choose strata strat_var13
Click add another stratum
choose strata strat_var14
verify no option to add another stratum

Save Randomization model
verify project saved successfully.
click randomization and check strat variables appears under stratification column beside the complex_rand target.

Check Logging module and verify that the above randomization steps are logged appropriately. (only include if different from the last logging check)
