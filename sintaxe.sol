// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Variables {
    uint8 a = 1;         // 8-bit inteiro sem sinal (0 a 255)
    uint16 b = 65535;    // 16-bit inteiro sem sinal (0 a 65535)
    uint256 c = 100000000; // 256-bit inteiro sem sinal (0 a 2^256-1)

    int8 d = -128;        // 8-bit inteiro com sinal (-128 a 127)
    int16 e = 32767;      // 16-bit inteiro com sinal (-32768 a 32767)
    int256 f = -100000000; // 256-bit inteiro com sinal (-2^255 a 2^255-1)

    bool isReady = true; //boolean
    bool hasBalance = false;

    address owner = 0x1234567890123456789012345678901234567890; //wallet adress in hash code
    address payable payableOwner = payable(owner); //this wallet is payable

    string greeting = "Hello, World!"; //Strings
    string name = "Alice";

    enum State { Created, Locked, Inactive } //Enum
    State public state;

    // public, internal, external, private
    // public: Everyone can see
    // internal: This contract and contracts that inherit from it, can be seen / equals protected in java
    // external: Only outside can see
    // private: Only this contract can see
    function getGreeting() public returns (string memory) {
        return "Hello, World!";
    }

    // pure, view
    // pure: Pure means that the function will not query anything on the lobckchain, nor store anything in memory.
    // pure is used only for mathematics calculations
    function getGreetingPure() public pure returns (string memory) {
        return "Hello, World!";
    }

    //Same thing in this function, the '_a' and '_b' variable, has been passed in function params, its not necessary to consult the blockchain
    function add(uint _a, uint _b) public pure returns (uint) {
        return _a + _b;
    }

    //view:
    //view is used for read variables in contract.
    function getNameView() public view returns (string memory) {
        return name;
    }

    //A modifier is basically a way of reusing code, serving as a layer of verification and validation before executing that function.
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _; //if msg.sender == owner returs true, this part of the function will be activated.
    }

    //we are using the onlyOwner modifier, if msg.sender == owner returs true, the function return name. else the function is not executed.
    function getNameViewOnlyOwner() public view onlyOwner returns (string memory) {
        return name;
    }
}