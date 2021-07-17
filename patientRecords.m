clear all;
clc;
pkg load io;

datasetFile = '~/Documents/repo/datasets/patients/dataMini.csv';

datasetFull = csv2cell(datasetFile);

%Reads i rows of the dataset
i = 1;

dataset = datasetFull(2:end,:);

disp('============ the genesis transaction begin ============');
bc = BlockChain;
bc;
mining = Miner(bc);

fprintf('\nindex: %d \n\n',bc.blockArray(1).index)
fprintf('data: %s \n\n',bc.blockArray(1).data)
fprintf('selfHash: %s \n\n',bc.blockArray(1).selfHash)

disp('============ the genesis transaction end ============');

%Loads each dataset line as a block transaction
for n = 1:i
  
  transaction=cell2mat(dataset(n,[1,2,3,14]));
  
  fprintf('============ begin transaction #%d ============\n',n);
  mining.mine(transaction)
  bc;

  fprintf('\nindex: %d \n\n',bc.blockArray(n+1).index)
  fprintf('data: %s \n\n',bc.blockArray(n+1).data)
  fprintf('nonce: %d \n\n',bc.blockArray(n+1).nonce)
  fprintf('previousHash: %s \n\n',bc.blockArray(n+1).previousHash)
  fprintf('selfHash: %s \n\n',bc.blockArray(n+1).selfHash)

  fprintf('============= end transaction #%d =============\n',n);

end
