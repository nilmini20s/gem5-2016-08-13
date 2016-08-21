import m5
from m5.objects import *

alpha_suffix = '_base.amd64-m64-gcc43-nn'

#400.perlbench
perlbench = LiveProcess()
perlbench.executable = 'perlbench' + alpha_suffix
perlbench.cmd = [perlbench.executable] + ['-I./lib', 'checkspam.pl', '2500',
        '5', '25', '11', '150', '1', '1', '1', '1']

#401.bzip2
bzip2 = LiveProcess()
bzip2.executable = 'bzip2' + alpha_suffix
bzip2.cmd = [bzip2.executable] + ['input.source', '280']

#403.gcc
gcc = LiveProcess()
gcc.executable = 'gcc' + alpha_suffix
gcc.cmd = [gcc.executable] + ['166.i', '-o', '166.s']

#410.bwaves
bwaves = LiveProcess()
bwaves.executable = 'bwaves' + alpha_suffix
bwaves.cmd = [bwaves.executable]

#416.gamess
gamess = LiveProcess()
gamess.executable = 'gamess' + alpha_suffix
gamess.cmd = [gamess.executable]
gamess.input = 'cytosine.2.config'

#429.mcf
mcf = LiveProcess()
mcf.executable = 'mcf' + alpha_suffix
mcf.cmd = [mcf.executable] + ['inp.in']

#433.milc
milc = LiveProcess()
milc.executable = 'milc' + alpha_suffix
milc.cmd = [milc.executable]
milc.input = 'su3imp.in'

#434.zeusmp
zeusmp = LiveProcess()
zeusmp.executable = 'zeusmp' + alpha_suffix
zeusmp.cmd = [zeusmp.executable]

#435.gromacs
gromacs = LiveProcess()
gromacs.executable = 'gromacs' + alpha_suffix
gromacs.cmd = [gromacs.executable] + ['-silent', '-deffnm', 'gromacs',
        '-nice', '0']

#436.cactusADM
cactusADM = LiveProcess()
cactusADM.executable = 'cactusADM' + alpha_suffix
cactusADM.cmd = [cactusADM.executable] + ['benchADM.par']

#437.leslie3d
leslie3d = LiveProcess()
leslie3d.executable = 'leslie3d' + alpha_suffix
leslie3d.cmd = [leslie3d.executable]
leslie3d.input = 'leslie3d.in'

#444.namd
namd = LiveProcess()
namd.executable = 'namd' + alpha_suffix
namd.cmd = [namd.executable] + ['--input', 'namd.input', '--output',
        'namd.out', '--iterations', '38']

#445.gobmk
gobmk = LiveProcess()
gobmk.executable = 'gobmk' + alpha_suffix
gobmk.cmd = [gobmk.executable] + ['--quiet', '--mode', 'gtp']
gobmk.input = '13x13.tst'

#447.dealII
dealII=LiveProcess()
dealII.executable = 'dealII' + alpha_suffix
# TEST CMDS
dealII.cmd = [dealII.executable]+['23']
# REF CMDS
#dealII.output = out_dir + 'dealII.out'

#450.soplex
soplex = LiveProcess()
soplex.executable = 'soplex' + alpha_suffix
soplex.cmd = [soplex.executable] + ['-m45000', 'pds-50.mps']

#453.povray
povray = LiveProcess()
povray.executable = 'povray' + alpha_suffix
povray.cmd = [povray.executable] + ['SPEC-benchmark-ref.ini']

#454.calculix
calculix = LiveProcess()
calculix.executable = 'calculix' + alpha_suffix
calculix.cmd = [calculix.executable] + ['-i', 'hyperviscoplastic']

#456.hmmer
hmmer = LiveProcess()
hmmer.executable = 'hmmer' + alpha_suffix
hmmer.cmd = [hmmer.executable] + ['nph3.hmm', 'swiss41']

#458.sjeng
sjeng = LiveProcess()
sjeng.executable = 'sjeng' + alpha_suffix
sjeng.cmd = [sjeng.executable] + ['ref.txt']

#459.GemsFDTD
GemsFDTD = LiveProcess()
GemsFDTD.executable = 'GemsFDTD' + alpha_suffix
GemsFDTD.cmd = [GemsFDTD.executable] + ['yee.dat']

#462.libquantum
libquantum = LiveProcess()
libquantum.executable = 'libquantum' + alpha_suffix
libquantum.cmd = [libquantum.executable] + ['1397', '8']

#464.h264ref
h264ref = LiveProcess()
h264ref.executable = 'h264ref' + alpha_suffix
h264ref.cmd = [h264ref.executable] + ['-d', 'foreman_ref_encoder_baseline.cfg']

#465.tonto
tonto = LiveProcess()
tonto.executable = 'tonto' + alpha_suffix
tonto.cmd = [tonto.executable]

#470.lbm
lbm = LiveProcess()
lbm.executable = 'lbm' + alpha_suffix
lbm.cmd = [lbm.executable] + ['300', 'reference.dat', '0', '0',
        '100_100_130_ldc.of']

#471.omnetpp
omnetpp=LiveProcess()
omnetpp.executable = 'omnetpp' + alpha_suffix
omnetpp.cmd = [omnetpp.executable] + ['omnetpp.ini']

#473.astar
astar=LiveProcess()
astar.executable = 'astar' + alpha_suffix
astar.cmd = [astar.executable] + ['rivers.cfg']

#481.wrf
wrf=LiveProcess()
wrf.executable = 'wrf' + alpha_suffix
wrf.cmd = [wrf.executable]

#482.sphinx3
sphinx3=LiveProcess()
sphinx3.executable = 'sphinx_livepretend' + alpha_suffix
sphinx3.cmd = [sphinx3.executable] + ['ctlfile', '.', 'args.an4']

#483.xalancbmk ##--NOT WORKING--##
#483.xalancbmk
xalancbmk=LiveProcess()
xalancbmk.executable = 'Xalan' + alpha_suffix
# TEST CMDS
xalancbmk.cmd = [xalancbmk.executable] + ['-v','t5.xml','xalanc.xsl']
# REF CMDS
#xalancbmk.output = out_dir + 'xalancbmk.out'
