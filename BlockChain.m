classdef BlockChain < handle

	properties
	totalCount % used to record the number of blocks
	blockArray % this is an object array that used to store the blockchain
	end

	methods
	function obj = BlockChain()
		obj.blockArray =[Block(0, 'Genesis Block')]; % genesis block
		obj.totalCount = 1;
		obj.calculateGensisBlockHash(); % calculate the hash of genesis block
	end

	function bc = getLatest(obj) % get the last block on the current blockchain
		bc = obj.blockArray(end);
	end

	function calculateGensisBlockHash(obj)
		gb = obj.blockArray(1);
		Opt = 'SHA256';
    str = strcat(num2str(gb.index), gb.data);
		%disp(str)
		gb.selfHash = hash(Opt, str); % calculate current hash
  end

	function addBlock(obj, newBlock) % when Miner.m successfully 'digs out' a block that meets the requirements
		if	obj.validateNewBlock(newBlock) % call this function
			obj.blockArray(end+1) = newBlock; % and then add this block to this blockchain
		end
	end

	function tf = validateNewBlock(obj, newBlock) % verify that the newly added block meets the requirements or not.
		%newHash = DataHash([strcat(newBlock.getCombined(), num2str(newBlock.nonce))])
    newHash = hash('SHA256', [strcat(newBlock.getCombined(), num2str(newBlock.nonce))]);
		if(strcmp(newHash(1:3), '000') && strcmp(newBlock.selfHash, newHash))
			tf=  true;
		else
			tf = false;
		end
	end
	end
end
