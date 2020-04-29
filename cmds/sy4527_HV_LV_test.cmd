# launch IOC in E3:
# iocsh.bash ./cmds/sy4527_HV_LV_test.cmd

require nblmpower, master

epicsEnvSet(AREA,           "$(AREA=CEA)")  # default prefix is "CEA"
epicsEnvSet(DEVICE,         "PBI-nBLM")
epicsEnvSet(HV_LV_PREFIX,   "SY4527")


#############################################################################################################################################################################################################
### CAEN power supply : HV tests
#############################################################################################################################################################################################################
# same config on all channels
dbLoadRecords("hv_test_all_ch.db", "AREA=${AREA}")
#############################################################################################################################################################################################################

iocInit

