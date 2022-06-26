import 'Bank_System/bank-account.dart';
import 'Bank_System/banking-system.dart';
import 'Bank_System/client.dart';

void main() {
  BankAccount bankAccount_1 = BankAccount(1000);
  BankAccount bankAccount_2 = BankAccount(2000);
  Client client_1 = Client('Mariam Moamen', 'AbuHammad', '01013630454');
  /*they are now have a relationship -->
   bankAccount_1 has client_1  and client_1  has bankAccount_1 */
  bankAccount_1.client = client_1;
  client_1.bankAccount = bankAccount_1;

   //print(bankAccount_1);
  //print(bankAccount_2);
  // bankAccount_1.viewAccountDetails();
  // client_1.viewClientDetails();

  BankingSystem bankingSystem = BankingSystem();
  bankingSystem.showMenu();
}
