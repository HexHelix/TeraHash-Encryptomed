// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21 <0.7.0;

contract SimpleStorage {
//   uint storedData;

//   uint public items;

//   struct Manf{
//     uint id;
//     string MedicineName;
//   }

//   mapping (uint => Manf) public CheckManf;

  

//   function AddManf(uint _medicineId,string memory _medicinename)public returns(bool){
//             Manf memory NewManf=Manf(_medicineId,_medicinename);
//             CheckManf[items]=NewManf;
//             items = items+1;
           
//             return true;
            
//     }

//   function set(uint x) public {
//     storedData = x;
//   }

//   function get() public view returns (uint) {
//     return storedData;
//   }
event Added(uint256 index);
    
    uint public items;
    
    struct Seller{
        uint productId;
        string Productiondate;
        string location;
        address person;
        
    }mapping (uint => Seller) public CheckSeller;
    
    struct Manf{
        string MedicineName;
        uint MedicineId;
        string Patchno;
        address Creator;
        string Productiondate;
        uint Rate;
        string ManfucturerLocation;
        string ManfucturerInfo;
        
    }
    
    mapping(uint=>Manf) public CheckManf;
    
    
    function AddManf(uint _rate,uint _medicineId,string memory _medicinename,string memory _patchno,string memory _productiondate,string memory _manufacturerlocation,string memory _manfucturerinfo)public returns(bool){
            Manf memory NewManf=Manf(_medicinename,_medicineId,_patchno,msg.sender,_productiondate,_rate,_manufacturerlocation,_manfucturerinfo);
            CheckManf[items]=NewManf;
            items = items+1;
            emit Added(items-1);
            return true;
            
    }
    
    
    function addSeller(uint _productId, string memory _date, string memory _supplierlocation) public returns (bool) {
        require(_productId<items);
        Seller memory NewSeller=Seller(_productId,_date,_supplierlocation,msg.sender);
        CheckSeller[items]=NewSeller;
    items = items+1;
            emit Added(items-1);
        return true;
    }
}
