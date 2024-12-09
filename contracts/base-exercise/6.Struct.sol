//SPDX-License-Identifier: NONE

pragma solidity 0.8.28;

contract GarageManager{

    struct Car {
        uint8 numberOfDoors;
        string make;
        string model;
        string color;
    }
    mapping(address => Car[]) public garage;

    Car[] garageCars;
    
    function addCar(
        string memory _make,
        string memory _model,
        string memory _color,
        uint8 _numberOfDoors) external  {

            Car storage newCar = garageCars.push();
            
            newCar.make = _make;
            newCar.model = _model;
            newCar.color = _color;
            newCar.numberOfDoors = _numberOfDoors;

            garage[msg.sender] = garageCars;
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
        uint8 _updateNumberOfDoors) external {

        if (_index >= garage[msg.sender].length){
            revert BadCarIndex(_index);
        }

        Car storage updatedCar = garage[msg.sender][_index];

        if (bytes(_updateMake).length != 0){
            updatedCar.make = _updateMake;
        }
        if (bytes(_updateModel).length != 0){
            updatedCar.model = _updateModel;
        }
        if (bytes(_updateColor).length != 0){
            updatedCar.color = _updateColor;
        }
        if (_updateNumberOfDoors != 0){
            updatedCar.numberOfDoors = _updateNumberOfDoors;
        }

    }
    
    function resetMyGarage()public {
        delete garage[msg.sender];
    }
}