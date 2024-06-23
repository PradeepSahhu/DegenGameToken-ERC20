# DegenToken Game using ERC20 from openzeppelin

This smart contract depicts the Degen Game Token.

## Fully Tested and Executed on Fuji Testnet


<img width="783" alt="image" src="https://github.com/PradeepSahhu/DegenGameToken-ERC20/assets/94203408/0c01524a-a5ec-4f0d-87a8-9a9c14fed9e6">

## verify from [Click Here to Verfity in Snowtrace](https://testnet.snowtrace.io/token/0x8182810F920E7D0ad3600d132066f5249EaCd46A?chainId=43113)

## The snowtrace Api key is paid now so, i verified the contract at sepolia testnet through etherscan api

<img width="837" alt="image" src="https://github.com/PradeepSahhu/DegenGameToken-ERC20/assets/94203408/969ff41f-47d8-4e96-a6c7-1951595a4b92">

Link To visit Verified Smart Contract : [https://sepolia.etherscan.io/address/0x01a5Cd1BE2b1732BBeB6AfC9c4B3c31874Fe07C8#code](https://sepolia.etherscan.io/address/0x4249056c7c5646A8660C1b65EB2546D90567Ae11#code)

## Code Explanation

```Solidity

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
```

Importing the OpenZeppelin ERC20 Contract and inheriting it to my contract using `is` keyword.

Using the constructor initlializing the owner state variable and minting some token for the owner.

```Solidity
  constructor(uint _tokenToMint) ERC20("Degen","DGN"){
        owner = msg.sender;
        gameAsset = new GameAsset();
        _mint(msg.sender, _tokenToMint); // very small amount because it takes high gas fees 
    } 
```

Minting the reward Token for another account ( its like giving the reward in the form of Tokens)

- I am not minning but transfering tokens because to save the transaction cost.

```Solidity

 ///@notice to reward a certain user by _amount amount only callable by the owner.

    function mintTokenReward(address _address,uint _amount) external onlyOwner{
        _mint(_address,_amount);
    }
```

Through this checkingBalance function anyone can check his/her token balance.
In degen game it will help to show/display/check the token balance of the current account.

```Solidity

  ///@notice for checking the balance of token of caller account.


    function checkingBalance() external view returns(uint){
        return balanceOf(msg.sender);
    }

```

Through transferTokens transfering some amount of tokens from the caller account to the recipient account by some required check i.e user must have equal to greater than that tokens.
In degen Game it will help to share game resources with other players.

```Solidity
function tranferTokens(address _recepient, uint _amount) external{
        require(balanceOf(msg.sender) >= _amount);
       transfer(_recepient, _amount);

    }
```

Redeeming one tokens for one NFT (Game Asset NFT).

```Solidity

   ///@notice redeeming one token for a NFT 
    function redeemTokens() external{
        require(balanceOf(msg.sender) >= 1);
        _transfer(msg.sender, address(this), 1);
        gameAsset.safeMint(msg.sender);
    }

```

Burning the game assets or Degen Game tokens.

```Solidity


 ///@notice burn the _tokenAmount amount of token

    function burnToken(uint _tokenAmount) external {
        require( balanceOf(msg.sender)>=_tokenAmount);
        _burn(msg.sender, _tokenAmount);
    }

```

In case of emergency the owner the withdraw all the tokens from the contract through withdraw function.

```Solidity
///@notice to withdraw all tokens
    function withdraw() external onlyOwner{
          _transfer(address(this), owner, balanceOf(address(this)));
    }
```

Author : Pradeep Sahu
