%clear all;
%clc;
disp('============ the genesis transaction begin ============');
bc = BlockChain;
bc
bc.blockArray(1)
mining = Miner(bc)
disp('============ the genesis transaction end ============');

disp('============ the first transaction begin ============');
transaction = ['A', 'B', 'MOP', '200','SIDE']
mining.mine(transaction)
bc;
bc.blockArray(2)
disp('============ the first transaction end ============');

disp('============ the second transaction begin ============');
transaction = ['B', 'C', 'USD', '300']
mining.mine(transaction)
bc;
bc.blockArray(3)
disp('============ the second transaction end ============');

disp('============ the third transaction begin ============');
transaction = ['C', 'A', 'HKD', '700']
mining.mine(transaction)
bc; 
bc.blockArray(4)
disp('============ the third transaction end ============');

disp('============ the third transaction begin ============');
transaction = ['X', 'Y', 'BNB', '901']
mining.mine(transaction)
bc; 
bc.blockArray(5)
disp('============ the third transaction end ============');


