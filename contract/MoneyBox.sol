// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MoneyBox {
    // moneybox address
    address public owner = msg.sender;

    // total money
    uint public balance = 0;

    // donare Ether aggiornando il saldo
    function donate() public payable { //payable 
        require(msg.value > 0, "L'importo donato deve essere positivo!!");
        balance += msg.value; // Aggiunge il valore della donazione al saldo
    }

    // prelevare Ether aggiornando il saldo, può farlo solo il proprietario
    function withdraw(uint _amount) public {
        require(msg.sender == owner, "Solo il proprietario puo' prelevare!!");
        require(_amount <= balance, "Importo superiore al saldo disponibile!!");
        payable(owner).transfer(_amount); // trasferisce ethere all'owner
        balance -= _amount; // aggiorna saldo
    }
}
