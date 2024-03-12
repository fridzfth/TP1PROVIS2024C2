import 'dart:async';

// Define a class to represent a human account holder
class Human {
  String name; // The name of the account holder
  int age; // The age of the account holder
  String mother; // The name of the account holder's mother
  List<Account> accounts; // List of accounts owned by the human

  // Constructor for Human class
  Human(this.name, this.age, this.mother) : accounts = [];

  // Method to display information about the human account holder
  void displayHumanInfo() {
    print(' - Name: $name');
    print(' - Age: $age');
    print(' - Mother\'s Name: $mother');
  }
}

// Define a class to represent a bank account
class Account {
  String accountNumber; // The account number
  Human accountHolder; // The account holder (instance of Human class)
  double balance; // The balance of the account
  String bankName; // The name of the bank
  List<Transaction> transactions; // List of transactions for the account

  // Constructor for Account class
  Account(this.accountNumber, this.accountHolder, this.balance, this.bankName)
      : transactions = [];

  // Method to display information about the account
  void displayAccountInfo() {
    print('Account Number: $accountNumber');
    print('Account Holder:');
    accountHolder.displayHumanInfo();
    print('Bank: $bankName');
    print('Balance: \$${balance.toStringAsFixed(2)}');
  }

  // Method to deposit money into the account
  Future<void> deposit(double amount) async {
    await Future.delayed(Duration(seconds: 2));
    if (balance >= amount) {
      balance += amount;
      print('Deposited \$${amount.toStringAsFixed(2)}');
    } else {
      print('Transaction canceled');
    }
  }

  // Method to withdraw money from the account
  Future<void> withdraw(double amount) async {
    await Future.delayed(Duration(seconds: 2));
    if (balance >= amount) {
      balance -= amount;
      print('Withdrawn \$${amount.toStringAsFixed(2)}');
    } else {
      print('Insufficient funds');
    }
  }

  // Method to transfer money from this account to another account
  Future<void> transfer(Account receiver, double amount) async {
    final transactionId = DateTime.now().millisecondsSinceEpoch.toString();
    final description = 'Transfer to ${receiver.accountHolder.name}';
    if (bankName != receiver.bankName) {
      // Transfer between different banks incurs a transfer fee
      final transferFee = amount * 0.005;
      await withdraw(amount + transferFee);
      await receiver.deposit(amount);
      if (balance >= amount) {
        print(
            'Transfer fee (\$${transferFee.toStringAsFixed(2)}) applied for cross-bank transfer.');
        final description2 = 'Got balance from ${accountHolder.name}';
        transactions.add(Transaction(transactionId, description, amount));
        receiver.transactions
            .add(Transaction(transactionId, description2, amount));
        print('Transfer completed successfully');
      } else {
        print('Transfer failed');
      }
    } else {
      // Transfer within the same bank
      await withdraw(amount);
      await receiver.deposit(amount);
      if (balance >= amount) {
        final description2 = 'Got balance from ${accountHolder.name}';
        transactions.add(Transaction(transactionId, description, amount));
        receiver.transactions
            .add(Transaction(transactionId, description2, amount));
        print('Transfer completed successfully');
      } else {
        print('Transfer failed');
      }
    }
  }

  // Method to display all transactions for this account
  void displayAllTransactions() {
    if (transactions.isEmpty) {
      print('No Transaction Found');
    } else {
      print('All Transactions:');
      for (var transaction in transactions) {
        transaction.displayTransactionInfo();
        print('--------------');
      }
    }
  }
}

// Define a class to represent a transaction
class Transaction {
  final String transactionId; // The transaction ID
  final String description; // Description of the transaction
  final double amount; // The amount of money involved in the transaction

  // Constructor for Transaction class
  Transaction(this.transactionId, this.description, this.amount);

  // Method to display information about the transaction
  void displayTransactionInfo() {
    print('Transaction ID: $transactionId');
    print('Description: $description');
    print('Amount: \$${amount.toStringAsFixed(2)}');
  }
}

// Define a class to represent a bank
class Bank {
  List<Account> accounts; // List of accounts associated with the bank
  String bankName; // The name of the bank

  // Constructor for Bank class
  Bank(this.bankName) : accounts = [];

  // Method to add an account to the bank
  void addAccount(Account account) {
    accounts.add(account);
  }

  // Method to display information about all accounts in the bank
  void displayAllAccountsInfo() {
    print('Bank: $bankName');
    print('All Accounts:');
    for (var account in accounts) {
      account.displayAccountInfo();
      print('--------------');
    }
  }
}

// Main function
void main() async {
  // Create instances of Human class to represent account holders
  final kepin = Human('Kevinn Smither', 30, 'Caroline Pperer');
  final ahmad = Human('Ahmad Jaelani', 25, 'Susi Sus Banget');

  // Create instances of Account class to represent bank accounts
  final account1 = Account('123456789', kepin, 1000.0, 'JBJ');
  final account3 = Account('943895035', kepin, 1456.5, 'Mandisendiri');
  final account2 = Account('987654321', ahmad, 500.0, 'Mandisendiri');

  // Create instances of Bank class to represent banks
  final bankA = Bank('JBJ');
  final bankB = Bank('Mandisendiri');

  // Add accounts to banks
  bankA.addAccount(account1);
  bankB.addAccount(account2);
  bankB.addAccount(account3);

  // Display information about all accounts in each bank
  bankA.displayAllAccountsInfo();
  bankB.displayAllAccountsInfo();
  print('\nPerforming transfer...\n');

  // Perform a transfer between two accounts in different bank
  await account1.transfer(account2, 120.5);

  // Display updated information about all accounts in each bank
  print('\nUpdated Account Information:');
  bankA.displayAllAccountsInfo();
  bankB.displayAllAccountsInfo();

  // Display transaction history
  print('\nTransaction History:');
  print('Account1:');
  account1.displayAllTransactions();
  print('Account2:');
  account2.displayAllTransactions();
  print('Account3:');
  account3.displayAllTransactions();

  // Perform another transfer between two accounts in same bank
  print('\nPerforming transfer...\n');
  await account3.transfer(account2, 532.5);

  // Display updated information
  print('\nUpdated Account Information:');
  bankA.displayAllAccountsInfo();
  bankB.displayAllAccountsInfo();

  // Display transaction history for account3 and account2
  print('\nTransaction History:');
  print('Account1:');
  account1.displayAllTransactions();
  print('Account2:');
  account2.displayAllTransactions();
  print('Account3:');
  account3.displayAllTransactions();
  
}
