// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

// Chimera deps
import {BaseSetup} from "@chimera/BaseSetup.sol";
import {vm} from "@chimera/Hevm.sol";

// Managers
import {ActorManager} from "@recon/ActorManager.sol";
import {AssetManager} from "@recon/AssetManager.sol";

// Helpers
import {Utils} from "@recon/Utils.sol";

// Your deps
import "src/Morpho.sol";
import "src/mocks/IrmMock.sol";
import "src/mocks/OracleMock.sol";

abstract contract Setup is BaseSetup, ActorManager, AssetManager, Utils {
    IrmMock irm;
    Morpho morpho;
    OracleMock oracleMock;
    
    /// === Setup === ///
    /// This contains all calls to be performed in the tester constructor, both for Echidna and Foundry
    function setup() internal virtual override {
        irm = new IrmMock();
        morpho = new Morpho(address(this));
        oracleMock = new OracleMock();

        _newAsset(18);
        _newAsset(18);

        _addActor(address(0x101));
    }

    /// === MODIFIERS === ///
    /// Prank admin and actor
    
    modifier asAdmin {
        vm.prank(address(this));
        _;
    }

    modifier asActor {
        vm.prank(address(_getActor()));
        _;
    }
}
