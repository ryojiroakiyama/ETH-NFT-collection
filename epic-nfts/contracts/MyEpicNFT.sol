// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;
// いくつかの OpenZeppelin のコントラクトをインポートします。
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

// インポートした OpenZeppelin のコントラクトを継承しています。
// 継承したコントラクトのメソッドにアクセスできるようになります。
contract MyEpicNFT is ERC721URIStorage {
    // OpenZeppelin が tokenIds を簡単に追跡するために提供するライブラリを呼び出しています
    // トラッキングの際に起こりうるオーバーフロー(インクリメントしていくから)を防ぐらしい
    using Counters for Counters.Counter;

    // _tokenIds用意(初期値:0)
    Counters.Counter private _tokenIds;

    // NFT トークンの名前とそのシンボルを渡します。
    constructor() ERC721("SquareNFT", "SQUARE") {
        console.log("This is my NFT contract.");
    }

    // ユーザーが NFT を取得するために実行する関数です。
    function makeAnEpicNFT() public {
        // 現在のtokenIdを取得します。tokenIdは0から始まります。
        uint256 newItemId = _tokenIds.current();

        // msg.sender を使って NFT を送信者に Mint します。
        _safeMint(msg.sender, newItemId);

        // NFT データを設定します。
        _setTokenURI(
            newItemId,
            "data:application/json;base64,ewoJIm5hbWUiOiAiRXBpY05mdENyZWF0b3IiLAoJImRlc2NyaXB0aW9uIjogIlRoZSBoaWdobHkgYWNjbGFpbWVkIHNxdWFyZSBjb2xsZWN0aW9uIiwKCSJpbWFnZSI6ICJkYXRhOmltYWdlL3N2Zyt4bWw7YmFzZTY0LFBITjJad29nSUhodGJHNXpQU0pvZEhSd09pOHZkM2QzTG5jekxtOXlaeTh5TURBd0wzTjJaeUlLSUNCd2NtVnpaWEoyWlVGemNHVmpkRkpoZEdsdlBTSjRUV2x1V1UxcGJpQnRaV1YwSWdvZ0lIWnBaWGRDYjNnOUlqQWdNQ0F6TlRBZ016VXdJZ28rQ2lBZ1BITjBlV3hsUGdvZ0lDQWdMbUpoYzJVZ2V3b2dJQ0FnSUNCbWFXeHNPaUIzYUdsMFpUc0tJQ0FnSUNBZ1ptOXVkQzFtWVcxcGJIazZJSE5sY21sbU93b2dJQ0FnSUNCbWIyNTBMWE5wZW1VNklERTBjSGc3Q2lBZ0lDQjlDaUFnUEM5emRIbHNaVDRLSUNBOGNtVmpkQ0IzYVdSMGFEMGlNVEF3SlNJZ2FHVnBaMmgwUFNJeE1EQWxJaUJtYVd4c1BTSmliR0ZqYXlJZ0x6NEtJQ0E4ZEdWNGRBb2dJQ0FnZUQwaU5UQWxJZ29nSUNBZ2VUMGlOVEFsSWdvZ0lDQWdZMnhoYzNNOUltSmhjMlVpQ2lBZ0lDQmtiMjFwYm1GdWRDMWlZWE5sYkdsdVpUMGliV2xrWkd4bElnb2dJQ0FnZEdWNGRDMWhibU5vYjNJOUltMXBaR1JzWlNJS0lDQStDaUFnSUNCRmNHbGpUbVowUTNKbFlYUnZjZ29nSUR3dmRHVjRkRDRLUEM5emRtYysiCn0="
        );

        // NFTがいつ誰に作成されたかを確認します。
        console.log(
            "An NFT w/ ID %s has been minted to %s",
            newItemId,
            msg.sender
        );

        // 次の NFT が Mint されるときのカウンターをインクリメントする。
        _tokenIds.increment();
    }
}
