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

txTotalData1 = strcat(tx1Data, tx2Data, tx3Data, tx4Data)

mining.mine(txTotalData1);
bc;
bc.blockArray(2);

leaf1Hash = strcat(tx1Hash, tx2Hash)
leaf2Hash = strcat(tx3Hash, tx4Hash)

merkleRoot1 = strcat(leaf1Hash,leaf2Hash)

merkleRoot1Hash = hash('SHA256', merkleRoot1)
disp('============ the first block end ============')

disp('============ the second block begin ============')

%Transaction data
tx5Data = ['Eleanor Ritter','female,1939-09-03','skin cancer']
tx6Data = ['Sofia Wise','female','1956-10-16','Alzheimers disease']
tx7Data = ['Nevaeh Perry','female','1946-09-30','kidney disease']
tx8Data = ['Addison Combs','female','1963-01-17','breast cancer']

txTotalData2 = strcat(tx5Data, tx6Data, tx7Data, tx8Data)

mining.mine(txTotalData2);
bc;
bc.blockArray(3);

leaf3Hash = strcat(tx5Data, tx6Data)
leaf4Hash = strcat(tx7Data, tx8Data)

merkleRoot2 = strcat(leaf3Hash,leaf4Hash)

merkleRoot2Hash = hash('SHA256', merkleRoot2)

disp('============ the second block end ============')

disp('============ the third block begin ============')

%Transaction data
tx9Data = ['Ashley Wilson','female','1946-10-21','Alzheimers','disease']
tx10Data = ['Levi Burns','male','1958-01-31','HIV/AIDS']
tx11Data = ['Jonah Smith','male','1965-10-30','HIV/AIDS']
tx12Data = ['Bella Small','female','1959-03-30','multiple sclerosis']


txTotalData3 = strcat(tx9Data, tx10Data, tx11Data, tx12Data)

mining.mine(txTotalData3);
bc;
bc.blockArray(4);

leaf5Hash = strcat(tx9Data, tx10Data)
leaf6Hash = strcat(tx11Data, tx12Data)

merkleRoot3 = strcat(leaf5Hash,leaf6Hash)

merkleRoot3Hash = hash('SHA256', merkleRoot3)

disp('============ the third block end ============')

disp('============ the fourth block begin ============')

%Transaction data
tx13Data = ['Eli Wilson','male','1949-02-09','hypertension']
tx14Data = ['Samantha Flores','female','1972-12-15','hypertension']
tx15Data = ['Riley Jones','female','1967-11-20','heart disease']
tx16Data = ['Jake Glover','male','1943-12-27','hypertension']

txTotalData4 = strcat(tx13Data, tx14Data, tx15Data, tx16Data)

mining.mine(txTotalData4);
bc;
bc.blockArray(5);

leaf7Hash = strcat(tx13Data, tx14Data)
leaf8Hash = strcat(tx15Data, tx16Data)

merkleRoot4 = strcat(leaf7Hash,leaf8Hash)

merkleRoot4Hash = hash('SHA256', merkleRoot4)

disp('============ the fourth block end ============')
