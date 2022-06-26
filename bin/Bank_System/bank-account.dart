import 'client.dart';

class BankAccount {
  static int ID_GENERATOR = 1000;
  int accountId;
  double balance;
  Client client;

  BankAccount(this.balance) {
    accountId = ID_GENERATOR;
    ID_GENERATOR++;
  }

  BankAccount.init() : this(0);

  bool withdraw(double amountOfMoney) {
    if (amountOfMoney < 0) {
      print('Invalid Amount');
      return false;
    }
    if (amountOfMoney > balance) {
      print('Invalid Amount');
      return false;
    }
    balance -= amountOfMoney;
    return true;
  }

  bool deposite(double amountOfMoney) {
    if (amountOfMoney < 0) {
      print('Invalid Amount');
      return false;
    }
    balance += amountOfMoney;
    return true;
  }

  void viewAccountDetails() {
    print('Account ID : $accountId');
    print('Account Balance : $balance');
    client.viewClientDetails();
   /* print('Account Owner Name : ${client.name}');
    print('Account Owner Phone : ${client.phone}');
    print('Account Owner Address : ${client.address}');*/
  }
}
