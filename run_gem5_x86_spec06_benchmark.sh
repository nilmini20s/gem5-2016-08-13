#!/bin/bash 
GEM5_DIR=/home/nilmini/work/research/hsing-min/gem5
SPEC_DIR=/home/nilmini/programs/cpu2006 
ARGC=$# # Get number of arguments excluding arg0 (the script itself). Check for help message condition.  
if [[ "$ARGC" != 2 ]]; then # Bad number of arguments.  
    echo "USAGE: run_gem5_x86_spec06_benchmark.sh <BENCHMARK> <OUPUT_DIR>"
    echo "EXAMPLE: ./run_gem5_x86_spec06_benchmark.sh bzip2 /FULL/PATH/TO/output_dir" 
    echo "" 
    echo "A single --help or -h argument will bring this message back." 
fi 

# Get command line input. We will need to check these.  
BENCHMARK=$1    # Benchmark name, e.g. bzip2 
OUTPUT_DIR=$2   # Directory to place run output. Make sure this exists!  
GEM5_OPT=$3

# BENCHMARK CODENAMES 
PERLBENCH_CODE=400.perlbench
BZIP2_CODE=401.bzip2 
GCC_CODE=403.gcc 
BWAVES_CODE=410.bwaves 
GAMESS_CODE=416.gamess
MCF_CODE=429.mcf
MILC_CODE=433.milc
ZEUSMP_CODE=434.zeusmp
GROMACS_CODE=435.gromacs
CACTUSADM_CODE=436.cactusADM
LESLIE3D_CODE=437.leslie3d
NAMD_CODE=444.namd
GOBMK_CODE=445.gobmk
DEALII_CODE=447.dealII 
SOPLEX_CODE=450.soplex
POVRAY_CODE=453.povray
CALCULIX_CODE=454.calculix
HMMER_CODE=456.hmmer
SJENG_CODE=458.sjeng
GEMSFDTD_CODE=459.GemsFDTD
LIBQUANTUM_CODE=462.libquantum
H264REF_CODE=464.h264ref
TONTO_CODE=465.tonto
LBM_CODE=470.lbm
OMNETPP_CODE=471.omnetpp
ASTAR_CODE=473.astar
WRF_CODE=481.wrf
SPHINX3_CODE=482.sphinx3
XALANCBMK_CODE=483.xalancbmk

# Check BENCHMARK input
BENCHMARK_CODE="none"

if [[ "$BENCHMARK" == "perlbench" ]]; then
    BENCHMARK_CODE=$PERLBENCH_CODE
fi
if [[ "$BENCHMARK" == "bzip2" ]]; then
    BENCHMARK_CODE=$BZIP2_CODE
fi
if [[ "$BENCHMARK" == "gcc" ]]; then
    BENCHMARK_CODE=$GCC_CODE
fi
if [[ "$BENCHMARK" == "bwaves" ]]; then
    BENCHMARK_CODE=$BWAVES_CODE
fi
if [[ "$BENCHMARK" == "gamess" ]]; then
    BENCHMARK_CODE=$GAMESS_CODE
fi
if [[ "$BENCHMARK" == "mcf" ]]; then
    BENCHMARK_CODE=$MCF_CODE
fi
if [[ "$BENCHMARK" == "milc" ]]; then
    BENCHMARK_CODE=$MILC_CODE
fi
if [[ "$BENCHMARK" == "zeusmp" ]]; then
    BENCHMARK_CODE=$ZEUSMP_CODE
fi
if [[ "$BENCHMARK" == "gromacs" ]]; then
    BENCHMARK_CODE=$GROMACS_CODE
fi
if [[ "$BENCHMARK" == "cactusADM" ]]; then
    BENCHMARK_CODE=$CACTUSADM_CODE
fi
if [[ "$BENCHMARK" == "leslie3d" ]]; then
    BENCHMARK_CODE=$LESLIE3D_CODE
fi
if [[ "$BENCHMARK" == "namd" ]]; then
    BENCHMARK_CODE=$NAMD_CODE
fi
if [[ "$BENCHMARK" == "gobmk" ]]; then
    BENCHMARK_CODE=$GOBMK_CODE
fi
if [[ "$BENCHMARK" == "dealII" ]]; then
    BENCHMARK_CODE=$DEALII_CODE
fi
if [[ "$BENCHMARK" == "soplex" ]]; then
    BENCHMARK_CODE=$SOPLEX_CODE
fi
if [[ "$BENCHMARK" == "povray" ]]; then
    BENCHMARK_CODE=$POVRAY_CODE
fi
if [[ "$BENCHMARK" == "calculix" ]]; then
    BENCHMARK_CODE=$CALCULIX_CODE
