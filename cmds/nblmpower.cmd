# launch IOC in E3:
# iocsh.bash ./cmds/nblmpower.cmd

require nblmpower, master

epicsEnvSet(AREA,           "$(AREA=CEA)")  # default prefix is "CEA"
epicsEnvSet(DEVICE,         "PBI-nBLM")
epicsEnvSet(HV_LV_PREFIX,   "SY4527")

#### hardware connection layer

#############################################################################################################################################################################################################
### CAEN power supply (HV + LV)
#############################################################################################################################################################################################################

# CAEN crate (touchscreen)
dbLoadRecords("CAEN_SY4527_crate.template", "AREA=${AREA}, DEVICE=${DEVICE}, HV_LV_PREFIX="${HV_LV_PREFIX}", CRATE_IDX="1"")       # first crate
## HV
dbLoadRecords("CAEN_HV_A7030.db", "AREA=${AREA}, DEVICE=${DEVICE}, HV_LV_PREFIX="${HV_LV_PREFIX}", CRATE_IDX="1", HV_SLOT="02"")
dbLoadRecords("CAEN_HV_A7030.db", "AREA=${AREA}, DEVICE=${DEVICE}, HV_LV_PREFIX="${HV_LV_PREFIX}", CRATE_IDX="1", HV_SLOT="05"")
## LV
dbLoadRecords("CAEN_LV_A2519.db", "AREA=${AREA}, DEVICE=${DEVICE}, HV_LV_PREFIX="${HV_LV_PREFIX}", CRATE_IDX="1", LV_SLOT="10"")

# CAEN crate 2
dbLoadRecords("CAEN_SY4527_crate.template", "AREA=${AREA}, DEVICE=${DEVICE}, HV_LV_PREFIX="${HV_LV_PREFIX}", CRATE_IDX="2"")   # second crate
## HV
dbLoadRecords("CAEN_HV_A7030.db", "AREA=${AREA}, DEVICE=${DEVICE}, HV_LV_PREFIX="${HV_LV_PREFIX}", CRATE_IDX="2", HV_SLOT="15"")
# #LV
#############################################################################################################################################################################################################

iocInit

