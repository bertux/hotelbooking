//SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

/**
* @title hotelBooking
* @dev Contract to book hotel rooms
* @custom:dev-run-script scripts/deploy_with_ethers.ts
*/
contract hotelBooking{

    struct hotelRoom{
        string categoryName;
        uint tariff;
        bool occupied;
        uint review;
        uint reviewNb;
        address customerBooked;
        bool booked;
    }

    struct customer{
        string name;
        string addre;
        uint  custIdNb;
    }

    uint public custCount;
    uint public nbOfRooms;
    address public owner;

    modifier onlyowner{
        require(msg.sender == owner , "Only owner has the rights to add rooms");
        _;
    }

    mapping(uint=>hotelRoom) public hotelRoomDetails;
    mapping(address=>customer) public customerDetails;

    constructor(){
        owner = msg.sender;
        setHotelRoom(1, "Royal", 10);
        setHotelRoom(2, "Premium", 5);
        setHotelRoom(3, "Delux", 3);
    }

    function setHotelRoom(uint _roomNb , string memory _categoryName, uint _tariff) public onlyowner{
        hotelRoomDetails[_roomNb].categoryName = _categoryName;
        hotelRoomDetails[_roomNb].tariff = _tariff;
        hotelRoomDetails[_roomNb].review = 0;
        hotelRoomDetails[_roomNb].reviewNb = 0;
        nbOfRooms++;
    }

    function setcust(address _addr , string memory _name ,string memory _addre) public {
        customerDetails[_addr].name = _name;
        customerDetails[_addr].addre = _addre;
        customerDetails[_addr].custIdNb = custCount;
        custCount++ ;
    }



    function payToBook() public payable {
        if(msg.value==10){
            bookRoomRoyal();
        }
        else if(msg.value==5){
            bookRoomPremium();
        }
        else if(msg.value==3){
            bookRoomDeluxe();
        }
        else{
            revert();
        }
    }

    function bookRoomRoyal() internal {
       require(hotelRoomDetails[1].booked==false , "Room is already booked");
        hotelRoomDetails[1].booked = true;
        hotelRoomDetails[1].customerBooked = msg.sender;

    }

    function bookRoomPremium() internal {
        require(hotelRoomDetails[2].booked==false , "Room is already booked");
        hotelRoomDetails[2].booked = true;
        hotelRoomDetails[2].customerBooked = msg.sender;
    }

    function bookRoomDeluxe() internal {
        require(hotelRoomDetails[3].booked==false , "Room is already booked");
        hotelRoomDetails[3].booked = true;
        hotelRoomDetails[3].customerBooked = msg.sender;
    }


    function checkInRoyal() external {
        require(hotelRoomDetails[1].customerBooked==msg.sender , "This room has not been booked by you.");
        hotelRoomDetails[1].occupied = true;
    }

     function checkInPremium() external {
       require(hotelRoomDetails[2].customerBooked==msg.sender , "This room has not been booked by you.");
        hotelRoomDetails[2].occupied = true;
    }

    function checkInDeluxe() external {
        require(hotelRoomDetails[3].customerBooked==msg.sender , "This room has not been booked by you.");
        hotelRoomDetails[3].occupied = true;
    }

    
    function checkOutRoyal(uint _rating) external {
        require(hotelRoomDetails[1].customerBooked==msg.sender , "This room has not been booked by you.");
            hotelRoomDetails[1].occupied = false;
            hotelRoomDetails[1].booked = false;
            hotelRoomDetails[1].review = (_rating+ (hotelRoomDetails[1].review*hotelRoomDetails[1].reviewNb))/(hotelRoomDetails[1].reviewNb+1);
            hotelRoomDetails[1].reviewNb++;
    }

     function checkOutPremium(uint _rating) external {
        require(hotelRoomDetails[2].customerBooked==msg.sender , "This room has not been booked by you.");
            hotelRoomDetails[2].occupied = false;
            hotelRoomDetails[2].booked = false;
            hotelRoomDetails[2].review = (_rating+ (hotelRoomDetails[2].review*hotelRoomDetails[2].reviewNb))/(hotelRoomDetails[2].reviewNb+1);
            hotelRoomDetails[2].reviewNb++;
    }

    function checkOutDeluxe(uint _rating) external {
        require(hotelRoomDetails[3].customerBooked==msg.sender , "This room has not been booked by you.");
            hotelRoomDetails[3].occupied = false;
            hotelRoomDetails[3].booked = false;
            hotelRoomDetails[3].review = (_rating+ (hotelRoomDetails[3].review*hotelRoomDetails[3].reviewNb))/(hotelRoomDetails[3].reviewNb+1);
            hotelRoomDetails[3].reviewNb++;
    }
}