DATAPOINTS BDRVR CDSDefaultOutput_3p3v_Typ_27degC
MODEL_VERSION=2.0
PullUpReference=3.3
PullDownReference=0
PowerClampReference=3.3
GroundClampReference=0

DATAPOINTS AC_PARAM
dVGateOpen=1
dVGateClose=0
ENABLE_ON_VOLT=1
ENABLE_OFF_VOLT=0
RISE_TIME=8.33333e-010
FALL_TIME=8.33333e-010
dVdtr=3.96e+009
dVdtf=3.96e+009
END AC_PARAM

DATAPOINTS VI POWER_CLAMP
0 0
0.1 0
0.4 0.0001
0.5 0.0006
0.6 0.0012
0.7 0.0024
0.8 0.006
0.9 0.013
1 0.025
5 0.179
END VI POWER_CLAMP

DATAPOINTS VI ground_clamp
0 0
-0.1 0
-0.4 -0.0001
-0.5 -0.0005
-0.6 -0.0012
-0.7 -0.0024
-0.8 -0.006
-0.9 -0.013
-1 -0.025
-5 -0.179
END VI ground_clamp

DATAPOINTS VI PULL_UP
-6.6 -0.142
-5 -0.137
-4.5 -0.133
-4 -0.128
-3.5 -0.123
-3 -0.118
-2.5 -0.11
-2 -0.098
-1.5 -0.083
-1 -0.064
-0.5 -0.038
0 0
1 0.064
2 0.098
3 0.118
3.3 0.122
END VI PULL_UP

DATAPOINTS VI pull_down
-3.3 -0.21
-3 -0.207
-2 -0.188
-1 -0.07
0 0
0.5 0.07
1 0.127
1.5 0.164
2 0.188
2.5 0.203
3 0.207
3.5 0.21
4 0.212
4.5 0.214
5 0.215
6.6 0.217
END VI pull_down

DATAPOINTS PARASITICS
C_COMP=4e-012
END PARASITICS

END BDRVR CDSDefaultOutput_3p3v_Typ_27degC
DATAPOINTS BDRVR CDSDefaultInput_3p3v_Typ_27degC
MODEL_VERSION=2.0
PowerClampReference=3.3
GroundClampReference=0

DATAPOINTS AC_PARAM
dVGateOpen=1
dVGateClose=0
ENABLE_ON_VOLT=1
ENABLE_OFF_VOLT=0
RISE_TIME=-1
FALL_TIME=-1
dVdtr=-1
dVdtf=-1
END AC_PARAM

DATAPOINTS LOGIC_PARAM
VHI_MIN=2
VLO_MAX=0.8
END LOGIC_PARAM

DATAPOINTS VI POWER_CLAMP
0 0
0.1 0
0.4 0.0001
0.5 0.0006
0.6 0.0012
0.7 0.0024
0.8 0.006
0.9 0.013
1 0.025
5 0.179
END VI POWER_CLAMP

DATAPOINTS VI ground_clamp
0 0
-0.1 0
-0.4 -0.0001
-0.5 -0.0005
-0.6 -0.0012
-0.7 -0.0024
-0.8 -0.006
-0.9 -0.013
-1 -0.025
-5 -0.179
END VI ground_clamp

DATAPOINTS PARASITICS
C_COMP=4e-012
END PARASITICS

END BDRVR CDSDefaultInput_3p3v_Typ_27degC