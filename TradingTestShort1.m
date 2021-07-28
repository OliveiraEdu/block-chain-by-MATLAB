clear all
clc
disp('============ the genesis block begin ============')
bc = BlockChain;

bc;

bc.blockArray(1);

mining = Miner(bc);

fprintf('\nindex: %d \n\n',bc.blockArray(1).index)
fprintf('data: %s \n\n',bc.blockArray(1).data)
fprintf('selfHash: %s \n\n',bc.blockArray(1).selfHash)

disp('============ the genesis block end ============')

disp('============ the first block begin ============')

%Transaction data
tx1Data = ['Amelia Nixon','female','1944-03-09','hypertension']
tx2Data = ['Clara Hicks','female','1966-07-02','endometriosis']
tx3Data = ['Mason Brown','male','1981-05-31','prostate cancer']
tx4Data = ['Michael Rice','male','1945-02-13','multiple sclerosis']

tx1Hash = hash('SHA256',tx1Data)
tx2Hash = hash('SHA256',tx2Data)
tx3Hash = hash('SHA256',tx3Data)
tx4Hash = hash('SHA256',tx4Data)

txTotalData = strcat(tx1Data, tx2Data, tx3Data, tx4Data)

mining.mine(txTotalData);
bc;
bc.blockArray(2);

leaf1Hash = strcat(tx1Hash, tx2Hash)
leaf2Hash = strcat(tx3Hash, tx4Hash)

merkleRoot = strcat(leaf1Hash,leaf2Hash)

merkleRootHash = hash('SHA256', merkleRoot)
disp('============ the first block end ============')

disp('============ the second block begin ============')

%Transaction data
tx1Data = ['Eleanor Ritter','female,1939-09-03','skin cancer']
tx2Data = ['Sofia Wise','female','1956-10-16','Alzheimers disease']
tx3Data = ['Nevaeh Perry','female','1946-09-30','kidney disease']
tx4Data = ['Addison Combs','female','1963-01-17','breast cancer']

txTotalData = strcat(tx1Data, tx2Data, tx3Data, tx4Data)

mining.mine(txTotalData);
bc;
bc.blockArray(3);

leaf1Hash = strcat(tx1Hash, tx2Hash)
leaf2Hash = strcat(tx3Hash, tx4Hash)

merkleRoot = strcat(leaf1Hash,leaf2Hash)

merkleRootHash = hash('SHA256', merkleRoot)

disp('============ the second block end ============')

disp('============ the third block begin ============')

%Transaction data
tx1Data = ['Ashley Wilson','female','1946-10-21','Alzheimers','disease']
tx2Data = ['Levi Burns','male','1958-01-31','HIV/AIDS']
tx3Data = ['Jonah Smith','male','1965-10-30','HIV/AIDS']
tx4Data = ['Bella Small','female','1959-03-30','multiple sclerosis']


txTotalData = strcat(tx1Data, tx2Data, tx3Data, tx4Data)

mining.mine(txTotalData);
bc;
bc.blockArray(4);

leaf1Hash = strcat(tx1Hash, tx2Hash)
leaf2Hash = strcat(tx3Hash, tx4Hash)

merkleRoot = strcat(leaf1Hash,leaf2Hash)

merkleRootHash = hash('SHA256', merkleRoot)

disp('============ the third block end ============')

disp('============ the fourth block begin ============')

%Transaction data
tx1Data = ['Eli Wilson','male','1949-02-09','hypertension']
tx2Data = ['Samantha Flores','female','1972-12-15','hypertension']
tx3Data = ['Riley Jones','female','1967-11-20','heart disease']
tx4Data = ['Jake Glover','male','1943-12-27','hypertension']

txTotalData = strcat(tx1Data, tx2Data, tx3Data, tx4Data)

mining.mine(txTotalData);
bc;
bc.blockArray(5);

leaf1Hash = strcat(tx1Hash, tx2Hash)
leaf2Hash = strcat(tx3Hash, tx4Hash)

merkleRoot = strcat(leaf1Hash,leaf2Hash)

merkleRootHash = hash('SHA256', merkleRoot)

disp('============ the fourth block end ============')
