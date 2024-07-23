// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// library number to string
import "@openzeppelin/contracts/utils/Strings.sol";

contract Foundraising {
    using Strings for uint256;

    // foundraiser address
    address public owner;

    // total money collected, foundraising goal, donor count
    uint public balance = 0;
    uint public goal = 5000;
    uint public donor_count = 0;
    bool public foundraising_open = true;

   // set the fundraising goal at contract creation
    constructor(uint _goal) {
        owner = msg.sender;
        goal = _goal;
    }

    function donate() public payable { 
        require(foundraising_open, "La raccolta fondi e' conclusa.");
        require(msg.value > 0, "L'importo donato deve essere positivo.");
        // add value donated to balance 
        balance += msg.value;
        donor_count++;
    }

    function withdraw(uint _amount) public {
        require(msg.sender == owner, "Solo il proprietario puo' prelevare.");
        require(!foundraising_open, "La raccolta fondi non e' ancora chiusa!");
        require(_amount > 0, "Prelevare un'importo maggiore di 0.");
        require(_amount <= balance, "Importo superiore al saldo disponibile.");
        // transfer to the owner address
        payable(owner).transfer(_amount);
        balance -= _amount;
    }

    function isFoundraisingOpen() public view returns (bool) {
        return foundraising_open;
    }

    function closeFoundraising() public {
        require(msg.sender == owner, "Solo il proprietario puo' chiudere la raccolta fondi.");
        require(balance >= goal, "L'obiettivo della raccolta fondi non e' stato ancora raggiunto.");
        foundraising_open = false;
    }

    function getFundraisingStatus() public view returns (string memory) {
        // return a string
        if (balance >= goal) {
            return string(abi.encodePacked("Obiettivo raggiunto! Fondi raccolti: ", balance.toString(), " Totale donatori: ", donor_count.toString()));
        } else {
            return string(abi.encodePacked("Mancano ", (goal - balance).toString(), " eth per completare la raccolta."));
        }
    }
 
}
