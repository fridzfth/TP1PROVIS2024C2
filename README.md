# TP1PROVIS2024C2
# Pemrograman Berbasis Objek (OOP) dan Asynchronous dalam Dart
## Pemrograman Berbasis Objek (OOP)

### Kelas:

1. **Human:**
   - Mewakili pemegang akun manusia.
   - Properti: `name`, `age`, `mother`, dan `accounts`.
   - Metode: `displayHumanInfo()`.

2. **Account:**
   - Mewakili akun bank.
   - Properti: `accountNumber`, `accountHolder`, `balance`, `bankName`, dan `transactions`.
   - Metode: `displayAccountInfo()`, `deposit(double amount)`, `withdraw(double amount)`, `transfer(Account receiver, double amount)`, `displayAllTransactions()`.

3. **Transaction:**
   - Mewakili transaksi.
   - Properti: `transactionId`, `description`, dan `amount`.
   - Metode: `displayTransactionInfo()`.

4. **Bank:**
   - Mewakili bank.
   - Properti: `accounts` dan `bankName`.
   - Metode: `addAccount(Account account)`, `displayAllAccountsInfo()`.

### Implementasi:

- Kode menunjukkan penggunaan kelas untuk memodelkan entitas seperti `Human`, `Account`, `Transaction`, dan `Bank`.
- Kelas mengenkapsulasi properti dan perilaku, mempromosikan organisasi dan kegunaan kode.
- Hubungan dibentuk antar kelas, seperti `Account` memiliki referensi ke instance `Human`.

## Pemrograman Asynchronous

### Metode Asynchronous:

1. **deposit(double amount):**
   - Secara asynchronous menyetorkan uang ke akun setelah penundaan 2 detik.

2. **withdraw(double amount):**
   - Secara asynchronous menarik uang dari akun setelah penundaan 2 detik.

3. **transfer(Account receiver, double amount):**
   - Secara asynchronous mentransfer uang antar akun.
   - Menggunakan pemrograman asynchronous untuk transfer antar bank dengan penundaan dan potensi biaya transfer.

### Fungsi Utama:

- Fungsi `main` menunjukkan pemrograman asynchronous menggunakan `await` untuk transfer akun.
