clear all;
clc;
pkg load dataframe;
warning('off', 'Octave:legacy-function');

datasetFull = dataframe('~/Documents/repo/datasets/patients/data.csv');

%Reads i rows of the dataset
i = 3;

dataset = datasetFull(1:i,1:end);

disp('============ the genesis transaction begin ============');
bc = BlockChain;
bc; 
bc.blockArray(1);
mining = Miner(bc);
disp('============ the genesis transaction end ============');

%Loads each dataset lines as a block
for n = 1:i

  line =  [dataset.array(n,1) dataset.array(n,2) dataset.array(n,3) dataset.array(n,14)];
  
  disp('============ begin transaction  ============');
  transaction = line;
  mining.mine(transaction)
  bc; 
  bc.blockArray(2);
  disp('============  end transaction ============');

end




