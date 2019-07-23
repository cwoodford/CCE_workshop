#!/bin/bash -
#SBATCH -J 0217_1_R234                   # Job Name
#SBATCH -o SpEC.stdout                # Output file name
#SBATCH -e SpEC.stderr                # Error file name
#SBATCH --nodes 1                 
#SBATCH --ntasks 1        
#SBATCH -t 24:00:00   # Run time
#SBATCH --mail-user=woodford@cita.utoronto.ca

#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL

./SpEC
