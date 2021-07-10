classdef Block < handle

	properties
	index % index of block
	data % transcation data
	previousHash % the previous hash
	selfHash % current hash
	nonce % random number
	end

%The block’s function can accept 2 or 3 parameters. When two parameters are provided,
%the constructed Block object is called a Genesis Block, which is the first block on the entire
%blockchain; when it accepts three parameters, the third parameter is the hash value from the
%previous block.
 
 methods
	function obj = Block(index, data, previousHash)
		if nargin == 2 % genesis block!
			obj.index = index ;
			obj.data = data ;
		elseif nargin == 3
			obj.index = index ;
			obj.data = data ;
			obj.previousHash = previousHash;
		end
	end

	% The function below converts all data on the block except 'nonce' and
	% 'selfHash' into characters, which is then used to calculate selfHash.
	function str = getCombined(obj)
		%str = strcat([num2str(obj.index), obj.previousHash, join(obj.data)]);
    str = strcat([num2str(obj.index), obj.previousHash, (obj.data)]);
    end
	end
end
