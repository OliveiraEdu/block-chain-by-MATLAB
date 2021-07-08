classdef Miner < handle

	properties
	blockchain
	end

	methods
	function obj = Miner(blockchain)
		obj.blockchain = blockchain;
	end

	function mine(obj, newData)
		% get the last block on the current blockchain
		latestBlock = obj.blockchain.getLatest();
		% construct a new block
		newBlock = Block(latestBlock.index+1,...
		newData,...
		latestBlock.selfHash);
		% find appropriate selfhash
		not_found = true;
		iter = 1;
		%Opt.Method = 'SHA-256';
		%Opt.Input  = 'ascii';
    Opt = 'SHA256';

		tic
		while(not_found)
		%newHash = DataHash([strcat(newBlock.getCombined(), num2str(iter))]);
    newHash = hash(Opt, [strcat(newBlock.getCombined(), num2str(iter))]);
    
    %If it does not meet the requirements(i.e., the first three digits of newHash begin with 000), try the next integer until the first three digits of newHash are 000.
    if(strcmp(newHash(1 : 3), '000'))
				newBlock.nonce = iter; % solve violently
        newBlock.selfHash = newHash; % if the approproate selfhash is found
				obj.blockchain.addBlock(newBlock); % add selfhash to blockchain
        
        fprintf('data: %s \n\n',newData)
        fprintf('index: %d \n\n',latestBlock.index+1)
        fprintf('nonce: %d \n\n',newBlock.nonce)
        fprintf('previousHash: %s \n\n', latestBlock.selfHash)
        fprintf('newHash: %s \n\n', newHash)
				
				break
			end
		iter = iter + 1;
		end
		toc

	end
	end
end

