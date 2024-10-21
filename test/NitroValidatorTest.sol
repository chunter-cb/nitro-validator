// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import {Test, console} from "forge-std/Test.sol";
import "../src/INitroValidator.sol";
import "../src/NitroValidator.sol";

contract NitroValidatorTest is Test {
    INitroValidator validator;
    bytes attestation;

    function setUp() public {
        vm.warp(1708930774); // set timestamp to Oct 21 2024 4PM EST 
        attestation = vm.readFileBinary("./test/nitro-attestation/sample_attestation.bin");
        validator = new NitroValidator(); 
        console.log("validator address");
        console.log(address(validator));
    }

    function test_validateAttestation() public {
        // Call the function to validate the attestation
        (bytes memory enclavePubKey, bytes memory pcr0) = validator.validateAttestation(attestation, 365 days);

        // Assert expected outputs (dummy check for now)
        assertTrue(enclavePubKey.length > 0, "Enclave public key should not be empty");
        assertTrue(pcr0.length > 0, "PCR0 should not be empty");
    }
}