fi
if [[ "$BENCHMARK" == "hmmer" ]]; then
    BENCHMARK_CODE=$HMMER_CODE
fi
if [[ "$BENCHMARK" == "sjeng" ]]; then
    BENCHMARK_CODE=$SJENG_CODE
fi
if [[ "$BENCHMARK" == "GemsFDTD" ]]; then
    BENCHMARK_CODE=$GEMSFDTD_CODE
fi
if [[ "$BENCHMARK" == "libquantum" ]]; then
    BENCHMARK_CODE=$LIBQUANTUM_CODE
fi
if [[ "$BENCHMARK" == "h264ref" ]]; then
    BENCHMARK_CODE=$H264REF_CODE
fi
if [[ "$BENCHMARK" == "tonto" ]]; then
    BENCHMARK_CODE=$TONTO_CODE
fi
if [[ "$BENCHMARK" == "lbm" ]]; then
    BENCHMARK_CODE=$LBM_CODE
fi
if [[ "$BENCHMARK" == "omnetpp" ]]; then
    BENCHMARK_CODE=$OMNETPP_CODE
fi
if [[ "$BENCHMARK" == "astar" ]]; then
    BENCHMARK_CODE=$ASTAR_CODE
fi
if [[ "$BENCHMARK" == "wrf" ]]; then
    BENCHMARK_CODE=$WRF_CODE
fi
if [[ "$BENCHMARK" == "sphinx3" ]]; then
    BENCHMARK_CODE=$SPHINX3_CODE
fi
if [[ "$BENCHMARK" == "xalancbmk" ]]; then
    BENCHMARK_CODE=$XALANCBMK_CODE
fi

# Sanity check
if [[ "$BENCHMARK_CODE" == "none" ]]; then
    echo "Input benchmark selection $BENCHMARK did not match any known SPEC 2006 benchmarks. Exiting!"
    exit 1
fi

# Check OUTPUT_DIR existence
if [[ !(-d "$OUTPUT_DIR") ]]; then
    echo "Output directory $OUTPUT_DIR does not exist. Exiting!"
    exit 1
fi

# Run directory for the selected SPEC benchmark
RUN_DIR=$SPEC_DIR/benchspec/CPU2006/$BENCHMARK_CODE/run/run_base_ref_amd64-m64-gcc43-nn.0000
# File log for this script's stdout henceforth
SCRIPT_OUT=$OUTPUT_DIR/runscript_${BENCHMARK}.log

# REPORT SCRIPT CONFIGURATION
echo "Command line:" | tee $SCRIPT_OUT
echo "$0 $*" | tee -a $SCRIPT_OUT
echo "===Hardcoded directories===" | tee -a $SCRIPT_OUT
echo "GEM5_DIR: $GEM5_DIR" | tee -a $SCRIPT_OUT
echo "SPEC_DIR: $SPEC_DIR" | tee -a $SCRIPT_OUT
echo "===Script inputs===" | tee -a $SCRIPT_OUT
echo "BENCHMARK: $BENCHMARK" | tee -a $SCRIPT_OUT
echo "OUTPUT_DIR: $OUTPUT_DIR" | tee -a $SCRIPT_OUT
echo "======" | tee -a $SCRIPT_OUT

# LAUNCH GEM5 SIMULATION
echo "" | tee -a $SCRIPT_OUT
echo "Changing to SPEC benchmark runtime directory $RUN_DIR" | tee -a $SCRIPT_OUT
cd $RUN_DIR

echo "" | tee -a $SCRIPT_OUT
echo "" | tee -a $SCRIPT_OUT
echo "---Here goes nothing! Starting gem5!---" | tee -a $SCRIPT_OUT
echo "" | tee -a $SCRIPT_OUT
echo "" | tee -a $SCRIPT_OUT

# Actually launching gem5
gdb --args $GEM5_DIR/build/X86/gem5.$GEM5_OPT \
    --outdir=$OUTPUT_DIR \
    --debug-flags=CacheAll,O3CPUAll \
    --debug-file=$OUTPUT_DIR/debug.out \
    $GEM5_DIR/configs/example/spec06_config.py \
    --benchmark=$BENCHMARK \
    --benchmark_stdout=$OUTPUT_DIR/$BENCHMARK.out \
    --benchmark_stderr=$OUTPUT_DIR/$BENCHMARK.err \
    --cpu-type=detailed \
    --cpu-clock=1GHz \
    --mem-size=2GB \
    -I 10000000 \
    --caches \
    --l1d_size=32kB \
    --l1i_size=32kB \
    --l2cache \
    --l2_size=2MB | tee -a $SCRIPT_OUT 
