Opt = 'SHA256';

bc.blockArray(2).selfHash;
bc.blockArray(3).selfHash;
bc.blockArray(4).selfHash;
bc.blockArray(5).selfHash;


leaf1=strcat(bc.blockArray(2).selfHash,bc.blockArray(3).selfHash);
leaf2=strcat(bc.blockArray(4).selfHash,bc.blockArray(5).selfHash);

leaf1Hash=hash(Opt,leaf1);
leaf2Hash=hash(Opt,leaf2);

MerkleRoot1 = strcat(leaf1Hash, leaf2Hash);

MerkleRootHash1 = hash(Opt, MerkleRoot1);



