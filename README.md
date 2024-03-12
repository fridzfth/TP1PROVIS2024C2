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

### Screenshots:
![ss1](https://github.com/fridzfth/TP1PROVIS2024C2/blob/56e8fb78c2d66a5b6a6778bdf960c1fef008659e/Screenshots/Screenshot%202024-03-12%20114602.png)
![ss2](https://github.com/fridzfth/TP1PROVIS2024C2/blob/56e8fb78c2d66a5b6a6778bdf960c1fef008659e/Screenshots/Screenshot%202024-03-12%20114625.png)
![ss3](https://github.com/fridzfth/TP1PROVIS2024C2/blob/56e8fb78c2d66a5b6a6778bdf960c1fef008659e/Screenshots/Screenshot%202024-03-12%20114645.png)
![ss4](https://github.com/fridzfth/TP1PROVIS2024C2/blob/56e8fb78c2d66a5b6a6778bdf960c1fef008659e/Screenshots/Screenshot%202024-03-12%20114703.png)
![ss5](https://github.com/fridzfth/TP1PROVIS2024C2/blob/56e8fb78c2d66a5b6a6778bdf960c1fef008659e/Screenshots/Screenshot%202024-03-12%20114720.png)
