
import 'bank-account.dart';

class SavingBankAccount extends BankAccount{
  double minBalance;

  SavingBankAccount(double balance,[this.minBalance=1000]) : super(balance);

  @override
  bool withdraw(double amountOfMoney){
    if(balance - amountOfMoney < minBalance){
      print('Invalid Amount , Balance Should Be Greater Than Minim Balance');
      return false;
    }
   return super.withdraw(amountOfMoney);
  }
  @override
  bool deposite(double amountOfMoney){
    if(amountOfMoney < 100){
      print('Invalid Amount , Amount Should Be > 100');
      return false;
    }
  return super.deposite(amountOfMoney);
  }
  @override
  void viewAccountDetails(){
  print('Saving Account Details-----');
  print('Account ID : $accountId');
  print('Account Balance : $balance');
  print('Minim Balance : $minBalance');
  client.viewClientDetails();
  }
}