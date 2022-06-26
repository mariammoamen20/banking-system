import 'bank-account.dart';
import 'client.dart';
import 'dart:io';

import 'saving-bank-account.dart';

class BankingSystem {
  List<BankAccount> bankAccounts;

  List<Client> clients;

  BankingSystem() {
    clients = [];
    bankAccounts = [];
    addDataToTest();
  }

  /// *--------------------------------------------------------------------------------------------------*/
  // function for testing without need to create account لتسهيل عليا
  void addDataToTest() {
    for (int i = 0; i < 20; i++) {
      Client client = Client('Mariam $i', '${i * 10}', 'AbuHammad');
      BankAccount bankAccount = BankAccount(i * 1000.0);

      client.bankAccount = bankAccount;
      bankAccount.client = client;
      //add data into list
      bankAccounts.add(bankAccount);
      clients.add(client);
    }
  }
  void createAccount(){
    //1- client details
    //2 - type of account
    //3- amount of money you want to add into your balance 
    
    print('enter client name ');
    var name = stdin.readLineSync();

    print('enter client address');
    var address = stdin.readLineSync();

    print('enter client phone ');
    var phone = stdin.readLineSync();

    var client = Client(name, address, phone);

    print('enter initial balance ');
    var balance = double.parse(stdin.readLineSync());

    print('enter type of account ');
    print('1- Basic Bank Account');
    print('2- Saving Bank Account ');
    var accountType = int.parse(stdin.readLineSync());
    BankAccount account;
   if(accountType == 1){
      account= BankAccount(balance);
   }else if(accountType == 2){
     account = SavingBankAccount(balance);
   }
   account.client = client;
   client.bankAccount = account;

   bankAccounts.add(account);
   clients.add(client);
   print('account created successfully ');

  }
  /// *--------------------------------------------------------------------------------------------------*/
  void showAllAccountDetails() {
    for (int i = 0; i < bankAccounts.length; i++) {
      bankAccounts[i].viewAccountDetails();
      print('---------------------------');
    }
  }

  /// *--------------------------------------------------------------------------------------------------*/
  void showAccountDetails() {
    //1- enter your account id
    print('enter an account id');
    int accountId = int.parse(stdin.readLineSync());
    //2- search for this id
    //if it is not found leave function and this mean we couldn't find the account
    if (searchForID(accountId) == null) {
      print('account is not found ');
      return;
    }
    //else we found the account and show it's details with method showAccountDetails from BankAccount Class
    else {
      searchForID(accountId).viewAccountDetails();
    }
  }

  /// *--------------------------------------------------------------------------------------------------*/
  void deleteAccount() {
    //1- enter your account id
    print('enter an account id');
    var accountId = int.parse(stdin.readLineSync());
    var account = searchForID(accountId);
    if (searchForID(accountId) == null) {
      print('Account Is Not Found ');
      return;
    }
    //remove that account founded by id from list
    bankAccounts.remove(account);
    clients.remove(account.client);
    print('Account Removed Successfully');
  }

  /// *--------------------------------------------------------------------------------------------------*/
  void withdraw() {
    //1- enter your account id
    print('enter an account id');
    var accountId = int.parse(stdin.readLineSync());
    var account = searchForID(accountId);

    print('enter amount of money to withdraw ');
    double amountOfMoney = double.parse(stdin.readLineSync());
    account.withdraw(amountOfMoney);
    if (account.withdraw(amountOfMoney)) {
      print('Successful Operation');
    }
  }

  /// *--------------------------------------------------------------------------------------------------*/
  void deposit() {
    //1- enter your account id
    print('enter an account id');
    var accountId = int.parse(stdin.readLineSync());
    var account = searchForID(accountId);

    print('enter amount of money to deposit ');
    double amountOfMoney = double.parse(stdin.readLineSync());
    account.deposite(amountOfMoney);
    if (account.deposite(amountOfMoney)) {
      print('Successful Operation');
    }
  }

  /// *--------------------------------------------------------------------------------------------------*/
  BankAccount searchForID(int id) {
    for (int i = 0; i < bankAccounts.length; i++) {
      if (bankAccounts[i].accountId == id) {
        return bankAccounts[i];
      }
    }
    return null;
  }

  /// *--------------------------------------------------------------------------------------------------*/
  void showMenu() {
    while (true) {
      print('1- Create Account ');
      print('2- Show Account Details ');
      print('3- Show All Account ');
      print('4- Delete Account ');
      print('5- Withdraw Money ');
      print('6- Deposit Money ');
      print('7- Exit ');

      print('enter an option');
      int userOption = int.parse(stdin.readLineSync());
      if (userOption == 1) {
        createAccount();
      } else if (userOption == 2) {
        showAccountDetails();
        print('----------------------');
      } else if (userOption == 3) {
        showAllAccountDetails();
      } else if (userOption == 4) {
        deleteAccount();
      } else if (userOption == 5) {
        withdraw();
      } else if (userOption == 6) {
        deposit();
      } else if (userOption == 7) {
        //exit from account
        return;
      }
    }
  }
}
