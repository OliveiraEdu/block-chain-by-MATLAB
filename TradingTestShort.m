clear all
clc
disp('============ the genesis block begin ============')
bc = BlockChain

bc

bc.blockArray(1)

mining = Miner(bc)
disp('============ the genesis block end ============')

disp('============ the first block begin ============')

%Transaction data
tx1 = ['A', 'B', 'MOP', '200']

tx2 = ['B', 'C', 'USD', '300']

tx3 = ['C', 'A', 'HKD', '700']

tx4 = ['X', 'Y', 'BNB', '901']


mining.mine(tx1)

bc

bc.blockArray(2)

mining.mine(tx2)

bc

bc.blockArray(3)

mining.mine(tx3)

bc

bc.blockArray(4)

mining.mine(tx4)

bc

bc.blockArray(5)

%Calculating the Merkler Root
Opt = 'SHA256'

%bc.blockArray(2).selfHash
%bc.blockArray(3).selfHash
%bc.blockArray(4).selfHash
%bc.blockArray(5).selfHash


leaf1=strcat(bc.blockArray(2).selfHash,bc.blockArray(3).selfHash)
leaf2=strcat(bc.blockArray(4).selfHash,bc.blockArray(5).selfHash)

leaf1Hash=hash(Opt,leaf1)
leaf2Hash=hash(Opt,leaf2)

MerkleRoot1 = strcat(leaf1Hash, leaf2Hash)

MerkleRootHash1 = hash(Opt, MerkleRoot1)

disp('============ the first block end ============')
