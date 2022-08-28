pragma solidity >=0.8.16 <0.9.0;

import "forge-std/Test.Sol";
import "forge-std/Vm.sol";
import "../src/OwnerUpOnly.sol";

contract OwnerUpOnlyTest is Test {
    OwnerUpOnly upOnly;

    function setUp() public {
        upOnly = new OwnerUpOnly();
    }

    function testIncrementAsOwner() public {
        assertEq(upOnly.count(), 0);
        upOnly.increment();
        assertEq(upOnly.count(), 1);
    }

    function testAsOwner() public {
        vm.prank(address(1));
        assertEq(upOnly.count(), 0);
        upOnly.increment();
        assertEq(upOnly.count(), 1);
    }

    function testFailIncrementAsNotOwner() public {
        vm.prank(address(0));
        upOnly.increment();
        assertEq(upOnly.count(), 1);
    }

    function testIncrementAsNotOwner() public {
        vm.expectRevert(Unauthorized.selector);
        vm.prank(address(0));
        upOnly.increment();
        assertEq(upOnly.count(), 0);
    }
}
