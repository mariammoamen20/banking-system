


import 'bank-account.dart';

class Client{
  String name;
  String address ;
  String phone;
  BankAccount bankAccount;
  Client(this.name,this.address,this.phone);
  void viewClientDetails(){
    print('Client Name : $name');
    print('Client Address : $address');
    print('Client Phone : $phone');
    //print('Client Account ID : ${bankAccount.accountId}');
  }
}