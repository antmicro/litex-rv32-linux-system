#!/bin/bash
BASE=${HOME}
export LM_LICENSE_FILE=1702@localhost
export PATH=$BASE/microsemi/Libero_SoC_PolarFire_v2.3/Libero/bin:${PATH}
cd $1
LD_LIBRARY_PATH=$BASE/microsemi/Libero_SoC_PolarFire_v2.3/Libero/lib:$LD_LIBRARY_PATH libero SCRIPT:$2
