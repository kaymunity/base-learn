//SPDX-License-Identifier: NONE

pragma solidity 0.8.28;

contract GarageManager{

    struct Car {
        string make;
        string model;
        string color;
        uint numberOfDoors;
    }

    mapping(address => Car[]) public garage;

    
    function addCar(
        string memory _make,
        string memory _model,
        string memory _color,
        uint _numberOfDoors) external  {

        Car memory newCar = Car({
            make: _make,
            model: _model,
            color: _color,
            numberOfDoors: _numberOfDoors
        });

        garage[msg.sender].push(newCar);
    }

    function getMyCars() external view returns( Car[] memory){
        return garage[msg.sender];
    }

    function getUserCars(address _user) external view returns(Car[] memory){
        return garage[_user];
    }

    
    error BadCarIndex(uint _indexProvided);
    function updateCar(
        uint _index,
        string memory _updateMake,
        string memory _updateModel,
        string memory _updateColor, 
        uint _updateNumberOfDoors) external {

        if (_index >= garage[msg.sender].length){
            revert BadCarIndex(_index);
        }

        garage[msg.sender][_index] = Car({
        make: _updateMake,
        model: _updateModel,
        color: _updateColor,
        numberOfDoors: _updateNumberOfDoors
        });

        // Car storage updatedCar = garage[msg.sender][_index];

        // if (bytes(_updateMake).length != 0){
        //     updatedCar.make = _updateMake;
        // }
        // if (bytes(_updateModel).length != 0){
        //     updatedCar.model = _updateModel;
        // }
        // if (bytes(_updateColor).length != 0){
        //     updatedCar.color = _updateColor;
        // }
        // if (_updateNumberOfDoors != 0){
        //     updatedCar.numberOfDoors = _updateNumberOfDoors;
        // }

    }
    
    function resetMyGarage() public {
        delete garage[msg.sender];
    }
}