clear all;
clc;
pkg load dataframe;
warning('off', 'Octave:legacy-function');

datasetFull = dataframe('~/Documents/repo/datasets/patients/dataMini.csv');

%Reads i rows of the dataset
i = 1;

dataset = datasetFull(1:i,1:end);

disp('============ the genesis transaction begin ============');
bc = BlockChain;
bc;
bc.blockArray(1);
mining = Miner(bc);
disp('============ the genesis transaction end ============');

%Loads each dataset line as a block transaction
for n = 1:i

  transaction =  [dataset.array(n,1) dataset.array(n,2) dataset.array(n,3) dataset.array(n,14)];

  fprintf('============ begin transaction  #%d ============\n',n);
  mining.mine(transaction)
  bc;

  fprintf('\nindex: %d \n\n',bc.blockArray(n+1).index)
  fprintf('data: %s \n\n',bc.blockArray(n+1).data)
  fprintf('nonce: %d \n\n',bc.blockArray(n+1).nonce)
  fprintf('previousHash: %s \n\n',bc.blockArray(n+1).previousHash)
  fprintf('selfHash: %s \n\n',bc.blockArray(n+1).selfHash)


  fprintf('============ end transaction  #%d ============\n',n);

end
