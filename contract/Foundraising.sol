// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Foundraising {
    // foundraiser address
    address public owner = msg.sender;

    // total money collected, foundraising goal and donor count
    uint public balance = 0;
    uint public goal = 5000;
    uint public donor_count = 0;
    bool public foundraising_open = true;

    function donate() public payable { 
        require(foundraising_open, "La raccolta fondi e' stata chiusa.");
        require(msg.value > 0, "L'importo donato deve essere positivo.");
        // add value donated to balance 
        balance += msg.value;
        donor_count++;
    }

    function withdraw(uint _amount) public {
        require(msg.sender == owner, "Solo il proprietario puo' prelevare.");
        require(_amount > 0, "Prelevare un'importo maggiore di 0.");
        require(_amount <= balance, "Importo superiore al saldo disponibile.");
        // transfer to the owner address
        payable(owner).transfer(_amount);
        balance -= _amount;
    }

    function close_foundraising() public {
        require(foundraising_open, "La raccolta fondi e' gia' chiusa.");
        require(msg.sender == owner, "Solo il proprietario puo' chiudere la raccolta fondi.");
        // this variable will be checked in the function donate()
        foundraising_open = false;
    }

    function check_goal() public view returns (string memory) {
        // return a string
        if (balance >= goal) {
            return string(abi.encodePacked("Obiettivo raggiunto! Fondi raccolti: ", uintToString(balance) , " Totale donatori: ", uintToString(donor_count)));
        } else {
            return string(abi.encodePacked("Mancano ", uintToString(goal-balance), " eth per completare la raccolta."));
        }
    }
 
    function uintToString(uint v) private pure returns (string memory str) {
        // convert uint in string
        // the return string where this function in coded need to have string(abi.encodePacked("string")
        uint maxlength = 100;
        bytes memory reversed = new bytes(maxlength);
        uint i = 0;
        while (v != 0) {
            uint remainder = v % 10;
            v = v / 10;
            reversed[i++] = bytes1(uint8(48 + remainder));
        }
        bytes memory s = new bytes(i);
        for (uint j = 0; j < i; j++) {
            s[j] = reversed[i - 1 - j];
        }
        str = string(s);
    }
}
